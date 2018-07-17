import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import TrucksList from './components/TrucksList';

document.addEventListener('DOMContentLoaded', () => {
      ReactDOM.render( 
        <TrucksList />, 
        document.getElementById('app'));
      })