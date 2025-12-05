# TechMart - File Structure & Key Files

## 📁 Complete File Structure

```
c:\Users\Magdy\Desktop\Fourth Year\Web Technology\project\
│
├── 📄 README.md                          # Original project readme
├── 📄 SETUP_GUIDE.md                     # ✨ NEW - Comprehensive setup guide
├── 📄 QUICKSTART.md                      # ✨ NEW - Quick reference guide
├── 📄 CHANGES_SUMMARY.md                 # ✨ NEW - All changes documented
├── 📄 ADMIN_FEATURES.md                  # Existing documentation
├── 📄 MIGRATION_COMPLETE.md              # Existing documentation
├── 📄 SIGNUP_FEATURE.md                  # Existing documentation
│
├── 📂 assets/
│   ├── 📂 css/
│   │   └── 📄 styles.css                 # 🔄 UPDATED - Fully responsive design
│   │
│   ├── 📂 js/
│   │   └── 📄 script.js                  # 🔄 UPDATED - Enhanced validation
│   │
│   ├── 📂 images/                        # Product and UI images
│   │
│   ├── 📂 other/
│   │   └── 📄 SiteMap 9.eddx            # Site map file
│   │
│   └── 📂 sql/
│       ├── 📄 amazon-db.sql              # Main database structure
│       ├── 📄 init_techmart.sql          # ✨ NEW - Additional setup script
│       ├── 📄 sample_orders.sql          # Existing sample data
│       └── 📄 techmart.sql               # Existing backup
│
├── 📂 config/
│   └── 📄 db.php                         # 🔄 UPDATED - Database config (amazon-db)
│
└── 📂 html/
    ├── 📄 index.php                      # Homepage
    ├── 📄 products.php                   # 🔄 UPDATED - Product listing
    ├── 📄 login.php                      # 🔄 UPDATED - User login
    ├── 📄 signup.php                     # 🔄 UPDATED - User registration
    ├── 📄 checkout.php                   # Checkout page
    ├── 📄 profile.php                    # User profile
    ├── 📄 wishlist.php                   # User wishlist
    ├── 📄 order-history.php              # Order history
    ├── 📄 logout.php                     # Logout handler
    ├── 📄 admin-dashboard.php            # 🔄 UPDATED - Admin overview
    ├── 📄 manage-products.php            # 🔄 UPDATED - Full CRUD operations
    └── 📄 manage-orders.php              # Order management

Legend:
✨ NEW      - Newly created file
🔄 UPDATED  - Modified/enhanced file
📄          - Regular file
📂          - Directory
```

## 🎯 Key Files to Know

### 🔥 Most Important Files

#### 1. `config/db.php`

**Purpose**: Database connection configuration
**Change**: Database name changed to 'amazon-db'

```php
define('DB_NAME', 'amazon-db');  // Changed from 'techmart'
```

#### 2. `assets/sql/init_techmart.sql` ✨ NEW

**Purpose**: Database initialization
**Contains**:

- Adds password_hash and is_admin columns to users
- Adds description and category_id to products
- Creates orders and order_items tables
- Inserts admin user (admin@techmart.com)

#### 3. `html/manage-products.php` 🔄 MAJOR UPDATE

**Purpose**: Complete CRUD for products
**Features**:

- ✅ Create new products
- ✅ Read/display all products
- ✅ Update existing products
- ✅ Delete products
- Modal-based editing
- Brand and stock management

#### 4. `assets/css/styles.css` 🔄 MAJOR UPDATE

**Purpose**: Styling and responsive design
**Additions**:

- 5 responsive breakpoints
- Mobile navigation menu
- Touch-friendly elements
- Dark mode enhancements
- Dashboard styling
- Form improvements

#### 5. `assets/js/script.js` 🔄 UPDATED

**Purpose**: Client-side functionality
**Features**:

- Shopping cart management
- Form validation
- Dark mode toggle
- Product filtering
- Real-time notifications

## 📊 Database Tables Used

### Main Tables (from amazon-db.sql)

```
products         - Product information (id, name, brand, price, stock)
categories       - Product categories (id, name, description)
users           - User accounts (id, username, email, created_at)
```

### Added by init_techmart.sql ✨

```
orders          - Customer orders (id, user_id, total_amount, status)
order_items     - Order line items (id, order_id, product_id, quantity)

Modified:
users           - Added: password_hash, is_admin
products        - Added: description, category_id, image_url
```

## 🚀 Quick Access URLs

### Public Pages

- Homepage: `/html/index.php`
- Products: `/html/products.php`
- Login: `/html/login.php`
- Signup: `/html/signup.php`
- Checkout: `/html/checkout.php`

### Admin Pages

- Dashboard: `/html/admin-dashboard.php`
- Manage Products: `/html/manage-products.php` ⭐ CRUD HERE
- Manage Orders: `/html/manage-orders.php`

