/*
  Warnings:

  - A unique constraint covering the columns `[userId,storeId,styleId]` on the table `Wishlist` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Wishlist_storeId_styleId_key";

-- CreateIndex
CREATE UNIQUE INDEX "Wishlist_userId_storeId_styleId_key" ON "Wishlist"("userId", "storeId", "styleId");
