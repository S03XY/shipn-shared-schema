/*
  Warnings:

  - You are about to drop the column `attributes` on the `Style` table. All the data in the column will be lost.
  - You are about to drop the column `styleCode` on the `Style` table. All the data in the column will be lost.
  - You are about to drop the column `styleStatus` on the `Style` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Style_styleCode_key";

-- DropIndex
DROP INDEX "Style_styleStatus_idx";

-- AlterTable
ALTER TABLE "Style" DROP COLUMN "attributes",
DROP COLUMN "styleCode",
DROP COLUMN "styleStatus",
ADD COLUMN     "isListed" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "productInfo" JSONB;

-- CreateIndex
CREATE INDEX "Store_deactivated_idx" ON "Store"("deactivated");

-- CreateIndex
CREATE INDEX "Style_isListed_idx" ON "Style"("isListed");

-- CreateIndex
CREATE INDEX "Style_deactivated_idx" ON "Style"("deactivated");
