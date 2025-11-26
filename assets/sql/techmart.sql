-- ---------------------------------------------------------
-- TechMart Database Schema (Admin Only)
-- ---------------------------------------------------------

DROP DATABASE IF EXISTS techmart;
CREATE DATABASE techmart;
USE techmart;

-- ============================
-- USERS
-- ============================
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password_hash VARCHAR(255),
    is_admin BOOLEAN DEFAULT FALSE
);

-- ONLY ADMIN USER
INSERT INTO users (username, email, password_hash, is_admin) VALUES
('admin', 'admin@techmart.com', 'hashed_pass', TRUE);

-- ============================
-- PROFILES
-- ============================
CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Profiles empty — you will add later manually.

-- ============================
-- CATEGORIES
-- ============================
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO categories (name) VALUES
('laptops'),
('accessories'),
('security-tools');

-- ============================
-- PRODUCTS
-- ============================
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    description TEXT,
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- -------- Laptops (30)
INSERT INTO products (name, description, price, category_id) VALUES
('Laptop Model 1','High-end laptop for gaming and work.',17999,1),
('Laptop Model 2','High-end laptop for gaming and work.',18500,1),
('Laptop Model 3','High-end laptop for gaming and work.',21000,1),
('Laptop Model 4','High-end laptop for gaming and work.',19999,1),
('Laptop Model 5','High-end laptop for gaming and work.',17000,1),
('Laptop Model 6','High-end laptop for gaming and work.',24500,1),
('Laptop Model 7','High-end laptop for gaming and work.',18900,1),
('Laptop Model 8','High-end laptop for gaming and work.',26600,1),
('Laptop Model 9','High-end laptop for gaming and work.',16000,1),
('Laptop Model 10','High-end laptop for gaming and work.',27500,1),
('Laptop Model 11','High-end laptop for gaming and work.',15500,1),
('Laptop Model 12','High-end laptop for gaming and work.',23000,1),
('Laptop Model 13','High-end laptop for gaming and work.',25500,1),
('Laptop Model 14','High-end laptop for gaming and work.',26000,1),
('Laptop Model 15','High-end laptop for gaming and work.',24000,1),
('Laptop Model 16','High-end laptop for gaming and work.',18000,1),
('Laptop Model 17','High-end laptop for gaming and work.',20000,1),
('Laptop Model 18','High-end laptop for gaming and work.',15800,1),
('Laptop Model 19','High-end laptop for gaming and work.',31000,1),
('Laptop Model 20','High-end laptop for gaming and work.',29900,1),
('Laptop Model 21','High-end laptop for gaming and work.',22700,1),
('Laptop Model 22','High-end laptop for gaming and work.',17500,1),
('Laptop Model 23','High-end laptop for gaming and work.',21300,1),
('Laptop Model 24','High-end laptop for gaming and work.',21900,1),
('Laptop Model 25','High-end laptop for gaming and work.',20500,1),
('Laptop Model 26','High-end laptop for gaming and work.',25600,1),
('Laptop Model 27','High-end laptop for gaming and work.',26700,1),
('Laptop Model 28','High-end laptop for gaming and work.',17800,1),
('Laptop Model 29','High-end laptop for gaming and work.',19000,1),
('Laptop Model 30','High-end laptop for gaming and work.',29999,1);

