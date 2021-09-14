import React from 'react';
import clsx from 'clsx';
import { makeStyles } from '@material-ui/core/styles';
import Drawer from '@material-ui/core/Drawer';
import Button from '@material-ui/core/Button';
import List from '@material-ui/core/List';
import Divider from '@material-ui/core/Divider';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import InboxIcon from '@material-ui/icons/MoveToInbox';
import MailIcon from '@material-ui/icons/Mail';
import { Link } from 'react-router-dom';
import { Redirect } from 'react-router'
import MenuIcon from '@material-ui/icons/Menu';
import { IconButton, Typography } from '@material-ui/core';
import HomeOutlinedIcon from '@material-ui/icons/HomeOutlined';
import LibraryBooksIcon from '@material-ui/icons/LibraryBooks';
import BugReportIcon from '@material-ui/icons/BugReport';

const useStyles = makeStyles({
  list: {
    width: 250,
  },
  fullList: {
    width: 'auto',
  },
});

export default function TemporaryDrawer() {
  const classes = useStyles();
  const [state, setState] = React.useState({
    top: false,
    left: false,
    bottom: false,
    right: false,
  });

  const toggleDrawer = (anchor, open) => (event) => {
    if (event.type === 'keydown' && (event.key === 'Tab' || event.key === 'Shift')) {
      return;
    }

    setState({ ...state, [anchor]: open });
  };

  const list = (anchor) => (
    <div
      className={clsx(classes.list, {
        [classes.fullList]: anchor === 'top' || anchor === 'bottom',
      })}
      role="presentation"
      onClick={toggleDrawer(anchor, false)}
      onKeyDown={toggleDrawer(anchor, false)}
    >
        <Typography variant="h5" align="center" style={{marginTop:21, marginBottom:45}}>
            BugTracker
        </Typography>

      <List align="center">
        {/*['Inbox', 'Starred', 'Send email', 'Drafts'].map((text, index) => (
          <ListItem onClick={() => console.log('yo')} button key={text}>
            <ListItemIcon>{index % 2 === 0 ? <InboxIcon /> : <MailIcon />}</ListItemIcon>
            <ListItemText primary={text} />
          </ListItem>
        ))*/}

        

        <Link style={{textDecoration: "none",color: "black"}} to='/'>
            <ListItem button>
                <ListItemIcon><HomeOutlinedIcon/></ListItemIcon>
                <ListItemText primary={'Home'} />
            </ListItem>
        </Link>

        <Link style={{textDecoration: "none",color: "black"}} to='/projects'>
            <ListItem button>
                <ListItemIcon><LibraryBooksIcon/></ListItemIcon>
                <ListItemText primary={'Projects'} />
            </ListItem>
        </Link>

        <Link style={{textDecoration: "none",color: "black"}} to='/issues'>
            <ListItem button >
                
                    <ListItemIcon><BugReportIcon/></ListItemIcon>
                    <ListItemText primary={'Issues'} />
                
            </ListItem>
        </Link>
        
      </List>
    </div>
  );

  return (
    <div>
      {
        <React.Fragment>
        <IconButton onClick={toggleDrawer('left', true)} edge="start" color="inherit" aria-label="menu">
          <MenuIcon />
        </IconButton>
          <Drawer anchor={'left'} open={state['left']} onClose={toggleDrawer('left', false)}>
            {list('left')}
          </Drawer>
        </React.Fragment>
      }
    </div>
  );
}
