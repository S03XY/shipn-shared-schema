/*
  Warnings:

  - A unique constraint covering the columns `[styleId]` on the table `PriceBreakup` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[title,userId]` on the table `PriceBreakup` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `PriceBreakup` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "PriceBreakup" ADD COLUMN     "userId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "PriceBreakup_styleId_key" ON "PriceBreakup"("styleId");

-- CreateIndex
CREATE UNIQUE INDEX "PriceBreakup_title_userId_key" ON "PriceBreakup"("title", "userId");

-- AddForeignKey
ALTER TABLE "PriceBreakup" ADD CONSTRAINT "PriceBreakup_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
