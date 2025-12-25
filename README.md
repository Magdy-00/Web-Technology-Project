# 🛒 TechMart E-Commerce Platform

A fully functional e-commerce website built with PHP, MySQL, HTML5, CSS3, and JavaScript. TechMart specializes in technology products including laptops, accessories, and security tools.

![PHP](https://img.shields.io/badge/PHP-777BB4?style=flat&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)

## 📋 Table of Contents

- [Features](#features)
- [Demo Credentials](#demo-credentials)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Database Schema](#database-schema)
- [Pages Overview](#pages-overview)
- [Admin Features](#admin-features)
- [User Features](#user-features)
- [Security Features](#security-features)
- [Screenshots](#screenshots)
- [Future Enhancements](#future-enhancements)
- [License](#license)

## ✨ Features

### 🔐 Authentication System

- User registration with email and username validation
- Secure login with password hashing (bcrypt)
- Session-based authentication
- Role-based access control (Admin/User)
- Profile management
- Logout functionality

### 🛍️ Shopping Experience

- Browse 100+ products across 3 categories
- Dynamic product filtering by category
- Shopping cart with localStorage persistence
- Add/remove items from cart
- Real-time cart total calculation
- Wishlist functionality
- Checkout process

### 🎨 User Interface

- Fully responsive design (mobile, tablet, desktop)
- Dark/Light mode toggle with persistence
- Modern and clean UI
- Smooth animations and transitions
- Mobile-friendly navigation menu
- Cart dropdown with item preview

### 👨‍💼 Admin Panel

- Dashboard with real-time statistics
  - Total Products
  - Total Orders
  - Total Users
  - Revenue Tracking
- **Product Management (CRUD)**
  - Add new products
  - Edit existing products
  - Delete products
  - View all products
- **Order Management**
  - View all orders with customer details
  - Update order status (pending, processing, shipping, completed, cancelled)
  - Order history tracking

### 📊 User Account Features

- View and edit profile information
- Order history
- Wishlist management
- Personalized dashboard

## 🔑 Demo Credentials

### Admin Account

```
Email: admin@techmart.com
Password: admin123 (Update this in production!)
```

### Test User Account

```
Email: test@example.com
Password: test123
```

Or create your own account via the signup page!

## 🛠️ Technologies Used

### Backend

- **PHP 7.4+** - Server-side scripting
- **MySQL** - Database management
- **PDO/MySQLi** - Database connectivity

### Frontend

- **HTML5** - Structure
- **CSS3** - Styling with custom properties
- **JavaScript (ES6+)** - Interactivity
- **localStorage** - Client-side data persistence

### Security

- Password hashing with `password_hash()`
- Prepared statements (SQL injection prevention)
- XSS protection with `htmlspecialchars()`
- Session management
- Input sanitization

## 📁 Project Structure

```
project/
├── assets/
│   ├── css/
│   │   └── styles.css           # Main stylesheet with dark mode
│   ├── js/
│   │   └── script.js            # Cart, dark mode, navigation logic
│   ├── images/                  # Product and UI images
│   ├── sql/
│   │   ├── techmart.sql         # Main database schema
│   │   └── sample_orders.sql    # Sample data for testing
│   └── other/
│       └── SiteMap 9.eddx       # Site structure diagram
├── config/
│   └── db.php                   # Database connection configuration
├── html/
│   ├── index.php                # Home page
│   ├── products.php             # Product listing with filters
│   ├── login.php                # User login
│   ├── signup.php               # User registration
│   ├── logout.php               # Session destruction
│   ├── profile.php              # User profile management
│   ├── checkout.php             # Shopping cart checkout
│   ├── wishlist.php             # User wishlist
│   ├── order-history.php        # User's past orders
│   ├── admin-dashboard.php      # Admin statistics dashboard
│   ├── manage-products.php      # Admin product CRUD
│   └── manage-orders.php        # Admin order management
├── ADMIN_FEATURES.md            # Admin features documentation
├── SIGNUP_FEATURE.md            # Authentication system documentation
├── MIGRATION_COMPLETE.md        # Migration from HTML to PHP notes
└── README.md                    # This file
```

## 🚀 Installation

### Prerequisites

- PHP 7.4 or higher
- MySQL 5.7 or higher
- Apache/Nginx web server (XAMPP, WAMP, MAMP, or similar)
- Web browser (Chrome, Firefox, Safari, Edge)

### Step 1: Clone the Repository

```bash
git clone https://github.com/Magdy-00/Web-Technology-Project.git
cd Web-Technology-Project
```

### Step 2: Database Setup

1. Start your MySQL server
2. Import the database schema:

```bash
mysql -u root -p < assets/sql/techmart.sql
```

3. (Optional) Import sample data:

```bash
mysql -u root -p < assets/sql/sample_orders.sql
```

### Step 3: Configure Database Connection

Edit `config/db.php` with your database credentials:

```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'techmart');
```

### Step 4: Start Web Server

If using XAMPP/WAMP, place the project in `htdocs` or `www` folder.

For PHP built-in server:

```bash
cd html
php -S localhost:8000
```

### Step 5: Access the Application

```
http://localhost/project/html/index.php
```

or

```
http://localhost:8000/index.php
```

### Step 6: Update Admin Password

For security, update the admin password:

```sql
UPDATE users
SET password_hash = '$2y$10$YourHashedPasswordHere'
WHERE email = 'admin@techmart.com';
```

Generate a hash:

```php
echo password_hash('your_secure_password', PASSWORD_DEFAULT);
```

## 🗄️ Database Schema

### Tables

#### `users`

```sql
user_id (PK)         - INT AUTO_INCREMENT
username             - VARCHAR(50)
email                - VARCHAR(100)
password_hash        - VARCHAR(255)
is_admin             - BOOLEAN (DEFAULT FALSE)
```

#### `profiles`

```sql
profile_id (PK)      - INT AUTO_INCREMENT
user_id (FK)         - INT
full_name            - VARCHAR(100)
address              - VARCHAR(255)
phone                - VARCHAR(20)
```

#### `categories`

```sql
category_id (PK)     - INT AUTO_INCREMENT
name                 - VARCHAR(100)
```

**Data:** laptops, accessories, security-tools

#### `products`

```sql
product_id (PK)      - INT AUTO_INCREMENT
name                 - VARCHAR(150)
description          - TEXT
price                - DECIMAL(10,2)
category_id (FK)     - INT
```

**100 Products:** 30 laptops, 40 accessories, 30 security tools

#### `orders`

```sql
order_id (PK)        - INT AUTO_INCREMENT
user_id (FK)         - INT
total                - DECIMAL(10,2)
order_date           - DATETIME
status               - VARCHAR(50)
```

#### `order_items`

```sql
order_item_id (PK)   - INT AUTO_INCREMENT
order_id (FK)        - INT
product_id (FK)      - INT
quantity             - INT
```

#### `wishlist`

```sql
wishlist_id (PK)     - INT AUTO_INCREMENT
user_id (FK)         - INT
product_id (FK)      - INT
```

## 📄 Pages Overview

### Public Pages

- **Home (`index.php`)** - Hero section, featured categories, site features
- **Products (`products.php`)** - Product grid with category filtering
- **Login (`login.php`)** - User authentication
- **Sign Up (`signup.php`)** - New user registration
- **Checkout (`checkout.php`)** - Shopping cart and order placement

### User Pages (Authentication Required)

- **Profile (`profile.php`)** - View/edit personal information
- **Order History (`order-history.php`)** - Past orders and status
- **Wishlist (`wishlist.php`)** - Saved products

### Admin Pages (Admin Role Required)

- **Dashboard (`admin-dashboard.php`)** - Key metrics and statistics
- **Manage Products (`manage-products.php`)** - Full CRUD operations
- **Manage Orders (`manage-orders.php`)** - Order status management

## 🔧 Admin Features

### Dashboard Statistics

- **Total Products** - Count from database
- **Total Orders** - All orders placed
- **Total Users** - Registered customers (excluding admins)
- **Revenue** - Sum of all order totals

### Product Management

- **Add Product**: Create new products with name, description, price, category
- **Edit Product**: Update existing product details
- **Delete Product**: Remove products with confirmation
- **View All**: Paginated list of all products

### Order Management

- **View Orders**: Complete order list with customer details
- **Update Status**: Change order status (5 states)
- **Order Details**: Customer name, email, date, total amount

### Status Options

1. Pending - New orders
2. Processing - Being prepared
3. Shipping - In transit
4. Completed - Delivered
5. Cancelled - Cancelled orders

## 👤 User Features

### Shopping Cart

- Add products to cart
- View cart items in dropdown
- Update quantities
- Remove items
- Calculate total
- Persist cart in localStorage
- Cart count badge

### Dark Mode

- Toggle between light and dark themes
- Smooth transitions
- Persisted preference in localStorage
- Applies to all pages

### Profile Management

- View username and email
- Edit full name, phone, address
- Update profile information
- Session-protected pages

### Wishlist

- Save favorite products
- Quick access to desired items
- Manage wishlist items

## 🔒 Security Features

### Implemented

✅ Password hashing with bcrypt (`password_hash()`)  
✅ SQL injection prevention (prepared statements)  
✅ XSS protection (`htmlspecialchars()`)  
✅ Session-based authentication  
✅ Role-based access control  
✅ Input sanitization  
✅ Email uniqueness validation  
✅ Username uniqueness validation

### Recommended for Production

⚠️ CSRF token protection  
⚠️ Rate limiting for login attempts  
⚠️ Email verification on signup  
⚠️ Password reset functionality  
⚠️ HTTPS enforcement  
⚠️ Two-factor authentication  
⚠️ Account lockout after failed attempts  
⚠️ Security headers (CSP, X-Frame-Options)

## 📸 Screenshots

### Home Page

<<<<<<< HEAD
Modern landing page with hero section and featured categories.

### Products Page

Grid layout with category filtering and add-to-cart functionality.

### Shopping Cart

Dropdown cart with item preview and quick checkout.
=======
<img width="1904" height="924" alt="image" src="https://github.com/user-attachments/assets/f3f966a6-e6e2-4fcd-b27a-3a0b42befc4e" />
<img width="1905" height="918" alt="image" src="https://github.com/user-attachments/assets/55aad1f3-2ffb-40cd-88ab-0736adc7e4d1" />



### Products Page

<img width="1904" height="914" alt="image" src="https://github.com/user-attachments/assets/962c1f4f-a81f-4ce3-91b6-ea74a7456c6b" />

>>>>>>> 91b6ce37b426db60637dfc877d10b6b497cecfc4

### Admin Dashboard

Clean dashboard with real-time statistics.

### Product Management

Full CRUD interface for managing products.

### Dark Mode

Beautiful dark theme for reduced eye strain.

## 🚀 Future Enhancements

### Planned Features

- [ ] Product search functionality
- [ ] Advanced filtering (price range, sort by)
- [ ] Product reviews and ratings
- [ ] Image uploads for products
- [ ] Payment gateway integration
- [ ] Email notifications
- [ ] Invoice generation
- [ ] Shipping calculator
- [ ] Coupon/discount codes
- [ ] Multi-language support
- [ ] Product recommendations
- [ ] Analytics dashboard
- [ ] Export orders to CSV/PDF
- [ ] Social media integration
- [ ] Live chat support

### Technical Improvements

- [ ] RESTful API for mobile apps
- [ ] Caching for better performance
- [ ] CDN integration for assets
- [ ] Automated testing
- [ ] CI/CD pipeline
- [ ] Database optimization
- [ ] Load balancing
- [ ] Redis for session management
- [ ] Elasticsearch for search

## 📝 Documentation

Additional documentation available:

- **[ADMIN_FEATURES.md](ADMIN_FEATURES.md)** - Complete admin panel guide
- **[SIGNUP_FEATURE.md](SIGNUP_FEATURE.md)** - Authentication system details
- **[MIGRATION_COMPLETE.md](MIGRATION_COMPLETE.md)** - Migration notes

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🐛 Known Issues

- Admin password needs to be properly hashed in database
- Email verification not implemented
- Password reset not available
- No image upload for products (using placeholders)

## 📞 Support

For support, email: info@techmart.com

## 👥 Authors

- **Magdy** - _Initial work_ - [Magdy-00](https://github.com/Magdy-00)

## 🙏 Acknowledgments

- Inspired by modern e-commerce platforms
- Built as a Web Technology course project
- Fourth Year Project - 2025

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📊 Project Stats

- **Lines of Code**: ~5,000+
- **Files**: 12 PHP pages, 1 CSS file, 1 JS file
- **Database Tables**: 7 tables
- **Products**: 100 items
- **Categories**: 3 types
- **Development Time**: 4 weeks
- **Language**: PHP, MySQL, HTML5, CSS3, JavaScript

---

<div align="center">

**⭐ Star this repository if you found it helpful!**

Made with ❤️ by [Magdy-00](https://github.com/Magdy-00)

</div>
