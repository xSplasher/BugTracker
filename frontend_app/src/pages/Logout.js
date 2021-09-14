import React, { useEffect } from 'react'
import auth from '../components/auth'



const Logout = () => {
    
    useEffect(() => {
        auth.logout();     
    }, [])

    return (
        <div>
            
        </div>
    )
}

export default Logout
