const initialState = { songs: [], isLoading: false };


export const actionCreators = {
	getSongs: () => {
		return {
			type: 'GET_SONGS',
			payload: {
				request: {
					method: 'get',
					url: 'songs'
				}
			}
		};
	}
};

export const reducer = (state, action) => {

	state = state || initialState;

	if (action.type === 'GET_SONGS') {
		return {
			...state,
			isLoading: true
		};
	}

	if (action.type === 'GET_SONGS_SUCCESS') {
		return {
			...state,
			songs: action.payload.data,
			isLoading: false
		};
	}

	if (action.type === 'GET_SONGS_FAIL') {
		return {
			...state,
			songs: [],
			isLoading: false
		}
	}
	return state;
};
