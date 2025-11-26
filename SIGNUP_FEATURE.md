# TechMart Signup & Authentication System

## Overview

Complete user authentication system with signup, login, logout, and profile management.

## New Features Added

### 1. **Signup Page** (`signup.php`)

- Full user registration with validation
- Password confirmation
- Email uniqueness check
- Username uniqueness check
- Profile creation (full name, phone, address)
- Password hashing with PHP's `password_hash()`
- Auto-redirect to login after successful signup

**Form Fields:**

- Username \* (required, must be unique)
- Email \* (required, must be unique)
- Full Name (optional)
- Phone Number (optional)
- Address (optional)
- Password \* (required, min 6 characters)
- Confirm Password \* (required, must match)

**Validation:**

- ✅ Passwords must match
- ✅ Password minimum 6 characters
- ✅ Email must be unique in database
- ✅ Username must be unique in database
- ✅ SQL injection prevention with prepared statements

### 2. **Login System** (`login.php`)

- Email and password authentication
- Password verification with `password_verify()`
- Session-based authentication
- Role-based redirect (admin → dashboard, user → profile)
- Error messages for invalid credentials

**Login Flow:**

1. User enters email and password
2. System verifies credentials against database
3. On success:
   - Session variables set: `user_id`, `username`, `email`, `is_admin`
   - Admin users → `admin-dashboard.php`
   - Regular users → `profile.php`
4. On failure: Error message displayed

### 3. **Logout System** (`logout.php`)

- Destroys all session data
- Redirects to home page
- Linked from all authenticated pages

### 4. **Profile Page** (`profile.php`)

- Displays logged-in user's information
- Editable profile fields (full name, phone, address)
- Email displayed but cannot be changed
- Updates profile in database
- Session-protected (redirects to login if not authenticated)
- Success/error messages for updates

### 5. **Navigation Updates**

- "Sign Up" link added to all main pages
- "Logout" link added to authenticated pages
- Consistent navigation across site

## Database Schema

### Users Table

```sql
user_id INT (Primary Key, Auto Increment)
username VARCHAR(50)
email VARCHAR(100)
password_hash VARCHAR(255) - Hashed with password_hash()
is_admin BOOLEAN - Default FALSE
```

### Profiles Table

```sql
profile_id INT (Primary Key, Auto Increment)
user_id INT (Foreign Key → users.user_id)
full_name VARCHAR(100)
address VARCHAR(255)
phone VARCHAR(20)
```

## Security Features

✅ **Password Hashing**: Using PHP's `password_hash()` with bcrypt
✅ **SQL Injection Prevention**: All queries use prepared statements
✅ **XSS Prevention**: Using `htmlspecialchars()` on output
✅ **Session Management**: Secure session handling
✅ **Input Sanitization**: Custom `sanitize()` function for user input
✅ **CSRF Protection**: (Recommended for production - not implemented in demo)

## How to Use

### Sign Up New User

1. Navigate to `http://localhost/project/html/signup.php`
2. Fill in the registration form
3. Click "Create Account"
4. You'll be redirected to login page

### Login

1. Navigate to `http://localhost/project/html/login.php`
2. Enter your email and password
3. Click "Login"
4. Regular users: Redirected to profile
5. Admin users: Redirected to dashboard

**Admin Credentials:**

- Email: `admin@techmart.com`
- Password: `hashed_pass` (Note: You should update this in the database)

### Update Profile

1. After logging in as a regular user
2. You'll be on the profile page
3. Edit your full name, phone, or address
4. Click "Update Profile"
5. Changes saved to database

### Logout

1. Click "Logout" in navigation
2. Session destroyed
3. Redirected to home page

## Testing the System

### Test User Registration:

```
Username: testuser
Email: test@example.com
Password: test123
Confirm Password: test123
```

### Test Login:

1. Use the credentials you just created
2. Should redirect to profile page
3. Profile should show your username and email

### Test Admin Login:

1. Email: admin@techmart.com
2. Password: (set in database)
3. Should redirect to admin dashboard

## Files Modified/Created

### New Files:

- `html/signup.php` - Registration page with validation
- `html/logout.php` - Session destruction and logout

### Modified Files:

- `html/login.php` - Added authentication logic
- `html/profile.php` - Added database integration
- `html/index.php` - Added "Sign Up" link
- `html/products.php` - Added "Sign Up" link
- `html/checkout.php` - Added "Sign Up" link
- `html/admin-dashboard.php` - Updated logout link
- `html/manage-products.php` - Updated logout link
- `html/manage-orders.php` - Updated logout link

## Session Variables

After successful login, these session variables are set:

```php
$_SESSION['user_id']    // Integer - User's ID
$_SESSION['username']   // String - Username
$_SESSION['email']      // String - Email address
$_SESSION['is_admin']   // Boolean - Admin status
```

## Error Messages

### Signup Errors:

- "Passwords do not match!"
- "Password must be at least 6 characters long!"
- "Email already registered!"
- "Username already taken!"
- "Registration failed. Please try again."

### Login Errors:

- "Invalid email or password!"

## Production Recommendations

⚠️ **Before deploying to production:**

1. **Update Admin Password:**

   ```sql
   UPDATE users
   SET password_hash = '$2y$10$...'
   WHERE email = 'admin@techmart.com';
   ```

   Generate with: `password_hash('your_secure_password', PASSWORD_DEFAULT)`

2. **Add CSRF Protection:**

   - Generate tokens for forms
   - Validate tokens on submission

3. **Implement Rate Limiting:**

   - Prevent brute force attacks
   - Limit login attempts

4. **Add Email Verification:**

   - Send verification email on signup
   - Verify email before allowing login

5. **Use HTTPS:**

   - Encrypt all data in transit
   - Secure session cookies

6. **Add Password Reset:**

   - Forgot password functionality
   - Email-based password reset

7. **Implement Remember Me:**

   - Secure token-based remember me
   - Store in database with expiration

8. **Add Account Lockout:**
   - Lock account after X failed attempts
   - Time-based or admin unlock

## Navigation Structure

```
Public Pages:
├── Home (index.php)
├── Products (products.php)
├── Login (login.php)
├── Sign Up (signup.php)
└── Checkout (checkout.php)

Authenticated User Pages:
├── Profile (profile.php)
├── Order History (order-history.php)
└── Wishlist (wishlist.php)

Admin Pages:
├── Dashboard (admin-dashboard.php)
├── Manage Products (manage-products.php)
└── Manage Orders (manage-orders.php)

Utility:
└── Logout (logout.php)
```

## Next Steps

1. Test signup with multiple users
2. Test login with different accounts
3. Verify admin login redirects correctly
4. Test profile updates
5. Ensure logout works properly
6. Add email verification (optional)
7. Add password reset (optional)
8. Implement "Remember Me" (optional)

## Troubleshooting

### "Cannot modify header information" error

- Make sure there's no output before `session_start()`
- Check for BOM in PHP files

### Users can't login

- Verify password is hashed in database
- Check database connection
- Ensure session is started

### Signup fails

- Check MySQL error messages
- Verify database tables exist
- Check field lengths match database

### Session not persisting

- Check PHP session configuration
- Verify session.save_path is writable
- Check session cookie settings
