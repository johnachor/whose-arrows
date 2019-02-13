import firebase from 'firebase';
import constants from './constants.json';

// initialize Firebase app
firebase.initializeApp(constants.firebaseConfig);
const storageService = firebase.storage();

export default storageService;