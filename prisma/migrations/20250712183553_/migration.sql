/*
  Warnings:

  - You are about to drop the column `delegates` on the `Store` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Store" DROP COLUMN "delegates";

-- CreateTable
CREATE TABLE "StoreDelegate" (
    "id" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "role" TEXT NOT NULL,

    CONSTRAINT "StoreDelegate_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "StoreDelegate_storeId_userId_role_key" ON "StoreDelegate"("storeId", "userId", "role");

-- AddForeignKey
ALTER TABLE "StoreDelegate" ADD CONSTRAINT "StoreDelegate_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreDelegate" ADD CONSTRAINT "StoreDelegate_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
