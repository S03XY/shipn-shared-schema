/*
  Warnings:

  - Made the column `storeId` on table `PriceBreakup` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "PriceBreakup" DROP CONSTRAINT "PriceBreakup_storeId_fkey";

-- AlterTable
ALTER TABLE "PriceBreakup" ALTER COLUMN "storeId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "PriceBreakup" ADD CONSTRAINT "PriceBreakup_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
