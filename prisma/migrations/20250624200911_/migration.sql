/*
  Warnings:

  - You are about to drop the column `blockchainReferenceId` on the `User` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "User_blockchainReferenceId_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "blockchainReferenceId";
