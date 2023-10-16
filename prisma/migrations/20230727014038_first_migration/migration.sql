-- CreateTable
CREATE TABLE "availableTimes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "date" TEXT NOT NULL,

    CONSTRAINT "availableTimes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "availableTimes_date_key" ON "availableTimes"("date");
