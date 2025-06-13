-- CreateTable
CREATE TABLE "Clinica" (
    "id" SERIAL NOT NULL,
    "nome_clinica" TEXT NOT NULL,
    "token_zapi" TEXT NOT NULL,
    "telefone_clinica" TEXT,
    "email_contato" TEXT,
    "plano" TEXT NOT NULL DEFAULT 'BASICO',
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Clinica_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_clinica" INTEGER NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Paciente" (
    "id_paciente" SERIAL NOT NULL,
    "cpf" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "codigoIbge" TEXT,
    "cep" TEXT,
    "logradouro" TEXT,
    "numero" TEXT,
    "complemento" TEXT,
    "bairro" TEXT,
    "cidade" TEXT,
    "uf" TEXT,
    "senha" TEXT,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "id_clinica" INTEGER NOT NULL,

    CONSTRAINT "Paciente_pkey" PRIMARY KEY ("id_paciente")
);

-- CreateTable
CREATE TABLE "ProfissionalDaSaude" (
    "id_profissional_saude" SERIAL NOT NULL,
    "nomeProfissional" TEXT NOT NULL,
    "imagemProfissional" TEXT,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "cpf" TEXT NOT NULL,
    "conselho" TEXT,
    "numeroConselho" TEXT,
    "UfConselho" TEXT,
    "rqe" TEXT,
    "telefone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telemedicina" BOOLEAN NOT NULL DEFAULT false,
    "especialidade" TEXT,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "nomeConsultorio" TEXT,
    "telefoneConsultorio" TEXT,
    "codigoIbge" TEXT,
    "cep" TEXT,
    "logradouro" TEXT,
    "numero" TEXT,
    "complemento" TEXT,
    "bairro" TEXT,
    "cidade" TEXT,
    "uf" TEXT,
    "id_clinica" INTEGER NOT NULL,
    "usuario_id" INTEGER,

    CONSTRAINT "ProfissionalDaSaude_pkey" PRIMARY KEY ("id_profissional_saude")
);

-- CreateTable
CREATE TABLE "Consulta" (
    "id" SERIAL NOT NULL,
    "data" TIMESTAMP(3) NOT NULL,
    "hora" TIMESTAMP(3) NOT NULL,
    "valor" DOUBLE PRECISION,
    "telemedicina" BOOLEAN NOT NULL DEFAULT false,
    "status" TEXT NOT NULL,
    "observacoes" TEXT,
    "paciente_id" INTEGER NOT NULL,
    "profissional_id" INTEGER NOT NULL,
    "id_clinica" INTEGER NOT NULL,

    CONSTRAINT "Consulta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Avaliacao" (
    "id" SERIAL NOT NULL,
    "consulta_id" INTEGER NOT NULL,
    "data_avaliacao" TIMESTAMP(3) NOT NULL,
    "descricao" TEXT,
    "parecer_profissional" TEXT,
    "id_clinica" INTEGER NOT NULL,

    CONSTRAINT "Avaliacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Procedimento" (
    "id" SERIAL NOT NULL,
    "nome_procedimento" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "duracao_minutos" INTEGER NOT NULL,
    "telemedicina" BOOLEAN NOT NULL DEFAULT false,
    "descricao" TEXT,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" TIMESTAMP(3),
    "id_clinica" INTEGER NOT NULL,

    CONSTRAINT "Procedimento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ConsultaProcedimento" (
    "consulta_id" INTEGER NOT NULL,
    "procedimento_id" INTEGER NOT NULL,

    CONSTRAINT "ConsultaProcedimento_pkey" PRIMARY KEY ("consulta_id","procedimento_id")
);

-- CreateTable
CREATE TABLE "Agenda" (
    "id" SERIAL NOT NULL,
    "data" TIMESTAMP(3) NOT NULL,
    "hora_inicio" TIMESTAMP(3) NOT NULL,
    "hora_fim" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,
    "tipo_bloqueio" TEXT,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "profissional_id" INTEGER NOT NULL,
    "id_clinica" INTEGER NOT NULL,

    CONSTRAINT "Agenda_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Paciente_cpf_key" ON "Paciente"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "ProfissionalDaSaude_cpf_key" ON "ProfissionalDaSaude"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "ProfissionalDaSaude_usuario_id_key" ON "ProfissionalDaSaude"("usuario_id");

-- CreateIndex
CREATE UNIQUE INDEX "Procedimento_nome_procedimento_key" ON "Procedimento"("nome_procedimento");

-- AddForeignKey
ALTER TABLE "Usuario" ADD CONSTRAINT "Usuario_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Paciente" ADD CONSTRAINT "Paciente_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfissionalDaSaude" ADD CONSTRAINT "ProfissionalDaSaude_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfissionalDaSaude" ADD CONSTRAINT "ProfissionalDaSaude_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_paciente_id_fkey" FOREIGN KEY ("paciente_id") REFERENCES "Paciente"("id_paciente") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_profissional_id_fkey" FOREIGN KEY ("profissional_id") REFERENCES "ProfissionalDaSaude"("id_profissional_saude") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacao" ADD CONSTRAINT "Avaliacao_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacao" ADD CONSTRAINT "Avaliacao_consulta_id_fkey" FOREIGN KEY ("consulta_id") REFERENCES "Consulta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procedimento" ADD CONSTRAINT "Procedimento_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConsultaProcedimento" ADD CONSTRAINT "ConsultaProcedimento_consulta_id_fkey" FOREIGN KEY ("consulta_id") REFERENCES "Consulta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConsultaProcedimento" ADD CONSTRAINT "ConsultaProcedimento_procedimento_id_fkey" FOREIGN KEY ("procedimento_id") REFERENCES "Procedimento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agenda" ADD CONSTRAINT "Agenda_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agenda" ADD CONSTRAINT "Agenda_profissional_id_fkey" FOREIGN KEY ("profissional_id") REFERENCES "ProfissionalDaSaude"("id_profissional_saude") ON DELETE RESTRICT ON UPDATE CASCADE;
