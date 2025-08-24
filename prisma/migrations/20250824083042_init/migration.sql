-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "policyConsent" BOOLEAN NOT NULL,
    "ageConsent" BOOLEAN NOT NULL,
    "displayId" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "description" TEXT,
    "socialLinks" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deactivated" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wallet" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "description" TEXT,
    "walletAddress" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "deactivated" BOOLEAN NOT NULL DEFAULT false,
    "ceratedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

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
    "name" TEXT NOT NULL,
    "storeDisplayId" TEXT NOT NULL,
    "description" TEXT,
    "assets" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "storeWallet" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "totalRatings" INTEGER NOT NULL DEFAULT 0,
    "ratingCount" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isVerified" BOOLEAN NOT NULL DEFAULT false,
    "isDeactivated" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Store_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreDelegate" (
    "id" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "isDeactivated" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "StoreDelegate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreRatings" (
    "id" TEXT NOT NULL,
    "rating" INTEGER NOT NULL DEFAULT 0,
    "description" TEXT,
    "storeId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StoreRatings_pkey" PRIMARY KEY ("id")
);

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
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "assets" JSONB,
    "isDeactivated" BOOLEAN NOT NULL,
    "storeId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subcategory" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "assets" JSONB,
    "isDeactivated" BOOLEAN NOT NULL,
    "categoryId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Subcategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Style" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "styleAvailability" TEXT NOT NULL,
    "assets" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "amount" BIGINT NOT NULL,
    "isDrafted" BOOLEAN NOT NULL DEFAULT true,
    "isPublised" BOOLEAN NOT NULL DEFAULT false,
    "maxOrderCount" INTEGER NOT NULL DEFAULT 1,
    "totalRatings" INTEGER NOT NULL DEFAULT 0,
    "ratingCount" INTEGER NOT NULL DEFAULT 0,
    "productInfo" JSONB,
    "additionalInfo" JSONB,
    "storeId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "parentStyleId" TEXT,
    "taggedParentStyleId" TEXT,
    "isDeactivated" BOOLEAN NOT NULL DEFAULT false,
    "priceBreakupId" TEXT,
    "categoryId" TEXT NOT NULL,
    "subcategoryId" TEXT NOT NULL,

    CONSTRAINT "Style_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PriceBreakup" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "components" JSONB,
    "deactivated" BOOLEAN NOT NULL DEFAULT false,
    "userId" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PriceBreakup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StyleLogs" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "styleId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "StyleLogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inventory" (
    "id" TEXT NOT NULL,
    "freeUnits" INTEGER NOT NULL DEFAULT 0,
    "reservedUnits" INTEGER NOT NULL DEFAULT 0,
    "styleId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StyleReview" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "rating" INTEGER NOT NULL DEFAULT 0,
    "isEdited" BOOLEAN NOT NULL DEFAULT false,
    "styleId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "signingWalletId" TEXT NOT NULL,
    "contentSignedHash" TEXT NOT NULL,
    "parentId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

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
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

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
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "OrderItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Delivery" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "deliveryStatus" TEXT,
    "deliveryStatusHistory" JSONB NOT NULL DEFAULT '[]',
    "trackingLink" TEXT,
    "orderId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

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
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "HashVersion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_displayId_key" ON "User"("displayId");

-- CreateIndex
CREATE UNIQUE INDEX "Wallet_walletAddress_key" ON "Wallet"("walletAddress");

-- CreateIndex
CREATE INDEX "Wallet_userId_idx" ON "Wallet"("userId");

-- CreateIndex
CREATE INDEX "Address_userId_idx" ON "Address"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Store_storeDisplayId_key" ON "Store"("storeDisplayId");

-- CreateIndex
CREATE INDEX "Store_userId_isDeactivated_idx" ON "Store"("userId", "isDeactivated");

-- CreateIndex
CREATE UNIQUE INDEX "StoreDelegate_storeId_userId_role_key" ON "StoreDelegate"("storeId", "userId", "role");

-- CreateIndex
CREATE INDEX "StoreRatings_storeId_idx" ON "StoreRatings"("storeId");

-- CreateIndex
CREATE INDEX "StoreRatings_userId_idx" ON "StoreRatings"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "StoreRatings_userId_storeId_key" ON "StoreRatings"("userId", "storeId");

-- CreateIndex
CREATE UNIQUE INDEX "AllTimeStoreTradeMetrics_storeId_key" ON "AllTimeStoreTradeMetrics"("storeId");

-- CreateIndex
CREATE INDEX "AllTimeStoreTradeMetrics_storeId_idx" ON "AllTimeStoreTradeMetrics"("storeId");

-- CreateIndex
CREATE INDEX "Category_isDeactivated_idx" ON "Category"("isDeactivated");

-- CreateIndex
CREATE UNIQUE INDEX "Category_title_storeId_key" ON "Category"("title", "storeId");

-- CreateIndex
CREATE INDEX "Subcategory_isDeactivated_idx" ON "Subcategory"("isDeactivated");

-- CreateIndex
CREATE UNIQUE INDEX "Subcategory_title_categoryId_key" ON "Subcategory"("title", "categoryId");

-- CreateIndex
CREATE INDEX "Style_categoryId_idx" ON "Style"("categoryId");

-- CreateIndex
CREATE INDEX "Style_subcategoryId_idx" ON "Style"("subcategoryId");

-- CreateIndex
CREATE INDEX "Style_storeId_idx" ON "Style"("storeId");

-- CreateIndex
CREATE INDEX "Style_parentStyleId_idx" ON "Style"("parentStyleId");

-- CreateIndex
CREATE INDEX "Style_taggedParentStyleId_idx" ON "Style"("taggedParentStyleId");

-- CreateIndex
CREATE INDEX "Style_priceBreakupId_idx" ON "Style"("priceBreakupId");

-- CreateIndex
CREATE INDEX "Style_isDrafted_idx" ON "Style"("isDrafted");

-- CreateIndex
CREATE INDEX "Style_isDeactivated_idx" ON "Style"("isDeactivated");

-- CreateIndex
CREATE INDEX "Style_isPublised_title_idx" ON "Style"("isPublised", "title");

-- CreateIndex
CREATE INDEX "Style_isPublised_amount_idx" ON "Style"("isPublised", "amount");

-- CreateIndex
CREATE UNIQUE INDEX "PriceBreakup_title_userId_key" ON "PriceBreakup"("title", "userId");

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
ALTER TABLE "StoreDelegate" ADD CONSTRAINT "StoreDelegate_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreDelegate" ADD CONSTRAINT "StoreDelegate_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreRatings" ADD CONSTRAINT "StoreRatings_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreRatings" ADD CONSTRAINT "StoreRatings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AllTimeStoreTradeMetrics" ADD CONSTRAINT "AllTimeStoreTradeMetrics_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subcategory" ADD CONSTRAINT "Subcategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_parentStyleId_fkey" FOREIGN KEY ("parentStyleId") REFERENCES "Style"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_taggedParentStyleId_fkey" FOREIGN KEY ("taggedParentStyleId") REFERENCES "Style"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_priceBreakupId_fkey" FOREIGN KEY ("priceBreakupId") REFERENCES "PriceBreakup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Style" ADD CONSTRAINT "Style_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES "Subcategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PriceBreakup" ADD CONSTRAINT "PriceBreakup_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PriceBreakup" ADD CONSTRAINT "PriceBreakup_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StyleLogs" ADD CONSTRAINT "StyleLogs_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StyleReview" ADD CONSTRAINT "StyleReview_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StyleReview" ADD CONSTRAINT "StyleReview_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StyleReview" ADD CONSTRAINT "StyleReview_signingWalletId_fkey" FOREIGN KEY ("signingWalletId") REFERENCES "Wallet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

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
