using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WhoseArrows.Models.DB;
using WhoseArrows.Models.Request;
using WhoseArrows.Models.Response;

namespace WhoseArrows.DBAccess.Interface
{
	interface IGameService
	{
		// Single DB object insertion methods
		Task<Player>			AddNewPlayer			(NewPlayerRequest newPlayer);
		Task<Session>			AddNewSession			(Session newSession);
		Task<SessionQuestion>	AddNewSessionQuestion	(SessionQuestion newSessionQuestion);

		// Deletions
		Task<Player>	DeletePlayer	(long playerId);
		Task<Session>	DeleteSession	(long sessionId);

		// Other operations
		Task<Player>					Login				(string firebaseId);
		Task<FirstQuestion>				BeginGame			(Session newSession);
		Task<NewQuestionResponse>		PlayerGuess			(Guess guess);
//		Task<Hint>						GetHint				(long sessionQuestionId);
		Task<int>						GetScore			(long sessionId);
		Task<IEnumerable<SessionScore>>	GetHighScores		(int sessionLength);
	}
}
