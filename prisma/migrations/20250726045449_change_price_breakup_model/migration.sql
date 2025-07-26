/*
  Warnings:

  - You are about to drop the column `styleId` on the `PriceBreakup` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "PriceBreakup" DROP CONSTRAINT "PriceBreakup_styleId_fkey";

-- DropIndex
DROP INDEX "PriceBreakup_styleId_key";

-- AlterTable
ALTER TABLE "PriceBreakup" DROP COLUMN "styleId";

-- AlterTable
ALTER TABLE "Style" ADD COLUMN     "priceBreakupId" TEXT;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_priceBreakupId_fkey" FOREIGN KEY ("priceBreakupId") REFERENCES "PriceBreakup"("id") ON DELETE SET NULL ON UPDATE CASCADE;
