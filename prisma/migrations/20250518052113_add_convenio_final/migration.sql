-- AlterTable
ALTER TABLE "Consulta" ADD COLUMN     "id_convenio" INTEGER;

-- AlterTable
ALTER TABLE "InteracaoRobo" ADD COLUMN     "id_convenio" INTEGER;

-- CreateTable
CREATE TABLE "Convenio" (
    "id_convenio" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "id_clinica" INTEGER NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Convenio_pkey" PRIMARY KEY ("id_convenio")
);

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_id_convenio_fkey" FOREIGN KEY ("id_convenio") REFERENCES "Convenio"("id_convenio") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InteracaoRobo" ADD CONSTRAINT "InteracaoRobo_id_convenio_fkey" FOREIGN KEY ("id_convenio") REFERENCES "Convenio"("id_convenio") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Convenio" ADD CONSTRAINT "Convenio_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;
