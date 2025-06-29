-- DropIndex
DROP INDEX "User_id_key";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deactivated" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- CreateTable
CREATE TABLE "Wallet" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "description" TEXT,
    "walletAddress" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "ceratedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Wallet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" TEXT NOT NULL,
    "addressLine" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Store" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "assets" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "taxWallet" TEXT NOT NULL,
    "storeWallet" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "storePubkey" TEXT NOT NULL,
    "delegates" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "totalRatings" INTEGER NOT NULL DEFAULT 0,
    "ratingCount" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "totalTradedVolume" BIGINT NOT NULL DEFAULT 0,
    "isVerified" BOOLEAN NOT NULL DEFAULT false,
    "deactivated" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Store_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Style" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "styleAvailability" TEXT NOT NULL,
    "styleCode" TEXT NOT NULL,
    "assets" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "amount" BIGINT NOT NULL,
    "styleStatus" TEXT NOT NULL,
    "maxOrderCount" INTEGER NOT NULL DEFAULT 1,
    "totalRatings" INTEGER NOT NULL DEFAULT 0,
    "ratingCount" INTEGER NOT NULL DEFAULT 0,
    "attributes" JSONB,
    "additionalInfo" JSONB,
    "taxPercentage" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "parentItemId" TEXT,
    "deactivated" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Style_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PriceBreakup" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "components" JSONB,
    "styleId" TEXT NOT NULL,
    "deactivated" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "PriceBreakup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StyleLogs" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "styleId" TEXT,

    CONSTRAINT "StyleLogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inventory" (
    "id" TEXT NOT NULL,
    "freeUnits" INTEGER NOT NULL DEFAULT 0,
    "reservedUnits" INTEGER NOT NULL DEFAULT 0,
    "styleId" TEXT NOT NULL,

    CONSTRAINT "Inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StyleReview" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "totalRatings" INTEGER NOT NULL DEFAULT 0,
    "styleId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "contentSignedHash" TEXT NOT NULL,
    "parentId" TEXT,

    CONSTRAINT "StyleReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" TEXT NOT NULL,
    "subTotal" BIGINT NOT NULL,
    "taxAmount" BIGINT NOT NULL,
    "totalPlatformFees" BIGINT NOT NULL,
    "totalAmount" BIGINT NOT NULL,
    "shippingAmount" BIGINT NOT NULL,
    "type" TEXT NOT NULL,
    "orderStatus" TEXT NOT NULL,
    "orderStatusHistory" JSONB NOT NULL DEFAULT '[]',
    "createdAt" TIMESTAMP(3) NOT NULL,
    "shippingAddressLine" TEXT NOT NULL,
    "shippingCity" TEXT NOT NULL,
    "shippingState" TEXT NOT NULL,
    "shippingCountry" TEXT NOT NULL,
    "shippingPostalCode" TEXT NOT NULL,
    "billingAddressLine" TEXT NOT NULL,
    "billingCity" TEXT NOT NULL,
    "billingState" TEXT NOT NULL,
    "billingCountry" TEXT NOT NULL,
    "billingPostalCode" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderItem" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "asset" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "amount" BIGINT NOT NULL,
    "components" JSONB,
    "orderId" TEXT NOT NULL,
    "styleId" TEXT NOT NULL,

    CONSTRAINT "OrderItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Delivery" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "deliveryStatus" TEXT,
    "deliveryStatusHistory" JSONB NOT NULL DEFAULT '[]',
    "trackingLink" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "orderId" TEXT NOT NULL,

    CONSTRAINT "Delivery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payment" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "type" TEXT NOT NULL,
    "transactionHash" TEXT NOT NULL,
    "amount" BIGINT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sourceWalletAddress" TEXT NOT NULL,
    "destinationWalletAddress" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "itemId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentHistoricalDataAgg" (
    "id" TEXT NOT NULL,
    "amount" BIGINT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentHistoricalDataAgg_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ItemHistoricalDataAgg" (
    "id" TEXT NOT NULL,
    "quantity" BIGINT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ItemHistoricalDataAgg_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HashVersion" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "data" JSONB NOT NULL,
    "hash" TEXT NOT NULL,
    "version" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "HashVersion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Wallet_walletAddress_key" ON "Wallet"("walletAddress");

-- CreateIndex
CREATE UNIQUE INDEX "Store_title_key" ON "Store"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Style_styleCode_key" ON "Style"("styleCode");

-- CreateIndex
CREATE INDEX "Style_styleStatus_idx" ON "Style"("styleStatus");

-- CreateIndex
CREATE INDEX "StyleLogs_type_idx" ON "StyleLogs"("type");

-- CreateIndex
CREATE INDEX "StyleLogs_startDate_endDate_idx" ON "StyleLogs"("startDate", "endDate");

-- CreateIndex
CREATE UNIQUE INDEX "Inventory_styleId_key" ON "Inventory"("styleId");

-- CreateIndex
CREATE INDEX "StyleReview_styleId_idx" ON "StyleReview"("styleId");

-- CreateIndex
CREATE INDEX "StyleReview_parentId_idx" ON "StyleReview"("parentId");

-- CreateIndex
CREATE INDEX "Order_orderStatus_idx" ON "Order"("orderStatus");

-- CreateIndex
CREATE INDEX "Order_createdAt_idx" ON "Order"("createdAt");

-- CreateIndex
CREATE INDEX "Order_shippingCity_idx" ON "Order"("shippingCity");

-- CreateIndex
CREATE INDEX "Order_shippingCountry_idx" ON "Order"("shippingCountry");

-- CreateIndex
CREATE INDEX "Order_shippingPostalCode_idx" ON "Order"("shippingPostalCode");

-- CreateIndex
CREATE INDEX "Order_billingCity_idx" ON "Order"("billingCity");

-- CreateIndex
CREATE INDEX "Order_billingCountry_idx" ON "Order"("billingCountry");

-- CreateIndex
CREATE INDEX "Order_billingPostalCode_idx" ON "Order"("billingPostalCode");

-- CreateIndex
CREATE INDEX "Payment_type_idx" ON "Payment"("type");

-- CreateIndex
CREATE INDEX "PaymentHistoricalDataAgg_startDate_endDate_idx" ON "PaymentHistoricalDataAgg"("startDate", "endDate");

-- CreateIndex
CREATE INDEX "ItemHistoricalDataAgg_startDate_endDate_idx" ON "ItemHistoricalDataAgg"("startDate", "endDate");

-- CreateIndex
CREATE INDEX "HashVersion_hash_idx" ON "HashVersion"("hash");

-- AddForeignKey
ALTER TABLE "Wallet" ADD CONSTRAINT "Wallet_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_parentItemId_fkey" FOREIGN KEY ("parentItemId") REFERENCES "Style"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PriceBreakup" ADD CONSTRAINT "PriceBreakup_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StyleLogs" ADD CONSTRAINT "StyleLogs_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StyleReview" ADD CONSTRAINT "StyleReview_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StyleReview" ADD CONSTRAINT "StyleReview_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StyleReview" ADD CONSTRAINT "StyleReview_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "StyleReview"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Delivery" ADD CONSTRAINT "Delivery_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HashVersion" ADD CONSTRAINT "HashVersion_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
