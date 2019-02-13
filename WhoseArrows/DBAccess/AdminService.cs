using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.DBAccess.Interface;
using WhoseArrows.Models.DB;
using WhoseArrows.Models.Request;

namespace WhoseArrows.DBAccess
{
	public class AdminService : IAdminService
	{
		static GameService _game = new GameService();

		public async Task<bool> VerifyAdmin(string firebaseId)
		{
			var currentPlayer = await _game.GetPlayerByFirebaseId(firebaseId);

			return currentPlayer.IsAdmin;
		}

		public async Task<Question> AddNewQuestion (Question newQuestion)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var questionString = @"INSERT INTO Questions 
											(CorrectAnswer, ImageUrl, SerializedSteps)
										OUTPUT INSERTED.*
										VALUES 
											(@CorrectAnswer, @ImageUrl, @SerializedSteps)";

				return await db.QueryFirstOrDefaultAsync<Question>(questionString, newQuestion);
			}
		}

		public async Task<Hint> AddNewHint (Hint newHint)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var newHintString = @"INSERT INTO Hints 
											(QuestionId, HintText, HintOrder)
										OUTPUT INSERTED.*
										VALUES 
											(@QuestionId, @HintText, @HintOrder)";

				return await db.QueryFirstOrDefaultAsync<Hint>(newHintString, newHint);
			}
		}

		public async Task<Question> DeleteQuestion (long questionId)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var deleteQuestionString = @"DELETE FROM Questions 
												OUTPUT DELETED.* 
												WHERE QuestionId = @questionId";

				return await db.QueryFirstOrDefaultAsync<Question>(deleteQuestionString, new { questionId });
			}
		}

		public async Task<Player> DeletePlayer(long playerId)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var deletePlayerString = @"DELETE FROM Players 
											OUTPUT DELETED.* 
											WHERE PlayerId = @playerId";

				return await db.QueryFirstOrDefaultAsync<Player>(deletePlayerString, new { playerId });
			}
		}

		public async Task<IEnumerable<Question>> GetAllQuestions(string firebaseId)
		{
			if (await VerifyAdmin(firebaseId))
			{
				using (var db = SQLConnectionFactory.New())
				{
					return await db.QueryAsync<Question>("SELECT * FROM Questions");
				}
			}
			else
			{
				return null;
			}
		}

		public async Task<IEnumerable<Hint>> GetAllHints(string firebaseId)
		{
			if (await VerifyAdmin(firebaseId))
			{
				using (var db = SQLConnectionFactory.New())
				{
					return await db.QueryAsync<Hint>("SELECT * FROM Hints");
				}
			}
			else
			{
				return null;
			}
		}

		public async Task<QuestionAndHints> AddNewQuestionWithHints(QuestionAndHints newQuestion, string firebaseId)
		{
			if (await VerifyAdmin(firebaseId))
			{
				var createdQuestion = await AddNewQuestion(newQuestion);
				if (createdQuestion == default(Question)) return null;

				var responseQuestion = new QuestionAndHints(createdQuestion);

				var hints = newQuestion.Hints
					.Select(x => AddQuestionIdToHint(x, responseQuestion))
					.Select(async x => await AddNewHint(x));

				responseQuestion.Hints = await Task.WhenAll(hints);

				return responseQuestion;
			}
			else
			{
				return null;
			}
		}

		public Hint AddQuestionIdToHint(Hint hint, Question question)
		{
			hint.QuestionId = question.QuestionId;
			return hint;
		}

		public QuestionAndHints AddHintsToQuestion (Question q, IEnumerable<Hint> hs)
		{
			return new QuestionAndHints(q)
			{
				Hints = hs
			};
		}

		public async Task<IEnumerable<QuestionAndHints>> GetAllQuestionsAndHints(string firebaseId)
		{
			if(await VerifyAdmin(firebaseId))
			{
				var qs = await GetAllQuestions(firebaseId);
				var hs = await GetAllHints(firebaseId);

				return qs.Select(x => AddHintsToQuestion(x, hs.Where(y => y.QuestionId == x.QuestionId)));
			}
			else
			{
				return null;
			}
		}
	}
}
