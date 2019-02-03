using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.DB
{
	public class Hint
	{
		public long Id { get; set; }
		public long QuestionId { get; set; }
		public string HintText { get; set; }
		public int HintOrder { get; set; }
	}
}
