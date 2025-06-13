import React, { useState } from "react";
import "../App.css"; // ou "./App.css" se for movido

export default function Login() {
  const [isRegistering, setIsRegistering] = useState(false);

  return (
    <div className="container">
      <h2 className="title">
        {isRegistering ? "Cadastro de Usuário" : "Login"}
      </h2>
      <form>
        {isRegistering && <input type="text" placeholder="Nome completo" required />}
        <input type="email" placeholder="Email" required />
        <input type="password" placeholder="Senha" required />
        <button type="submit">{isRegistering ? "Cadastrar" : "Entrar"}</button>
      </form>
      <button
        type="button"
        className="toggle-button"
        onClick={() => setIsRegistering(!isRegistering)}
      >
        {isRegistering ? "Já tem conta? Entrar" : "Novo por aqui? Cadastre-se"}
      </button>
    </div>
  );
}
