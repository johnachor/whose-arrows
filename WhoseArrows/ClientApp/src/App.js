import React from 'react';
import { Route } from 'react-router';
import Layout from './components/Layout';
import Game from './components/Game';
import Auth from './components/Auth';
import AdminInterface from './components/AdminInterface';


export default () => (
	<Layout>
		<Route exact path='/' component={Auth} />
		<Route exact path='/auth' component={Auth} />
		<Route exact path='/game' component={Game} />
		<Route exact path='/admin' component={AdminInterface} />
	</Layout>
);
