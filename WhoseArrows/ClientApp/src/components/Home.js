import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { actionCreators } from '../store/Songs';

class Home extends React.Component {
	componentDidMount() {
		this.props.getSongs();
	}

	render() {

		const songsTable = this.props.songs.map(song => {
			return (
				<tr key={song.songId}><td>{song.title}</td><td>{song.titleRomanized}</td><td>{song.artist}</td></tr>
			);
		});
						
		return (
			<div>
				<h1>I haz sum songz from da database</h1>
				<table><tbody>{songsTable}</tbody></table>
			</div>
		);
	}
}

export default connect(
	state => state.songs,
	dispatch => bindActionCreators(actionCreators, dispatch)
)(Home);
