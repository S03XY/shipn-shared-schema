/*
  Warnings:

  - You are about to drop the column `parentId` on the `StyleReview` table. All the data in the column will be lost.
  - You are about to drop the `StoreRatings` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "StoreRatings" DROP CONSTRAINT "StoreRatings_storeId_fkey";

-- DropForeignKey
ALTER TABLE "StoreRatings" DROP CONSTRAINT "StoreRatings_userId_fkey";

-- DropForeignKey
ALTER TABLE "StyleReview" DROP CONSTRAINT "StyleReview_parentId_fkey";

-- DropIndex
DROP INDEX "StyleReview_parentId_idx";

-- AlterTable
ALTER TABLE "StyleReview" DROP COLUMN "parentId";

-- DropTable
DROP TABLE "StoreRatings";

-- CreateTable
CREATE TABLE "StoreReview" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "rating" INTEGER NOT NULL DEFAULT 0,
    "isEdited" BOOLEAN NOT NULL DEFAULT false,
    "storeId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "signingWalletId" TEXT NOT NULL,
    "contentSignedHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "StoreReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReviewComment" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "signingWalletId" TEXT NOT NULL,
    "contentSignedHash" TEXT NOT NULL,
    "storeReviewId" TEXT,
    "styleReviewId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ReviewComment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "StoreReview_storeId_idx" ON "StoreReview"("storeId");

-- CreateIndex
CREATE INDEX "ReviewComment_storeReviewId_idx" ON "ReviewComment"("storeReviewId");

-- CreateIndex
CREATE INDEX "ReviewComment_styleReviewId_idx" ON "ReviewComment"("styleReviewId");

-- CreateIndex
CREATE INDEX "ReviewComment_userId_idx" ON "ReviewComment"("userId");

-- AddForeignKey
ALTER TABLE "StoreReview" ADD CONSTRAINT "StoreReview_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreReview" ADD CONSTRAINT "StoreReview_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreReview" ADD CONSTRAINT "StoreReview_signingWalletId_fkey" FOREIGN KEY ("signingWalletId") REFERENCES "Wallet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReviewComment" ADD CONSTRAINT "ReviewComment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReviewComment" ADD CONSTRAINT "ReviewComment_signingWalletId_fkey" FOREIGN KEY ("signingWalletId") REFERENCES "Wallet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReviewComment" ADD CONSTRAINT "ReviewComment_storeReviewId_fkey" FOREIGN KEY ("storeReviewId") REFERENCES "StoreReview"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReviewComment" ADD CONSTRAINT "ReviewComment_styleReviewId_fkey" FOREIGN KEY ("styleReviewId") REFERENCES "StyleReview"("id") ON DELETE SET NULL ON UPDATE CASCADE;
