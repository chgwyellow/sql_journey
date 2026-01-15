DROP DATABASE IF EXISTS ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE `USERS` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `username` varchar(255) UNIQUE NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

CREATE TABLE `PHOTOS` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `image_url` varchar(255) NOT NULL,
  `user_id` integer NOT NULL,
  `created_at` timestamp DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES USERS(id)
);

CREATE TABLE `COMMENTS` (
  `id` integer AUTO_INCREMENT PRIMARY KEY,
  `comment_text` text NOT NULL,
  `user_id` integer NOT NULL,
  `photo_id` integer NOT NULL,
  `created_at` timestamp DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES USERS(id),
  FOREIGN KEY(photo_id) REFERENCES PHOTOS(id)
);

CREATE TABLE `LIKES` (
  `user_id` integer NOT NULL,
  `photo_id` integer NOT NULL,
  `created_at` timestamp DEFAULT NOW(),
  PRIMARY KEY (`user_id`, `photo_id`),
  FOREIGN KEY(user_id) REFERENCES USERS(id),
  FOREIGN KEY(photo_id) REFERENCES PHOTOS(id)
);

CREATE TABLE `FOLLOWS` (
  `follower_id` integer NOT NULL,
  `followee_id` integer NOT NULL,
  `created_at` timestamp DEFAULT NOW(),
  PRIMARY KEY (`follower_id`, `followee_id`),
  FOREIGN KEY(follower_id) REFERENCES USERS(id),
  FOREIGN KEY(followee_id) REFERENCES USERS(id)
);