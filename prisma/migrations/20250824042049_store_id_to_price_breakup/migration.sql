/*
  Warnings:

  - You are about to drop the column `taxWallet` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `taxPercentage` on the `Style` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "PriceBreakup" ADD COLUMN     "storeId" TEXT;

-- AlterTable
ALTER TABLE "Store" DROP COLUMN "taxWallet";

-- AlterTable
ALTER TABLE "Style" DROP COLUMN "taxPercentage";

-- AddForeignKey
ALTER TABLE "PriceBreakup" ADD CONSTRAINT "PriceBreakup_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE SET NULL ON UPDATE CASCADE;
