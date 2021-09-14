import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useHistory, useParams, Link} from 'react-router-dom';
import axiosInstance from '../components/axiosjuicer';
import IssueElement from '../components/IssueElement';

const IssuesProject = () => {

    const [theissues, settheissues] = useState([]);
    const [searchtext, setsearchtext] = useState('');
    const [currentProject, setcurrentProject] = useState('');
    const { id } = useParams();
    const history = useHistory();

    useEffect(() => {
        axiosInstance.get('projects/'+String(id)).then(res => {    

            if(res.data['status'] == 'success'){
                settheissues(res.data['data']);
                setcurrentProject(res.data['projectName']);
            }
        })
    }, [])

    return (
        <div className='container' style={{marginTop:45}}>
            {/*<Link to={{pathname: '/newissue', state: {somestate: 'yo' }}}>YO</Link>*/}
            <input onClick={()=> history.push('/newissue', {from: currentProject })} className='btn btn-primary' type='button' value='Create Ticket'/>

            <div style={{"float":"right"}}>
                <input placeholder='Search...' style={{"paddingBottom":"6px","height":"36px"}} onChange={(e) => setsearchtext(e.target.value)} type='text'/>
            </div>
            <div>
            {theissues.filter((val) => {
                if(searchtext.trim() == ""){
                    return val
                }else if(val.text.toLowerCase().includes(searchtext.toLowerCase()) || val.issue_name.toLowerCase().includes(searchtext.toLowerCase()) || val.created_by.toLowerCase().includes(searchtext.toLowerCase()) || val.assignto.toLowerCase().includes(searchtext.toLowerCase())){
                    return val
                }
            }).map((item) =>(
            <div>
                {
                    <IssueElement {...item}/>
                }
                
                <br/>
            </div>
            ))}
            </div>
        </div>
    )
}

export default IssuesProject
