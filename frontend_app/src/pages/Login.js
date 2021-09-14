import React, { useEffect, useState } from 'react';
import './logincss.css'
import auth from '../components/auth'
import axiosInstance from '../components/axiosjuicer';
import { useHistory } from 'react-router-dom';

const Login = (props) => {

    const [Login, setLogin] = useState('');
    const [Password, setPassword] = useState('');

    const history = useHistory();

    useEffect(() => {
        //auth.login();
        //console.log(auth.isAuthenticated());
    }, [])

    const sendit = () => {
        if(props.location.state){
            auth.login(Login,Password, props.location.state);
            //auth.isModerator();
        }
        else{
            auth.login(Login,Password);
        }
    };

    return (
        <>
            <main className="text-center">
                <form className="form-signin">
                    <h1 className="h3 mb-3 font-weight-normal">Please sign in</h1>
                    <input type="email" className="form-control" placeholder="Username" onChange={(e)=>setLogin(e.target.value)} required/>
                    <input type="password" className="form-control" placeholder="Password" onChange={(e)=>setPassword(e.target.value)} required/>
                    <div className="checkbox mb-3">
                        <label>
                        <input type="checkbox" value="remember-me"/> Remember me
                        </label>
                    </div>
                    <button className="btn btn-lg btn-primary btn-block" type="submit" onClick={sendit}>Sign in</button>
                </form>
            </main>
        </>
    );
}

export default Login;