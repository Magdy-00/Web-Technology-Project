# TechMart - Testing Checklist

Use this checklist to verify all features are working correctly.

## 🔧 Prerequisites Testing

### Database Setup

- [ ] XAMPP/WAMP installed and Apache running
- [ ] MySQL service running
- [ ] Database `amazon-db` created in phpMyAdmin
- [ ] File `amazon-db.sql` imported successfully
- [ ] File `init_techmart.sql` imported successfully
- [ ] Products table has sample data
- [ ] Categories table has sample data
- [ ] Users table has admin user
- [ ] Orders table exists (check in phpMyAdmin)

### File Setup

- [ ] Project files in correct directory (htdocs/www)
- [ ] Can access: http://localhost/techmart/html/index.php
- [ ] No PHP errors displayed
- [ ] CSS loads properly (check browser DevTools)
- [ ] JavaScript loads properly (check console)

## 🏠 Homepage Testing (index.php)

### Visual Check

- [ ] Logo displays "TechMart"
- [ ] Navigation menu visible
- [ ] Dark mode toggle button (🌙) visible
- [ ] Shopping cart icon (🛒) visible with count "0"
- [ ] Hero section with "Welcome to TechMart"
- [ ] "Shop Now" button present
- [ ] Features section with 4 cards
- [ ] Footer with contact info

### Functionality

- [ ] All navigation links work
- [ ] Dark mode toggles (🌙 ↔ ☀️)
- [ ] Dark mode persists on page reload
- [ ] Cart dropdown opens on click
- [ ] Cart shows "Your cart is empty"
- [ ] Mobile menu works (resize browser < 768px)

## 🛍️ Products Page Testing (products.php)

### Display

- [ ] Page header shows "Our Products"
- [ ] Category filter buttons visible
- [ ] Products display in grid layout
- [ ] Each product shows:
  - [ ] Icon/emoji
  - [ ] Product name
  - [ ] Brand name
  - [ ] Price
  - [ ] Description
  - [ ] Stock quantity
  - [ ] "Add to Cart" button

### Filtering

- [ ] "All" button is active by default
- [ ] Click "Electronics" - filters to electronics
- [ ] Click "Fashion" - filters to fashion items
- [ ] Click "Home Appliances" - filters appropriately
- [ ] Click "All" - shows all products again
- [ ] Smooth animation when filtering

### Shopping Cart

- [ ] Click "Add to Cart" on any product
- [ ] Cart count increases (+1)
- [ ] Green notification appears
- [ ] Open cart dropdown
- [ ] Product appears in cart
- [ ] Product shows name, price, icon
- [ ] Total price calculated correctly
- [ ] Click remove (🗑️) button
- [ ] Product removed from cart
- [ ] Cart count decreases
- [ ] Cart persists after page refresh

### Responsive

- [ ] Desktop (> 1200px): 4 columns
- [ ] Tablet (768-1199px): 2 columns
- [ ] Mobile (< 768px): 1 column
- [ ] Filter buttons wrap on mobile
- [ ] All text readable on small screens

## 🔐 Authentication Testing

### Login (login.php)

- [ ] Login page loads
- [ ] Form has email and password fields
- [ ] Try login with: admin@techmart.com / admin123
- [ ] Successful login redirects to admin dashboard
- [ ] Try login with: mohamed@example.com / (any password)
- [ ] Successful login redirects to profile
- [ ] Try invalid email
- [ ] Error message displays
- [ ] Form validation works (empty fields)

### Signup (signup.php)

- [ ] Signup page loads
- [ ] Form has username, email, password, confirm password
- [ ] Enter all fields correctly
- [ ] Account created successfully
- [ ] Success message displays
- [ ] Redirects to login after 2 seconds
- [ ] Try mismatched passwords
- [ ] Error message shows
- [ ] Try existing email
- [ ] "Email already registered" error shows
- [ ] Client-side validation works (required fields)
- [ ] Email format validation works

### Logout

