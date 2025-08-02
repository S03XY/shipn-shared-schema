/*
  Warnings:

  - Added the required column `storeId` to the `Style` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Style" ADD COLUMN     "storeId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
