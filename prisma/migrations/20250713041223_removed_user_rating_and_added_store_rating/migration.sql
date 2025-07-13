/*
  Warnings:

  - You are about to drop the `UserRatings` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "UserRatings" DROP CONSTRAINT "UserRatings_storeId_fkey";

-- DropForeignKey
ALTER TABLE "UserRatings" DROP CONSTRAINT "UserRatings_styleId_fkey";

-- DropForeignKey
ALTER TABLE "UserRatings" DROP CONSTRAINT "UserRatings_userId_fkey";

-- DropTable
DROP TABLE "UserRatings";

-- CreateTable
CREATE TABLE "StoreRatings" (
    "id" TEXT NOT NULL,
    "rating" INTEGER NOT NULL DEFAULT 0,
    "description" TEXT,
    "storeId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "StoreRatings_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "StoreRatings_storeId_idx" ON "StoreRatings"("storeId");

-- CreateIndex
CREATE INDEX "StoreRatings_userId_idx" ON "StoreRatings"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "StoreRatings_userId_storeId_key" ON "StoreRatings"("userId", "storeId");

-- AddForeignKey
ALTER TABLE "StoreRatings" ADD CONSTRAINT "StoreRatings_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreRatings" ADD CONSTRAINT "StoreRatings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
