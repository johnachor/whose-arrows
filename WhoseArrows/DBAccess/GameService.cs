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
	public class GameService : IGameService
	{
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
												(SessionGuid, PlayerId, AnonPlayerName, SessionLength)
											OUTPUT INSERTED.*
											VALUES
												(NEWID(), @PlayerId, @AnonPlayerName, @SessionLength";

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


	}
}
