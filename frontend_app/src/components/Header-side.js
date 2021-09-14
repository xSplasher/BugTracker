import React, { useState } from 'react'
import { useEffect } from 'react';
import { Link } from 'react-router-dom';
import auth from './auth'
import SideNav, { Toggle, Nav, NavItem, NavIcon, NavText } from '@trendmicro/react-sidenav';
import '@trendmicro/react-sidenav/dist/react-sidenav.css';

import {Navigation} from 'react-minimal-side-navigation';
import 'react-minimal-side-navigation/lib/ReactMinimalSideNavigation.css';




const Header = (props) => {

    const [element, setElement] = useState();

    

    useEffect(() => {

        const thelib = window.thejsfile;
        
        if(localStorage.getItem('theusername')){
            setElement(<><li className="nav-item active" style={{"color":"white"}}>Welcome {localStorage.getItem('theusername')}</li><li className="nav-item active">
            <a style={{textDecoration: "none",color: "white", marginLeft: 30, marginRight:30}} href='#' onClick={()=>{localStorage.clear();window.location.reload(); }}>Logout</a>
            </li></>);
        }
        if(!localStorage.getItem('theusername')){

            setElement(<><li className="nav-item active">
                <Link style={{textDecoration: "none",color: "white", marginLeft: 30, marginRight:30}} to="/login">Login</Link>
            </li>
            <li className="nav-item active">
            <Link style={{textDecoration: "none",color: "white", marginLeft: 30, marginRight:30}} to="/register">Register</Link>
            </li></>
            );
        }
    }, []);

    

    return (

    <div className="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style={{float:"left", width: '18%',height:"100%"}}>
        <a href="/" className="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
          <svg className="bi me-2" width={40} height={32}><use xlinkHref="#bootstrap" /></svg>
          <span className="fs-4">Sidebar</span>
        </a>
        <hr />
        <ul className="nav nav-pills flex-column mb-auto">
          <li className="nav-item">
            <a href="#" className="nav-link active" aria-current="page">
              <svg className="bi me-2" width={16} height={16}><use xlinkHref="#home" /></svg>
              Home
            </a>
          </li>
          <li>
            <a href="#" className="nav-link text-white">
              <svg className="bi me-2" width={16} height={16}><use xlinkHref="#speedometer2" /></svg>
              Dashboard
            </a>
          </li>
          <li>
            <a href="#" className="nav-link text-white">
              <svg className="bi me-2" width={16} height={16}><use xlinkHref="#table" /></svg>
              Orders
            </a>
          </li>
          <li>
            <a href="#" className="nav-link text-white">
              <svg className="bi me-2" width={16} height={16}><use xlinkHref="#grid" /></svg>
              Products
            </a>
          </li>
          <li>
            <a href="#" className="nav-link text-white">
              <svg className="bi me-2" width={16} height={16}><use xlinkHref="#people-circle" /></svg>
              Customers
            </a>
          </li>
        </ul>
        <hr />
        <div className="dropdown">
          <a href="#" className="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="" className="rounded-circle me-2" width={32} height={32} />
            <strong>mdo</strong>
          </a>
          <ul className="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
            <li><a className="dropdown-item" href="#">New project...</a></li>
            <li><a className="dropdown-item" href="#">Settings</a></li>
            <li><a className="dropdown-item" href="#">Profile</a></li>
            <li><hr className="dropdown-divider" /></li>
            <li><a className="dropdown-item" href="#">Sign out</a></li>
          </ul>
        </div>
    </div>
    )
}

export default Header
