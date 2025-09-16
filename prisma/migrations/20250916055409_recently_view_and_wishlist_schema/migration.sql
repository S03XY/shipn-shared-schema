-- CreateTable
CREATE TABLE "RecentlyViewedStyle" (
    "id" TEXT NOT NULL,
    "styleId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecentlyViewedStyle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wishlist" (
    "id" TEXT NOT NULL,
    "styleId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Wishlist_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "RecentlyViewedStyle_userId_idx" ON "RecentlyViewedStyle"("userId");

-- CreateIndex
CREATE INDEX "RecentlyViewedStyle_storeId_idx" ON "RecentlyViewedStyle"("storeId");

-- CreateIndex
CREATE INDEX "RecentlyViewedStyle_styleId_idx" ON "RecentlyViewedStyle"("styleId");

-- CreateIndex
CREATE INDEX "RecentlyViewedStyle_userId_styleId_idx" ON "RecentlyViewedStyle"("userId", "styleId");

-- CreateIndex
CREATE UNIQUE INDEX "RecentlyViewedStyle_storeId_styleId_key" ON "RecentlyViewedStyle"("storeId", "styleId");

-- CreateIndex
CREATE INDEX "Wishlist_userId_idx" ON "Wishlist"("userId");

-- CreateIndex
CREATE INDEX "Wishlist_storeId_idx" ON "Wishlist"("storeId");

-- CreateIndex
CREATE INDEX "Wishlist_styleId_idx" ON "Wishlist"("styleId");

-- CreateIndex
CREATE INDEX "Wishlist_userId_styleId_idx" ON "Wishlist"("userId", "styleId");

-- CreateIndex
CREATE UNIQUE INDEX "Wishlist_storeId_styleId_key" ON "Wishlist"("storeId", "styleId");

-- AddForeignKey
ALTER TABLE "RecentlyViewedStyle" ADD CONSTRAINT "RecentlyViewedStyle_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecentlyViewedStyle" ADD CONSTRAINT "RecentlyViewedStyle_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecentlyViewedStyle" ADD CONSTRAINT "RecentlyViewedStyle_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wishlist" ADD CONSTRAINT "Wishlist_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wishlist" ADD CONSTRAINT "Wishlist_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wishlist" ADD CONSTRAINT "Wishlist_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
