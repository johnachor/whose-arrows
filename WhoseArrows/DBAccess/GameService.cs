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
				var newPlayerString = @"INSERT INTO Players (Name, FirebaseId)
											OUTPUT INSERTED.*
											VALUES (@Name, @FirebaseId)";

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
	}
}
