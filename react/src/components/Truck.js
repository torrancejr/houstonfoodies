import React, { Component } from 'react';

class Truck extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    return ( 
      <div className = "table-card">
        <a href = {`/trucks/${this.props.id}`} >
          <p className = "crop" >
            <img src = {this.props.photo}/> 
          </p> 
          <h2>{ this.props.name} </h2> 
          <h3>{this.props.location}</h3> 
          <p>{this.props.website}</p> 
        </a> 
      </div>
    )
  }
}

export default Truck;