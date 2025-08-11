/*
  Warnings:

  - You are about to drop the column `priceBreakupId` on the `Style` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Style" DROP CONSTRAINT "Style_priceBreakupId_fkey";

-- AlterTable
ALTER TABLE "Style" DROP COLUMN "priceBreakupId",
ADD COLUMN     "PriceBreakup" JSONB;
