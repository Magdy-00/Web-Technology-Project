<?php
require_once '../config/db.php';

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = getDBConnection();
    
    $username = sanitize($_POST['username']);
    $email = sanitize($_POST['email']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $full_name = sanitize($_POST['full_name']);
    $phone = sanitize($_POST['phone']);
    $address = sanitize($_POST['address']);
    
    // Validation
    if ($password !== $confirm_password) {
        $error = "Passwords do not match!";
    } elseif (strlen($password) < 6) {
        $error = "Password must be at least 6 characters long!";
    } else {
        // Check if email already exists
        $stmt = $conn->prepare("SELECT user_id FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $error = "Email already registered!";
        } else {
            // Check if username already exists
            $stmt = $conn->prepare("SELECT user_id FROM users WHERE username = ?");
            $stmt->bind_param("s", $username);
            $stmt->execute();
            $result = $stmt->get_result();
            
            if ($result->num_rows > 0) {
                $error = "Username already taken!";
            } else {
                // Hash password
                $password_hash = password_hash($password, PASSWORD_DEFAULT);
                
                // Insert user
                $stmt = $conn->prepare("INSERT INTO users (username, email, password_hash, is_admin) VALUES (?, ?, ?, FALSE)");
                $stmt->bind_param("sss", $username, $email, $password_hash);
                
                if ($stmt->execute()) {
                    $user_id = $stmt->insert_id;
                    
                    // Insert profile
                    $stmt = $conn->prepare("INSERT INTO profiles (user_id, full_name, address, phone) VALUES (?, ?, ?, ?)");
                    $stmt->bind_param("isss", $user_id, $full_name, $address, $phone);
                    $stmt->execute();
                    
                    $success = "Account created successfully! Redirecting to login...";
                    header("refresh:2;url=login.php");
                } else {
                    $error = "Registration failed. Please try again.";
                }
            }
        }
        $stmt->close();
    }
    
    closeDBConnection($conn);
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Sign Up</title>
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
						<li><a href="login.php">Login</a></li>
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
							<h2>Create Your Account</h2>
							
							<?php if ($error): ?>
								<div class="alert alert-error"><?php echo $error; ?></div>
							<?php endif; ?>
							
							<?php if ($success): ?>
								<div class="alert alert-success"><?php echo $success; ?></div>
							<?php endif; ?>
							
							<form method="POST" class="login-form">
								<div class="form-group">
									<label for="username">Username *</label>
									<input
										type="text"
										id="username"
										name="username"
										required
										placeholder="Choose a username"
										value="<?php echo isset($_POST['username']) ? htmlspecialchars($_POST['username']) : ''; ?>"
									/>
								</div>
								
								<div class="form-group">
									<label for="email">Email *</label>
									<input
										type="email"
										id="email"
										name="email"
										required
										placeholder="Enter your email"
										value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>"
									/>
								</div>
								
								<div class="form-group">
									<label for="full_name">Full Name</label>
									<input
										type="text"
										id="full_name"
										name="full_name"
										placeholder="Enter your full name"
										value="<?php echo isset($_POST['full_name']) ? htmlspecialchars($_POST['full_name']) : ''; ?>"
									/>
								</div>
								
								<div class="form-group">
									<label for="phone">Phone Number</label>
									<input
										type="tel"
										id="phone"
										name="phone"
										placeholder="Enter your phone number"
										value="<?php echo isset($_POST['phone']) ? htmlspecialchars($_POST['phone']) : ''; ?>"
									/>
								</div>
								
								<div class="form-group">
									<label for="address">Address</label>
									<input
										type="text"
										id="address"
										name="address"
										placeholder="Enter your address"
										value="<?php echo isset($_POST['address']) ? htmlspecialchars($_POST['address']) : ''; ?>"
									/>
								</div>
								
								<div class="form-group">
									<label for="password">Password *</label>
									<input
										type="password"
										id="password"
										name="password"
										required
										placeholder="Create a password (min 6 characters)"
										minlength="6"
									/>
								</div>
								
								<div class="form-group">
									<label for="confirm_password">Confirm Password *</label>
									<input
										type="password"
										id="confirm_password"
										name="confirm_password"
										required
										placeholder="Re-enter your password"
										minlength="6"
									/>
								</div>
								
								<button type="submit" class="btn btn-primary btn-full">
									Create Account
								</button>
							</form>
							
							<div class="login-footer">
								<p>
									Already have an account? <a href="login.php">Login here</a>
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
		<script>
			// Password confirmation validation
			document.querySelector('form').addEventListener('submit', function(e) {
				const password = document.getElementById('password').value;
				const confirmPassword = document.getElementById('confirm_password').value;
				
				if (password !== confirmPassword) {
					e.preventDefault();
					alert('Passwords do not match!');
				}
			});
		</script>
	</body>
</html>
