/*
  Warnings:

  - You are about to drop the `OneDayStoreTradeMetrics` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "OneDayStoreTradeMetrics" DROP CONSTRAINT "OneDayStoreTradeMetrics_storeId_fkey";

-- DropTable
DROP TABLE "OneDayStoreTradeMetrics";
