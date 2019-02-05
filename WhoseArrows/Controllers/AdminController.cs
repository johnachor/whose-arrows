using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WhoseArrows.DBAccess;
using WhoseArrows.Models.DB;
using WhoseArrows.Models.Request;

namespace WhoseArrows.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
		private static AdminAccess _admin = new AdminAccess();

		[HttpPost("question")]
		public async Task<ActionResult<QuestionAndHints>> AddNewQuestion(QuestionAndHints newQuestion) => Ok(await _admin.AddNewQuestionWithHints(newQuestion));
    }
}