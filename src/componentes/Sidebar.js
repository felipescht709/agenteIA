import React from 'react';
import '../App.css';

const Sidebar = () => {
  return (
    <aside className="sidebar">
      <div className="sidebar-section">Buscar Agendamento</div>
      <div className="sidebar-section">Lista de Espera</div>
      <div className="sidebar-section">Próximo Horário Livre</div>
      <div className="sidebar-section">Pacientes Esperando</div>
      <div className="sidebar-section">
        <label>Calendário</label>
        <input type="date" className="sidebar-input" />
      </div>
    </aside>
  );
};

export default Sidebar;
