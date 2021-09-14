import React from 'react'
import { useEffect, useState } from 'react'
import { useHistory, useParams } from 'react-router-dom'
import axiosInstance from '../components/axiosjuicer'
import Typography from '@material-ui/core/Typography';

const NewProject = () => {

    const [name, setname] = useState('');

    const history = useHistory();

    useEffect(() => {
        if(!localStorage.getItem('theusername')){            
            history.push('/login', window.location.href);
        }
        else{
            axiosInstance.get('isMod/').then(res => {
                if(!res.data['isMod']){             
                    history.push('/');
                }
            }).catch(err => {
                console.log(err);
            })
        }
    }, [])

    return (
        <div className='container'>
            <form>

                <h3 style={{"textAlign":"center",marginTop:60}}>Create an Issue :</h3>
                
                <div className="form-group">
                    <label>Name:</label>
                    <input onChange={e => setname(e.target.value)} className="form-control" name='issueText' type="text"/>
                </div>
                <br/>

                <div style={{"textAlign":"center"}}>
                    <input type="button" onClick={() => {
                        let theName = name.trim();

                        if(theName !== ''){
                            axiosInstance.post('newproject/',{'project_name':theName}).then(res => {
                                if(res.data['status'] == 'success'){
                                    //history.push('/');
                                }
                                else{                                    
                                    document.getElementById("theStatus").innerHTML = 'encountered issue creating the project.';
                                    document.getElementById("theStatus").hidden = false;
                                }
                            }).catch(err => {
                                console.log(err);
                            })
                        }
                        else{
                            alert('name is empty');
                        }

                    }} className="btn btn-primary" value='Create Issue' style={{"width":"30%","height":"45px"}}/>
                </div>



            </form>

            <Typography align="center" hidden style={{marginTop:30,color:"red"}}  id='theStatus'></Typography>
        </div>
    )
}

export default NewProject
