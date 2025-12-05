<?php
session_start();
require_once '../config/db.php';

// Check if user is admin (optional - can be uncommented when authentication is set up)
// if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
//     header("Location: login.php");
//     exit();
// }

// Get statistics from database
$conn = getDBConnection();

// Total Products
$result = $conn->query("SELECT COUNT(*) as total FROM products");
$totalProducts = $result->fetch_assoc()['total'];

// Check if orders table exists
$tablesResult = $conn->query("SHOW TABLES LIKE 'orders'");
$ordersTableExists = $tablesResult->num_rows > 0;

if ($ordersTableExists) {
    // Total Orders
    $result = $conn->query("SELECT COUNT(*) as total FROM orders");
    $totalOrders = $result->fetch_assoc()['total'];
    
    // Total Revenue
    $result = $conn->query("SELECT COALESCE(SUM(total_amount), 0) as revenue FROM orders");
    $revenue = $result->fetch_assoc()['revenue'];
} else {
    $totalOrders = 0;
    $revenue = 0;
}

// Total Users
$result = $conn->query("SELECT COUNT(*) as total FROM users");
$totalUsers = $result->fetch_assoc()['total'];

// Total Categories
$result = $conn->query("SELECT COUNT(*) as total FROM categories");
$totalCategories = $result->fetch_assoc()['total'];

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
					<p style="margin-bottom: 2rem; color: var(--text-secondary);">Welcome to TechMart Admin Panel</p>
					<div class="dashboard-grid">
						<div class="dashboard-card">
							<div class="card-icon">📦</div>
							<h3><?php echo $totalProducts; ?></h3>
							<p class="stat-label">Total Products</p>
						</div>
						<div class="dashboard-card">
							<div class="card-icon">📋</div>
							<h3><?php echo $totalOrders; ?></h3>
							<p class="stat-label">Total Orders</p>
						</div>
						<div class="dashboard-card">
							<div class="card-icon">👥</div>
							<h3><?php echo $totalUsers; ?></h3>
							<p class="stat-label">Total Users</p>
						</div>
						<div class="dashboard-card">
							<div class="card-icon">💰</div>
							<h3>$<?php echo number_format($revenue, 2); ?></h3>
							<p class="stat-label">Total Revenue</p>
						</div>
						<div class="dashboard-card">
							<div class="card-icon">📂</div>
							<h3><?php echo $totalCategories; ?></h3>
							<p class="stat-label">Categories</p>
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
							<a href="products.php" class="btn btn-secondary"
								>View Store</a
							>
						</div>
						
						<?php if (!$ordersTableExists): ?>
						<div class="admin-note" style="margin-top: 2rem; padding: 1rem; background: #fef3c7; border-left: 4px solid #f59e0b; border-radius: 4px;">
							<strong>Note:</strong> Orders table not found. Please run the <code>init_techmart.sql</code> script to add missing tables.
						</div>
						<?php endif; ?>
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
