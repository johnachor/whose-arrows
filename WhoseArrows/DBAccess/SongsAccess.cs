using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.Models.DB;
using Dapper;

namespace WhoseArrows.DBAccess
{
	public class SongsAccess
	{
		public async Task<IEnumerable<Song>> GetAllSongs()
		{
			using (var db = SQLConnectionFactory.New())
			{
				return await db.QueryAsync<Song>("SELECT * FROM Songs");
			}
		}
	}
}
