using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.Models.DB;

namespace WhoseArrows.Models.Response
{
	public class FirstQuestion
	{
		public Session Session { get; set; }
		public NewQuestionResponse Question { get; set; }
	}
}
