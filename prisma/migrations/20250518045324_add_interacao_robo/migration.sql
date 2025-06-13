-- CreateTable
CREATE TABLE "InteracaoRobo" (
    "id_interacao" SERIAL NOT NULL,
    "id_clinica" INTEGER NOT NULL,
    "id_paciente" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "data_interacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "InteracaoRobo_pkey" PRIMARY KEY ("id_interacao")
);

-- AddForeignKey
ALTER TABLE "InteracaoRobo" ADD CONSTRAINT "InteracaoRobo_id_paciente_fkey" FOREIGN KEY ("id_paciente") REFERENCES "Paciente"("id_paciente") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InteracaoRobo" ADD CONSTRAINT "InteracaoRobo_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;
