using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.Models.DB;
using WhoseArrows.Models.Request;

namespace WhoseArrows.DBAccess.Interface
{
	public interface IAdminAccess
	{
		// Single DB object insertion methods
		Task<Question>	AddNewQuestion	(Question newQuestion);
		Task<Hint>		AddNewHint		(Hint newHint);
		Task<Mix>		AddNewMix		(Mix newMix);
		Task<Song>		AddNewSong		(Song newSong);

		// Deletion
//		Task<Question>	DeleteQuestion	(long id);
//		Task<Player>	DeletePlayer	(long id);
//		Task<Session>	DeleteSession	(long id);
//		Task<Mix>		DeleteMix		(long id);
//		Task<Song>		DeleteSong		(long id);
		
		// Entry points for main operations
		Task<QuestionAndHints>	AddNewQuestionWithHints	(QuestionAndHints newQuestion);
		

	}
}
