using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.DBAccess.Interface;
using WhoseArrows.Models.DB;
using WhoseArrows.Models.Request;
using WhoseArrows.Models.Response;

namespace WhoseArrows.DBAccess
{
	public class GameService : IGameService
	{
		private static Random rng = new Random();

		public async Task<Player> AddNewPlayer (NewPlayerRequest newPlayer)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var newPlayerString = @"INSERT INTO Players 
												(Name, FirebaseId)
											OUTPUT INSERTED.*
											VALUES 
												(@Name, @FirebaseId)";

				return await db.QueryFirstOrDefaultAsync<Player>(newPlayerString, newPlayer);
			}
		}

		public async Task<Session> AddNewSession (Session newSession)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var newSessionString = @"INSERT INTO Sessions 
												(SessionGuid, PlayerId, SessionLength)
											OUTPUT INSERTED.*
											VALUES
												(NEWID(), @PlayerId, @SessionLength)";

				return await db.QueryFirstOrDefaultAsync<Session>(newSessionString, newSession);
			}
		}

		public async Task<SessionQuestion> AddNewSessionQuestion (SessionQuestion newSessionQuestion)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var newSessionQuestionString = @"INSERT INTO SessionQuestion 
														(SessionId, QuestionId, HintsShown)
													OUTPUT INSERTED.*
													VALUES
														(@SessionId, @QuestionId, @HintsShown)";

				return await db.QueryFirstOrDefaultAsync<SessionQuestion>(newSessionQuestionString, newSessionQuestion);
			}
		}

		public async Task<Player> DeletePlayer (long playerId)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var deletePlayerString = @"DELETE FROM Player
											OUTPUT DELETED.*
											WHERE PlayerId = @playerId";

				return await db.QueryFirstOrDefaultAsync<Player>(deletePlayerString, new { playerId });
			}
		}

		public async Task<Session> DeleteSession (long sessionId)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var deleteSessionString = @"DELETE FROM Session
											OUTPUT DELETED.*
											WHERE SessionId = @sessionId";

				return await db.QueryFirstOrDefaultAsync<Session>(deleteSessionString, new { sessionId });
			}
		}

		public async Task<int> AddPlayerAnswerToQuestion(long sessionQuestionId, long givenAnswer)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var updateAnswerString = @"UPDATE SessionQuestion
											SET GivenAnswer = @givenAnswer
											WHERE SessionQuestionId = @sessionQuestionId";

				return await db.ExecuteAsync(updateAnswerString, new { sessionQuestionId, givenAnswer });
			}
		}

		public async Task<Player> GetPlayerByFirebaseId (string firebaseId)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var getPlayerString = "SELECT * FROM Players WHERE FirebaseId = @firebaseId";

				return await db.QueryFirstOrDefaultAsync<Player>(getPlayerString, new { firebaseId });
			}
		}

		public async Task<Player> Login (string firebaseId)
		{
			var existingPlayer = await GetPlayerByFirebaseId(firebaseId);
			if (existingPlayer != default(Player))
			{
				return existingPlayer;
			}
			else
			{
				return await AddNewPlayer(new NewPlayerRequest { Name = "John", FirebaseId = firebaseId });
			}
		}

		public async Task<FirstQuestion> BeginGame(Session newSession)
		{
			var fq = new FirstQuestion();

			fq.Session = await AddNewSession(newSession);
			fq.Question = await GetNextQuestion(fq.Session.SessionId);

			return fq;
		}

		public async Task<NewQuestionResponse> GetNextQuestion(long sessionId)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var remainingQuestionsString = @"SELECT q.* FROM Questions q
													LEFT JOIN (
														SELECT * FROM SessionQuestion
														WHERE SessionId = @sessionId
													) sq
													ON sq.QuestionId = q.QuestionId
													WHERE SessionQuestionId IS NULL";

				var remainingQuestions = await db.QueryAsync<NewQuestionResponse>(remainingQuestionsString, new { sessionId });
				var nextQuestion = remainingQuestions.ElementAt(rng.Next(remainingQuestions.Count()));
				nextQuestion.CurrentScore = await GetScore(sessionId);
				var sq = await AddNewSessionQuestion(new SessionQuestion() { SessionId = sessionId, QuestionId = nextQuestion.QuestionId });
				nextQuestion.SessionQuestionId = sq.SessionQuestionId;

				return nextQuestion;
			}
		}

		public async Task<int> GetScore(long sessionId)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var scoreString = @"SELECT COUNT(CorrectAnswer) * 10 - SUM(HintsShown) * 3 Score 
										FROM Sessions s
										JOIN SessionQuestion sq ON sq.SessionId = s.SessionId
										JOIN Questions q ON sq.GivenAnswer = q.CorrectAnswer AND sq.QuestionId = q.QuestionId
										WHERE s.SessionId = @sessionId
										GROUP BY s.SessionId";

				return await db.QueryFirstOrDefaultAsync<int>(scoreString, new { sessionId });
			}
		}

		public async Task<bool> AddAnswerToSessionQuestion(Guess guess)
		{
			using (var db = SQLConnectionFactory.New())
			{
				return await db.ExecuteAsync("UPDATE SessionQuestion SET GivenAnswer = @GivenAnswer WHERE SessionQuestionId = @SessionQuestionId", guess) == 1;
			}
		}

		public async Task<GameState> CheckGameState (long sessionId)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var questionCountString = @"SELECT s.SessionLength, count(QuestionId) Answered
											FROM Sessions s
											JOIN SessionQuestion sq ON sq.SessionId = s.SessionId
											WHERE s.SessionId = 12 AND sq.GivenAnswer IS NOT NULL
											GROUP BY s.SessionLength";

				return await db.QueryFirstOrDefaultAsync<GameState>(questionCountString, new { sessionId });
			}
		}

		public async Task<NewQuestionResponse> PlayerGuess(Guess guess)
		{
			if (await AddAnswerToSessionQuestion(guess))
			{
				return await GetNextQuestion(guess.SessionId);
			}
			else
			{
				return null;
			}
		}

		public async Task<IEnumerable<SessionScore>> GetHighScores(int sessionLength)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var highScoreString = @"SELECT TOP 20 p.Name, s.SessionId, COUNT(CorrectAnswer) * 10 - SUM(HintsShown) * 3 Score 
										FROM Sessions s
										JOIN SessionQuestion sq ON sq.SessionId = s.SessionId
										JOIN Questions q ON sq.GivenAnswer = q.CorrectAnswer AND sq.QuestionId = q.QuestionId
										JOIN Players p ON p.PlayerId = s.PlayerId
										WHERE s.SessionLength = @sessionLength
										GROUP BY p.Name, s.SessionId
										ORDER BY Score DESC";

				return await db.QueryAsync<SessionScore>(highScoreString, new { sessionLength });
			}
		}
	}
}
