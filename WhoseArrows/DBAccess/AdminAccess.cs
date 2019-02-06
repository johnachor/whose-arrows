using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.DBAccess.Interface;
using WhoseArrows.Models.DB;
using WhoseArrows.Models.Request;

namespace WhoseArrows.DBAccess
{
	public class AdminAccess : IAdminAccess
	{

		public async Task<Question> AddNewQuestion (Question newQuestion)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var questionString = @"INSERT INTO Questions (CorrectAnswer, ImageUrl, SerializedSteps)
										OUTPUT INSERTED.*
										VALUES (@CorrectAnswer, @ImageUrl, @SerializedSteps)";

				return await db.QueryFirstOrDefaultAsync<Question>(questionString, newQuestion);
			}
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

		public async Task<Mix> AddNewMix (Mix newMix)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var newMixString = @"INSERT INTO Mixes (Title, ReleaseDate)
										OUTPUT INSERTED.*
										VALUES (@Title, @ReleaseDate)";

				return await db.QueryFirstOrDefaultAsync<Mix>(newMixString, newMix);
			}
		}

		public async Task<Song> AddNewSong (Song newSong)
		{
			using (var db = SQLConnectionFactory.New())
			{
				var newSongString = @"INSERT INTO Songs (FirstAppeared, Title, TitleRomanized, Artist, ArtistRomanized)
										OUTPUT INSERTED.*
										VALUES (@FirstAppeared, @Title, @TitleRomanized, @Artist, @ArtistRomanized)";

				return await db.QueryFirstOrDefaultAsync<Song>(newSongString, newSong);
			}
		}

		public async Task<QuestionAndHints> AddNewQuestionWithHints(QuestionAndHints newQuestion)
		{
			var createdQuestion = await AddNewQuestion(newQuestion);
			if (createdQuestion == default(Question)) return null;

			var responseQuestion = new QuestionAndHints(createdQuestion);

			var hints = newQuestion.Hints
				.Select(x => AddQuestionIdToHint(x, responseQuestion))
				.Select(async x => await AddNewHint(x));

			responseQuestion.Hints = await Task.WhenAll(hints);

			return responseQuestion;
		}

		public Hint AddQuestionIdToHint(Hint hint, Question question)
		{
			hint.QuestionId = question.QuestionId;
			return hint;
		}
	}
}
