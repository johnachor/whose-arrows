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
			storageService.ref(`images/${this.state.selectedFile.name}`).getDownloadURL().then(url => this.setState({imageUrl: url}));
		});
	}

	handleQuestionSubmit = e => {
		const newQuestion = {
			correctAnswer: this.state.submission.correctAnswer,
			imageUrl: this.state.imageUrl,
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

	render() {

		const questionTableRows = this.props.questions.map(x => {
			return (<tr key={x.questionId}>
				<td>{x.questionId}</td>
				<td>{x.correctAnswer}</td>
				<td>{JSON.stringify(x.hints)}</td>
				<td><img src={x.imageUrl} /></td>
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
				<div id="filesubmit">
					<input onChange={this.handleFileChange} type="file" className="file-select" accept="image/*" />
					<button className="file-submit" onClick={this.handleFileUploadSubmit}>SUBMIT</button>
				</div>
				<div id="questionBuilder">
					<label>Image URL</label><input type="text" readOnly value={this.state.imageUrl} /><br />
					<label>Correct Answer</label><input id="correctAnswer" type="number" onChange={this.handleInputChange} value={this.state.submission.correctAnswer} /><br />
					<label>Hint 1</label><input id="hint1" type="text" value={this.state.submission.hint1} onChange={this.handleInputChange} /><br />
					<label>Hint 2</label><input id="hint2" type="text" value={this.state.submission.hint2} onChange={this.handleInputChange} /><br />
					<button onClick={this.handleQuestionSubmit}>Add Question</button>
				</div>
			</div>
		);
	}
}

export default connect(
	state => state.admin,
	dispatch => bindActionCreators(actionCreators, dispatch)
)(AdminInterface);