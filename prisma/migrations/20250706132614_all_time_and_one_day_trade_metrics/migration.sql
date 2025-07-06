-- CreateTable
CREATE TABLE "AllTimeStoreTradeMetrics" (
    "id" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "totalOrders" INTEGER NOT NULL DEFAULT 0,
    "totalSales" BIGINT NOT NULL DEFAULT 0,
    "totalItemSold" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AllTimeStoreTradeMetrics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OneDayStoreTradeMetrics" (
    "id" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "oneDayOrders" INTEGER NOT NULL DEFAULT 0,
    "oneDaySales" BIGINT NOT NULL DEFAULT 0,
    "oneDayItemSold" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "OneDayStoreTradeMetrics_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AllTimeStoreTradeMetrics_storeId_key" ON "AllTimeStoreTradeMetrics"("storeId");

-- CreateIndex
CREATE INDEX "AllTimeStoreTradeMetrics_storeId_idx" ON "AllTimeStoreTradeMetrics"("storeId");

-- CreateIndex
CREATE UNIQUE INDEX "OneDayStoreTradeMetrics_storeId_key" ON "OneDayStoreTradeMetrics"("storeId");

-- CreateIndex
CREATE INDEX "OneDayStoreTradeMetrics_storeId_idx" ON "OneDayStoreTradeMetrics"("storeId");

-- AddForeignKey
ALTER TABLE "AllTimeStoreTradeMetrics" ADD CONSTRAINT "AllTimeStoreTradeMetrics_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OneDayStoreTradeMetrics" ADD CONSTRAINT "OneDayStoreTradeMetrics_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
