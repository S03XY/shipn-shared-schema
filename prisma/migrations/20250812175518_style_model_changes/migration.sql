-- DropIndex
DROP INDEX "Style_categoryId_key";

-- DropIndex
DROP INDEX "Style_subcategoryId_key";

-- CreateIndex
CREATE INDEX "Style_categoryId_idx" ON "Style"("categoryId");

-- CreateIndex
CREATE INDEX "Style_subcategoryId_idx" ON "Style"("subcategoryId");
