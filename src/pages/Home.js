import React from 'react';
import FiltersBar from '../componentes/FiltersBar';
import Agenda from '../componentes/Agenda';
import Sidebar from '../componentes/Sidebar';
import '../App.css';

const Home = () => {
  return (
    <div className="home-container">
      <h1 className="home-title">Bem-vindo, Felipe!</h1>
      <FiltersBar />
      <div className="home-content">
        <Agenda />
        <Sidebar />
      </div>
    </div>
  );
};

export default Home;
