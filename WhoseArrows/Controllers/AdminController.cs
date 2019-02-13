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

namespace WhoseArrows.Controllers
{
    [Route("api/[controller]")]
    [ApiController,Authorize]
    public class AdminController : ControllerBase
    {
		private static IAdminService _admin = new AdminService();

		[HttpPost("questions")]
		public async Task<QuestionAndHints> AddNewQuestion(QuestionAndHints newQuestion, [FromHeader] string firebaseId) 
			=> await _admin.AddNewQuestionWithHints(newQuestion, firebaseId);

		[HttpGet("questions")]
		public async Task<IEnumerable<QuestionAndHints>> GetAllQuestionsAndHints([FromHeader] string firebaseId)
			=> await _admin.GetAllQuestionsAndHints(firebaseId);
    }
}