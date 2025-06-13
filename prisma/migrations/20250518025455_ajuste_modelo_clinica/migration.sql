/*
  Warnings:

  - The primary key for the `Agenda` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Agenda` table. All the data in the column will be lost.
  - The primary key for the `Avaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Avaliacao` table. All the data in the column will be lost.
  - The primary key for the `Clinica` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `email_contato` on the `Clinica` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Clinica` table. All the data in the column will be lost.
  - You are about to drop the column `telefone_clinica` on the `Clinica` table. All the data in the column will be lost.
  - You are about to drop the column `token_zapi` on the `Clinica` table. All the data in the column will be lost.
  - The primary key for the `Consulta` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `data` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `hora` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `codigoIbge` on the `Paciente` table. All the data in the column will be lost.
  - The primary key for the `Procedimento` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Procedimento` table. All the data in the column will be lost.
  - You are about to drop the column `UfConselho` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `bairro` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `cep` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `cidade` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `codigoIbge` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `complemento` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `imagemProfissional` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `logradouro` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `nomeConsultorio` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `nomeProfissional` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `numero` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `numeroConselho` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `telefoneConsultorio` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - You are about to drop the column `uf` on the `ProfissionalDaSaude` table. All the data in the column will be lost.
  - The primary key for the `Usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Usuario` table. All the data in the column will be lost.
  - Added the required column `data_hora_inicio` to the `Consulta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_profissional` to the `ProfissionalDaSaude` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Agenda" DROP CONSTRAINT "Agenda_id_clinica_fkey";

-- DropForeignKey
ALTER TABLE "Avaliacao" DROP CONSTRAINT "Avaliacao_consulta_id_fkey";

-- DropForeignKey
ALTER TABLE "Avaliacao" DROP CONSTRAINT "Avaliacao_id_clinica_fkey";

-- DropForeignKey
ALTER TABLE "Consulta" DROP CONSTRAINT "Consulta_id_clinica_fkey";

-- DropForeignKey
ALTER TABLE "ConsultaProcedimento" DROP CONSTRAINT "ConsultaProcedimento_consulta_id_fkey";

-- DropForeignKey
ALTER TABLE "ConsultaProcedimento" DROP CONSTRAINT "ConsultaProcedimento_procedimento_id_fkey";

-- DropForeignKey
ALTER TABLE "Paciente" DROP CONSTRAINT "Paciente_id_clinica_fkey";

-- DropForeignKey
ALTER TABLE "Procedimento" DROP CONSTRAINT "Procedimento_id_clinica_fkey";

-- DropForeignKey
ALTER TABLE "ProfissionalDaSaude" DROP CONSTRAINT "ProfissionalDaSaude_id_clinica_fkey";

-- DropForeignKey
ALTER TABLE "ProfissionalDaSaude" DROP CONSTRAINT "ProfissionalDaSaude_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "Usuario" DROP CONSTRAINT "Usuario_id_clinica_fkey";

-- AlterTable
ALTER TABLE "Agenda" DROP CONSTRAINT "Agenda_pkey",
DROP COLUMN "id",
ADD COLUMN     "id_agenda" SERIAL NOT NULL,
ADD CONSTRAINT "Agenda_pkey" PRIMARY KEY ("id_agenda");

-- AlterTable
ALTER TABLE "Avaliacao" DROP CONSTRAINT "Avaliacao_pkey",
DROP COLUMN "id",
ADD COLUMN     "id_avaliacao" SERIAL NOT NULL,
ADD CONSTRAINT "Avaliacao_pkey" PRIMARY KEY ("id_avaliacao");

-- AlterTable
ALTER TABLE "Clinica" DROP CONSTRAINT "Clinica_pkey",
DROP COLUMN "email_contato",
DROP COLUMN "id",
DROP COLUMN "telefone_clinica",
DROP COLUMN "token_zapi",
ADD COLUMN     "bairro" TEXT,
ADD COLUMN     "cep" TEXT,
ADD COLUMN     "cidade" TEXT,
ADD COLUMN     "cnpj" TEXT,
ADD COLUMN     "codigo_ibge" TEXT,
ADD COLUMN     "complemento" TEXT,
ADD COLUMN     "email" TEXT,
ADD COLUMN     "id_clinica" SERIAL NOT NULL,
ADD COLUMN     "logradouro" TEXT,
ADD COLUMN     "numero" TEXT,
ADD COLUMN     "razao_social" TEXT,
ADD COLUMN     "telefone" TEXT,
ADD COLUMN     "uf" TEXT,
ADD CONSTRAINT "Clinica_pkey" PRIMARY KEY ("id_clinica");

-- AlterTable
ALTER TABLE "Consulta" DROP CONSTRAINT "Consulta_pkey",
DROP COLUMN "data",
DROP COLUMN "hora",
DROP COLUMN "id",
ADD COLUMN     "data_hora_fim" TIMESTAMP(3),
ADD COLUMN     "data_hora_inicio" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "id_consulta" SERIAL NOT NULL,
ADD CONSTRAINT "Consulta_pkey" PRIMARY KEY ("id_consulta");

-- AlterTable
ALTER TABLE "Paciente" DROP COLUMN "codigoIbge",
ADD COLUMN     "codigo_ibge" TEXT;

-- AlterTable
ALTER TABLE "Procedimento" DROP CONSTRAINT "Procedimento_pkey",
DROP COLUMN "id",
ADD COLUMN     "id_procedimento" SERIAL NOT NULL,
ADD CONSTRAINT "Procedimento_pkey" PRIMARY KEY ("id_procedimento");

-- AlterTable
ALTER TABLE "ProfissionalDaSaude" DROP COLUMN "UfConselho",
DROP COLUMN "bairro",
DROP COLUMN "cep",
DROP COLUMN "cidade",
DROP COLUMN "codigoIbge",
DROP COLUMN "complemento",
DROP COLUMN "imagemProfissional",
DROP COLUMN "logradouro",
DROP COLUMN "nomeConsultorio",
DROP COLUMN "nomeProfissional",
DROP COLUMN "numero",
DROP COLUMN "numeroConselho",
DROP COLUMN "telefoneConsultorio",
DROP COLUMN "uf",
ADD COLUMN     "imagem_profissional" TEXT,
ADD COLUMN     "nome_profissional" TEXT NOT NULL,
ADD COLUMN     "numero_conselho" TEXT,
ADD COLUMN     "uf_conselho" TEXT;

-- AlterTable
ALTER TABLE "Usuario" DROP CONSTRAINT "Usuario_pkey",
DROP COLUMN "id",
ADD COLUMN     "id_usuario" SERIAL NOT NULL,
ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_usuario");

-- AddForeignKey
ALTER TABLE "Usuario" ADD CONSTRAINT "Usuario_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Paciente" ADD CONSTRAINT "Paciente_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfissionalDaSaude" ADD CONSTRAINT "ProfissionalDaSaude_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfissionalDaSaude" ADD CONSTRAINT "ProfissionalDaSaude_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id_usuario") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consulta" ADD CONSTRAINT "Consulta_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacao" ADD CONSTRAINT "Avaliacao_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avaliacao" ADD CONSTRAINT "Avaliacao_consulta_id_fkey" FOREIGN KEY ("consulta_id") REFERENCES "Consulta"("id_consulta") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procedimento" ADD CONSTRAINT "Procedimento_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConsultaProcedimento" ADD CONSTRAINT "ConsultaProcedimento_consulta_id_fkey" FOREIGN KEY ("consulta_id") REFERENCES "Consulta"("id_consulta") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConsultaProcedimento" ADD CONSTRAINT "ConsultaProcedimento_procedimento_id_fkey" FOREIGN KEY ("procedimento_id") REFERENCES "Procedimento"("id_procedimento") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agenda" ADD CONSTRAINT "Agenda_id_clinica_fkey" FOREIGN KEY ("id_clinica") REFERENCES "Clinica"("id_clinica") ON DELETE RESTRICT ON UPDATE CASCADE;
