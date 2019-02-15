import firebase from 'firebase';
const loginType = 'REQUEST_FIREBASE_AUTH';
const logoutType = 'REQUEST_FIREBASE_UNAUTH';
const registerType = 'REQUEST_FIREBASE_REGISTER';
const authType = 'RECEIVE_FIREBASE_RESPONSE';
const apiLoginType = 'API_LOGIN'
const initialState = {
	user: {},
	player: {},
	isLoading: false
};

export const actionCreators = {
	login: (email, password) => (dispatch, getState) => {
		dispatch({ type: loginType });

		firebase.auth().signInWithEmailAndPassword(email, password)
			.then(response => {
				dispatch({ type: authType, response });
				if (response.user) {
					dispatch({
						type: apiLoginType,
						payload: {
							request: {
								method: 'post',
								url: 'game/login'
							}
						}
					});
				}
			})
			.catch(() => dispatch({ type: logoutType }));
	},

	register: (email, password) => (dispatch, getState) => {
		dispatch({ type: registerType });

		firebase.auth().createUserWithEmailAndPassword(email, password)
			.then(response => dispatch({ type: authType, response }))
			.catch(() => dispatch({ type: logoutType }));
	},

	logout: () => (dispatch) => {
		firebase.auth().signOut();
		dispatch(logoutType);
	},
};

export const reducer = (state, action) => {
	state = state || initialState;

	if (action.type === loginType || action.type === registerType) {
		return {
			...state,
			user: {},
			isLoading: true
		};
	}

	if (action.type === logoutType) {
		return {
			...state,
			user: {},
			isLoading: false
		};
	}

	if (action.type === authType) {
		return {
			...state,
			user: action.response.user,
			isLoading: false
		}
	}

	if (action.type === apiLoginType) {
		return {
			...state,
			player: {},
			isLoading: true
		}
	}

	if (action.type === 'API_LOGIN_SUCCESS') {
		return {
			...state,
			player: action.payload.data,
			isLoading: false
		}
	}
	return state;
};
