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
		SongsAccess _songs;

		public SongsController()
		{
			_songs = new SongsAccess();
		}

        [HttpGet]
		public async Task<IEnumerable<Song>> GetAllSongs () => await _songs.GetAllSongs();
	}
}
