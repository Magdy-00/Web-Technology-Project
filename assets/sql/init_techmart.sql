-- Additional fields needed for TechMart functionality
-- Run this after importing amazon-db.sql

-- Add missing fields to users table
ALTER TABLE `users` 
ADD COLUMN `password_hash` VARCHAR(255) NOT NULL AFTER `email`,
ADD COLUMN `is_admin` TINYINT(1) DEFAULT 0 AFTER `password_hash`;

-- Add description field to products table if not exists
ALTER TABLE `products` 
ADD COLUMN `description` TEXT AFTER `name`,
ADD COLUMN `category_id` INT(11) AFTER `description`,
ADD COLUMN `image_url` VARCHAR(255) AFTER `stock`;

-- Create orders table
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `shipping_address` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create order_items table
CREATE TABLE IF NOT EXISTS `order_items` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert sample admin user (password: admin123)
INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `is_admin`, `created_at`) 
VALUES (10, 'admin', 'admin@techmart.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2025-12-01')
ON DUPLICATE KEY UPDATE username=username;

-- Update existing products with categories
UPDATE `products` SET `category_id` = 1, `description` = 'High-performance laptop for work and gaming' WHERE `product_id` IN (1, 4);
UPDATE `products` SET `category_id` = 1, `description` = 'Latest smartphone with advanced features' WHERE `product_id` IN (2, 5);
UPDATE `products` SET `category_id` = 2, `description` = 'Premium quality headphones with noise cancellation' WHERE `product_id` IN (3, 6);
