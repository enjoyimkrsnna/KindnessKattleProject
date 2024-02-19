-- Add PickupInProgress column to DonationPosts table
ALTER TABLE DonationPosts
ADD PickupInProgress BIT NOT NULL DEFAULT 0;

-- Add PickupCompleted column to PickupStatuses table
ALTER TABLE PickupStatuses
ADD PickupCompleted BIT NOT NULL DEFAULT 0;
