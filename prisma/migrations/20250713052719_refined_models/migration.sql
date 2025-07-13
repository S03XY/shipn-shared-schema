-- DropIndex
DROP INDEX "Store_isDeactivated_idx";

-- CreateIndex
CREATE INDEX "Store_userId_isDeactivated_idx" ON "Store"("userId", "isDeactivated");

-- CreateIndex
CREATE INDEX "Wallet_userId_idx" ON "Wallet"("userId");
