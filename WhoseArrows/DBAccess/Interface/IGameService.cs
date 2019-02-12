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
//		Task<NewQuestionResponse>		PlayerGuess			(long sessionQuestionId, long songId);
//		Task<Hint>						GetHint				(long sessionQuestionId);
//		Task<Session>					AddPlayerIdToSession(long sessionId, long playerId);
//		Task<IEnumerable<HighScore>>	GetHighScores		(int sessionLength);
	}
}
