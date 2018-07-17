import React, {Component} from 'react';
import Truck from './Truck';

class TrucksList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      trucks: [],
      currentPage: 1,
      trucksPerPage: 9,
      search: ''
    }
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
  }

  updateSearch(event) {
    this.setState({
      search: event.target.value.substr(0, 50)
    })
    console.log(this.state.search)
  }

  previousPage(event) {
    let newPage = this.state.currentPage - 1;
    this.setState({
      currentPage: newPage
    })
  }

  nextPage(event) {
    let newPage = this.state.currentPage + 1;
    this.setState({
      currentPage: newPage
    })
  }

  handleClick(event) {
    this.setState({
      currentPage: event.target.id
    });
  };

  getData() {
    fetch('/api/v1/trucks.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw (error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({
          trucks: body["trucks"]
        })
      })
      .catch(error => console.error(`Error in fetch ${error.message}`));
  }

  componentDidMount() {
    this.getData();
  }

  render() {
    let indexOfLastTruck = this.state.currentPage * this.state.trucksPerPage;
    let indexOfFirstTruck = indexOfLastTruck - this.state.trucksPerPage;
    let currentTrucks;
    let filtered = this.state.trucks.filter(
      (truck) => {
        return truck.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1;
      }
    );

    if (indexOfFirstTruck < 0) {
      currentTrucks = filtered.slice(0, 10);
    } else if (indexOfLastTruck > filtered.length) {
      currentTrucks = filtered.slice(indexOfFirstTruck, indexOfLastTruck)
    } else {
      currentTrucks = this.state.trucks.slice(indexOfFirstTruck, indexOfLastTruck);
    }

    let finalTrucks = currentTrucks.map((truck, index) => {
      return (
        <Truck
        key={index}
        id={truck.id}
        name={truck.name}
        url={truck.website}
        photo={truck.photo}
        location={truck.location}
        />
      )
    });

    let pageNumbers = [];

    for (let i = 1; i <= Math.ceil(this.state.trucks.length / this.state.trucksPerPage); i++) {
      pageNumbers.push(i);
    }

    let renderPageNumbers = pageNumbers.map(number => {
      return ( 
        <li key = {number}
          id = {number}
          onClick = {this.handleClick} >
        {number} 
        </li>
      )
    })

    return ( 
      <div>
      <input 
      placeholder = "Search"
      type = "text"
      value = {this.state.search}
      onChange = {this.updateSearch}
      className = "searchBar" 
      />
      <div className = "expandable" >
        <div className = "cards-container" >
            <div className = "table-cards" > 
             {finalTrucks} 
            </div> 
          </div> 
        </div> 
        <div className = "pagination" > 
          {renderPageNumbers} 
        </div> 
      </div>
    )
  }
}

export default TrucksList;