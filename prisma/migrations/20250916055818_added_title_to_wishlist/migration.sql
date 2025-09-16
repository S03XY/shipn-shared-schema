/*
  Warnings:

  - A unique constraint covering the columns `[userId,title]` on the table `Wishlist` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `title` to the `Wishlist` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Wishlist" ADD COLUMN     "title" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Wishlist_userId_title_key" ON "Wishlist"("userId", "title");
