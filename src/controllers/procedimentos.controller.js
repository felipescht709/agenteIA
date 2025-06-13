const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const ProcedimentosController = {
  async criar(req, res) {
    const { id_clinica } = req.usuario;
    const {
      nome_procedimento,
      tipo,
      valor,
      duracao_minutos,
      telemedicina = false,
      descricao
    } = req.body;

    try {
      const existente = await prisma.procedimento.findFirst({
        where: {
          nome_procedimento,
          id_clinica
        }
      });

      if (existente) {
        return res.status(400).json({ error: 'Procedimento já cadastrado.' });
      }

      const novo = await prisma.procedimento.create({
        data: {
          nome_procedimento,
          tipo,
          valor,
          duracao_minutos,
          telemedicina: Boolean(telemedicina),
          descricao,
          id_clinica,
          ativo: true
        }
      });

      return res.status(201).json(novo);
    } catch (err) {
      console.error('Erro ao criar procedimento:', err);
      return res.status(500).json({ error: 'Erro ao criar procedimento.' });
    }
  },

  async listar(req, res) {
    const { id_clinica } = req.usuario;

    try {
      const procedimentos = await prisma.procedimento.findMany({
        where: {
          id_clinica,
          ativo: true
        },
        orderBy: { nome_procedimento: 'asc' }
      });

      return res.json(procedimentos);
    } catch (err) {
      console.error('Erro ao listar procedimentos:', err);
      return res.status(500).json({ error: 'Erro ao listar procedimentos.' });
    }
  }
};

module.exports = { ProcedimentosController };
