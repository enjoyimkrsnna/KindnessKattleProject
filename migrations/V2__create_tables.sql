-- Users Table
CREATE TABLE dbo.UserAccounts (
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
CREATE TABLE dbo.Addresses (
    AddressID INT PRIMARY KEY IDENTITY,
    AddressLine NVARCHAR(255) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    StateRegion NVARCHAR(50) NOT NULL,
    Longitude DECIMAL(9,6),
    Latitude DECIMAL(8,6)
);

-- FoodDonationPost Table
CREATE TABLE dbo.DonationPosts (
    PostID INT PRIMARY KEY IDENTITY,
    UserID INT,
    AddressID INT,
    FoodImageURL VARCHAR(255),
    FoodType NVARCHAR(50) NOT NULL,
    TimeAvailable DATETIME,
    IsPostActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (AddressID) REFERENCES dbo.Addresses(AddressID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- PickupStatus Table
CREATE TABLE dbo.PickupStatuses (
    PickupStatusID INT PRIMARY KEY IDENTITY,
    PostID INT,
    PickedUpByUserID INT,
    PickupDateTime DATETIME,
    FOREIGN KEY (PostID) REFERENCES dbo.DonationPosts(PostID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PickedUpByUserID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Conversation Table
CREATE TABLE dbo.Conversations (
    ConversationID INT PRIMARY KEY IDENTITY,
    User1ID INT,
    User2ID INT,
    UNIQUE (User1ID, User2ID),
    FOREIGN KEY (User1ID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (User2ID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ChatMessage Table
CREATE TABLE dbo.ChatMessages (
    MessageID INT PRIMARY KEY IDENTITY,
    ConversationID INT,
    SenderUserID INT,
    ReceiverUserID INT,
    MessageContent NVARCHAR(MAX),
    MessageTimestamp DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ConversationID) REFERENCES dbo.Conversations(ConversationID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SenderUserID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ReceiverUserID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Like Table
CREATE TABLE dbo.Likes (
    LikeID INT PRIMARY KEY IDENTITY,
    UserID INT,
    PostID INT,
    LikeDateTime DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PostID) REFERENCES dbo.DonationPosts(PostID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Comment Table
CREATE TABLE dbo.Comments (
    CommentID INT PRIMARY KEY IDENTITY,
    UserID INT,
    PostID INT,
    CommentContent NVARCHAR(MAX),
    CommentDateTime DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PostID) REFERENCES dbo.DonationPosts(PostID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- FeedbackRating Table
CREATE TABLE dbo.FeedbackRatings (
    FeedbackRatingID INT PRIMARY KEY IDENTITY,
    RatedUserID INT,
    RatingUserID INT,
    FeedbackContent NVARCHAR(MAX),
    Rating INT,
    RatingDateTime DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (RatedUserID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (RatingUserID) REFERENCES dbo.UserAccounts(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);
