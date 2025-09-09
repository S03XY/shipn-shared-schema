/*
  Warnings:

  - You are about to drop the column `isDrafted` on the `Style` table. All the data in the column will be lost.
  - You are about to drop the column `isPublised` on the `Style` table. All the data in the column will be lost.
  - Added the required column `status` to the `Style` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Style_isDrafted_idx";

-- DropIndex
DROP INDEX "Style_isPublised_amount_idx";

-- DropIndex
DROP INDEX "Style_isPublised_title_idx";

-- AlterTable
ALTER TABLE "Style" DROP COLUMN "isDrafted",
DROP COLUMN "isPublised",
ADD COLUMN     "status" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "Style_status_idx" ON "Style"("status");

-- CreateIndex
CREATE INDEX "Style_status_title_idx" ON "Style"("status", "title");
