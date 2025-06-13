import React from 'react';
import '../App.css';

const FiltersBar = () => {
  return (
    <div className="filters-bar">
      <select className="filter-select">
        <option>Todos pacientes</option>
      </select>
      <select className="filter-select">
        <option>Todos locais</option>
      </select>
      <select className="filter-select">
        <option>Profissional</option>
      </select>
    </div>
  );
};

export default FiltersBar;
