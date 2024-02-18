-- Insert dummy data into UserAccounts table
INSERT INTO UserAccounts (FirstName, LastName, Username, ImageURL, EmailAddress, ProfileDescription, IsActive)
VALUES ('John', 'Doe', 'john.doe', 'image_url1.jpg', 'john.doe@email.com', 'Profile description for John', 1),
       ('Jane', 'Smith', 'jane.smith', 'image_url2.jpg', 'jane.smith@email.com', 'Profile description for Jane', 1);

-- Insert dummy data into Addresses table
INSERT INTO Addresses (AddressLine, City, StateRegion, Longitude, Latitude)
VALUES ('123 Main St', 'Cityville', 'State1', 12.345678, -45.678901),
       ('456 Oak St', 'Townsville', 'State2', 23.456789, -56.789012);

-- Insert dummy data into DonationPosts table
INSERT INTO DonationPosts (UserID, AddressID, FoodImageURL, FoodType, TimeAvailable, IsPostActive, CreatedAt)
VALUES (1, 1, 'food_image_url1.jpg', 'Vegetables', '2024-02-20 12:00:00', 1, GETDATE()),
       (2, 2, 'food_image_url2.jpg', 'Fruits', '2024-02-21 15:30:00', 1, GETDATE());

-- Insert dummy data into PickupStatuses table
INSERT INTO PickupStatuses (PostID, PickedUpByUserID, PickupDateTime)
VALUES (1, 2, '2024-02-20 12:30:00'),
       (2, 1, '2024-02-21 16:00:00');

-- Insert dummy data into Conversations table
INSERT INTO Conversations (User1ID, User2ID)
VALUES (1, 2);

-- Insert dummy data into ChatMessages table
INSERT INTO ChatMessages (ConversationID, SenderUserID, ReceiverUserID, MessageContent, MessageTimestamp)
VALUES (1, 1, 2, 'Hello Jane!', GETDATE());

-- Insert dummy data into Likes table
INSERT INTO Likes (UserID, PostID, LikeDateTime)
VALUES (1, 2, GETDATE());

-- Insert dummy data into Comments table
INSERT INTO Comments (UserID, PostID, CommentContent, CommentDateTime)
VALUES (2, 1, 'Nice donation!', GETDATE());

-- Insert dummy data into FeedbackRatings table
INSERT INTO FeedbackRatings (RatedUserID, RatingUserID, FeedbackContent, Rating, RatingDateTime)
VALUES (1, 2, 'Great user!', 5, GETDATE());
