import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { Redirect, useHistory, useParams } from 'react-router-dom'
import axiosInstance from '../components/axiosjuicer'
import { Priority } from '../components/IssueElement'

import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import Paper from '@material-ui/core/Paper';
import { makeStyles } from '@material-ui/core/styles';



const useStyles = makeStyles((theme) => ({
    root: {
      flexGrow: 1,
    },
    paper: {
      padding: theme.spacing(2),
      margin: 'auto',
    },
    image: {
      width: 128,
      height: 128,
    },
    img: {
      margin: 'auto',
      display: 'block',
      maxWidth: '100%',
      maxHeight: '100%',
    },
  }));
  


const IssueText = (props) => {

    const classes = useStyles();

    return (
        <>  
            <Priority priority={props.theobject.priority}/>
                <div className={classes.root}>
                <Paper className={classes.paper}>

                    {/* Mark Issue as Solved Button */}

                    {(()=>{
                        if( ((localStorage.getItem('theusername') === props.theobject.created_by) || props.isModerator ) && !props.isItSolved){
                            return (
                                <input onClick={() => {
                                    axiosInstance.put('issue/'+String(props.theobject.theid), {newstate:"makeittrue"}).then(res => {
                                        if(res.data['status'] == 'success'){
                                            console.log('yep');
                                            window.location.reload();
                                        }
                                    })
                                }} type='button' className='btn btn-info btn-sm' name='editbutton' style={{"float":"right","marginRight":"10px"}} value='Mark as Solved'/>
                            );
                        }
                    })()}

                    <IsSolved theobject={props.theobject} />
                    
                    {/* Delete Issue Button */}

                    {(()=>{
                        if( ((localStorage.getItem('theusername') === props.theobject.created_by) && !props.isItSolved ) || props.isModerator){
                            return (
                                <input onClick={() => {
                                    axiosInstance.delete('issue/'+String(props.theobject.theid), {newstate:"update_issue"}).then(res => {
                                        if(res.data['status'] == 'success'){
                                            console.log('yep');
                                            //window.location.reload();
                                            window.location.href = 'http://127.0.0.1:3000/';
                                        }
                                    })
                                }} type='button' className='btn btn-danger btn-sm' style={{"float":"right","marginRight":"10px"}} value='Delete'/>
                            );
                        }
                    })()}

                    <br/><br/>

                    <Grid xs={12} container>
                        <Grid item xs={12}>
                            <Typography noWrap gutterBottom variant="subtitle1" style={{fontWeight:"bold",fontSize:18}}>
                                {props.theobject.issue_name}
                            </Typography>
                        </Grid>                

                        <Grid style={{marginRight:30,marginLeft:30,"wordWrap":"break-word",marginBottom:60}} item xs={12} zeroMinWidth>
                            <Typography gutterBottom variant="body2">
                        wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
                            </Typography>
                        </Grid>

                        <Grid item xs={6}>
                            <Typography gutterBottom variant="body2" style={{float:"left"}}>
                                assigned to: {props.theobject.assignto}
                            </Typography>  
                        </Grid>

                        <Grid item xs={6}>
                            <Typography gutterBottom variant="body2" style={{float:"right"}}>
                                {props.theobject.created_by} - created at: {props.theobject.at}
                            </Typography>                    
                        </Grid>
                    </Grid>



                    {/*
                    <h4 className='card-title' style={{"width":"100%","wordWrap":"break-word"}}> {props.theobject.issue_name} </h4><br/>
                    <p className='card-text' style={{"fontSize":"15px","paddingLeft":"30px","paddingRight":"30px","width":"100%","wordWrap":"break-word"}}>{props.theobject.text}</p><br></br>

                    <br/><br/>
                    <div className='card-link' style={{"float":"right","fontSize":"12px","marginTop":"3px"}}><span style={{"fontSize":"13px","paddingRight":"3px"}}>at: </span> {props.theobject.at}</div>  
                    <div className='card-link' style={{"float":"right","fontSize":"18px","paddingRight":"15px"}}><span style={{"marginRight":"12px"}}> {props.theobject.created_by}</span>  -</div>
                    <div className='card-link float-left' style={{"fontSize":"15px"}}><span style={{"fontSize":"12px","paddingRight":"3px"}}>assigned to: </span> {props.theobject.assignto}</div>
                    */}
                    </Paper>
                </div>
            
            

        </>
    );
}


