-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "is_new" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FavoriteTrails" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "FavoriteTrails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecentTrails" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "RecentTrails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trail" (
    "id" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "name" TEXT NOT NULL,
    "recent_trail_id" TEXT,
    "favorite_trail_id" TEXT,
    "trail_org_id" TEXT NOT NULL,

    CONSTRAINT "Trail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "trail_id" TEXT NOT NULL,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrailOrg" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "TrailOrg_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trailbucks" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "amount" INTEGER NOT NULL DEFAULT 0,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "Trailbucks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transactions" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "amount" INTEGER NOT NULL,
    "trail_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "trail_org_id" TEXT NOT NULL,
    "confirmation_number" TEXT NOT NULL,

    CONSTRAINT "Transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Notification_trail_id_key" ON "Notification"("trail_id");

-- CreateIndex
CREATE UNIQUE INDEX "Trailbucks_user_id_key" ON "Trailbucks"("user_id");

-- AddForeignKey
ALTER TABLE "FavoriteTrails" ADD CONSTRAINT "FavoriteTrails_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecentTrails" ADD CONSTRAINT "RecentTrails_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trail" ADD CONSTRAINT "Trail_recent_trail_id_fkey" FOREIGN KEY ("recent_trail_id") REFERENCES "RecentTrails"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trail" ADD CONSTRAINT "Trail_favorite_trail_id_fkey" FOREIGN KEY ("favorite_trail_id") REFERENCES "FavoriteTrails"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trail" ADD CONSTRAINT "Trail_trail_org_id_fkey" FOREIGN KEY ("trail_org_id") REFERENCES "TrailOrg"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_trail_id_fkey" FOREIGN KEY ("trail_id") REFERENCES "Trail"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trailbucks" ADD CONSTRAINT "Trailbucks_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transactions" ADD CONSTRAINT "Transactions_trail_id_fkey" FOREIGN KEY ("trail_id") REFERENCES "Trail"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transactions" ADD CONSTRAINT "Transactions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transactions" ADD CONSTRAINT "Transactions_trail_org_id_fkey" FOREIGN KEY ("trail_org_id") REFERENCES "TrailOrg"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
