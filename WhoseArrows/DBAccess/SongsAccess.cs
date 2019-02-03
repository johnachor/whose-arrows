using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.DBModels;
using Dapper;

namespace WhoseArrows.DBAccess
{
	public class SongsAccess
	{
		SQLMaker _sql;

		public SongsAccess(SQLMaker sql)
		{
			_sql = sql;
		}

		public async Task<IEnumerable<Song>> GetAllSongs()
		{
			using (var db = _sql.New())
			{
				return await db.QueryAsync<Song>("SELECT * FROM Songs");
			}
		}
	}
}