### User Pages

- Profile: `/html/profile.php`
- Orders: `/html/order-history.php`
- Wishlist: `/html/wishlist.php`

## 🔍 Where to Find Specific Features

### CRUD Operations

📍 **File**: `html/manage-products.php`

- Lines 1-80: PHP CRUD logic
- Lines 200-280: HTML table display
- Lines 280-320: Modal form
- Lines 330-390: JavaScript handlers

### Responsive Design

📍 **File**: `assets/css/styles.css`

- Lines 1-100: Base styles & variables
- Lines 1000-1407: Media queries
- Breakpoints: 1200px, 968px, 768px, 480px, 360px

### Form Validation

📍 **File**: `assets/js/script.js`

- Lines 180-245: Form validation logic
- Lines 150-170: Password confirmation
- Lines 170-180: Email validation

### Shopping Cart

📍 **File**: `assets/js/script.js`

- Lines 45-150: Cart management
- Lines 50-95: Update cart function
- Lines 120-140: Add to cart

### Authentication

📍 **File**: `html/login.php`

- Lines 1-55: Login logic
- Lines 60-220: Login form HTML

📍 **File**: `html/signup.php`

- Lines 1-65: Registration logic
- Lines 70-230: Signup form HTML

## 📦 What Each Component Does

### Frontend Components

**Navigation Bar**

- Location: Included in all HTML files
- Features: Logo, menu, dark mode, cart icon
- Responsive: Collapses to hamburger menu on mobile

**Shopping Cart Dropdown**

- Location: Included in all HTML files
- Features: View items, remove items, see total
- Persistent: Saved in localStorage

**Product Cards**

- Location: `html/products.php`
- Features: Image, name, brand, price, stock, add to cart
- Responsive: 4 → 2 → 1 column layout

**Admin Dashboard**

- Location: `html/admin-dashboard.php`
- Features: Statistics cards, quick actions
- Displays: Products, orders, users, revenue counts

**Product Management Table**

- Location: `html/manage-products.php`
- Features: List all products, edit, delete buttons
- Modal: Pop-up form for add/edit

### Backend Components

**Database Connection**

- Location: `config/db.php`
- Functions: getDBConnection(), sanitize(), closeDBConnection()

**CRUD Operations**

- Location: `html/manage-products.php`
- Methods: POST with action parameter (add/edit/delete)
- Security: Prepared statements, input sanitization

**Session Management**

- Location: All protected pages
- Variables: user_id, username, email, is_admin

## 🎨 Styling Classes Reference

### Common Classes

```css
.container
	-
	Main
	content
	wrapper
	(max-width, centered)
	.btn
	-
	Basic
	button
	styling
	.btn-primary
	-
	Primary
	action
	button
	(blue)
	.btn-secondary
	-
	Secondary
	action
	button
	(gray)
	.btn-full
	-
	Full-width
	button
	.form-group
	-
	Form
	field
	wrapper
	.alert
	-
	Notification
	message
	.modal
	-
	Modal
	dialog
	overlay;
```

### Layout Classes

```css
.navbar
	-
	Top
	navigation
	bar
	.hero
	-
	Homepage
	hero
	section
	.features-grid
	-
	4-column
	feature
	grid
	.products-grid
	-
	Product
	listing
	grid
	.dashboard-grid
	-
	Admin
	dashboard
	cards
	.table-container
	-
	Responsive
	table
	wrapper;
```

### Component Classes

```css
.product-card
	-
	Individual
	product
	display
	.dashboard-card
	-
	Admin
	statistic
	card
	.cart-dropdown
	-
	Shopping
	cart
	overlay
	.login-box
	-
	Login/signup
	form
	container
	.data-table
	-
	Admin
	data
	table;
```

## 💡 Tips for Navigation

### To Add a Product:

1. Open `/html/manage-products.php`
2. Click "Add New Product"
3. Fill form, submit

### To Edit Database:

1. Open phpMyAdmin
2. Select `amazon-db` database
3. Browse/edit tables

### To Change Styles:

1. Edit `/assets/css/styles.css`
2. Find relevant section
3. Modify and save

### To Add JavaScript:

1. Edit `/assets/js/script.js`
2. Add your code
3. Test in browser console

## 🔐 Admin Access

**Login Credentials**

- Email: admin@techmart.com
- Password: admin123

**Admin Pages**

- Dashboard: Statistics overview
- Manage Products: Full CRUD
- Manage Orders: Order list

## 📱 Testing on Different Devices

**Desktop** (1200px+)

- Full navigation visible
- 4-column product grid
- Expanded tables

**Tablet** (768-1199px)

- Full navigation visible
- 2-column product grid
- Scrollable tables

**Mobile** (< 768px)

- Hamburger menu
- 1-column product grid
- Horizontal scroll tables

---

**Need help?** See SETUP_GUIDE.md for detailed instructions!
