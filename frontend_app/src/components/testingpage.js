import React from 'react'
import { Link } from 'react-router-dom';


export const Priority = ({priority}) => {
    return (
        <>
                <label style={{"backgroundColor":"lightgrey","float":"right","textTransform": "capitalize","textAlign":"left","width":"9%","marginRight":"12px","marginTop":"10px","marginLeft":"6px","fontSize":"15px","border":"1px solid black","paddingLeft":"7px","paddingRight":"7px","paddingTop":"3px","paddingBottom":"3px","borderRadius":"9px"}}>
                    {priority}

                {(() => {

                    if(priority.toLowerCase() == "low"){
                        return (
                            <span style={{"float":"right","marginLeft":"10px","marginTop":"6px","height":"13px","width":"13px","backgroundColor":"#ffff00","borderRadius":"50%","display":"inline-block"}}></span>
                        );
                    }

                    if(priority.toLowerCase() == "medium"){
                        return (
                            <span style={{"float":"right","marginLeft":"10px","marginTop":"6px","height":"13px","width":"13px","backgroundColor":"#ffbf00","borderRadius":"50%","display":"inline-block"}}></span>
                        );
                    }

                    if(priority.toLowerCase() == "high"){
                        return (
                            <span style={{"float":"right","marginLeft":"10px","marginTop":"6px","height":"13px","width":"13px","backgroundColor":"#ff8000","borderRadius":"50%","display":"inline-block"}}></span>
                        );
                    }

                    if(priority.toLowerCase() == "critical"){
                        return (                    
                            <span style={{"float":"right","marginLeft":"10px","marginTop":"6px","height":"13px","width":"13px","backgroundColor":"#ff0000","borderRadius":"50%","display":"inline-block"}}></span>
                        );
                    }
                    
                    return "fuck you";

                })()}
                
                </label>
        </>
    );
}

const IssueStatus = ({status}) => {
    return (
        <>
        {(() => {
            if(status){
                return (
                    <label style={{"color":"white","float":"right","textAlign":"center","fontWeight":"bold","backgroundColor":"grey","width":"9%","marginRight":"12px","marginTop":"10px","marginLeft":"6px","fontSize":"15px","border":"1px solid white","paddingLeft":"7px","paddingRight":"7px","paddingTop":"3px","paddingBottom":"3px","borderRadius":"9px"}}>
                        Closed
                    </label>
                );
            }

            if(!status){
                return (
                    <label style={{"color":"white","float":"right","textAlign":"center","fontWeight":"bold","backgroundColor":"green","width":"9%","marginRight":"12px","marginTop":"10px","marginLeft":"6px","fontSize":"15px","border":"1px solid white","paddingLeft":"7px","paddingRight":"7px","paddingTop":"3px","paddingBottom":"3px","borderRadius":"9px"}}>
                        Open
                    </label>
                );                
            }
        })()}
        </>
    );
}

const IssueElement = (props) => {
    return (
        <>
            <Link to={`/issue/${props.theid}`}>
                

                <div className="container" >
                    
                    
                    <div className="inner-main">
                        <div className="inner-main-body p-2 p-sm-3 collapse forum-content show">
                            <div className="card mb-2">
                                <div className="card-body p-2 p-sm-3" style={{"backgroundColor":"#d9d9d9"}}>
                                    <Priority priority={props.priority}/>
                                    <IssueStatus status={props.isIssueSolved}/>
                                    <div className="media forum-item">
                                        <div className="media-body">
                                            <h6><a href="#" data-toggle="collapse" data-target=".forum-content" className="text-body">{props.issue_name}</a></h6>
                                            <p className="text-secondary">
                                            lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
                                            </p>
                                            <p className="text-muted">{props.created_by} <span className="text-secondary font-weight-bold">assigned to : {props.assignto}</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        </div>
                    </div>

                </div>

                    
            </Link>
        </>
    )
}

export default IssueElement
