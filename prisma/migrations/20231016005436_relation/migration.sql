/*
  Warnings:

  - You are about to drop the column `relatedService` on the `apointment` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "apointment_relatedService_key";

-- AlterTable
ALTER TABLE "apointment" DROP COLUMN "relatedService";
