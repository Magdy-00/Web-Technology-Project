<?php
require_once '../config/db.php';

// Get statistics from database
$conn = getDBConnection();

// Total Products
$result = $conn->query("SELECT COUNT(*) as total FROM products");
$totalProducts = $result->fetch_assoc()['total'];

// Total Orders
$result = $conn->query("SELECT COUNT(*) as total FROM orders");
$totalOrders = $result->fetch_assoc()['total'];

// Total Users
$result = $conn->query("SELECT COUNT(*) as total FROM users WHERE is_admin = FALSE");
$totalUsers = $result->fetch_assoc()['total'];

// Total Revenue
$result = $conn->query("SELECT COALESCE(SUM(total), 0) as revenue FROM orders");
$revenue = $result->fetch_assoc()['revenue'];

closeDBConnection($conn);
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Admin Dashboard</title>
		<link rel="stylesheet" href="../assets/css/styles.css" />
	</head>
	<body>
		<header>
			<nav class="navbar">
				<div class="container">
					<div class="logo">TechMart Admin</div>
					<button class="menu-toggle" id="menuToggle">
						<span></span>
						<span></span>
						<span></span>
					</button>
					<ul class="nav-links" id="navLinks">
						<li><a href="admin-dashboard.php" class="active">Dashboard</a></li>
						<li><a href="manage-products.php">Manage Products</a></li>
						<li><a href="manage-orders.php">Manage Orders</a></li>
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
					</div>
				</div>
			</nav>
		</header>

		<main>
			<section class="dashboard">
				<div class="container">
					<h1>Admin Dashboard</h1>
					<div class="dashboard-grid">
						<div class="dashboard-card">
							<div class="card-icon">📦</div>
							<h3>Total Products</h3>
							<p class="stat-number"><?php echo $totalProducts; ?></p>
						</div>
						<div class="dashboard-card">
							<div class="card-icon">📋</div>
							<h3>Total Orders</h3>
							<p class="stat-number"><?php echo $totalOrders; ?></p>
						</div>
						<div class="dashboard-card">
							<div class="card-icon">👥</div>
							<h3>Total Users</h3>
							<p class="stat-number"><?php echo $totalUsers; ?></p>
						</div>
						<div class="dashboard-card">
							<div class="card-icon">💰</div>
							<h3>Revenue</h3>
							<p class="stat-number">$<?php echo number_format($revenue, 2); ?></p>
						</div>
					</div>

					<div class="admin-actions">
						<h2>Quick Actions</h2>
						<div class="action-buttons">
							<a href="manage-products.php" class="btn btn-primary"
								>Manage Products</a
							>
							<a href="manage-orders.php" class="btn btn-secondary"
								>Manage Orders</a
							>
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
