import React from 'react'
import Header from './components/Header'
//import Header from './components/Header-side'
import SignIn from './pages/newSignin'
import SignUp from './pages/newSignup'
import Login from './pages/Login'
import Register from './pages/Register'
import Home from './pages/Home'
import Issues from './pages/Issues'
import Issue from './pages/Issue'
import Error404 from './pages/Error404'
import Logout from './pages/Logout'
import CreateNewIssue from './pages/CreateNewIssue'
import ListOfProjects from './pages/ListOfProjects'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom';
import { useEffect } from 'react'
import auth from './components/auth'
import IssuesProject from './pages/IssuesProject'

import AutoGridNoWrap from './components/theelem'
import NewProject from './pages/NewProject'
import AdminDashboard from './pages/AdminDashboard'





const avar = {
  thething:'YOOOO'
}

function App() {

  const name = 'Brad';

  
  

  return (
    <BrowserRouter>      
      <Header/>
      <Switch>

        <Route exact path='/' component={ListOfProjects}/>
        <Route exact path='/newissue' component={CreateNewIssue}/>
        <Route exact path='/newproject' component={NewProject}/>
        <Route exact path='/dashboard' component={AdminDashboard}/>
        {/*<Route exact path='/issues' component={Issues}/>*/}
        <Route exact path='/issue/:id' component={Issue}/>
        <Route exact path='/login' component={SignIn}/>  
        <Route exact path='/register' component={SignUp}/>
        <Route exact path='/logout' component={Logout}/>
        <Route exact path='/projects' component={ListOfProjects}/>
        <Route exact path='/project/:id' component={IssuesProject}/>
        <Route component={Error404}/>

      </Switch>

        {/*<div className="App">
        <h1>Hello from the other side {name}</h1>
        <Header title={avar.thething}></Header>
        </div>*/}
    </BrowserRouter>
    
  );
}

export default App;
