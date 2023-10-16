/*
  Warnings:

  - The `contact` column on the `availableTimes` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "availableTimes" DROP COLUMN "contact",
ADD COLUMN     "contact" JSONB[];
