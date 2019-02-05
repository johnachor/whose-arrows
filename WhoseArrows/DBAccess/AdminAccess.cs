using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.Models.DB;
using WhoseArrows.Models.Request;

namespace WhoseArrows.DBAccess
{
	public class AdminAccess
	{
		public async Task<Question> AddNewQuestionWithHints (QuestionAndHints newQuestion)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var questionString = @"INSERT INTO Questions (CorrectAnswer, ImageUrl, SerializedSteps)
										OUTPUT INSERTED.*
										VALUES (@CorrectAnswer, @ImageUrl, @SerializedSteps)";

				var createdQuestion = await db.QueryFirstOrDefaultAsync<Question>(questionString, newQuestion);

				if (createdQuestion == default(Question)) return null;

				var qah = new QuestionAndHints(createdQuestion);

				var hints = newQuestion.Hints
					.Select(x => AddQuestionIdToHint(x, qah))
					.Select(async x => await AddNewHint(x));

				qah.Hints = await Task.WhenAll(hints);

				return qah;
			}
		}

		private Hint AddQuestionIdToHint(Hint hint, Question question)
		{
			hint.QuestionId = question.Id;
			return hint;
		}

		public async Task<Hint> AddNewHint (Hint newHint)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var newHintString = @"INSERT INTO Hints (QuestionId, HintText, HintOrder)
										OUTPUT INSERTED.*
										VALUES (@QuestionId, @HintText, @HintOrder)";

				return await db.QueryFirstOrDefaultAsync<Hint>(newHintString, newHint);
			}
		}
	}
}
