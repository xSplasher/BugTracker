import React from 'react'

const Search = () => {
    return (
        <div style={{"float":"right"}}>
            <input style={{"paddingBottom":"6px","height":"36px"}} type='text'/> <input className='btn btn-primary' type='button' value='Search'/>
        </div>
    )
}

export default Search
