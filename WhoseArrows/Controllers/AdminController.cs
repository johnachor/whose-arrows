using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WhoseArrows.DBAccess;
using WhoseArrows.Models.DB;

namespace WhoseArrows.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
		private static AdminAccess _admin = new AdminAccess();

		[HttpPost("question")]
		public async Task<ActionResult<Question>> AddNewQuestion(Question newQuestion) => Ok(await _admin.AddNewQuestion(newQuestion));
    }
}