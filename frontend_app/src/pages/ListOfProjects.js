import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { makeStyles } from '@material-ui/core/styles';
import { Link, useParams, useHistory } from 'react-router-dom';
import axiosInstance from '../components/axiosjuicer'

import Paper from '@material-ui/core/Paper';
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
      padding: theme.spacing(3),
      margin: 'auto',
      width:"45%"
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
  


function ListOfProjects() {

    const classes = useStyles();
    const [theprojects, settheprojects] = useState([]);
    const [isMod, setisMod] = useState(false);

    const history = useHistory();

    useEffect(() => {
        axiosInstance.get('projects/all').then(res => {
            if(res.data['status'] == 'success'){
                settheprojects(res.data['data']);
            }
        });

        if(localStorage.getItem('theusername')){
            axiosInstance.get('isMod/').then((res) => {           
            
                if(res.data['isMod']){
                    setisMod(res.data['isMod']);
                    localStorage.setItem('isMod', true);
                }
    
            }).catch(err => {
                console.log(err);
            });
        }        
    }, [])

    return (

        <>
            {/*<Typography noWrap gutterBottom variant="subtitle1" style={{textAlign:'center',marginTop:30,fontStyle:'bold'}}>
                All Projects
            </Typography>
            */}

            <h3 style={{textAlign:"center", marginTop:30}}>All Projects</h3>
            
            <div style={{marginTop:20}}></div>

            {(() => {
                if(isMod){
                    return (
                        <input style={{marginLeft:"21%"}} onClick={()=> history.push('/newproject')} className='btn btn-primary' type='button' value='New Project'/>
                    );
                }
            })()}
            
            
            <div style={{marginTop:60}}>

            {theprojects.map((aproject) => (
                <div className={classes.root}>
                   <Paper className={classes.paper}>
                        <MenuItem component={Link} to={`/project/${aproject.theid}`}>
                        
                            <Grid xs={12} container>
                                <Grid item xs={6}>
                                    <Typography noWrap gutterBottom variant="subtitle1">
                                        {aproject.name} 
                                    </Typography>                                    
                                </Grid>

                                <Grid item xs={6} style={{float:'right'}}>

                                    <Typography noWrap gutterBottom variant="subtitle1" style={{float:"right"}}>
                                        {aproject.issues.length}
                                    </Typography>   
                                    
                                </Grid>
                            
                            </Grid>
                           
                        </MenuItem>
                    </Paper>
                </div>
            ))}
            </div>


            






        {/*
        <div className='mx-auto' style={{"width":"30%","color":"white"}}>
            
            {theprojects.map((aproject) => (

                <Link to={`/project/${aproject.theid}`} style={{textDecoration: "none",color: "white"}}>
                    <div className='card' style={{"marginBottom":"18px"}}>
                        <div className='card-body' style={{"background":"black"}}>
                            {aproject.name} <span style={{"float":"right"}}>{aproject.issues.length}</span>
                        </div>
                    </div>
                </Link>
                
            ))}
        </div>
        */}
        </>
    )
}

export default ListOfProjects
