import React, { useState } from 'react'
import auth from '../components/auth';


const Register = () => {


    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');

    const sendit = (e) => {
        e.preventDefault()
        //console.log(typeof(username))
        //console.log(username)
        //console.log(typeof(password))
        //console.log(password)
        auth.register(username,password);
    };

    return (
        <>
            <main className="text-center">
                <form className="form-signin">
                    <h1 className="h3 mb-3 font-weight-normal">Register</h1>
                    <input type="text" className="form-control" placeholder="Username" onChange={(e) => setUsername(e.target.value)} required/>                   
                    <input type="password" className="form-control" placeholder="Password" onChange={(e) => setPassword(e.target.value)} required/>
                    <button className="btn btn-lg btn-primary btn-block" type='submit' onClick={(e) => sendit(e)}>Sign in</button>
                </form>
            </main>
        </>
    )
}

export default Register
