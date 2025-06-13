-- CreateTable
CREATE TABLE "ControleOperacional" (
    "id_controle" SERIAL NOT NULL,
    "id_clinica" INTEGER NOT NULL,
    "data_referencia" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "pacientes_agendados" INTEGER NOT NULL DEFAULT 0,
    "pacientes_nao_agendados" INTEGER NOT NULL DEFAULT 0,
    "pacientes_faltantes" INTEGER NOT NULL DEFAULT 0,
    "nps" INTEGER,
    "total_consultas" INTEGER NOT NULL DEFAULT 0,
    "total_procedimentos" INTEGER NOT NULL DEFAULT 0,
    "valor_arrecadado" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "horas_robo_trabalhadas" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "economia_estimada" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ControleOperacional_pkey" PRIMARY KEY ("id_controle")
);

-- AddForeignKey
ALTER TABLE "ControleOperacional" ADD CONSTRAINT "ControleOperacional_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;