-- -------- Accessories (40)
INSERT INTO products (name, description, price, category_id) VALUES
('Accessory Item 1','Tech accessory item.',199,2),
('Accessory Item 2','Tech accessory item.',250,2),
('Accessory Item 3','Tech accessory item.',150,2),
('Accessory Item 4','Tech accessory item.',350,2),
('Accessory Item 5','Tech accessory item.',120,2),
('Accessory Item 6','Tech accessory item.',450,2),
('Accessory Item 7','Tech accessory item.',300,2),
('Accessory Item 8','Tech accessory item.',180,2),
('Accessory Item 9','Tech accessory item.',199,2),
('Accessory Item 10','Tech accessory item.',400,2),
('Accessory Item 11','Tech accessory item.',500,2),
('Accessory Item 12','Tech accessory item.',220,2),
('Accessory Item 13','Tech accessory item.',330,2),
('Accessory Item 14','Tech accessory item.',270,2),
('Accessory Item 15','Tech accessory item.',410,2),
('Accessory Item 16','Tech accessory item.',510,2),
('Accessory Item 17','Tech accessory item.',175,2),
('Accessory Item 18','Tech accessory item.',180,2),
('Accessory Item 19','Tech accessory item.',350,2),
('Accessory Item 20','Tech accessory item.',490,2),
('Accessory Item 21','Tech accessory item.',220,2),
('Accessory Item 22','Tech accessory item.',155,2),
('Accessory Item 23','Tech accessory item.',299,2),
('Accessory Item 24','Tech accessory item.',420,2),
('Accessory Item 25','Tech accessory item.',405,2),
('Accessory Item 26','Tech accessory item.',257,2),
('Accessory Item 27','Tech accessory item.',360,2),
('Accessory Item 28','Tech accessory item.',450,2),
('Accessory Item 29','Tech accessory item.',140,2),
('Accessory Item 30','Tech accessory item.',349,2),
('Accessory Item 31','Tech accessory item.',399,2),
('Accessory Item 32','Tech accessory item.',210,2),
('Accessory Item 33','Tech accessory item.',370,2),
('Accessory Item 34','Tech accessory item.',389,2),
('Accessory Item 35','Tech accessory item.',299,2),
('Accessory Item 36','Tech accessory item.',275,2),
('Accessory Item 37','Tech accessory item.',180,2),
('Accessory Item 38','Tech accessory item.',199,2),
('Accessory Item 39','Tech accessory item.',420,2),
('Accessory Item 40','Tech accessory item.',499,2);

-- -------- Security Tools (30)
INSERT INTO products (name, description, price, category_id) VALUES
('Security Tool 1','Cybersecurity tool.',850,3),
('Security Tool 2','Cybersecurity tool.',1200,3),
('Security Tool 3','Cybersecurity tool.',1300,3),
('Security Tool 4','Cybersecurity tool.',999,3),
('Security Tool 5','Cybersecurity tool.',1500,3),
('Security Tool 6','Cybersecurity tool.',1700,3),
('Security Tool 7','Cybersecurity tool.',1800,3),
('Security Tool 8','Cybersecurity tool.',2100,3),
('Security Tool 9','Cybersecurity tool.',2600,3),
('Security Tool 10','Cybersecurity tool.',2950,3),
('Security Tool 11','Cybersecurity tool.',700,3),
('Security Tool 12','Cybersecurity tool.',850,3),
('Security Tool 13','Cybersecurity tool.',950,3),
('Security Tool 14','Cybersecurity tool.',1050,3),
('Security Tool 15','Cybersecurity tool.',1100,3),
('Security Tool 16','Cybersecurity tool.',1450,3),
('Security Tool 17','Cybersecurity tool.',1700,3),
('Security Tool 18','Cybersecurity tool.',2600,3),
('Security Tool 19','Cybersecurity tool.',3100,3),
('Security Tool 20','Cybersecurity tool.',2990,3),
('Security Tool 21','Cybersecurity tool.',3300,3),
('Security Tool 22','Cybersecurity tool.',3550,3),
('Security Tool 23','Cybersecurity tool.',1999,3),
('Security Tool 24','Cybersecurity tool.',2200,3),
('Security Tool 25','Cybersecurity tool.',2400,3),
('Security Tool 26','Cybersecurity tool.',1300,3),
('Security Tool 27','Cybersecurity tool.',1600,3),
('Security Tool 28','Cybersecurity tool.',1700,3),
('Security Tool 29','Cybersecurity tool.',1990,3),
('Security Tool 30','Cybersecurity tool.',2999,3);

-- ============================
-- WISHLIST (empty – no users yet)
-- ============================
CREATE TABLE wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================
-- ORDERS (empty – no users yet)
-- ============================
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total DECIMAL(10,2),
    order_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ============================
-- ORDER ITEMS (empty)
-- ============================
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
