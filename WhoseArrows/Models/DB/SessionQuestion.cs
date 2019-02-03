using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.DB
{
	public class SessionQuestion
	{
		public long Id { get; set; }
		public long SessionId { get; set; }
		public long QuestionId { get; set; }
		public int HintsShown { get; set; }
		public long? PlayerAnswer { get; set; }
	}
}
