import React, { useState } from 'react'
import { useEffect } from 'react';
import { Link } from 'react-router-dom';
import auth from './auth'
import { AppBar, IconButton, Typography } from '@material-ui/core';
import { Toolbar } from '@material-ui/core';
import MenuIcon from '@material-ui/icons/Menu';
import { makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import TemporaryDrawer from './sidebar';
import HomeIcon from '@material-ui/icons/Home';


const useStyles = makeStyles((theme) => ({
    root: {
      flexGrow: 1,
    },
    menuButton: {
      marginRight: theme.spacing(2),
    },
    title: {
      flexGrow: 1,
    },
  }));


const Header = (props) => {

    const [element, setElement] = useState();
    const classes = useStyles();

    useEffect(() => {
        
        if(localStorage.getItem('theusername')){
            setElement(<>
            
            <div className={classes.title}>                
                {/*<Button style={{marginRight:60}} color="inherit">
                    <Link style={{textDecoration: "none",color: "white"}} to="/dashboard">Dashboard</Link>
                </Button>*/}
                Welcome {localStorage.getItem('theusername')}
            </div>
            <Button style={{fontWeight:"bold"}} color="inherit">
                <a style={{textDecoration: "none",color: "white"}} href='#' onClick={()=>{localStorage.clear();window.location.reload(); }}>Logout</a>
            </Button>
            </>);
        }
        if(!localStorage.getItem('theusername')){

            setElement(<div className={classes.title}>
            <Button style={{fontWeight:"bold"}} color="inherit">
                <Link style={{textDecoration: "none",color: "white"}} to="/login">Login</Link>
            </Button>

            <Button style={{fontWeight:"bold"}} color="inherit">
                <Link style={{textDecoration: "none",color: "white"}} to="/register">Register</Link>
            </Button></div>
            );
        }

        
    }, []);

    

    return (

        <div className={classes.root}>
            <AppBar position="static">
                <Toolbar align='center'>

                    <Link style={{textDecoration: "none",color: "white"}} to="/">
                        <HomeIcon></HomeIcon>
                    </Link>

                    {/*<TemporaryDrawer ></TemporaryDrawer>*/}
                    

                    {(() => {
                        let thevar = localStorage.getItem('isMod');
                        if(thevar){
                            //console.log(thevar);
                            /*return (
                                    <Button style={{fontWeight:"bold",background:'red'}} color="inherit">
                                        <Link style={{textDecoration: "none",color: "white"}} to="/admin">YOOOOO</Link>
                                    </Button>
                            );*/
                        }
                    })()}


                    {element}


                </Toolbar>
            </AppBar>
    













            {/* 
            
            <nav className="navbar navbar-expand-md navbar-dark bg-dark mb-4" style={{height: 60}}>
                <div className="container-fluid">
                    <div className="nav-item active">
                        <Link style={{textDecoration: "none",color: "white", marginLeft: 30, marginRight:30}} to="/">Home</Link>
                        <Link style={{textDecoration: "none",color: "white", marginLeft: 30, marginRight:30}} to="/issues">Issues</Link>
                        <Link style={{textDecoration: "none",color: "white", marginLeft: 30, marginRight:30}} to="/projects">Projects</Link>
                    </div>
                    
                    <div>
                        <ul className="navbar-nav me-auto mb-2 mb-md-0">
                            {element}
                        </ul>
                    </div>
                </div>
            </nav>
                
            */}
        </div>
            
    )
}

export default Header
