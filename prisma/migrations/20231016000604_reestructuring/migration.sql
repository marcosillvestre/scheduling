/*
  Warnings:

  - You are about to drop the `availableTimes` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "availableTimes";

-- CreateTable
CREATE TABLE "apointment" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "hour" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "relatedService" TEXT NOT NULL,

    CONSTRAINT "apointment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "services" (
    "id" SERIAL NOT NULL,
    "serviceName" TEXT NOT NULL,
    "howLong" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "services_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "apointment_hour_key" ON "apointment"("hour");

-- CreateIndex
CREATE UNIQUE INDEX "apointment_relatedService_key" ON "apointment"("relatedService");

-- CreateIndex
CREATE UNIQUE INDEX "services_serviceName_key" ON "services"("serviceName");

-- AddForeignKey
ALTER TABLE "services" ADD CONSTRAINT "services_serviceName_fkey" FOREIGN KEY ("serviceName") REFERENCES "apointment"("relatedService") ON DELETE RESTRICT ON UPDATE CASCADE;
