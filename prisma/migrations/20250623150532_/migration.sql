/*
  Warnings:

  - A unique constraint covering the columns `[displayId]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `displayId` to the `User` table without a default value. This is not possible if the table is not empty.
  - Made the column `blockchainReferenceId` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN     "displayId" TEXT NOT NULL,
ALTER COLUMN "blockchainReferenceId" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "User_displayId_key" ON "User"("displayId");
