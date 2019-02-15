using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.Response
{
	public class NewQuestionResponse
	{
		public long QuestionId { get; set; }
		public string ImageUrl { get; set; }
		public string SerializedSteps { get; set; }
		public int CurrentScore { get; set; } = 0;
		public long SessionQuestionId { get; set; }
		public bool GameComplete { get; set; }
	}
}
