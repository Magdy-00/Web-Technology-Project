-- Sample orders for testing admin dashboard
-- Make sure to run techmart.sql first

USE techmart;

-- Add some test users (customers, not admins)
INSERT INTO users (username, email, password_hash, is_admin) VALUES
('john_doe', 'john@example.com', 'hashed_pass_123', FALSE),
('jane_smith', 'jane@example.com', 'hashed_pass_456', FALSE),
('bob_johnson', 'bob@example.com', 'hashed_pass_789', FALSE);

-- Add status column to orders table if it doesn't exist
ALTER TABLE orders ADD COLUMN IF NOT EXISTS status VARCHAR(50) DEFAULT 'pending';

-- Add sample orders
INSERT INTO orders (user_id, total, order_date, status) VALUES
(2, 1746.00, '2025-11-25 10:30:00', 'pending'),
(3, 299.00, '2025-11-24 14:20:00', 'completed'),
(4, 1799.00, '2025-11-23 09:15:00', 'shipping'),
(2, 450.00, '2025-11-22 16:45:00', 'completed'),
(3, 2100.00, '2025-11-21 11:00:00', 'processing');

-- Add sample order items (linking orders to products)
INSERT INTO order_items (order_id, product_id, quantity) VALUES
-- Order 1: Laptop + Accessory
(1, 1, 1),
(1, 31, 2),
-- Order 2: Accessory only
(2, 35, 1),
-- Order 3: Laptop
(3, 2, 1),
-- Order 4: Multiple accessories
(4, 32, 1),
(4, 33, 1),
-- Order 5: Security tool
(5, 71, 1);
