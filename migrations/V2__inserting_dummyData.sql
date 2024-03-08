-- Insert dummy data into user_accounts table
INSERT INTO user_accounts (first_name, last_name, username, image_url, email_address, profile_description, is_active, email_notification_enabled)
VALUES
('John', 'Doe', 'john_doe', NULL, 'john.doe@example.com', 'I love helping others!', 1, 0),
('Alice', 'Smith', 'alice_smith', NULL, 'alice.smith@example.com', 'Food enthusiast', 1, 1),
('Bob', 'Johnson', 'bob_johnson', NULL, 'bob.johnson@example.com', 'Passionate about reducing food waste', 1, 1);

-- Insert dummy data into country table
INSERT INTO country (country_name)
VALUES
('United States'),
('Canada'),
('United Kingdom');

-- Insert dummy data into state table
INSERT INTO state (country_id, state_name)
VALUES
(1, 'California'),
(1, 'New York'),
(2, 'Ontario'),
(2, 'Quebec'),
(3, 'England'),
(3, 'Scotland');

-- Insert dummy data into city table
INSERT INTO city (state_id, city_name)
VALUES
(1, 'Los Angeles'),
(1, 'San Francisco'),
(2, 'New York City'),
(2, 'Albany'),
(3, 'Toronto'),
(3, 'Ottawa'),
(4, 'Montreal'),
(5, 'London'),
(5, 'Manchester'),
(6, 'Edinburgh');

-- Insert dummy data into food_types table
INSERT INTO food_types (food_type)
VALUES
('Vegetables'),
('Fruits'),
('Canned Goods'),
('Bakery'),
('Dairy'),
('Meat');

-- Insert dummy data into address table
INSERT INTO address (address_line, city_id, longitude, latitude)
VALUES
('123 Main St', 1, -118.2437, 34.0522),
('456 Oak St', 3, -73.9866, 40.7128),
('789 Maple St', 6, -75.6831, 45.4215);

-- Insert dummy data into donation_posts table
INSERT INTO donation_posts (user_id, food_type_id, address_id, food_image_url, time_available, is_pickup_completed, created_at)
VALUES
(1, 1, 1, 'image1.jpg', '2024-03-10 12:00:00', 0, '2024-03-08 08:30:00'),
(2, 2, 2, 'image2.jpg', '2024-03-12 14:30:00', 0, '2024-03-08 09:45:00'),
(3, 3, 3, 'image3.jpg', '2024-03-15 10:00:00', 0, '2024-03-08 10:15:00');

-- Insert dummy data into pickup_completed table
INSERT INTO pickup_completed (picked_up_by_user_id, post_id, pickup_date_time)
VALUES
(2, 1, '2024-03-10 12:45:00'),
(3, 2, '2024-03-12 15:00:00');

-- Insert dummy data into comments table
INSERT INTO comments (user_id, post_id, comment_content, comment_date_time)
VALUES
(2, 1, 'Great initiative!', '2024-03-10 13:00:00'),
(3, 1, 'Happy to contribute!', '2024-03-10 13:30:00'),
(1, 2, 'Nice variety of fruits!', '2024-03-12 15:30:00');

-- Insert dummy data into likes table
INSERT INTO likes (user_id, post_id, like_date_time)
VALUES
(3, 1, '2024-03-10 13:15:00'),
(1, 2, '2024-03-12 15:45:00');

-- Insert dummy data into feedback_ratings table
INSERT INTO feedback_ratings (rated_user_id, rating_user_id, feedback_content, rating, rating_date_time)
VALUES
(1, 2, 'Prompt pickup!', 5, '2024-03-10 14:00:00'),
(2, 3, 'Very friendly!', 4, '2024-03-12 16:00:00');
