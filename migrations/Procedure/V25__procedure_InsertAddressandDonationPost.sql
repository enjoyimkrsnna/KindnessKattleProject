CREATE PROCEDURE InsertAddressAndDonationPost

    @AddressLine NVARCHAR(255),

    @City NVARCHAR(50),

    @StateRegion NVARCHAR(50),

    @Longitude DECIMAL(9,6),

    @Latitude DECIMAL(8,6),

    @UserID INT,

    @FoodImageURL VARCHAR(255),

    @FoodType NVARCHAR(50),

    @TimeAvailable DATETIME

AS

BEGIN

    SET NOCOUNT ON;
 
    DECLARE @AddressID INT;
 
    -- Insert into Addresses table

    INSERT INTO Addresses (AddressLine, City, StateRegion, Longitude, Latitude)

    VALUES (@AddressLine, @City, @StateRegion, @Longitude, @Latitude);
 
    -- Get the AddressID of the inserted address

    SELECT @AddressID = SCOPE_IDENTITY();
 
    -- Insert into DonationPosts table

    INSERT INTO DonationPosts (UserID, AddressID, FoodImageURL, FoodType, TimeAvailable)

    VALUES (@UserID, @AddressID, @FoodImageURL, @FoodType, @TimeAvailable);
 
    PRINT 'Data inserted successfully.';

END;
