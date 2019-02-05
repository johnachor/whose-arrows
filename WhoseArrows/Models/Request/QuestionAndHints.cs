using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.Models.DB;

namespace WhoseArrows.Models.Request
{
	public class QuestionAndHints : Question
	{
		public QuestionAndHints() { }

		public QuestionAndHints(Question baseQuestion)
		{
			this.Id = baseQuestion.Id;
			this.ImageUrl = baseQuestion.ImageUrl;
			this.SerializedSteps = baseQuestion.SerializedSteps;
			this.CorrectAnswer = baseQuestion.CorrectAnswer;
		}

		public IEnumerable<Hint> Hints = new List<Hint>();
	}
}