- [ ] Click logout link
- [ ] Redirects to homepage or login
- [ ] Session cleared (can't access admin pages)

## 👨‍💼 Admin Dashboard Testing (admin-dashboard.php)

### Display

- [ ] Dashboard loads without errors
- [ ] Page title "Admin Dashboard"
- [ ] 5 statistic cards display:
  - [ ] Total Products (number)
  - [ ] Total Orders (number)
  - [ ] Total Users (number)
  - [ ] Total Revenue ($amount)
  - [ ] Categories (number)
- [ ] Numbers match database
- [ ] Quick action buttons visible
- [ ] Note appears if orders table missing

### Functionality

- [ ] Click "Manage Products" → goes to manage-products.php
- [ ] Click "Manage Orders" → goes to manage-orders.php
- [ ] Click "View Store" → goes to products.php
- [ ] Dark mode works
- [ ] Responsive on mobile

## ✏️ CRUD Operations Testing (manage-products.php)

### READ - View Products

- [ ] Page loads with product table
- [ ] Table shows columns: ID, Name, Brand, Category, Price, Stock, Actions
- [ ] All products from database displayed
- [ ] Products sorted by ID descending (newest first)
- [ ] Brand shows or "N/A" if empty
- [ ] Category shows or "Other" if empty
- [ ] Prices formatted correctly ($XX.XX)

### CREATE - Add New Product

- [ ] Click "Add New Product" button
- [ ] Modal opens with form
- [ ] Form fields present:
  - [ ] Product Name (required)
  - [ ] Brand (optional)
  - [ ] Description (optional)
  - [ ] Price (required)
  - [ ] Stock (required)
  - [ ] Category (dropdown)
- [ ] Fill in all fields
- [ ] Click "Save Product"
- [ ] Modal closes
- [ ] Page refreshes
- [ ] New product appears in table
- [ ] Check database - product added
- [ ] Try submitting empty required fields
- [ ] Validation prevents submission

### UPDATE - Edit Product

- [ ] Click ✏️ (edit) icon on any product
- [ ] Modal opens with "Edit Product" title
- [ ] Form pre-filled with product data
- [ ] Modify some fields (change price, stock)
- [ ] Click "Save Product"
- [ ] Modal closes
- [ ] Page refreshes
- [ ] Changes reflected in table
- [ ] Check database - product updated
- [ ] Original values preserved for unchanged fields

### DELETE - Remove Product

- [ ] Click 🗑️ (delete) icon on any product
- [ ] Confirmation dialog appears
- [ ] Dialog shows product name
- [ ] Click "OK" to confirm
- [ ] Page refreshes
- [ ] Product removed from table
- [ ] Check database - product deleted
- [ ] Click 🗑️ then "Cancel"
- [ ] Product NOT deleted

### Modal Behavior

- [ ] Click "Add New Product" → modal opens
- [ ] Click X (close) button → modal closes
- [ ] Click "Cancel" button → modal closes
- [ ] Click outside modal → modal closes
- [ ] Modal is centered on screen
- [ ] Modal is responsive on mobile

## 📱 Responsive Design Testing

### Desktop (1920x1080)

- [ ] All elements properly spaced
- [ ] Navigation horizontal
- [ ] Products in 4 columns
- [ ] Tables fit screen width
- [ ] Footer 3+ columns

### Laptop (1366x768)

- [ ] Layout adjusts properly
- [ ] Text remains readable
- [ ] Products in 4 columns
- [ ] Dashboard cards fit nicely

### Tablet Portrait (768x1024)

- [ ] Navigation still horizontal
- [ ] Products in 2 columns
- [ ] Forms single column
- [ ] Dashboard cards 2 columns
- [ ] Footer 2 columns

### Mobile (375x667 - iPhone)

- [ ] Navigation collapses to hamburger (☰)
- [ ] Click hamburger → menu slides down
- [ ] Products in 1 column
- [ ] All buttons touch-friendly
- [ ] Forms stack vertically
- [ ] Tables scroll horizontally
- [ ] Dashboard cards 1 column
- [ ] Footer 1 column
- [ ] Text sizes appropriate
- [ ] No horizontal scrolling (except tables)

### Mobile Small (320x568)

- [ ] Layout doesn't break
- [ ] All text readable
- [ ] Buttons not too small
- [ ] Forms usable

## 🎨 Dark Mode Testing

### All Pages

- [ ] Toggle dark mode on homepage
- [ ] Background changes to dark
- [ ] Text changes to light
- [ ] Cards have dark background
- [ ] Buttons maintain contrast
- [ ] Forms have dark inputs
- [ ] Tables readable in dark mode
- [ ] Navigate to products page → dark mode persists
- [ ] Navigate to admin → dark mode persists
- [ ] Refresh page → preference saved
- [ ] Toggle back to light mode → works correctly

## 🔍 Form Validation Testing

### Client-Side Validation

- [ ] Empty required field → red border
- [ ] Type in field → red border removes
- [ ] Invalid email → error notification
- [ ] Mismatched passwords → error notification
- [ ] Form with errors → doesn't submit
- [ ] Valid form → submits successfully

### Server-Side Validation

- [ ] Duplicate email signup → error message
- [ ] Duplicate username → error message
- [ ] Invalid login → error message
- [ ] SQL injection attempts → blocked (test: `' OR '1'='1`)

## 🛒 Shopping Cart Advanced Testing

### Persistence

- [ ] Add 3 items to cart
- [ ] Refresh page → items still there
- [ ] Close browser, reopen → items still there
- [ ] Clear browser data → cart empties

### Calculations

- [ ] Add item: $500
- [ ] Add item: $1000
- [ ] Add item: $200
- [ ] Total shows: $1700
- [ ] Remove one item
- [ ] Total updates correctly

### Edge Cases

- [ ] Add same item twice → appears twice
- [ ] Cart with 10+ items → scrollable
- [ ] Very long product name → doesn't break layout

## 🗄️ Database Testing

### Via phpMyAdmin

- [ ] Open phpMyAdmin
- [ ] Select `amazon-db` database
- [ ] Browse `products` table → see all products
- [ ] Browse `users` table → see password_hash column
- [ ] Browse `categories` table → see 3+ categories
- [ ] Browse `orders` table → exists (or shows note)
- [ ] Run query: `SELECT * FROM products WHERE price > 1000`
- [ ] Verify query results

### Data Integrity

- [ ] Product IDs are unique
- [ ] Category IDs link correctly
- [ ] Prices are positive numbers
- [ ] Stock is integer
- [ ] User emails are unique
- [ ] Created dates are valid

## ⚠️ Error Handling Testing

### PHP Errors

- [ ] Rename `db.php` temporarily
- [ ] Load any page
- [ ] Should show connection error (not blank page)
- [ ] Rename back to `db.php`
- [ ] Pages work again

### Database Errors

- [ ] Stop MySQL in XAMPP
- [ ] Try to load products page
- [ ] Should show error message
- [ ] Start MySQL again
- [ ] Pages work again

### 404 Testing

- [ ] Try: http://localhost/techmart/html/nonexistent.php
- [ ] Should show 404 error
- [ ] Browser back button works

## 🚀 Performance Testing

### Page Load Speed

- [ ] Homepage loads in < 2 seconds
- [ ] Products page loads in < 3 seconds
- [ ] Admin dashboard loads in < 2 seconds
- [ ] No console errors

### Smooth Animations

- [ ] Product filter animates smoothly
- [ ] Cart dropdown slides smoothly
- [ ] Modal opens/closes smoothly
- [ ] Dark mode toggle is instant
- [ ] No lag or stuttering

## 🌐 Browser Compatibility

### Chrome

- [ ] All features work
- [ ] Layout correct
- [ ] No console errors

### Firefox

- [ ] All features work
- [ ] Layout correct
- [ ] No console errors

### Safari (if available)

- [ ] All features work
- [ ] Layout correct

### Edge

- [ ] All features work
- [ ] Layout correct

## ✅ Final Checklist

- [ ] All CRUD operations work (Create, Read, Update, Delete)
- [ ] Application is responsive on all screen sizes
- [ ] Database connected and working
- [ ] Shopping cart functional
- [ ] Authentication works
- [ ] Dark mode works
- [ ] Forms validate properly
- [ ] No PHP errors displayed
- [ ] No JavaScript console errors
- [ ] Admin panel accessible
- [ ] Product filtering works
- [ ] All links functional
- [ ] Project ready for demo/submission

## 📊 Test Results Summary

**Total Tests**: ~200+
**Passed**: **\_** / **\_**
**Failed**: **\_** / **\_**
**Not Tested**: **\_** / **\_**

**Date Tested**: ******\_\_\_******
**Tested By**: ******\_\_\_******
**Browser Used**: ******\_\_\_******
**Device**: ******\_\_\_******

## 🐛 Issues Found

| Issue | Severity | Status | Notes |
| ----- | -------- | ------ | ----- |
|       |          |        |       |
|       |          |        |       |
|       |          |        |       |

**Severity Levels**: Critical / High / Medium / Low

---

**Testing Complete?** ✅ If all checked, your TechMart application is ready!
