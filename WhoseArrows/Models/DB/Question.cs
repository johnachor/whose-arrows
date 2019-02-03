using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WhoseArrows.Models.DB
{
	public class Question
	{
		public long Id { get; set; }
		public long CorrectAnswer { get; set; }
		public string ImageUrl { get; set; }
		public string SerializedSteps { get; set; }
	}
}
