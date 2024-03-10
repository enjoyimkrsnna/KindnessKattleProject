-- Insert dummy data into user_accounts table
INSERT INTO user_accounts (first_name, last_name, username, email_address, profile_description, is_active, email_notification_enabled)
VALUES ('John', 'Doe', 'john_doe', 'john.doe@example.com', 'I am an active user', 1, 1),
       ('Jane', 'Smith', 'jane_smith', 'jane.smith@example.com', 'Another user profile', 1, 0);

-- Insert dummy data into country table
INSERT INTO country (country_name)
VALUES ('India');

-- Insert dummy data into state table
INSERT INTO state (country_id, state_name)
VALUES (1, 'Maharashtra');

-- Insert dummy data into city table
INSERT INTO city (state_id, city_name)
VALUES (1, 'Mumbai');

-- Insert dummy data into food_types table
INSERT INTO food_types (food_type)
VALUES ('Vegetarian'), ('Non-Vegetarian');

-- Insert dummy data into address table
INSERT INTO address (address_line, pincode, longitude, latitude)
VALUES ('123 Main Street', '400001', 72.8557, 19.0760),
       ('456 Oak Avenue', '400002', 72.8777, 19.1098);

-- Insert dummy data into donation_posts table
INSERT INTO donation_posts (user_id, food_type_id, address_id, food_image_url, time_available, is_pickup_completed, created_at)
VALUES (1, 1, 1, 'image1.jpg', '2024-03-15 12:00:00', 0, GETDATE()),
       (2, 2, 2, 'image2.jpg', '2024-03-20 14:30:00', 1, GETDATE());

-- Insert dummy data into pickup_completed table
INSERT INTO pickup_completed (picked_up_by_user_id, post_id, pickup_date_time)
VALUES (1, 1, '2024-03-15 13:30:00'),
       (2, 2, '2024-03-21 15:45:00');

-- Insert dummy data into comments table
INSERT INTO comments (user_id, post_id, comment_content, comment_date_time)
VALUES (1, 1, 'Great initiative!', GETDATE()),
       (2, 2, 'Hope this helps someone in need.', GETDATE());

-- Insert dummy data into likes table
INSERT INTO likes (user_id, post_id, like_date_time)
VALUES (1, 1, GETDATE()),
       (2, 2, GETDATE());

-- Insert dummy data into feedback_ratings table
INSERT INTO feedback_ratings (rated_user_id, rating_user_id, feedback_content, rating, rating_date_time)
VALUES (1, 2, 'Prompt and helpful.', 5, GETDATE()),
       (2, 1, 'Friendly user!', 4, GETDATE());
