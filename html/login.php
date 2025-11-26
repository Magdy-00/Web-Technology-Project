<?php
session_start();
require_once '../config/db.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = getDBConnection();
    
    $email = sanitize($_POST['email']);
    $password = $_POST['password'];
    
    // Fetch user by email
    $stmt = $conn->prepare("SELECT user_id, username, email, password_hash, is_admin FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();
        
        // Verify password
        if (password_verify($password, $user['password_hash'])) {
            // Set session variables
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['email'] = $user['email'];
            $_SESSION['is_admin'] = $user['is_admin'];
            
            // Redirect based on role
            if ($user['is_admin']) {
                header("Location: admin-dashboard.php");
            } else {
                header("Location: profile.php");
            }
            exit();
        } else {
            $error = "Invalid email or password!";
        }
    } else {
        $error = "Invalid email or password!";
    }
    
    $stmt->close();
    closeDBConnection($conn);
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Login</title>
		<link rel="stylesheet" href="../assets/css/styles.css" />
		<style>
			.alert {
				padding: 12px 20px;
				margin-bottom: 20px;
				border-radius: 4px;
				font-weight: 500;
			}
			.alert-error {
				background-color: #fee;
				color: #c33;
				border: 1px solid #fcc;
			}
			body.dark-mode .alert-error {
				background-color: #4a1515;
				color: #ff6b6b;
				border-color: #6b2020;
			}
		</style>
	</head>
	<body>
		<header>
			<nav class="navbar">
				<div class="container">
					<div class="logo">TechMart</div>
					<button class="menu-toggle" id="menuToggle">
						<span></span>
						<span></span>
						<span></span>
					</button>
					<ul class="nav-links" id="navLinks">
						<li><a href="index.php">Home</a></li>
						<li><a href="products.php">Products</a></li>
						<li><a href="login.php" class="active">Login</a></li>
						<li><a href="signup.php">Sign Up</a></li>
						<li><a href="checkout.php">Checkout</a></li>
					</ul>
					<div class="nav-icons">
						<button
							class="icon-btn"
							id="darkModeToggle"
							title="Toggle Dark Mode"
						>
							<span class="icon">🌙</span>
						</button>
						<button
							class="icon-btn cart-btn"
							id="cartBtn"
							title="Shopping Cart"
						>
							<span class="icon">🛒</span>
							<span class="cart-count" id="cartCount">0</span>
						</button>
					</div>
				</div>
			</nav>
			<div class="cart-dropdown" id="cartDropdown">
				<div class="cart-header">
					<h3>Shopping Cart</h3>
					<button class="close-cart" id="closeCart">✕</button>
				</div>
				<div class="cart-items-container" id="cartItemsContainer">
					<p class="empty-cart">Your cart is empty</p>
				</div>
				<div class="cart-footer">
					<div class="cart-total">
						<span>Total:</span>
						<span id="cartTotal">$0</span>
					</div>
					<a href="checkout.php" class="btn btn-primary btn-full">Checkout</a>
				</div>
			</div>
		</header>

		<main>
			<section class="login-section">
				<div class="container">
					<div class="login-container">
						<div class="login-box">
							<h2>Login to Your Account</h2>
							
							<?php if ($error): ?>
								<div class="alert alert-error"><?php echo $error; ?></div>
							<?php endif; ?>
							
							<form method="POST" class="login-form">
								<div class="form-group">
									<label for="email">Email</label>
									<input
										type="email"
										id="email"
										name="email"
										required
										placeholder="Enter your email"
									/>
								</div>
								<div class="form-group">
									<label for="password">Password</label>
									<input
										type="password"
										id="password"
										name="password"
										required
										placeholder="Enter your password"
									/>
								</div>
								<div class="form-options">
									<label class="checkbox-label">
										<input type="checkbox" name="remember" />
										<span>Remember me</span>
									</label>
									<a href="#" class="forgot-password">Forgot Password?</a>
								</div>
								<button type="submit" class="btn btn-primary btn-full">
									Login
								</button>
							</form>
							<div class="login-footer">
								<p>
									Don't have an account? <a href="signup.php">Sign up</a>
								</p>
							</div>
							<div class="admin-note">
								<p><strong>Admin Login:</strong> admin@techmart.com</p>
								<p class="small-text">
									Regular users will be redirected to profile, admins to dashboard
								</p>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>

		<footer>
			<div class="container">
				<div class="footer-content">
					<div class="footer-section">
						<h4>TechMart</h4>
						<p>Your trusted technology partner</p>
					</div>
					<div class="footer-section">
						<h4>Quick Links</h4>
						<ul>
							<li><a href="index.php">Home</a></li>
							<li><a href="products.php">Products</a></li>
							<li><a href="login.php">Login</a></li>
						</ul>
					</div>
					<div class="footer-section">
						<h4>Contact</h4>
						<p>Email: info@techmart.com</p>
						<p>Phone: +1 234 567 890</p>
					</div>
				</div>
				<div class="footer-bottom">
					<p>&copy; 2025 TechMart. All rights reserved.</p>
				</div>
			</div>
		</footer>

		<script src="../assets/js/script.js"></script>
	</body>
</html>
