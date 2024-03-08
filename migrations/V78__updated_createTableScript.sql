CREATE TABLE user_accounts (
  user_id INT PRIMARY KEY IDENTITY(1, 1),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  username VARCHAR(50) UNIQUE NOT NULL,
  image_url VARCHAR(2083),
  email_address VARCHAR(100) UNIQUE NOT NULL,
  profile_description NVARCHAR(120),
  is_active BIT NOT NULL DEFAULT (1),
  email_notification_enabled BIT NOT NULL DEFAULT (0)
);
 
CREATE TABLE country (
  country_id INT PRIMARY KEY IDENTITY(1, 1),
  country_name VARCHAR(50) NOT NULL
);
 
CREATE TABLE state (
  state_id INT PRIMARY KEY IDENTITY(1, 1),
  country_id INT NOT NULL,
  state_name VARCHAR(50) NOT NULL,
  FOREIGN KEY (country_id) REFERENCES country (country_id)
);
 
CREATE TABLE city (
  city_id INT PRIMARY KEY IDENTITY(1, 1),
  state_id INT NOT NULL,
  city_name VARCHAR(50) NOT NULL,
  FOREIGN KEY (state_id) REFERENCES state (state_id)
);
 
CREATE TABLE food_types (
  food_id INT PRIMARY KEY IDENTITY(1, 1),
  food_type VARCHAR(20) NOT NULL
);
 
CREATE TABLE addresses (
  address_id INT PRIMARY KEY IDENTITY(1, 1),
  address_line NVARCHAR(255) NOT NULL,
  city_id INT NOT NULL,
  longitude DECIMAL(9,6),
  latitude DECIMAL(8,6),
  FOREIGN KEY (city_id) REFERENCES city (city_id)
);
 
CREATE TABLE donation_posts (
  post_id INT PRIMARY KEY IDENTITY(1, 1),
  user_id INT NOT NULL,
  food_type_id INT NOT NULL,
  address_id INT NOT NULL,
  food_image_url VARCHAR(2048),
  time_available DATETIME NOT NULL,
  is_pickup_completed BIT NOT NULL DEFAULT (0),
  created_at DATETIME DEFAULT (GETDATE()),
  FOREIGN KEY (user_id) REFERENCES user_accounts (user_id),
  FOREIGN KEY (food_type_id) REFERENCES food_types (food_id),
  FOREIGN KEY (address_id) REFERENCES address (address_id)
);
 
CREATE TABLE pickup_completed (
  pickup_status_id INT PRIMARY KEY IDENTITY(1, 1),
  picked_up_by_user_id INT NOT NULL,
  post_id INT NOT NULL,
  pickup_date_time DATETIME NOT NULL,
  FOREIGN KEY (picked_up_by_user_id) REFERENCES user_accounts (user_id),
  FOREIGN KEY (post_id) REFERENCES donation_posts (post_id)
);
 
CREATE TABLE comments (
  comment_id INT PRIMARY KEY IDENTITY(1, 1),
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  comment_content NVARCHAR(120) NOT NULL,
  comment_date_time DATETIME DEFAULT (GETDATE()),
  FOREIGN KEY (user_id) REFERENCES user_accounts (user_id),
  FOREIGN KEY (post_id) REFERENCES donation_posts (post_id)
);
 
CREATE TABLE likes (
  like_id INT PRIMARY KEY IDENTITY(1, 1),
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  like_date_time DATETIME DEFAULT (GETDATE()),
  FOREIGN KEY (user_id) REFERENCES user_accounts (user_id),
  FOREIGN KEY (post_id) REFERENCES donation_posts (post_id)
);
 
CREATE TABLE feedback_ratings (
  feedback_rating_id INT PRIMARY KEY IDENTITY(1, 1),
  rated_user_id INT NOT NULL,
  rating_user_id INT NOT NULL,
  feedback_content VARCHAR(250) NOT NULL,
  rating INT NOT NULL,
  rating_date_time DATETIME DEFAULT (GETDATE()),
  FOREIGN KEY (rated_user_id) REFERENCES user_accounts (user_id),
  FOREIGN KEY (rating_user_id) REFERENCES user_accounts (user_id)
);
