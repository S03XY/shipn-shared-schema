/*
  Warnings:

  - A unique constraint covering the columns `[userId,storeId,styleId]` on the table `RecentlyViewedStyle` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "RecentlyViewedStyle_storeId_styleId_key";

-- CreateIndex
CREATE UNIQUE INDEX "RecentlyViewedStyle_userId_storeId_styleId_key" ON "RecentlyViewedStyle"("userId", "storeId", "styleId");
