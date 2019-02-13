using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WhoseArrows.DBAccess;
using WhoseArrows.DBAccess.Interface;
using WhoseArrows.Models.DB;

namespace WhoseArrows.Controllers
{
    [Route("api/[controller]")]
    [ApiController, Authorize]
    public class GameController : ControllerBase
    {
		private static IGameService _game = new GameService();

		[HttpPost("login")]
		public async Task<Player> Login([FromHeader] string firebaseId)
			=> await _game.Login(firebaseId);
    }
}