const Comments = (props) => {

    const classes = useStyles();    

    return (
        <>  
            <h3 className='mx-auto'>Comments :</h3> <br/>
            <div className='mx-auto' style={{"width":"90%"}}>
                
                {props.theobject.map((thecommentsolution) => (
                    <>
                        {(() => {

                            if(thecommentsolution.isThisCommentSolution){  // SOLUTION COMMENT

                                return (
                                    <>
                                    <div id='solvedComment' className='mx-auto' style={{"width":"90%","border":"1px solid black","borderRadius":"9px","marginBottom":"60px","marginTop":"30px","paddingBottom":"12px"}}>
                                        <label className='btn btn-info btn-sm' style={{"width":"100%","textAlign":"center","borderRadius":"3px","paddingTop":"9px","paddingBottom":"9px","fontWeight":"bold","fontSize":"18px","pointerEvents":"none"}}>Solution</label><br/><br/>
                                        <label className='mx-auto' id='solvedText' style={{"width":"100%","wordWrap":"break-word","paddingLeft":"30px","paddingRight":"30px","fontSize":"15px"}}>{thecommentsolution.comment}</label><br/><br/>
                                        <label style={{"fontSize":"15px","marginLeft":"60px","marginRight":"6px"}}>-</label><label id='solvedName' style={{"fontSize":"15px"}}>{thecommentsolution.created_by}</label>
                                    </div>
                                    </>
                                );
                            }
                        })()}
                    </>
                ))}


                {props.theobject.map((item) =>(
                    <>
                    
                        <div className='card' style={{"marginBottom":"9px"}}>
                            <span hidden key={item.commentId}> YOOOOO </span>
                            <div className='card-body'>
                                {(() => {
                                    if(localStorage.getItem('theusername') === item.created_by && !props.isItSolved){ // DELETE COMMENT BUTTON
                                            return (
                                            <input onClick={() => {
                                                console.log(item.commentId);
                                                axiosInstance.post('deletecomment/',{cId:String(item.commentId)}).then(res => {
                                                    if(res.data['status'] == 'success'){
                                                        console.log('PogChamp');
                                                        window.location.reload();                                                
                                                    }
                                                    else{
                                                        console.log('we failed man');
                                                    }
                                                }).catch(err => {
                                                    console.log(err);
                                                })
                                            }} className='btn btn-danger btn-sm' style={{"float":"right"}} type='button' value='DELETE'></input>
                                            );
                                    }
                                })()}

                                {(()=>{
                                    if(!props.isItSolved && props.issueCreator === localStorage.getItem('theusername')){ // MARK AS SOLVED BUTTON
                                        return (
                                            <input onClick={() => {
                                                axiosInstance.put('comments/'+String(item.commentId), {newstate:"makeittrue"}).then(res => {
                                                    if(res.data['status'] == 'success'){
                                                        console.log('yep');
                                                        window.location.reload();
                                                    }
                                                })
                                            }} type='button' className='btn btn-info btn-sm' name='editbutton' style={{"float":"right","marginRight":"10px"}} value='Mark as Solution'/>
                                        );
                                    }
                                })()}
                                <p className='card-text' style={{"fontSize":"15px","paddingBottom":"6px"}}>{item.comment}</p>                     
                                <div className='card-link' style={{"float":"left","fontSize":"15px","paddingLeft":"15px"}}>- {item.created_by}</div>
                                <div className='card-link' style={{"float":"right","fontSize":"12px"}}>{item.at}</div>
                                
                            </div>
                            
                        </div>
                       
                    </>
                ))}
                
            </div>
        </>
    );
}


