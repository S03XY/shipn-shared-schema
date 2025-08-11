/*
  Warnings:

  - You are about to drop the column `priceBreakup` on the `Style` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[categoryId]` on the table `Style` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[subcategoryId]` on the table `Style` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `categoryId` to the `Style` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subcategoryId` to the `Style` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Style" DROP COLUMN "priceBreakup",
ADD COLUMN     "categoryId" TEXT NOT NULL,
ADD COLUMN     "priceBreakupId" TEXT,
ADD COLUMN     "subcategoryId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Style_categoryId_key" ON "Style"("categoryId");

-- CreateIndex
CREATE UNIQUE INDEX "Style_subcategoryId_key" ON "Style"("subcategoryId");

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_priceBreakupId_fkey" FOREIGN KEY ("priceBreakupId") REFERENCES "PriceBreakup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES "Subcategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
