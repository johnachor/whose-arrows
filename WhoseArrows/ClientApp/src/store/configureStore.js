import { applyMiddleware, combineReducers, compose, createStore } from 'redux';
import thunk from 'redux-thunk';
import axios from 'axios';
import axiosMiddleware from 'redux-axios-middleware';
import { routerReducer, routerMiddleware } from 'react-router-redux';
import reduxImmutableStateInvariant from 'redux-immutable-state-invariant';
import * as Auth from './Auth';
import * as Songs from './Songs';
import * as AdminInterface from './AdminInterface';

const client = axios.create({
	baseURL: '/api/',
	responseType: 'json'
});

const axiosMiddlewareConfig = {
	interceptors: {
		request: [
			function ({ getState }, req) {
				const authState = getState().auth;
				if (authState.user.uid) {
					req.headers.Authorization = `Bearer ${getState().auth.user.ra}`;
					req.headers.firebaseId = `${getState().auth.user.uid}`;
				}
				return req;
			}
		],
		response: [{
			error: ({ dispatch }, error) => {
				return Promise.reject(error);
			}
		}]
	}
};

export default function configureStore(history, initialState) {
	const reducers = {
		auth: Auth.reducer,
		songs: Songs.reducer,
		admin: AdminInterface.reducer
	};

	const middleware = [
		thunk,
		routerMiddleware(history),
		axiosMiddleware(client, axiosMiddlewareConfig)
	];

	// In development, use the browser's Redux dev tools extension if installed
	const enhancers = [];
	const isDevelopment = process.env.NODE_ENV === 'development';
	if (isDevelopment && typeof window !== 'undefined' && window.devToolsExtension) {
		enhancers.push(window.devToolsExtension());
	}

	const rootReducer = combineReducers({
		...reducers,
		routing: routerReducer
	});

	return createStore(
		rootReducer,
		initialState,
		compose(applyMiddleware(...middleware), ...enhancers)
	);
}
