<?php
session_start();
require_once '../config/db.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php?redirect=order-history.php");
    exit();
}

// Fetch user's orders
$conn = getDBConnection();
$user_id = $_SESSION['user_id'];

$result = $conn->query("SELECT o.order_id, o.order_date, o.total_amount, o.status, o.shipping_address 
                        FROM orders o 
                        WHERE o.customer_id = $user_id 
                        ORDER BY o.order_date DESC");
$orders = $result->fetch_all(MYSQLI_ASSOC);

closeDBConnection($conn);
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Order History</title>
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
					<li><a href="index.php">Home</a></li>
					<li><a href="products.php">Products</a></li>
					<li><a href="profile.php">Profile</a></li>
					<li><a href="logout.php">Logout</a></li>
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
			<section class="profile-section">
				<div class="container">
					<h1>Order History</h1>
					<?php if (isset($_GET['success'])): ?>
					<div class="alert alert-success">Order placed successfully!</div>
					<?php endif; ?>
					<div class="orders-list">
						<?php if (empty($orders)): ?>
						<p style="text-align: center; padding: 2rem; color: #666;">No orders found. <a href="products.php">Start shopping!</a></p>
						<?php else: ?>
						<?php foreach ($orders as $order): 
							// Get order items
							$conn = getDBConnection();
							$items_result = $conn->query("SELECT oi.quantity, oi.price, p.name 
														 FROM order_items oi 
														 LEFT JOIN products p ON oi.product_id = p.product_id 
														 WHERE oi.order_id = " . $order['order_id']);
							$items = $items_result->fetch_all(MYSQLI_ASSOC);
							closeDBConnection($conn);
							
							$status_class = 'status-' . strtolower($order['status']);
						?>
						<div class="order-card">
							<div class="order-header">
								<div>
									<h3>Order #<?php echo $order['order_id']; ?></h3>
									<p class="order-date"><?php echo date('F d, Y', strtotime($order['order_date'])); ?></p>
								</div>
								<span class="status-badge <?php echo $status_class; ?>"><?php echo htmlspecialchars($order['status']); ?></span>
							</div>
							<div class="order-items">
								<?php foreach ($items as $item): ?>
								<p><?php echo htmlspecialchars($item['name']); ?> (x<?php echo $item['quantity']; ?>) - $<?php echo number_format($item['price'], 2); ?></p>
								<?php endforeach; ?>
							</div>
							<div class="order-footer">
								<p class="order-total">Total: $<?php echo number_format($order['total_amount'], 2); ?></p>
								<p style="font-size: 0.9em; color: #666;">Shipping to: <?php echo htmlspecialchars($order['shipping_address']); ?></p>
							</div>
						</div>
						<?php endforeach; ?>
						<?php endif; ?>
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
