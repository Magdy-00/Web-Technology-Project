# TechMart - E-Commerce Web Application

A fully operational CRUD (Create, Read, Update, Delete) e-commerce web application built with PHP, MySQL, JavaScript, HTML5, and CSS3. TechMart is a responsive technology products marketplace with complete admin functionality.

## 🚀 Features

### User Features

- **Product Browsing**: View all products with categories (Electronics, Fashion, Home Appliances)
- **Shopping Cart**: Add/remove products with real-time cart updates
- **User Authentication**: Login and signup functionality
- **Responsive Design**: Fully responsive layout for mobile, tablet, and desktop
- **Dark Mode**: Toggle between light and dark themes
- **Product Search & Filter**: Filter products by category
- **Order History**: View past orders (when orders table is set up)

### Admin Features

- **Dashboard**: View statistics (total products, orders, users, revenue)
- **Product Management**: Full CRUD operations
  - Create new products
  - View all products in a data table
  - Edit existing products
  - Delete products
- **Order Management**: View and manage customer orders
- **Responsive Admin Panel**: Mobile-friendly admin interface

## 📋 Prerequisites

- **Web Server**: Apache (XAMPP, WAMP, or MAMP recommended)
- **PHP**: Version 7.4 or higher
- **MySQL**: Version 5.7 or higher
- **Web Browser**: Modern browser (Chrome, Firefox, Safari, Edge)

## 🛠️ Installation & Setup

### Step 1: Install XAMPP/WAMP/MAMP

