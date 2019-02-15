const initialState = {
	sessionId: null,
	sessionGuid: null,
	sessionQuestionId: null,
	sessionLength: null,
	questionId: null,
	imageUrl: null,
	currentScore: null,
	gameComplete: false,
	hints: []
};

export const actionCreators = {
	newGame: (playerId) => {
		return {
			type: 'NEW_GAME',
			payload: {
				request: {
					method: 'post',
					url: 'game/new',
					data: {
						playerId: playerId,
						sessionLength: 5
					}
				}
			}
		}
	},

	guess: (guess) => {
		return {
			type: 'GUESS',
			payload: {
				request: {
					method: 'post',
					url: 'game/guess',
					data: guess
				}
			}
		}
	},

	getHint: (sessionQuestionId) => {
		return {
			type: 'HINT',
			payload: {
				request: {
					method: 'get',
					url: `game/hint/${sessionQuestionId}`
				}
			}
		}
	}
}

export const reducer = (state, action) => {
	state = state || initialState;

	switch (action.type) {
		case 'NEW_GAME_SUCCESS':
			return {
				...state,
				sessionId: action.payload.data.session.sessionId,
				sessionGuid: action.payload.data.session.sessionGuid,
				sessionLength: action.payload.data.session.sessionLength,
				questionId: action.payload.data.question.questionId,
				imageUrl: action.payload.data.question.imageUrl,
				currentScore: action.payload.data.question.currentScore,
				sessionQuestionId: action.payload.data.question.sessionQuestionId,
				gameComplete: action.payload.data.question.gameComplete,
				hints: []
			};

		case 'GUESS_SUCCESS':
			return {
				...state,
				questionId: action.payload.data.questionId,
				imageUrl: action.payload.data.imageUrl,
				currentScore: action.payload.data.currentScore,
				sessionQuestionId: action.payload.data.sessionQuestionId,
				gameComplete: action.payload.data.gameComplete,
				hints: []
			};

		case 'HINT_SUCCESS': {
			return {
				...state,
				hints: state.hints.concat([action.payload.data])
			}
		}
	}

	return state;
};