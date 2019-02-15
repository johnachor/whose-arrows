import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { actionCreators } from '../store/AdminInterface';
import { Button } from 'react-bootstrap';
import './AdminInterface.css';
import storageService from '../firebase';

class AdminInterface extends React.Component {

	state = {
		selectedFile: null,
		imageUrl: '',
		submission: {
			correctAnswer: 0,
			hint1: '',
			hint2: ''
		}
	}

	componentDidMount() {
		this.props.retrieveQuestions();
	}

	getQuestions = e => {
		e.preventDefault();
		this.props.retrieveQuestions();
	}

	handleFileChange = e => {
		this.setState({ selectedFile: e.target.files[0] });
	}

	handleInputChange = e => {
		const { submission } = { ...this.state };
		submission[e.target.id] = e.target.value;
		this.setState({ submission: submission });
	}

	handleFileUploadSubmit = e => {
		const uploadTask = storageService.ref().child(`images/${this.state.selectedFile.name}`).put(this.state.selectedFile); //create a child directory called images, and place the file inside this directory
		uploadTask.on('state_changed', (snapshot) => {
			// Observe state change events such as progress, pause, and resume
		}, (error) => {
			// Handle unsuccessful uploads
			console.log(error);
		}, () => {
			// Do something once upload is complete
			storageService.ref(`images/${this.state.selectedFile.name}`).getDownloadURL().then(this.handleQuestionSubmit);
		});
	}

	handleQuestionSubmit = url => {
		const newQuestion = {
			correctAnswer: this.state.submission.correctAnswer,
			imageUrl: url,
			hints: [
				{
					hintOrder: 1,
					hintText: this.state.submission.hint1
				},
				{
					hintOrder: 2,
					hintText: this.state.submission.hint2
				}
			]
		}

		this.props.addNewQuestion(newQuestion);
	}

	deleteQuestion = (questionId) => {
		this.props.deleteQuestion(questionId);
	}

	render() {
		const renderHint = (hint) => {
			return (<p>{hint.hintOrder}: {hint.hintText}</p>);
		}

		const questionTableRows = this.props.questions.map(x => {
			return (<tr key={x.questionId}>
				<td>{x.questionId}</td>
				<td>{x.correctAnswer}</td>
				<td>Hints: <br />{x.hints.map(renderHint)}</td>
				<td><img src={x.imageUrl} /></td>
				<td><button onClick={() => this.deleteQuestion(`${x.questionId}`)}>Delete</button></td>
			</tr>);
		});

		return (
			<div className="AdminInterface">
				<Button onClick={this.getQuestions}>Get Questions</Button>
				<table>
					<thead><tr>
						<th>Question Id</th><th>Correct Answer</th><th>Hints</th><th>Image</th>
					</tr></thead>
					<tbody>{questionTableRows}</tbody>
				</table>
				<h2>Add Question</h2>
				<div id="questionBuilder">
					<input onChange={this.handleFileChange} type="file" className="file-select" accept="image/*" />
					<label>Correct Answer</label><input id="correctAnswer" type="number" onChange={this.handleInputChange} value={this.state.submission.correctAnswer} /><br />
					<label>Hint 1</label><input id="hint1" type="text" value={this.state.submission.hint1} onChange={this.handleInputChange} /><br />
					<label>Hint 2</label><input id="hint2" type="text" value={this.state.submission.hint2} onChange={this.handleInputChange} /><br />
					<button onClick={this.handleFileUploadSubmit}>Add Question</button>
				</div>
			</div>
		);
	}
}

export default connect(
	state => state.admin,
	dispatch => bindActionCreators(actionCreators, dispatch)
)(AdminInterface);