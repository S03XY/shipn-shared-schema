/*
  Warnings:

  - You are about to drop the column `deactivated` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `deactivated` on the `Style` table. All the data in the column will be lost.
  - You are about to drop the column `isListed` on the `Style` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Store_deactivated_idx";

-- DropIndex
DROP INDEX "Style_deactivated_idx";

-- DropIndex
DROP INDEX "Style_isListed_idx";

-- AlterTable
ALTER TABLE "Store" DROP COLUMN "deactivated",
ADD COLUMN     "isDeactivated" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Style" DROP COLUMN "deactivated",
DROP COLUMN "isListed",
ADD COLUMN     "isDeactivated" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "isDrafted" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "isPublised" BOOLEAN NOT NULL DEFAULT false;

-- CreateIndex
CREATE INDEX "Store_isDeactivated_idx" ON "Store"("isDeactivated");

-- CreateIndex
CREATE INDEX "Style_isDrafted_idx" ON "Style"("isDrafted");

-- CreateIndex
CREATE INDEX "Style_isPublised_idx" ON "Style"("isPublised");

-- CreateIndex
CREATE INDEX "Style_isDeactivated_idx" ON "Style"("isDeactivated");
