/*
  Warnings:

  - You are about to drop the column `title` on the `Wishlist` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Wishlist_userId_title_key";

-- AlterTable
ALTER TABLE "Wishlist" DROP COLUMN "title",
ADD COLUMN     "remark" TEXT;
