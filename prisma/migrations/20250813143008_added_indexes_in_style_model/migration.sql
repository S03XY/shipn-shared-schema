-- CreateIndex
CREATE INDEX "Style_storeId_idx" ON "Style"("storeId");

-- CreateIndex
CREATE INDEX "Style_parentStyleId_idx" ON "Style"("parentStyleId");

-- CreateIndex
CREATE INDEX "Style_taggedParentStyleId_idx" ON "Style"("taggedParentStyleId");

-- CreateIndex
CREATE INDEX "Style_priceBreakupId_idx" ON "Style"("priceBreakupId");
