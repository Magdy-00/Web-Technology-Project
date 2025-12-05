# TechMart - Quick Start Guide

## 🚀 5-Minute Setup

### 1. Import Database (Required)

```sql
1. Open phpMyAdmin (http://localhost/phpmyadmin)
2. Create database: "amazon-db"
3. Import: assets/sql/amazon-db.sql
4. Import: assets/sql/init_techmart.sql (IMPORTANT!)
```

### 2. Access Application

- Homepage: http://localhost/techmart/html/index.php
- Admin: http://localhost/techmart/html/admin-dashboard.php

### 3. Login

- Admin: admin@techmart.com / admin123
- User: mohamed@example.com / (any password)

## 📝 Common Tasks

### Add a Product

1. Go to: http://localhost/techmart/html/manage-products.php
2. Click "Add New Product"
3. Fill form and submit

### Edit a Product

1. In Manage Products page
2. Click ✏️ icon next to product
3. Modify and save

### Delete a Product

1. In Manage Products page
2. Click 🗑️ icon next to product
3. Confirm deletion

### View Products

- User view: http://localhost/techmart/html/products.php
- Admin view: http://localhost/techmart/html/manage-products.php

## 🎨 Test Features

### Test Shopping Cart

1. Go to Products page
2. Click "Add to Cart" on any product
3. Click cart icon (🛒) to view cart
4. Remove items with 🗑️ icon

### Test Dark Mode

1. Click moon icon (🌙) in navigation
2. Toggles to sun icon (☀️)
3. Preference is saved

### Test Responsive Design

1. Resize browser window
2. Or use browser DevTools (F12)
3. Check mobile view (< 768px)

### Test Product Filter

1. Go to Products page
2. Click category buttons
3. Products filter in real-time

## 🐛 Quick Fixes

### "Orders table not found"

- Run: assets/sql/init_techmart.sql

### "Can't connect to database"

- Check XAMPP/WAMP MySQL is running
- Verify database name is "amazon-db"

### "Products not showing"

- Check if products exist in database
- Run: SELECT \* FROM products;

### "Login not working"

- Make sure init_techmart.sql was run
- Use admin@techmart.com / admin123

## 📱 Responsive Breakpoints

- Mobile: < 768px
- Tablet: 768px - 1199px
- Desktop: 1200px+

## 🔑 Database Tables

Main tables used:

- `products` - Product information
- `categories` - Product categories
- `users` - User accounts
- `orders` - Customer orders (after init)
- `order_items` - Order details (after init)

## ✅ Checklist

- [ ] XAMPP/WAMP installed and running
- [ ] Database "amazon-db" created
- [ ] amazon-db.sql imported
- [ ] init_techmart.sql imported
- [ ] Files in htdocs/www directory
- [ ] Can access index.php in browser
- [ ] Can login to admin panel
- [ ] Can add/edit/delete products

## 📞 Need Help?

1. Read SETUP_GUIDE.md for detailed instructions
2. Check troubleshooting section
3. Verify both SQL files imported
4. Check browser console for errors (F12)

---

**Ready to go! Start with: http://localhost/techmart/html/index.php**
