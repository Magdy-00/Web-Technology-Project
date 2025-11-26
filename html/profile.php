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

// Fetch user and profile data
$stmt = $conn->prepare("SELECT u.username, u.email, p.full_name, p.address, p.phone 
                        FROM users u 
                        LEFT JOIN profiles p ON u.user_id = p.user_id 
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
    $full_name = sanitize($_POST['full_name']);
    $phone = sanitize($_POST['phone']);
    $address = sanitize($_POST['address']);
    
    // Check if profile exists
    $stmt = $conn->prepare("SELECT profile_id FROM profiles WHERE user_id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        // Update existing profile
        $stmt = $conn->prepare("UPDATE profiles SET full_name = ?, phone = ?, address = ? WHERE user_id = ?");
        $stmt->bind_param("sssi", $full_name, $phone, $address, $user_id);
    } else {
        // Insert new profile
        $stmt = $conn->prepare("INSERT INTO profiles (user_id, full_name, phone, address) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("isss", $user_id, $full_name, $phone, $address);
    }
    
    if ($stmt->execute()) {
        $success = "Profile updated successfully!";
        // Refresh user data
        $stmt = $conn->prepare("SELECT u.username, u.email, p.full_name, p.address, p.phone 
                                FROM users u 
                                LEFT JOIN profiles p ON u.user_id = p.user_id 
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
									<label for="fullname">Full Name</label>
									<input
										type="text"
										id="fullname"
										name="full_name"
										value="<?php echo htmlspecialchars($user['full_name'] ?? ''); ?>"
									/>
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
									<label for="phone">Phone</label>
									<input
										type="tel"
										id="phone"
										name="phone"
										value="<?php echo htmlspecialchars($user['phone'] ?? ''); ?>"
									/>
								</div>
								<div class="form-group">
									<label for="address">Address</label>
									<textarea id="address" name="address" rows="3"><?php echo htmlspecialchars($user['address'] ?? ''); ?></textarea>
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
