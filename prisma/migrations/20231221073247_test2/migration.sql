/*
  Warnings:

  - Added the required column `project_id` to the `time` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_time" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "start_time" DATETIME NOT NULL,
    "end_time" DATETIME NOT NULL,
    "created_at" DATETIME NOT NULL,
    "project_id" INTEGER NOT NULL
);
INSERT INTO "new_time" ("created_at", "end_time", "id", "start_time", "title") SELECT "created_at", "end_time", "id", "start_time", "title" FROM "time";
DROP TABLE "time";
ALTER TABLE "new_time" RENAME TO "time";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
