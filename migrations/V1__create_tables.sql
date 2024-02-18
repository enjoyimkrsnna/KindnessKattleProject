-- Users Table
CREATE TABLE UserAccounts (
    UserID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    ImageURL VARCHAR(255),
    EmailAddress VARCHAR(50) NOT NULL UNIQUE,
    ProfileDescription NVARCHAR(MAX),
    IsActive BIT NOT NULL
);

-- Address Table
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY IDENTITY,
    AddressLine VARCHAR(255) NOT NULL,
    City VARCHAR(50) NOT NULL,
    StateRegion VARCHAR(50) NOT NULL,
    Longitude DECIMAL(9,6),
    Latitude DECIMAL(8,6)
);

