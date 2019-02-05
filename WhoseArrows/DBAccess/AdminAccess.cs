using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.Models.DB;

namespace WhoseArrows.DBAccess
{
	public class AdminAccess
	{
		public async Task<Question> AddNewQuestion (Question newQuestion)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var commandString = @"INSERT INTO Questions (CorrectAnswer, ImageUrl, SerializedSteps)
										OUTPUT INSERTED.*
										VALUES (@CorrectAnswer, @ImageUrl, @SerializedSteps)";

				return await db.QueryFirstOrDefaultAsync<Question>(commandString, newQuestion);
			}
		}
	}
}
