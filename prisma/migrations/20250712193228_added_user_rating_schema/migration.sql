-- CreateTable
CREATE TABLE "UserRatings" (
    "id" TEXT NOT NULL,
    "rating" INTEGER NOT NULL DEFAULT 0,
    "description" TEXT NOT NULL,
    "storeId" TEXT,
    "styleId" TEXT,
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserRatings_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "UserRatings_storeId_idx" ON "UserRatings"("storeId");

-- CreateIndex
CREATE INDEX "UserRatings_styleId_idx" ON "UserRatings"("styleId");

-- CreateIndex
CREATE INDEX "UserRatings_userId_idx" ON "UserRatings"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "UserRatings_userId_storeId_key" ON "UserRatings"("userId", "storeId");

-- CreateIndex
CREATE UNIQUE INDEX "UserRatings_userId_styleId_key" ON "UserRatings"("userId", "styleId");

-- AddForeignKey
ALTER TABLE "UserRatings" ADD CONSTRAINT "UserRatings_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRatings" ADD CONSTRAINT "UserRatings_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "Style"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRatings" ADD CONSTRAINT "UserRatings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
