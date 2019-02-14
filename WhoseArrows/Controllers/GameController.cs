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
using WhoseArrows.Models.Request;
using WhoseArrows.Models.Response;

namespace WhoseArrows.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GameController : ControllerBase
    {
		private static IGameService _game = new GameService();

		[HttpPost("login")]
		public async Task<Player> Login([FromHeader] string firebaseId)
			=> await _game.Login(firebaseId);

		[HttpPost("new")]
		public async Task<FirstQuestion> NewSession(Session newSession)
			=> await _game.BeginGame(newSession);

		[HttpPost("guess")]
		public async Task<NewQuestionResponse> PlayerGuess(Guess guess)
			=> await _game.PlayerGuess(guess);

		[HttpGet("highscores")]
		public async Task<IEnumerable<SessionScore>> GetHighScores()
			=> await _game.GetHighScores(5);


    }
}