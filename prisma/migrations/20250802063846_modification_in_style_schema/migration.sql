/*
  Warnings:

  - You are about to drop the column `parentItemId` on the `Style` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Style" DROP CONSTRAINT "Style_parentItemId_fkey";

-- DropIndex
DROP INDEX "Style_isPublised_idx";

-- AlterTable
ALTER TABLE "Style" DROP COLUMN "parentItemId",
ADD COLUMN     "parentStyleId" TEXT,
ADD COLUMN     "taggedParentStyleId" TEXT;

-- CreateIndex
CREATE INDEX "Style_isPublised_title_idx" ON "Style"("isPublised", "title");

-- CreateIndex
CREATE INDEX "Style_isPublised_amount_idx" ON "Style"("isPublised", "amount");

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_parentStyleId_fkey" FOREIGN KEY ("parentStyleId") REFERENCES "Style"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_taggedParentStyleId_fkey" FOREIGN KEY ("taggedParentStyleId") REFERENCES "Style"("id") ON DELETE SET NULL ON UPDATE CASCADE;
