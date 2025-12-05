<?php
session_start();
require_once '../config/db.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$conn = getDBConnection();
$user_id = $_SESSION['user_id'];

// Fetch user and address data
$stmt = $conn->prepare("SELECT u.username, u.email, a.street, a.city, a.country, a.postal_code 
                        FROM users u 
                        LEFT JOIN addresses a ON u.user_id = a.user_id 
                        WHERE u.user_id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$stmt->close();

// Handle profile update
$success = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $street = sanitize($_POST['street']);
    $city = sanitize($_POST['city']);
    $country = sanitize($_POST['country']);
    $postal_code = sanitize($_POST['postal_code']);
    
    // Check if address exists
    $stmt = $conn->prepare("SELECT address_id FROM addresses WHERE user_id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        // Update existing address
        $stmt = $conn->prepare("UPDATE addresses SET street = ?, city = ?, country = ?, postal_code = ? WHERE user_id = ?");
        $stmt->bind_param("ssssi", $street, $city, $country, $postal_code, $user_id);
    } else {
        // Insert new address
        $stmt = $conn->prepare("INSERT INTO addresses (user_id, street, city, country, postal_code) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("issss", $user_id, $street, $city, $country, $postal_code);
    }
    
    if ($stmt->execute()) {
        $success = "Profile updated successfully!";
        // Refresh user data
        $stmt = $conn->prepare("SELECT u.username, u.email, a.street, a.city, a.country, a.postal_code 
                                FROM users u 
                                LEFT JOIN addresses a ON u.user_id = a.user_id 
                                WHERE u.user_id = ?");
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();
    } else {
        $error = "Failed to update profile.";
    }
    $stmt->close();
}

closeDBConnection($conn);
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Profile</title>
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
			.alert-success {
				background-color: #efe;
				color: #3c3;
				border: 1px solid #cfc;
			}
			body.dark-mode .alert-error {
				background-color: #4a1515;
				color: #ff6b6b;
				border-color: #6b2020;
			}
			body.dark-mode .alert-success {
				background-color: #154a15;
				color: #6bff6b;
				border-color: #206b20;
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
						<li><a href="profile.php" class="active">Profile</a></li>
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
					<h1>My Profile</h1>
					<div class="profile-container">
						<div class="profile-sidebar">
							<div class="profile-avatar">👤</div>
							<h3><?php echo htmlspecialchars($user['username']); ?></h3>
							<p><?php echo htmlspecialchars($user['email']); ?></p>
							<nav class="profile-nav">
								<a href="#" class="profile-nav-link active">Profile Info</a>
								<a href="order-history.php" class="profile-nav-link"
									>Order History</a
								>
								<a href="wishlist.php" class="profile-nav-link">Wishlist</a>
							</nav>
						</div>
						<div class="profile-content">
							<h2>Profile Information</h2>
							
							<?php if ($error): ?>
								<div class="alert alert-error"><?php echo $error; ?></div>
							<?php endif; ?>
							
							<?php if ($success): ?>
								<div class="alert alert-success"><?php echo $success; ?></div>
							<?php endif; ?>
							
							<form class="profile-form" method="POST">
								<div class="form-group">
									<label for="username">Username</label>
									<input
										type="text"
										id="username"
										name="username"
										value="<?php echo htmlspecialchars($user['username']); ?>"
										disabled
									/>
									<small>Username cannot be changed</small>
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<input
										type="email"
										id="email"
										name="email"
										value="<?php echo htmlspecialchars($user['email']); ?>"
										disabled
									/>
									<small>Email cannot be changed</small>
								</div>
								<div class="form-group">
									<label for="street">Street Address</label>
									<input
										type="text"
										id="street"
										name="street"
										value="<?php echo htmlspecialchars($user['street'] ?? ''); ?>"
									/>
								</div>
								<div class="form-group">
									<label for="city">City</label>
									<input
										type="text"
										id="city"
										name="city"
										value="<?php echo htmlspecialchars($user['city'] ?? ''); ?>"
									/>
								</div>
								<div class="form-group">
									<label for="country">Country</label>
									<input
										type="text"
										id="country"
										name="country"
										value="<?php echo htmlspecialchars($user['country'] ?? ''); ?>"
									/>
								</div>
								<div class="form-group">
									<label for="postal_code">Postal Code</label>
									<input
										type="text"
										id="postal_code"
										name="postal_code"
										value="<?php echo htmlspecialchars($user['postal_code'] ?? ''); ?>"
									/>
								</div>
								<button type="submit" class="btn btn-primary">
									Update Profile
								</button>
							</form>
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
