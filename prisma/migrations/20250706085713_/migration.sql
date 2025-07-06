/*
  Warnings:

  - You are about to drop the column `title` on the `Store` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[storeDisplayId]` on the table `Store` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `name` to the `Store` table without a default value. This is not possible if the table is not empty.
  - Added the required column `storeDisplayId` to the `Store` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Store_title_key";

-- AlterTable
ALTER TABLE "Store" DROP COLUMN "title",
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "storeDisplayId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Store_storeDisplayId_key" ON "Store"("storeDisplayId");
