import React from 'react';
import { Route } from 'react-router';
import Layout from './components/Layout';
import Home from './components/Home';
import Auth from './components/Auth';



export default () => (
	<Layout>
		<Route exact path='/' component={Home} />
		<Route exact path='/auth' component={Auth} />
	</Layout>
);
