import React, { useEffect, useState } from 'react'
import axios from 'axios';
import IssueElement from '../components/IssueElement';
import auth from '../components/auth';
import { useHistory } from 'react-router-dom';
import Search from '../components/Search';



const Issues = () => {

    const [listOfIssues, setlistOfIssues] = useState([]);
    const [searchtext, setsearchtext] = useState('');

    const history = useHistory();

    useEffect(() => {

         
        //console.log(auth.isAuthenticated());
        
    
        axios.get("http://127.0.0.1:8000/api/issue/all").then(res => {
            
            if(res.data['status'] == 'success'){
                setlistOfIssues(res.data['data'])
            }
            else{
                console.log('didnt load api data')
            }
        });
    }, []);


    /*useEffect(() => { 
        #console.log('UPDATING VARIABLE')
        console.log(listOfIssues);
    }, [listOfIssues]);*/


    /*useEffect(() => {
    
        axios.get("http://127.0.0.1:8000/api/issue/all").then(res => {
            
            if(res.data['status'] == 'success'){
                setlistOfIssues(res.data['data'])
            }
            else{
                console.log('didnt load api data')
            }

            console.log(listOfIssues);
        });
    }, [listOfIssues])
    */
    return (
        <div className='container' style={{marginTop:45}}>
            
            <input onClick={()=> history.push('/newissue')} className='btn btn-primary' type='button' value='Create Ticket'/>

            <div style={{"float":"right"}}>
                <input placeholder='Search...' style={{"paddingBottom":"6px","height":"36px"}} onChange={(e) => setsearchtext(e.target.value)} type='text'/>
            </div>

            <div style={{"marginTop":"30px"}}>


                



                {listOfIssues.filter((val) => {
                    if(searchtext.trim() == ""){
                        return val
                    }else if(val.text.toLowerCase().includes(searchtext.toLowerCase()) || val.issue_name.toLowerCase().includes(searchtext.toLowerCase())){
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

export default Issues;


/*

Object.keys(item).map((key) => {
    return (
        <>
        <div> {item[key]} </div>
        </>
    );                        
})          


*/