const IsSolved = (props) => {
    return (
        <>
            {(() => {

                if(props.theobject.isIssueSolved){
                    return (
                        <label className='btn btn-info btn-sm' name='solvedIssue' style={{float:"right","fontSize":"16px","marginLeft":"18px","pointerEvents":"none"}}>Solved &#10003;</label>
                    );
                }
                
            })()}
        </>
    );
}


const Issue = () => {
    const { id } = useParams();
    const [theissue, settheissue] = useState('');
    const [comments, setComments] = useState([]);
    const [newcomment, setnewcomment] = useState('');
    const [isSolved, setisSolved] = useState(false);
    const [isMod, setisMod] = useState(false);

    const history = useHistory();

    useEffect(() => {
        //console.log('access');
        //console.log(localStorage.getItem('access_token'));
        if(!localStorage.getItem('theusername')){            
            history.push('/login', window.location.href);
        }

        else{

            axiosInstance.get("issue/"+String(id)).then(res => {

                if(res.data['status'] == 'success'){
                    
                    if(res.data['data'].isIssueSolved){                        
                        setisSolved(true);
                    }
                   
                    settheissue(res.data['data'])
                }
                else{
                    console.log('didnt load api data')
                }

                setisMod(res.data['isModerator']);
                
            }).catch((err) => {
                console.log(JSON.stringify(err));
            });

            //eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjI1MTgzMjYzLCJqdGkiOiI5NTdmYzNmNTg5ZTY0ZjZjYjljM2ZkZmQ0NzBlZmUxYyIsInVzZXJfaWQiOjJ9.pNjOLYQG0EG4vrlH65NGu3RTBwIeRb5rwDRWbYQ-Um4

            axiosInstance.get("comments/"+String(id)).then(res => {

                if(res.data['status'] == 'success'){
                    setComments(res.data['data'])
                }
                else{
                    console.log('didnt load api data')
                }
                
            }).catch(err => {
                console.log(err);
            });
            //console.log('refresh');
            //console.log(localStorage.getItem('refresh_token'))
        }
    },[])
    /*
    useEffect(() => { 
        console.log('UPDATING ISSUES');
        console.log(theissue);
    }, [theissue]);

    useEffect(() => { 
        console.log('UPDATING COMMENTS ##########');
        console.log(comments);
    }, [comments]);
    */

    return (
        <>
            <div className='container' style={{marginTop:60}}>

                {(() => {
                    
                    if(theissue){
                        return (
                        <div>
                            
                            <IssueText theobject={theissue} isItSolved={isSolved} isModerator={isMod}/>

                            {(()=> {
                                if(theissue.isIssueSolved == false){

                                    return(
                                        <div className='mx-auto' style={{"width":"70%","height":"100px","alignItems":"center"}}>
                                            <br/>                                      
                                            <textarea onChange={(e) => setnewcomment(e.target.value)} type='text' name='thetext' style={{"resize": "none","width":"100%","height":"100px","marginBottom":"12px"}}> </textarea>
                                            <input onClick={(e) => {
                                                axiosInstance.post('newcomment/',{comment:newcomment,IssueId:theissue.theid}).then(res => {

                                                    if(res.data['status'] == 'success'){
                                                        console.log('PogU');
                                                        window.location.reload();
                                                    }
                                                    else{
                                                        console.log('bruuuuuuh')
                                                    }

                                                }).catch(err => {
                                                    console.log('some error happened');
                                                    
                                                    console.log(err);
                                                });
                                                
                                            }} className='btn btn-primary' style={{"float":"right"}} type='button' name='thebutton' value='Add Comment'/>
                                        </div>
                                    );
                                }

                            })()}
                            <br/>
                            <br/>
                            <Comments theobject={comments} isItSolved={isSolved} issueCreator={theissue.created_by}></Comments>
                            
                            
                        </div>
                        );
                    }
                    
                })()}
            </div>
        </>
    )
}

export default Issue
