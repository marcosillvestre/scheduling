/*
  Warnings:

  - Changed the type of `contact` on the `availableTimes` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `date` on the `availableTimes` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "availableTimes" DROP COLUMN "contact",
ADD COLUMN     "contact" JSONB NOT NULL,
DROP COLUMN "date",
ADD COLUMN     "date" JSONB NOT NULL;
