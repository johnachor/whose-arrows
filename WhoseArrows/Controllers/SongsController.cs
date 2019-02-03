using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WhoseArrows.DBAccess;
using WhoseArrows.DBModels;

namespace WhoseArrows.Controllers
{
    [Route("api/[controller]")]
    public class SongsController : Controller
    {
		SQLMaker _sql;
		SongsAccess _songs;

		public SongsController(SQLMaker sql)
		{
			_sql = sql;
			_songs = new SongsAccess(_sql);
		}

        [HttpGet]
		public async Task<ActionResult<IEnumerable<Song>>> GetAllSongs ()
		{
			return Ok(await _songs.GetAllSongs());
		}
    }
}
