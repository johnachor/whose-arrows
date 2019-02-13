using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.Models.DB;
using WhoseArrows.Models.Request;

namespace WhoseArrows.DBAccess.Interface
{
	public interface IAdminService
	{
		// Verify request came from an admin
		Task<bool>		VerifyAdmin		(string firebaseId);

		// Single DB object insertion methods
		Task<Question>	AddNewQuestion	(Question newQuestion);
		Task<Hint>		AddNewHint		(Hint newHint);

		// Deletion
		Task<Question>	DeleteQuestion	(long id);
		Task<Player>	DeletePlayer	(long id);
		
		// Entry points for main operations
		Task<QuestionAndHints>	AddNewQuestionWithHints	(QuestionAndHints newQuestion, string firebaseId);
		Task<IEnumerable<QuestionAndHints>> GetAllQuestionsAndHints(string firebaseId);
	}
}
