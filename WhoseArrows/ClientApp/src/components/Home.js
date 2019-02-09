import React from 'react';
import { connect } from 'react-redux';
import axios from 'axios';

class Home extends React.Component {
	state = {
		songs: []
	}

	componentDidMount() {
		axios.get("api/songs").then(response => this.setState({ songs: response.data }));
	}

	render() {

		const songsTable = this.state.songs.map(song => {
			return (
				<tr><td>{song.title}</td><td>{song.artist}</td></tr>
			);
		});
						
		return (
			<div>
				<h1>I haz sum songz from da database</h1>
				<table>{songsTable}</table>
			</div>
		);
	}
}

export default connect()(Home);
