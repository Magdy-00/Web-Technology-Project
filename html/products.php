<?php
session_start();
require_once '../config/db.php';

// Get category filter from URL
$category_filter = isset($_GET['category']) ? sanitize($_GET['category']) : 'all';

// Fetch products from database
$conn = getDBConnection();

// Simplified query to work with basic schema
$sql = "SELECT p.*, 
        (SELECT c.name FROM categories c WHERE c.category_id = p.category_id) as category_name 
        FROM products p 
        ORDER BY p.name";
$result = $conn->query($sql);

// Function to get icon based on category or product name
function getCategoryIcon($category, $productName = '') {
    $category = strtolower($category ?? '');
    $productName = strtolower($productName);
    
    if (strpos($category, 'electronic') !== false || strpos($productName, 'laptop') !== false) {
        return '💻';
    } elseif (strpos($category, 'fashion') !== false || strpos($productName, 'headphone') !== false) {
        return '🎧';
    } elseif (strpos($category, 'home') !== false || strpos($productName, 'smartphone') !== false || strpos($productName, 'phone') !== false) {
        return '📱';
    } else {
        return '📦';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Products</title>
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
						<li><a href="products.php" class="active">Products</a></li>
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
			<section class="page-header">
				<div class="container">
					<h1>Our Products</h1>
					<p>Discover our wide range of technology products</p>
				</div>
			</section>

			<section class="products">
				<div class="container">
					<div class="filters">
						<h3>Categories</h3>
						<div class="filter-buttons">
							<button class="filter-btn active" data-category="all">All</button>
							<button class="filter-btn" data-category="Electronics">
								Electronics
							</button>
							<button class="filter-btn" data-category="Fashion">
								Fashion
							</button>
							<button class="filter-btn" data-category="Home Appliances">
								Home Appliances
							</button>
						</div>
					</div>

					<div class="products-grid">
						<?php
						if ($result && $result->num_rows > 0) {
							while($row = $result->fetch_assoc()) {
								$icon = getCategoryIcon($row['category_name'], $row['name']);
								$price = number_format($row['price'], 0);
								$description = !empty($row['description']) ? $row['description'] : 'Quality product available now';
								?>
								<div class="product-card" data-category="<?php echo htmlspecialchars($row['category_name'] ?? 'Other'); ?>">
									<div class="product-image"><?php echo $icon; ?></div>
									<h3><?php echo htmlspecialchars($row['name']); ?></h3>
									<p class="brand"><?php echo htmlspecialchars($row['brand'] ?? ''); ?></p>
									<p class="price">$<?php echo $price; ?></p>
									<p class="description"><?php echo htmlspecialchars($description); ?></p>
									<p class="stock">In Stock: <?php echo $row['stock']; ?></p>
									<button
										class="btn btn-primary add-to-cart-btn"
										data-name="<?php echo htmlspecialchars($row['name']); ?>"
										data-price="<?php echo $row['price']; ?>"
										data-icon="<?php echo $icon; ?>"
										data-id="<?php echo $row['product_id']; ?>"
									>
										Add to Cart
									</button>
								</div>
								<?php
							}
						} else {
							echo '<p class="no-products">No products found.</p>';
						}
						
						closeDBConnection($conn);
						?>
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
