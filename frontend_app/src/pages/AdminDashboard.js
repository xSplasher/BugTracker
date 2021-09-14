import React, { useEffect, useState } from 'react'




const AdminDashboard = () => {

    const [isMod, setisMod] = useState(false);

    useEffect(() => {

        if(localStorage.getItem('isMod')){
            setisMod(true);
            console.log('yo');
        }

        
    }, []);



    return (
        <div>
            
        </div>
    )
}

export default AdminDashboard
