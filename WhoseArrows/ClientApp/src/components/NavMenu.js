import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Glyphicon, Nav, Navbar, NavItem } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';
import './NavMenu.css';

const NavMenu = props => (
	<Navbar inverse fixedTop fluid collapseOnSelect>
		<Navbar.Header>
			<Navbar.Brand>
				<Link to={'/'}>WhoseArrows</Link>
			</Navbar.Brand>
			<Navbar.Toggle />
		</Navbar.Header>
		<Navbar.Collapse>
			<Nav>
				<LinkContainer to={'/auth'}>
					<NavItem>
						<Glyphicon glyph='user' /> Auth
					</NavItem>
				</LinkContainer>
				<LinkContainer to={'/game'}>
					<NavItem>
						<Glyphicon glyph='arrow-left' />
						<Glyphicon glyph='arrow-down' />
						<Glyphicon glyph='arrow-up' />
						<Glyphicon glyph='arrow-right' />
						Game
					</NavItem>
				</LinkContainer>
				<LinkContainer to={'/highscores'}>
					<NavItem>
						<Glyphicon glyph='list-alt' /> High Scores
					</NavItem>
				</LinkContainer>
				{props.user.uid
					? <LinkContainer to={'/mystats'}>
						<NavItem>
							<Glyphicon glyph='user' /> My Stats
						</NavItem>
					</LinkContainer>
					: null}
				{props.player.isAdmin ?
					<LinkContainer to={'/admin'}>
						<NavItem>
							<Glyphicon glyph='eye-open' /> Admin Tools
					</NavItem>
					</LinkContainer>
					: null}
			</Nav>
		</Navbar.Collapse>
	</Navbar>
);

export default connect(state => state.auth)(NavMenu);