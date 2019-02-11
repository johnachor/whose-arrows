import React from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { actionCreators } from '../store/Auth';

class AuthForm extends React.Component {

	state = {
		user: {
			email: '',
			password: ''
		},
		isError: false,
		error: ''
	}

	onInputChange = (e) => {
		const { user } = { ...this.state };
		user[e.target.id] = e.target.value;
		this.setState({ user });
	}

	submitLogin = (e) => {
		e.preventDefault();
		const { user } = this.state;
		// Send user to firebase auth method
		this.props.login(user.email, user.password);
	}

	submitRegister = (e) => {
		e.preventDefault();
		const { user } = this.state;
		// Send user to firebase auth method
		this.props.register(user.email, user.password);
	}

	render() {
		return (
			<div className='LoginForm'>
				<h2>Login to WhoseArrows!</h2>
				<div className="container">
					<div className="row justify-content-center">
						<form className='card'>
							<div className="form-group">
								<label htmlFor="email">Email address</label>
								<input type="email" id="email" className="form-control" placeholder="Enter email" value={this.state.user.email} onChange={this.onInputChange} />
							</div>
							<div className="form-group">
								<label htmlFor="password">Password</label>
								<input type="password" id="password" className="form-control" placeholder="Password" value={this.state.user.password} onChange={this.onInputChange} />
							</div>
							{
								this.state.isError ? (
									<div className="alert alert-danger">{this.state.error}</div>
								) : null
							}
							<button onClick={this.submitLogin} className="btn btn-primary">Login</button>
							<button onClick={this.submitRegister} className="btn btn-primary">Register</button>
						</form>
					</div>
				</div>
			</div>
		);
	}
}

export default connect(
	state => state.auth.user,
	dispatch => bindActionCreators(actionCreators, dispatch)
)(AuthForm);
