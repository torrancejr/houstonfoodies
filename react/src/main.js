import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import TrucksList from './components/TrucksList';

$(function () {
  let app = document.getElementById('app');
  if (app) {
    ReactDOM.render( <
      TrucksList / > ,
      app
    );
  };
});