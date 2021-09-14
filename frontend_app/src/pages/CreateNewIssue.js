import React from 'react'
import { useEffect, useState } from 'react'
import { useHistory, useParams } from 'react-router-dom'
import axiosInstance from '../components/axiosjuicer'


const CreateNewIssue = () => {

    const [projects, setprojects] = useState([]);
    const [theusers, settheusers] = useState([]);
    const [priorities, setpriorities] = useState(['low','medium','high','critical']);

    const [title, settitle] = useState('');
    const [description, setdescription] = useState('');
    const [project, setproject] = useState('');
    const [priority, setpriority] = useState('');
    const [assignto, setassignto] = useState('');

    const history = useHistory();

    useEffect(() => {

        
        setproject(history.location.state.from);
        
        if(!localStorage.getItem('theusername')){            
            history.push('/login', window.location.href);
        }

        else{

            axiosInstance.get('projects/all').then(res => {
                if(res.data['status'] === 'success'){
                    var thearray = [];
                    res.data['data'].forEach((theElement) => thearray.push(theElement['name']));
                    setprojects(thearray);
                }
            });

            axiosInstance.get('allusers/').then(res => {
                if(res.data['status'] === 'success'){
                    var thearray = [];
                    res.data['data'].forEach((theElement) => thearray.push(theElement['username']));
                    settheusers(thearray);
                }
            });
        }
    }, []);


    return (
        <div className='container'>
            <br/>
            <form>

                <h3 style={{"textAlign":"center"}}>Create an Issue :</h3>
                
                <div className="form-group">
                    <label>Title:</label>
                    <input onChange={e => settitle(e.target.value)} className="form-control" name='issueText' type="text"/>
                </div>
                
                <div className="form-group">
                    <label>Description:</label>
                    <textarea onChange={e => setdescription(e.target.value)} className="form-control" name='text' type="text"></textarea>
                </div>

                {/* 
                <div className="form-group">
                    <label>Projects:</label><br/>                    
                    <select onChange={e => setproject(e.target.value)} style={{"width":"15%","height":"36px"}} name="project">
                        <option selected>Select a Project</option>
                        {projects.map((aproject) => (
                            <option value={aproject}>{aproject}</option>
                        ))}
                    </select>
                </div>
                */}
                <div className="form-group">
                    <label>Priority:</label><br/>
                    <select onChange={e => setpriority(e.target.value)} style={{"width":"15%","height":"36px"}} name="priority">
                        <option selected>Select a Priority</option>
                        <option value="low">Low</option>
                        <option value="medium">Medium</option>
                        <option value="high">High</option>
                        <option value="critical">Critical</option>
                    </select>
                </div>

                <label>Assign to:</label><br/>
                <select onChange={e => setassignto(e.target.value)} id='theselectlist' style={{"width":"21%","height":"36px"}} name="assignto">
                    <option selected>Select a User</option>
                    {theusers.map((auser) => (
                        <option value={auser}>{auser}</option>
                    ))}
                </select><br/><br/><br/>

                <div style={{"textAlign":"center"}}>
                    <input type="button" onClick={() => {
                        let theProject = project.trim();
                        let thePriority = priority.trim().toLowerCase();
                        let theAssignedUser = assignto.trim();
                        
                        if(theusers.includes(theAssignedUser) && projects.includes(theProject) && priorities.includes(thePriority)){
                            axiosInstance.post('issue/addnew',{issue_name:title.trim(),text:description.trim(),created_by:localStorage.getItem('theusername'),priority:thePriority,assignto:theAssignedUser,project_it_belongs_to:theProject}).then(res => {
                                if(res.data['status'] == 'success'){
                                    window.location.reload();
                                }
                                else{
                                    console.log('couldnt create the issue');
                                }
                            }).catch(err => {
                                console.log(err);
                            })
                        }
                        
                    }} className="btn btn-primary" value='Create Issue' style={{"width":"30%","height":"45px"}}/>
                </div>



            </form>
        </div>
    );
}

export default CreateNewIssue