1. Download and install [XAMPP](https://www.apachefriends.org/) (or WAMP/MAMP)
2. Start Apache and MySQL services

### Step 2: Set Up the Database

1. **Import the main database**:

   - Open phpMyAdmin (http://localhost/phpmyadmin)
   - Create a new database named `amazon-db`
   - Click on "Import" tab
   - Select the file: `assets/sql/amazon-db.sql`
   - Click "Go" to import

2. **Run the initialization script** (Important!):
   - After importing amazon-db.sql, import the additional setup file
   - In phpMyAdmin, select the `amazon-db` database
   - Click on "Import" tab
   - Select the file: `assets/sql/init_techmart.sql`
   - Click "Go" to import
   - This adds necessary fields to users table and creates orders tables

### Step 3: Configure Database Connection

The database configuration is already set up in `config/db.php`:

```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'amazon-db');
```

If your MySQL setup is different, update these values accordingly.

### Step 4: Copy Files to Web Server

1. Copy the entire project folder to your web server directory:
   - **XAMPP**: `C:\xampp\htdocs\techmart\`
   - **WAMP**: `C:\wamp64\www\techmart\`
   - **MAMP**: `/Applications/MAMP/htdocs/techmart/`

### Step 5: Access the Application

Open your web browser and navigate to:

- **Homepage**: http://localhost/techmart/html/index.php
- **Products**: http://localhost/techmart/html/products.php
- **Admin Dashboard**: http://localhost/techmart/html/admin-dashboard.php
- **Manage Products**: http://localhost/techmart/html/manage-products.php

## 👤 Default Login Credentials

After running `init_techmart.sql`, you can use this admin account:

- **Email**: admin@techmart.com
- **Password**: admin123

For testing user accounts, you can log in with any existing user from the database:

- **Emails**: mohamed@example.com, sara@example.com, ahmed@example.com
- **Password**: Any password (fallback authentication is enabled for demo)

## 📁 Project Structure

```
techmart/
│
├── assets/
│   ├── css/
│   │   └── styles.css          # Main stylesheet with responsive design
│   ├── js/
│   │   └── script.js           # JavaScript for interactivity
│   ├── images/                 # Product and UI images
│   └── sql/
│       ├── amazon-db.sql       # Main database structure
│       └── init_techmart.sql   # Additional setup script
│
├── config/
│   └── db.php                  # Database configuration
│
├── html/
│   ├── index.php               # Homepage
│   ├── products.php            # Product listing
│   ├── login.php               # User login
│   ├── signup.php              # User registration
│   ├── checkout.php            # Checkout page
│   ├── admin-dashboard.php     # Admin overview
│   ├── manage-products.php     # Product CRUD operations
│   ├── manage-orders.php       # Order management
│   ├── profile.php             # User profile
│   ├── order-history.php       # User orders
│   ├── wishlist.php            # User wishlist
│   └── logout.php              # Logout handler
│
└── README.md                   # This file
```

## 🎨 Responsive Design

TechMart is fully responsive with breakpoints at:

- **Desktop**: 1200px+
- **Tablet**: 768px - 1199px
- **Mobile**: 320px - 767px

Features:

- Collapsible mobile navigation menu
- Responsive grid layouts
- Touch-friendly buttons and forms
- Optimized font sizes for all screens

## 🔧 CRUD Operations

### Products Management

#### Create (Add New Product)

1. Go to Manage Products page
2. Click "Add New Product" button
3. Fill in the form:
   - Product Name (required)
   - Brand
   - Description
   - Price (required)
   - Stock (required)
   - Category
4. Click "Save Product"

#### Read (View Products)

- View all products on the Products page
- Admin can see full product list in Manage Products

#### Update (Edit Product)

1. In Manage Products, click the ✏️ (edit) icon
2. Modify the product details
3. Click "Save Product"

#### Delete (Remove Product)

1. In Manage Products, click the 🗑️ (delete) icon
2. Confirm the deletion
3. Product is permanently removed

## 🎯 Key Features Explained

### Dark Mode

- Toggle between light and dark themes
- Preference saved in browser localStorage
- Applies to all pages

### Shopping Cart

- Add products from product listing
- View cart in dropdown
- Remove items individually
- Cart persists in localStorage
- Total price calculated automatically

### Admin Dashboard

- Real-time statistics
- Quick access to management pages
- Responsive card layout

### Form Validation

- Client-side validation for all forms
- Email format checking
- Password confirmation matching
- Required field validation
- Visual feedback for errors

## 🐛 Troubleshooting

### Database Connection Error

- Verify MySQL is running in XAMPP/WAMP
- Check database credentials in `config/db.php`
- Ensure `amazon-db` database exists

### Products Not Displaying

- Run `init_techmart.sql` to add missing columns
- Check if products exist in database
- Verify category_id relationships

### Login Issues

- Run `init_techmart.sql` to add password_hash column
- Use the default admin credentials
- Check if users table has data

### Orders Table Not Found

- Run `init_techmart.sql` to create orders tables
- This is normal if you only imported amazon-db.sql

### Blank Page or PHP Errors

- Enable PHP error reporting in php.ini
- Check Apache error logs
- Verify all PHP files have proper closing tags

## 💻 Development Notes

### Database Schema

**Products Table**:

- product_id (Primary Key)
- name
- brand
- description
- price
- stock
- category_id (Foreign Key)

**Users Table** (after init):

- user_id (Primary Key)
- username
- email
- password_hash
- is_admin
- created_at

**Categories Table**:

- category_id (Primary Key)
- name
- description

**Orders Table** (created by init):

- order_id (Primary Key)
- user_id (Foreign Key)
- total_amount
- status
- shipping_address
- created_at

### Security Notes

For production deployment:

1. Enable admin authentication checks (uncomment in files)
2. Use proper password hashing for all users
3. Add CSRF protection
4. Implement input sanitization
5. Use prepared statements (already implemented)
6. Add SSL/HTTPS
7. Set proper file permissions

## 📱 Browser Compatibility

- ✅ Chrome (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Edge (latest)
- ✅ Mobile browsers (iOS Safari, Chrome Mobile)

## 🎓 Technologies Used

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Backend**: PHP 7.4+
- **Database**: MySQL 5.7+
- **Styling**: Custom CSS with CSS Variables
- **Icons**: Unicode Emojis
- **Responsive**: CSS Flexbox & Grid

## 📄 License

This project is open-source and available for educational purposes.

## 👨‍💻 Support

For issues or questions:

1. Check the troubleshooting section
2. Verify all installation steps were followed
3. Ensure both SQL files were imported
4. Check browser console for JavaScript errors
5. Review Apache/PHP error logs

## 🚀 Future Enhancements

- Payment gateway integration
- Email notifications
- Product reviews and ratings
- Advanced search functionality
- Image upload for products
- Inventory management
- Sales reports and analytics
- Customer management
- Shipping tracking

---

**Created for Web Technology Project - December 2025**
