/*
  Warnings:

  - Added the required column `signingWalletId` to the `StyleReview` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "StyleReview" ADD COLUMN     "signingWalletId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "StyleReview" ADD CONSTRAINT "StyleReview_signingWalletId_fkey" FOREIGN KEY ("signingWalletId") REFERENCES "Wallet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
