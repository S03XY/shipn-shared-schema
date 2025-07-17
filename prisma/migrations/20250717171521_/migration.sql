/*
  Warnings:

  - A unique constraint covering the columns `[title,categoryId]` on the table `Subcategory` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Subcategory_title_categoryId_key" ON "Subcategory"("title", "categoryId");
