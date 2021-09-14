import { useHistory } from 'react-router-dom';
import axiosInstance from './axiosjuicer'


class Auth {
    constructor() {
        this.authenticated = false;
    }

    register(uusername, ppassword){
        axiosInstance.post('newuser/',{username:uusername, password:ppassword}).then((res) =>{
            //const history = useHistory();
            //window.location.href = theRedirect
            window.location.href = 'http://127.0.0.1:3000/login';        
            //console.log('DONE')
            
        }).catch((err) => {
            console.log(err);
        });
    }

    login(login, ppassword, theRedirect){ // make a function to actually Login

        axiosInstance.post('token/',{username:login, password:ppassword}).then((res) =>{
            localStorage.setItem('access_token', res.data.access);
            //console.log('REFRESH TOKEN IS');
            //console.log(res.data.refresh);
            localStorage.setItem('refresh_token', res.data.refresh);
            localStorage.setItem('theusername', login);
            //history.push('/issues')

            if(theRedirect){
                window.location.href = theRedirect
            }else{
                window.location.href = 'http://127.0.0.1:3000/'
            }
        }).catch((err) => {
            //console.log(err.response.data['detail']);
            //console.log(err);
            console.log('idk man');
            //alert('Try again');
        });

        
    }

    logout(){ // make a function to actually Logout
        this.authenticated = false;
        localStorage.clear();
    }

    isAuthenticated(){
        return this.authenticated;
    }

    isModerator(){

        axiosInstance.get('isMod/').then((res) => {           
            
            if(res.data['isMod']){
                console.log('login:');
                console.log(res.data['isMod']);
                localStorage.setItem('isMod', true);
            }
            else{
                localStorage.setItem('isMod', false);
                console.log(res.data['isMod']);
            }

            
        }).catch(err => {
            console.log(err);
        });
    }
}

export default new Auth();