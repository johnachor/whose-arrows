using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.Request
{
	public class Guess
	{
		public long SessionId { get; set; }
		public long SessionQuestionId { get; set; }
		public long GivenAnswer { get; set; }
	}
}
