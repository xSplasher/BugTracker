import React, { useState } from 'react';
import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import TextField from '@material-ui/core/TextField';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Link from '@material-ui/core/Link';
import Grid from '@material-ui/core/Grid';
import Box from '@material-ui/core/Box';
import LockOutlinedIcon from '@material-ui/icons/LockOutlined';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import auth from '../components/auth'


function Copyright() {
  return (
    <Typography variant="body2" color="textSecondary" align="center">
      {'Copyright © '}
      <Link color="inherit" href="https://material-ui.com/">
        Your Website
      </Link>{' '}
      {new Date().getFullYear()}
      {'.'}
    </Typography>
  );
}

const useStyles = makeStyles((theme) => ({
  paper: {
    marginTop: theme.spacing(8),
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: '100%', // Fix IE 11 issue.
    marginTop: theme.spacing(1),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));


export default function SignIn(props) {
    const classes = useStyles();

    const [Login, setLogin] = useState('');
    const [Password, setPassword] = useState('');

    const sendit = (e) => {
        e.preventDefault()

        if(props.location.state){
            auth.login(Login,Password, props.location.state);
        }
        else{
            auth.login(Login,Password);
        }
    };

    const loginAsMod = () => {
      
      if(props.location.state){
          auth.login('admin','azer2331998', props.location.state);
      }
      else{
          auth.login('admin','azer2331998');
      }
    };

    const loginAsUser = () => {
      
      if(props.location.state){
          auth.login('reda','2331998reda', props.location.state);
      }
      else{
          auth.login('reda','2331998reda');
      }
    };

  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <div className={classes.paper}>
        <Avatar className={classes.avatar}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Login
        </Typography>
        <form className={classes.form} noValidate>
          <TextField
            onChange={(e)=>setLogin(e.target.value)}
            variant="outlined"
            margin="normal"
            required
            fullWidth
            id="username"
            label="Username"
            name="username"
            autoFocus
          />
          <TextField
            onChange={(e)=>setPassword(e.target.value)}
            variant="outlined"
            margin="normal"
            required
            fullWidth
            name="password"
            label="Password"
            type="password"
            id="password"
            autoComplete="current-password"
          />
          <Button            
            type="submit"
            fullWidth
            variant="contained"
            color="primary"
            onClick={(e) => sendit(e)}
            className={classes.submit}
          >
            Sign In
          </Button>

          <br/><br/>
          <Grid container xs={12} style={{textAlign:'center'}}>
            {/*
            <Grid item>
              <Link href="/register" variant="body2">
                {"Don't have an account? Sign Up"}
              </Link>
            </Grid>
            */}
            <Grid item xs={12}>
              <Link href="#" variant="body2" onClick={() => loginAsMod()}>
                Login as a Moderator
              </Link>
            </Grid>

            <br/><br/>

            <Grid item  xs={12}>
              <Link href="#" variant="body2" onClick={() => loginAsUser()}>
                Login as a Normal User
              </Link>
            </Grid>
            
          </Grid>
          
        </form>
      </div>
    </Container>
  );
}