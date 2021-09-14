import React from 'react'
import { Link } from 'react-router-dom';
import Paper from '@material-ui/core/Paper';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import Avatar from '@material-ui/core/Avatar';
import Typography from '@material-ui/core/Typography';
import ButtonBase from '@material-ui/core/ButtonBase';
import Divider from '@material-ui/core/Divider';
import MenuItem from '@material-ui/core/MenuItem';


const useStyles = makeStyles((theme) => ({
    root: {
      flexGrow: 1,
    },
    paper: {
      padding: theme.spacing(0),
      margin: 'auto',
      width:"72%"
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
  





export const Priority = ({priority}) => {
    return (
        <>
                


                {(() => {
                    //style={{textAlign:'center',"width":"100%","float":"right","fontWeight":"bold","backgroundColor":"grey","borderRadius":"9px",'color':'white'}}
                    if(priority.toLowerCase() == "low"){
                        return (
                            <Typography  gutterBottom variant="subtitle1" style={{backgroundColor:'#ffff00',"textTransform": "capitalize",textAlign:'center',"width":"100%","float":"right","fontWeight":"bold","borderRadius":"3px",'color':'black'}}>
                                {priority} 
                            </Typography>
                        );
                    }

                    if(priority.toLowerCase() == "medium"){
                        return (
                            <Typography  gutterBottom variant="subtitle1" style={{backgroundColor:'#ffbf00',"textTransform": "capitalize",textAlign:'center',"width":"100%","float":"right","fontWeight":"bold","borderRadius":"3px",'color':'black'}}>
                                {priority} 
                            </Typography>
                        );
                    }

                    if(priority.toLowerCase() == "high"){
                        return (
                            <Typography  gutterBottom variant="subtitle1" style={{backgroundColor:'#ff8000',"textTransform": "capitalize",textAlign:'center',"width":"100%","float":"right","fontWeight":"bold","borderRadius":"3px",'color':'black'}}>
                                {priority} 
                            </Typography>
                        );
                    }

                    if(priority.toLowerCase() == "critical"){
                        return (
                            <Typography  gutterBottom variant="subtitle1" style={{backgroundColor:'#ff0000',"textTransform": "capitalize",textAlign:'center',"width":"100%","float":"right","fontWeight":"bold","borderRadius":"3px",'color':'black'}}>
                                {priority} 
                            </Typography>
                        );
                    }
                    
                    return "fuck you";

                })()}


                {(() => {/*
                        //style={{textAlign:'center',"width":"100%","float":"right","fontWeight":"bold","backgroundColor":"grey","borderRadius":"9px",'color':'white'}}
                    if(priority.toLowerCase() == "low"){
                        return (
                            <span style={{"marginLeft":"10px","marginTop":"6px","height":"13px","width":"13px","backgroundColor":"#ffff00","borderRadius":"50%","display":"inline-block"}}></span>
                        );
                    }

                    if(priority.toLowerCase() == "medium"){
                        return (
                            <span style={{"marginLeft":"10px","marginTop":"6px","height":"13px","width":"13px","backgroundColor":"#ffbf00","borderRadius":"50%","display":"inline-block"}}></span>
                        );
                    }

                    if(priority.toLowerCase() == "high"){
                        return (
                            <span style={{"marginLeft":"10px","marginTop":"6px","height":"13px","width":"13px","backgroundColor":"#ff8000","borderRadius":"50%","display":"inline-block"}}></span>
                        );
                    }

                    if(priority.toLowerCase() == "critical"){
                        return (                    
                            <span style={{"marginLeft":"10px","marginTop":"6px","height":"13px","width":"13px","backgroundColor":"#ff0000","borderRadius":"50%","display":"inline-block"}}></span>
                        );
                    }
                    
                    return "fuck you";

                */})()}
                
        </>
    );
}

const IssueStatus = ({status}) => {
    return (
        <>
        {(() => {
            if(status){
                return (
                    <Typography gutterBottom variant="subtitle1" style={{textAlign:'center',"width":"100%","float":"right","fontWeight":"bold","backgroundColor":"grey","borderRadius":"3px",'color':'white'}}>
                        Closed
                    </Typography>
                );
            }

            if(!status){
                return (
                    <Typography gutterBottom variant="subtitle1" style={{textAlign:'center',"width":"100%","float":"right","fontWeight":"bold","backgroundColor":"green","borderRadius":"3px",'color':'white'}}>
                        Open
                    </Typography>
                );                
            }
        })()}
        </>
    );
}

const IssueElement = (props) => {

    const classes = useStyles();

    
    return (
        <>
            
            
                <div className={classes.root}>
                
                
                <Paper className={classes.paper}>
                    <MenuItem component={Link} to={`/issue/${props.theid}`}>
                        
                        <Grid xs={12} container>
                            
                                <Grid container xs={12}>
                                    <Grid item xs={8}>
                                        <Typography noWrap gutterBottom variant="subtitle1" style={{fontWeight:"bold"}}>
                                        {props.issue_name}
                                        </Typography>
                                    </Grid>
                                    <Grid item xs={2}>
                                        <Priority priority={props.priority}/>
                                    </Grid>
                                    <Grid item xs={2}>
                                        <IssueStatus status={props.isIssueSolved}/>
                                    </Grid>
                                </Grid>

                                <Grid container xs={9} style={{marginTop:18}}>
                                    <Grid item xs>
                                        <Typography variant="body2" style={{ cursor: 'pointer' }}>
                                        created by: {props.created_by}
                                        </Typography>
                                    </Grid>
                                    <Grid item xs>
                                        <Typography variant="body2" style={{ cursor: 'pointer' }}>
                                        assigned to: {props.assignto}
                                        </Typography>
                                    </Grid>
                                </Grid>
                            
                            
                        </Grid>
                    </MenuItem>
                </Paper>
                
                </div>
                



                {/*
                <div style={{"position":"relative","height":"120px","cursor":"pointer","paddingTop":"9px","paddingBottom":"12px","paddingLeft":"9px","marginTop":"1px","backgroundColor":"#000000","color":"#FFFFFF","border":"2px solid white","borderRadius":"6px"}} >
                
                    <Priority priority={props.priority}/>
                    <IssueStatus status={props.isIssueSolved}/>
                    <p style={{"fontSize":"18px","marginTop":"6px","marginLeft":"9px","fontWeight":"bold","width":"70%","wordWrap":"break-word"}}>{props.issue_name}</p>

                    <div style={{"marginLeft":"15px","marginBottom":"9px", "position":"absolute", "bottom":"0"}}>                        
                        <label style={{"fontSize":"15px"}}>created by: <span style={{"textTransform": "capitalize",}}>{props.created_by}</span></label>
                        <label style={{"fontSize":"15px","marginLeft":"45px"}}> assigned to : <span style={{"textTransform": "capitalize",}}>{props.assignto}</span></label>
                    </div>
                </div>
                */}
            
        </>
    )
}

export default IssueElement
