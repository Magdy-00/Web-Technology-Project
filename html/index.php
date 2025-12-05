<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Home</title>
		<link rel="stylesheet" href="../assets/css/styles.css" />
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
					<li><a href="index.php" class="active">Home</a></li>
					<li><a href="products.php">Products</a></li>
					<?php if (isset($_SESSION['user_id'])): ?>
						<li><a href="profile.php">Profile</a></li>
						<li><a href="logout.php">Logout</a></li>
					<?php else: ?>
						<li><a href="login.php">Login</a></li>
					<?php endif; ?>
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
			<section class="hero">
				<div class="container">
					<div class="hero-content">
						<h1>Welcome to TechMart</h1>
						<p>Your one-stop shop for the latest technology products</p>
						<a href="products.php" class="btn btn-primary">Shop Now</a>
					</div>
				</div>
			</section>

			<section class="features">
				<div class="container">
					<h2>Why Choose TechMart?</h2>
					<div class="features-grid">
						<div class="feature-card">
							<div class="icon">🚚</div>
							<h3>Fast Delivery</h3>
							<p>Quick and reliable shipping to your doorstep</p>
						</div>
						<div class="feature-card">
							<div class="icon">🔒</div>
							<h3>Secure Payment</h3>
							<p>Your transactions are safe and encrypted</p>
						</div>
						<div class="feature-card">
							<div class="icon">💯</div>
							<h3>Quality Products</h3>
							<p>Only the best tech products for you</p>
						</div>
						<div class="feature-card">
							<div class="icon">🎧</div>
							<h3>24/7 Support</h3>
							<p>We're here to help you anytime</p>
						</div>
					</div>
				</div>
			</section>

			<section class="categories">
				<div class="container">
					<h2>Browse Categories</h2>
					<div class="category-grid">
						<a href="products.php?category=laptops" class="category-card">
							<div class="category-image">💻</div>
							<h3>Laptops</h3>
						</a>
						<a href="products.php?category=accessories" class="category-card">
							<div class="category-image">🎧</div>
							<h3>Accessories</h3>
						</a>
						<a href="products.php?category=security-tools" class="category-card">
							<div class="category-image">🔐</div>
							<h3>Security Tools</h3>
						</a>
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
