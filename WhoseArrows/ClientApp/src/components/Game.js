import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import * as SongsStore from '../store/Songs';
import * as GameStore from '../store/Game';
import Select from 'react-select';

class Game extends React.Component {
	state = {
		dropdownSelection: null
	}

	componentDidMount() {
		this.props.getSongs();
	}

	handleDropdownChange = selection => {
		this.setState({ dropdownSelection: selection });
	}

	beginNewGame = () => {
		this.props.newGame(this.props.player.playerId);
	}

	guess = () => {
		this.props.guess({ sessionId: this.props.sessionId, sessionQuestionId: this.props.sessionQuestionId, givenAnswer: this.state.dropdownSelection.value });
	}

	getHint = () => {
		this.props.getHint(this.props.sessionQuestionId);
	}

	render() {
		return (
			<div className="maingame">
				{!this.props.sessionId ? <button onClick={this.beginNewGame}>Begin New Game</button>
					:
					<div>
						<h2>Current Score: {this.props.currentScore}</h2>
						{!this.props.gameComplete ?
							<div>
								<img className="question-img" src={this.props.imageUrl} />
								<Select value={this.state.dropdownSelection} onChange={this.handleDropdownChange} options={this.props.songs.songs.map(x => ({ value: x.songId, label: (x.titleRomanized || x.title) + ' - ' + x.artist }))} />
								<button onClick={this.guess}>Guess</button>
								<div>
									{this.props.hints.map(x => { return (<p key={x.hintId}>{x.hintText}</p>) })}
									
									<button onClick={this.getHint} disabled={this.props.hints.length === 2}>Get Hint</button>
								</div>
							</div>
							: <div><h2>Game complete!</h2> <br /> <button onClick={this.beginNewGame}>Start Another</button></div>}
					</div>}
			</div>);
	}
}

const mapStateToProps = (state, ownProps) => {
	return {
		songs: state.songs,
		player: state.auth.player,
		...state.game
	}
}

const mapDispatchToProps = (dispatch) => {
	return {
		...bindActionCreators(GameStore.actionCreators, dispatch),
		...bindActionCreators(SongsStore.actionCreators, dispatch)
	}
}

export default connect(mapStateToProps, mapDispatchToProps)(Game);