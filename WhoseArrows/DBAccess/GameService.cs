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

			}
		}
	}
}
