import React from 'react';
import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom';
import LoginPage from './pages/LoginPage';
import Home from './pages/Home';
import Header from './componentes/Menu'; // Corrigido
import './App.css';

// Componente auxiliar para renderizar o Header apenas fora do /login
const Layout = ({ children }) => {
  const location = useLocation();
  const hideHeader = location.pathname === "/login";

  return (
    <>
      {!hideHeader && <Header nomeUsuario="Felipe" />}
      {children}
    </>
  );
};

function App() {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/home" element={<Home />} />
        </Routes>
      </Layout>
    </Router>
  );
}

export default App;
