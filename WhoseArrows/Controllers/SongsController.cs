using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WhoseArrows.DBAccess;
using WhoseArrows.Models.DB;

namespace WhoseArrows.Controllers
{
    [Route("api/[controller]")]
	[Authorize]
    public class SongsController : Controller
    {
		private static SongsAccess _songs = new SongsAccess();

        [HttpGet]
		public async Task<IEnumerable<Song>> GetAllSongs () => await _songs.GetAllSongs();
	}
}
