<?php
session_start();
require_once '../config/db.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php?redirect=checkout.php&message=Please login to checkout");
    exit();
}

// Handle order placement
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['place_order'])) {
    $conn = getDBConnection();
    
    try {
        // Start transaction
        $conn->begin_transaction();
        
        $user_id = $_SESSION['user_id'];
        $fullname = sanitize($_POST['fullname']);
        $email = sanitize($_POST['email']);
        $phone = sanitize($_POST['phone']);
        $address = sanitize($_POST['address']);
        $city = sanitize($_POST['city']);
        $state = sanitize($_POST['state']);
        $zip = sanitize($_POST['zip']);
        
        $shipping_address = $address . ', ' . $city . ', ' . $state . ' ' . $zip;
        $cart_items = json_decode($_POST['cart_items'], true);
        
        if (empty($cart_items)) {
            throw new Exception('Cart is empty');
        }
        
        // Calculate total
        $total_amount = 0;
        foreach ($cart_items as $item) {
            $total_amount += $item['price'] * $item['quantity'];
        }
        
        // Create order
        $stmt = $conn->prepare("INSERT INTO orders (customer_id, order_date, total_amount, currency, status, shipping_address, notes) VALUES (?, NOW(), ?, 'USD', 'Processing', ?, ?)");
        $notes = 'Customer: ' . $fullname . ', Phone: ' . $phone . ', Email: ' . $email;
        $stmt->bind_param("idss", $user_id, $total_amount, $shipping_address, $notes);
        $stmt->execute();
        $order_id = $conn->insert_id;
        $stmt->close();
        
        // Insert order items and reduce stock
        $stmt_item = $conn->prepare("INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)");
        $stmt_stock = $conn->prepare("UPDATE products SET stock = stock - ? WHERE product_id = ? AND stock >= ?");
        
        foreach ($cart_items as $item) {
            $product_id = intval($item['id']);
            $quantity = intval($item['quantity']);
            $price = floatval($item['price']);
            
            // Insert order item
            $stmt_item->bind_param("iiid", $order_id, $product_id, $quantity, $price);
            $stmt_item->execute();
            
            // Reduce stock
            $stmt_stock->bind_param("iii", $quantity, $product_id, $quantity);
            $stmt_stock->execute();
            
            if ($stmt_stock->affected_rows === 0) {
                throw new Exception('Insufficient stock for product ID: ' . $product_id);
            }
        }
        
        $stmt_item->close();
        $stmt_stock->close();
        
        // Commit transaction
        $conn->commit();
        closeDBConnection($conn);
        
        // Clear cart and redirect
        echo "<script>localStorage.removeItem('cart'); window.location.href='order-history.php?success=1';</script>";
        exit();
        
    } catch (Exception $e) {
        $conn->rollback();
        closeDBConnection($conn);
        $error_message = $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Checkout</title>
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
					<li><a href="checkout.php" class="active">Checkout</a></li>
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
			<section class="checkout-section">
				<div class="container">
					<h1>Checkout</h1>
					<?php if (isset($error_message)): ?>
					<div class="alert alert-error"><?php echo htmlspecialchars($error_message); ?></div>
					<?php endif; ?>
					<div class="checkout-container">
						<div class="checkout-form">
							<h2>Shipping Information</h2>
							<form id="checkoutForm" method="POST">
								<div class="form-group">
									<label for="fullname">Full Name</label>
									<input type="text" id="fullname" name="fullname" required />
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<input type="email" id="email" name="email" required />
								</div>
								<div class="form-group">
									<label for="phone">Phone</label>
									<input type="tel" id="phone" name="phone" required />
								</div>
								<div class="form-group">
									<label for="address">Shipping Address</label>
									<textarea
										id="address"
										name="address"
										rows="3"
										required
									></textarea>
								</div>
								<div class="form-group">
									<label for="city">City</label>
									<input type="text" id="city" name="city" required />
								</div>
								<div class="form-row">
									<div class="form-group">
										<label for="state">State</label>
										<input type="text" id="state" name="state" required />
									</div>
									<div class="form-group">
										<label for="zip">ZIP Code</label>
										<input type="text" id="zip" name="zip" required />
									</div>
								</div>
								<h3>Payment Method</h3>
								<div class="payment-methods">
									<label class="radio-label">
										<input type="radio" name="payment" value="card" checked />
										<span>Credit/Debit Card</span>
									</label>
									<label class="radio-label">
										<input type="radio" name="payment" value="paypal" />
										<span>PayPal</span>
									</label>
								</div>
									<input type="hidden" name="place_order" value="1">
									<input type="hidden" name="cart_items" id="cartItemsData">
									<button type="submit" class="btn btn-primary btn-full">
										Place Order
									</button>
								</form>
						</div>
						<div class="order-summary">
							<h2>Order Summary</h2>
							<div class="cart-items">
								<div class="cart-item">
									<span>Premium Laptop</span>
									<span>$1,299</span>
								</div>
								<div class="cart-item">
									<span>Wireless Headphones</span>
									<span>$299</span>
								</div>
							</div>
							<div class="order-totals">
								<div class="total-row">
									<span>Subtotal</span>
									<span>$1,598</span>
								</div>
								<div class="total-row">
									<span>Shipping</span>
									<span>$20</span>
								</div>
								<div class="total-row">
									<span>Tax</span>
									<span>$128</span>
								</div>
								<div class="total-row total">
									<span>Total</span>
									<span>$1,746</span>
								</div>
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
		<script>
			// Populate cart items data before form submission
			document.getElementById('checkoutForm').addEventListener('submit', function(e) {
				const cart = JSON.parse(localStorage.getItem('cart') || '[]');
				document.getElementById('cartItemsData').value = JSON.stringify(cart);
			});
		</script>
	</body>
</html>
