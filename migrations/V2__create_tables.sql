-- Users Table
CREATE TABLE UserAccounts (
    UserID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    ImageURL VARCHAR(255),
    EmailAddress VARCHAR(100) NOT NULL UNIQUE,
    ProfileDescription NVARCHAR(MAX),
    IsActive BIT NOT NULL
);

-- Address Table
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY IDENTITY,
    AddressLine NVARCHAR(255) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    StateRegion NVARCHAR(50) NOT NULL,
    Longitude DECIMAL(9,6),
    Latitude DECIMAL(8,6)
);

-- FoodDonationPost Table
CREATE TABLE DonationPosts (
    PostID INT PRIMARY KEY IDENTITY,
    UserID INT,
    AddressID INT,
    FoodImageURL VARCHAR(255),
    FoodType NVARCHAR(50) NOT NULL,
    TimeAvailable DATETIME,
    IsPostActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES UserAccounts(UserID),
    FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID)
);

-- PickupStatus Table
CREATE TABLE PickupStatuses (
    PickupStatusID INT PRIMARY KEY IDENTITY,
    PostID INT,
    PickedUpByUserID INT,
    PickupDateTime DATETIME,
    FOREIGN KEY (PostID) REFERENCES DonationPosts(PostID),
    FOREIGN KEY (PickedUpByUserID) REFERENCES UserAccounts(UserID)
);

-- Conversation Table
CREATE TABLE Conversations (
    ConversationID INT PRIMARY KEY IDENTITY,
    User1ID INT,
    User2ID INT,
    UNIQUE (User1ID, User2ID),
    FOREIGN KEY (User1ID) REFERENCES UserAccounts(UserID),
    FOREIGN KEY (User2ID) REFERENCES UserAccounts(UserID)
);

-- ChatMessage Table
CREATE TABLE ChatMessages (
    MessageID INT PRIMARY KEY IDENTITY,
    ConversationID INT,
    SenderUserID INT,
    ReceiverUserID INT,
    MessageContent NVARCHAR(MAX),
    MessageTimestamp DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ConversationID) REFERENCES Conversations(ConversationID),
    FOREIGN KEY (SenderUserID) REFERENCES UserAccounts(UserID),
    FOREIGN KEY (ReceiverUserID) REFERENCES UserAccounts(UserID)
);

-- Like Table
CREATE TABLE Likes (
    LikeID INT PRIMARY KEY IDENTITY,
    UserID INT,
    PostID INT,
    LikeDateTime DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES UserAccounts(UserID),
    FOREIGN KEY (PostID) REFERENCES DonationPosts(PostID)
);

-- Comment Table
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY IDENTITY,
    UserID INT,
    PostID INT,
    CommentContent NVARCHAR(MAX),
    CommentDateTime DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES UserAccounts(UserID),
    FOREIGN KEY (PostID) REFERENCES DonationPosts(PostID)
);

-- FeedbackRating Table
CREATE TABLE FeedbackRatings (
    FeedbackRatingID INT PRIMARY KEY IDENTITY,
    RatedUserID INT,
    RatingUserID INT,
    FeedbackContent NVARCHAR(MAX),
    Rating INT,
    RatingDateTime DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (RatedUserID) REFERENCES UserAccounts(UserID),
    FOREIGN KEY (RatingUserID) REFERENCES UserAccounts(UserID)
);
