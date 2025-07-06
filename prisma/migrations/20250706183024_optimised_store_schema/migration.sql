/*
  Warnings:

  - You are about to drop the column `storePubkey` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `totalTradedVolume` on the `Store` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Store" DROP COLUMN "storePubkey",
DROP COLUMN "totalTradedVolume";
