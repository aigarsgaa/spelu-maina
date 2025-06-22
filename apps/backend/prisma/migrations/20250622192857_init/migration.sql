-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('USER', 'ADMIN', 'MODERATOR');

-- CreateEnum
CREATE TYPE "Condition" AS ENUM ('NEW', 'LIKE_NEW', 'GOOD', 'ACCEPTABLE', 'POOR');

-- CreateEnum
CREATE TYPE "ListingStatus" AS ENUM ('AVAILABLE', 'PENDING', 'SOLD', 'TRADED', 'REMOVED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "password" TEXT NOT NULL,
    "emailVerified" BOOLEAN NOT NULL DEFAULT false,
    "image" TEXT,
    "role" "UserRole" NOT NULL DEFAULT 'USER',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "locationId" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Location" (
    "id" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "lat" DOUBLE PRECISION NOT NULL,
    "lng" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Game" (
    "id" TEXT NOT NULL,
    "bggId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "yearPublished" INTEGER,
    "minPlayers" INTEGER,
    "maxPlayers" INTEGER,
    "playingTime" INTEGER,
    "minPlaytime" INTEGER,
    "maxPlaytime" INTEGER,
    "minAge" INTEGER,
    "description" TEXT,
    "thumbnail" TEXT,
    "image" TEXT,
    "averageRating" DOUBLE PRECISION,
    "averageWeight" DOUBLE PRECISION,
    "rank" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Listing" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "condition" "Condition" NOT NULL,
    "price" DOUBLE PRECISION,
    "status" "ListingStatus" NOT NULL DEFAULT 'AVAILABLE',
    "gameId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Listing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ListingImage" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "listingId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ListingImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Message" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "senderId" TEXT NOT NULL,
    "recipientId" TEXT NOT NULL,
    "listingId" TEXT,
    "read" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameCategory" (
    "id" TEXT NOT NULL,
    "bggId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "GameCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameMechanic" (
    "id" TEXT NOT NULL,
    "bggId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "GameMechanic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GamePublisher" (
    "id" TEXT NOT NULL,
    "bggId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "country" TEXT,

    CONSTRAINT "GamePublisher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameDesigner" (
    "id" TEXT NOT NULL,
    "bggId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "country" TEXT,

    CONSTRAINT "GameDesigner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameArtist" (
    "id" TEXT NOT NULL,
    "bggId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "country" TEXT,

    CONSTRAINT "GameArtist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_GameToGameCategory" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_GameToGameCategory_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_GameToGameMechanic" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_GameToGameMechanic_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_GameToGamePublisher" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_GameToGamePublisher_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_GameToGameDesigner" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_GameToGameDesigner_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_GameToGameArtist" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_GameToGameArtist_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Game_bggId_key" ON "Game"("bggId");

-- CreateIndex
CREATE UNIQUE INDEX "GameCategory_bggId_key" ON "GameCategory"("bggId");

-- CreateIndex
CREATE UNIQUE INDEX "GameMechanic_bggId_key" ON "GameMechanic"("bggId");

-- CreateIndex
CREATE UNIQUE INDEX "GamePublisher_bggId_key" ON "GamePublisher"("bggId");

-- CreateIndex
CREATE UNIQUE INDEX "GameDesigner_bggId_key" ON "GameDesigner"("bggId");

-- CreateIndex
CREATE UNIQUE INDEX "GameArtist_bggId_key" ON "GameArtist"("bggId");

-- CreateIndex
CREATE INDEX "_GameToGameCategory_B_index" ON "_GameToGameCategory"("B");

-- CreateIndex
CREATE INDEX "_GameToGameMechanic_B_index" ON "_GameToGameMechanic"("B");

-- CreateIndex
CREATE INDEX "_GameToGamePublisher_B_index" ON "_GameToGamePublisher"("B");

-- CreateIndex
CREATE INDEX "_GameToGameDesigner_B_index" ON "_GameToGameDesigner"("B");

-- CreateIndex
CREATE INDEX "_GameToGameArtist_B_index" ON "_GameToGameArtist"("B");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListingImage" ADD CONSTRAINT "ListingImage_listingId_fkey" FOREIGN KEY ("listingId") REFERENCES "Listing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_recipientId_fkey" FOREIGN KEY ("recipientId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_listingId_fkey" FOREIGN KEY ("listingId") REFERENCES "Listing"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGameCategory" ADD CONSTRAINT "_GameToGameCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGameCategory" ADD CONSTRAINT "_GameToGameCategory_B_fkey" FOREIGN KEY ("B") REFERENCES "GameCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGameMechanic" ADD CONSTRAINT "_GameToGameMechanic_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGameMechanic" ADD CONSTRAINT "_GameToGameMechanic_B_fkey" FOREIGN KEY ("B") REFERENCES "GameMechanic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGamePublisher" ADD CONSTRAINT "_GameToGamePublisher_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGamePublisher" ADD CONSTRAINT "_GameToGamePublisher_B_fkey" FOREIGN KEY ("B") REFERENCES "GamePublisher"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGameDesigner" ADD CONSTRAINT "_GameToGameDesigner_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGameDesigner" ADD CONSTRAINT "_GameToGameDesigner_B_fkey" FOREIGN KEY ("B") REFERENCES "GameDesigner"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGameArtist" ADD CONSTRAINT "_GameToGameArtist_A_fkey" FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGameArtist" ADD CONSTRAINT "_GameToGameArtist_B_fkey" FOREIGN KEY ("B") REFERENCES "GameArtist"("id") ON DELETE CASCADE ON UPDATE CASCADE;
