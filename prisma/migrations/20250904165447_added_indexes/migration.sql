/*
  Warnings:

  - Added the required column `storeId` to the `Subcategory` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Category_isDeactivated_idx";

-- DropIndex
DROP INDEX "Subcategory_isDeactivated_idx";

-- AlterTable
ALTER TABLE "Subcategory" ADD COLUMN     "storeId" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "Category_storeId_isDeactivated_idx" ON "Category"("storeId", "isDeactivated");

-- CreateIndex
CREATE INDEX "Subcategory_storeId_categoryId_idx" ON "Subcategory"("storeId", "categoryId");

-- CreateIndex
CREATE INDEX "Subcategory_storeId_isDeactivated_idx" ON "Subcategory"("storeId", "isDeactivated");

-- CreateIndex
CREATE INDEX "Subcategory_categoryId_isDeactivated_idx" ON "Subcategory"("categoryId", "isDeactivated");

-- AddForeignKey
ALTER TABLE "Subcategory" ADD CONSTRAINT "Subcategory_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
