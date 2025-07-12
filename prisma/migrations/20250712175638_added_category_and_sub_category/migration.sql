-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "assets" JSONB NOT NULL,
    "isDeactivated" BOOLEAN NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subcategory" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "assets" JSONB NOT NULL,
    "isDeactivated" BOOLEAN NOT NULL,

    CONSTRAINT "Subcategory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Category_isDeactivated_idx" ON "Category"("isDeactivated");

-- CreateIndex
CREATE INDEX "Subcategory_isDeactivated_idx" ON "Subcategory"("isDeactivated");
