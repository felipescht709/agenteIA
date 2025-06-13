import '../App.css'; // ou './App.css' se estiver no mesmo nível
import React from 'react';
import { Link } from 'react-router-dom';

const Header = ({ nomeUsuario = "Usuário" }) => {
  return (
    <header className="header">
      <div className="header-left">
        <div className="logo">Agenda IA</div>
        <nav className="nav-links">
          <Link to="/agenda">Agenda</Link>
          <Link to="/relatorios">Relatórios</Link>
          <Link to="/configuracoes">Configurações</Link>
        </nav>
      </div>
      <div className="header-right">
        <span className="saudacao">Olá, {nomeUsuario}</span>
        <img className="avatar" src="/avatar.png" alt="Perfil" />
      </div>
    </header>
  );
};

export default Header;
