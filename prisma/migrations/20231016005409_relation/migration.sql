/*
  Warnings:

  - Added the required column `apointmentId` to the `services` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "services" DROP CONSTRAINT "services_serviceName_fkey";

-- AlterTable
ALTER TABLE "services" ADD COLUMN     "apointmentId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "services" ADD CONSTRAINT "services_apointmentId_fkey" FOREIGN KEY ("apointmentId") REFERENCES "apointment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
