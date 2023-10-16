/*
  Warnings:

  - The `date` column on the `availableTimes` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "availableTimes" DROP COLUMN "date",
ADD COLUMN     "date" JSONB[];

-- CreateIndex
CREATE UNIQUE INDEX "availableTimes_date_key" ON "availableTimes"("date");
