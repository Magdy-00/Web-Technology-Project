# TechMart Admin Features Documentation

## Overview

All three admin pages now have full database integration with CRUD (Create, Read, Update, Delete) functionality.

## Database Setup

### 1. Import Main Database

First, import the main database schema:

```sql
mysql -u root -p < assets/sql/techmart.sql
```

### 2. Import Sample Data (Optional)

To test the admin features with sample orders and users:

```sql
mysql -u root -p < assets/sql/sample_orders.sql
```

### 3. Update Database Connection

Make sure `config/db.php` has the correct database name. The current configuration uses:

- Database: `webtech`
- Host: `localhost`
- User: `root`
- Password: (empty)

If your database is named `techmart` (as in the SQL file), update line 4 in `config/db.php`:

```php
define('DB_NAME', 'techmart');
```

## Admin Pages Features

### 1. Admin Dashboard (`admin-dashboard.php`)

**Features:**

- ✅ **Total Products** - Live count from database
- ✅ **Total Orders** - Live count from orders table
- ✅ **Total Users** - Count of non-admin users
- ✅ **Revenue** - Sum of all order totals

**Database Queries:**

- Products: `SELECT COUNT(*) FROM products`
- Orders: `SELECT COUNT(*) FROM orders`
- Users: `SELECT COUNT(*) FROM users WHERE is_admin = FALSE`
- Revenue: `SELECT SUM(total) FROM orders`

### 2. Manage Products (`manage-products.php`)

**Features:**

- ✅ **View All Products** - Shows all 100 products from database
- ✅ **Add New Product** - Modal form to add products
- ✅ **Edit Product** - Update name, description, price, category
- ✅ **Delete Product** - Remove products with confirmation

**How to Use:**

1. **Add Product:**

   - Click "Add New Product" button
   - Fill in the form (name, description, price, category)
   - Click "Save Product"

2. **Edit Product:**

   - Click the ✏️ (edit) icon next to any product
   - Modify the fields in the modal
   - Click "Save Product"

3. **Delete Product:**
   - Click the 🗑️ (delete) icon
   - Confirm the deletion
   - Product is removed from database

### 3. Manage Orders (`manage-orders.php`)

**Features:**

- ✅ **View All Orders** - Shows orders with customer info
- ✅ **Update Order Status** - Change order status (pending, processing, shipping, completed, cancelled)
- ✅ **Display Customer Info** - Shows username and email

**Order Statuses:**

- `pending` - New orders awaiting processing
- `processing` - Orders being prepared
- `shipping` - Orders in transit
- `completed` - Delivered orders
- `cancelled` - Cancelled orders

**How to Use:**

1. **View Orders:**

   - All orders displayed in table format
   - Shows Order ID, Customer, Email, Date, Total, Status

2. **Update Status:**
   - Click the ✏️ (edit) icon next to any order
   - Select new status from dropdown
   - Click "Update Status"

## Database Schema

### Products Table

```sql
product_id INT (Primary Key)
name VARCHAR(150)
description TEXT
price DECIMAL(10,2)
category_id INT (Foreign Key)
```

### Orders Table

```sql
order_id INT (Primary Key)
user_id INT (Foreign Key)
total DECIMAL(10,2)
order_date DATETIME
status VARCHAR(50) - NEW COLUMN
```

### Categories

1. laptops (category_id: 1)
2. accessories (category_id: 2)
3. security-tools (category_id: 3)

## Testing the Features

### Test Add Product:

1. Go to `http://localhost/project/html/manage-products.php`
2. Click "Add New Product"
3. Enter:
   - Name: "Test Laptop Pro"
   - Description: "High-performance laptop"
   - Price: 2499.99
   - Category: Laptops
4. Submit and verify it appears in the table

### Test Edit Product:

1. Find any product in the list
2. Click edit icon ✏️
3. Change the price
4. Submit and verify the change

### Test Delete Product:

1. Find the test product you added
2. Click delete icon 🗑️
3. Confirm deletion
4. Verify it's removed from the list

### Test Order Management:

1. Go to `http://localhost/project/html/manage-orders.php`
2. If you imported sample_orders.sql, you'll see 5 orders
3. Click edit on any order
4. Change status from "pending" to "processing"
5. Verify the status badge updates

## Security Notes

⚠️ **Important:** This is a development version. For production, you should:

1. Add proper authentication/session management
2. Use prepared statements (already implemented)
3. Add CSRF token protection
4. Implement proper password hashing
5. Add input validation on server side
6. Add admin role verification before allowing operations

## Troubleshooting

### No products showing?

- Check if database is imported: `mysql -u root -p webtech -e "SELECT COUNT(*) FROM products;"`
- Should return 100 products

### No orders showing?

- Import sample_orders.sql for test data
- Or create orders through the website

### Modal not appearing?

- Check browser console for JavaScript errors
- Ensure dark mode toggle isn't conflicting

### Database connection error?

- Verify MySQL is running
- Check credentials in config/db.php
- Ensure database name matches (webtech vs techmart)

## File Structure

```
project/
├── config/
│   └── db.php (Database connection)
├── html/
│   ├── admin-dashboard.php (Statistics)
│   ├── manage-products.php (Product CRUD)
│   └── manage-orders.php (Order management)
└── assets/
    └── sql/
        ├── techmart.sql (Main schema)
        └── sample_orders.sql (Test data)
```

## Next Steps

1. Import the database
2. Update config/db.php if needed
3. Start your local server (XAMPP/WAMP/MAMP)
4. Access the admin pages
5. Test all CRUD operations
6. Add authentication for security
