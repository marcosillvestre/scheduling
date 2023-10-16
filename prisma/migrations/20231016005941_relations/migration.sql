-- DropForeignKey
ALTER TABLE "services" DROP CONSTRAINT "services_apointmentId_fkey";

-- AlterTable
ALTER TABLE "services" ALTER COLUMN "apointmentId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "services" ADD CONSTRAINT "services_apointmentId_fkey" FOREIGN KEY ("apointmentId") REFERENCES "apointment"("id") ON DELETE SET NULL ON UPDATE CASCADE;
