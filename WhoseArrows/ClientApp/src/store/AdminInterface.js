﻿import firebase from 'firebase';

const initialState = {
	questions: [],
	newQuestion: {},
	isLoading: true
};

export const actionCreators = {
	retrieveQuestions: () => {
		return {
			type: 'RETRIEVE_QUESTIONS',
			payload: {
				request: {
					method: 'get',
					url: 'admin/questions'
				}
			}
		};
	},

	addNewQuestion: (newQuestionWithHints) => {
		return {
			type: 'ADD_QUESTION',
			payload: {
				request: {
					method: 'post',
					url: 'admin/questions',
					data: newQuestionWithHints
				}
			}
		};
	}
}

export const reducer = (state, action) => {
	console.log(action);
	state = state || initialState;

	switch (action.type) {

		case 'RETRIEVE_QUESTIONS':
			return {
				...state,
				questions: [],
				isLoading: true
			};

		case 'RETRIEVE_QUESTIONS_SUCCESS':
			return {
				...state,
				questions: action.payload.data,
				isLoading: false
			}

		case 'ADD_QUESTION_SUCCESS':
			return {
				...state,
				newQuestion: action.payload.data
			}
	}

	return state;
}