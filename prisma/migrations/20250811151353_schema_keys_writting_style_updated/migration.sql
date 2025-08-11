/*
  Warnings:

  - You are about to drop the column `PriceBreakup` on the `Style` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Style" DROP COLUMN "PriceBreakup",
ADD COLUMN     "priceBreakup" JSONB;
