// src/routes/auth.routes.js
const express = require('express');
const { AuthController } = require('../controllers/auth.controller');

const router = express.Router();

// Cadastro com criação de clínica + usuário administrador
router.post('/register', AuthController.register);

// Login do usuário (admin, profissional ou recepcionista)
router.post('/login', AuthController.login);
//primeiro acesso do usuário
router.post('/primeiro-acesso', AuthController.primeiroAcesso);

module.exports = { AuthRoutes: router };
