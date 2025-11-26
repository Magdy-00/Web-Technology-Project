<?php
require_once '../config/db.php';

// Get category filter from URL
$category_filter = isset($_GET['category']) ? sanitize($_GET['category']) : 'all';

// Fetch products from database
$conn = getDBConnection();

if ($category_filter === 'all') {
    $sql = "SELECT p.*, c.name as category_name FROM products p 
            JOIN categories c ON p.category_id = c.category_id 
            ORDER BY p.name";
    $result = $conn->query($sql);
} else {
    $sql = "SELECT p.*, c.name as category_name FROM products p 
            JOIN categories c ON p.category_id = c.category_id 
            WHERE c.name = ? 
            ORDER BY p.name";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $category_filter);
    $stmt->execute();
    $result = $stmt->get_result();
}

// Function to get icon based on category
function getCategoryIcon($category) {
    switch($category) {
        case 'laptops':
            return '💻';
        case 'accessories':
            return '🎧';
        case 'security-tools':
            return '🔐';
        default:
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
						<li><a href="login.php">Login</a></li>
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
							<button class="filter-btn <?php echo $category_filter === 'all' ? 'active' : ''; ?>" data-category="all">All</button>
							<button class="filter-btn <?php echo $category_filter === 'laptops' ? 'active' : ''; ?>" data-category="laptops">
								Laptops
							</button>
							<button class="filter-btn <?php echo $category_filter === 'accessories' ? 'active' : ''; ?>" data-category="accessories">
								Accessories
							</button>
							<button class="filter-btn <?php echo $category_filter === 'security-tools' ? 'active' : ''; ?>" data-category="security-tools">
								Security Tools
							</button>
						</div>
					</div>

					<div class="products-grid">
						<?php
						if ($result && $result->num_rows > 0) {
							while($row = $result->fetch_assoc()) {
								$icon = getCategoryIcon($row['category_name']);
								$price = number_format($row['price'], 0);
								?>
								<div class="product-card" data-category="<?php echo htmlspecialchars($row['category_name']); ?>">
									<div class="product-image"><?php echo $icon; ?></div>
									<h3><?php echo htmlspecialchars($row['name']); ?></h3>
									<p class="price">$<?php echo $price; ?></p>
									<p class="description"><?php echo htmlspecialchars($row['description']); ?></p>
									<button
										class="btn btn-primary add-to-cart-btn"
										data-name="<?php echo htmlspecialchars($row['name']); ?>"
										data-price="<?php echo $row['price']; ?>"
										data-icon="<?php echo $icon; ?>"
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
