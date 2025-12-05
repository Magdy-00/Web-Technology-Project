<?php
require_once '../config/db.php';

// Handle order status updates
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'update_status') {
    $conn = getDBConnection();
    
    $order_id = intval($_POST['order_id']);
    $status = sanitize($_POST['status']);
    
    $stmt = $conn->prepare("UPDATE orders SET status = ? WHERE order_id = ?");
    $stmt->bind_param("si", $status, $order_id);
    $stmt->execute();
    $stmt->close();
    
    closeDBConnection($conn);
    header("Location: manage-orders.php");
    exit();
}

// Fetch all orders with user information
$conn = getDBConnection();

$result = $conn->query("SELECT o.order_id, o.total_amount, o.order_date, o.status, u.username, u.email 
                        FROM orders o 
                        LEFT JOIN users u ON o.customer_id = u.user_id 
                        ORDER BY o.order_date DESC");
$orders = $result->fetch_all(MYSQLI_ASSOC);

closeDBConnection($conn);
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Manage Orders</title>
		<link rel="stylesheet" href="../assets/css/styles.css" />
		<style>
			.modal {
				display: none;
				position: fixed;
				z-index: 1000;
				left: 0;
				top: 0;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, 0.5);
			}
			.modal-content {
				background-color: var(--bg-color, #fff);
				margin: 5% auto;
				padding: 20px;
				border-radius: 8px;
				width: 90%;
				max-width: 400px;
			}
			.modal-header {
				display: flex;
				justify-content: space-between;
				align-items: center;
				margin-bottom: 20px;
			}
			.close {
				font-size: 28px;
				font-weight: bold;
				cursor: pointer;
			}
			.form-group {
				margin-bottom: 15px;
			}
			.form-group label {
				display: block;
				margin-bottom: 5px;
				font-weight: 500;
			}
			.form-group select {
				width: 100%;
				padding: 8px;
				border: 1px solid #ddd;
				border-radius: 4px;
				font-family: inherit;
			}
			.modal-buttons {
				display: flex;
				gap: 10px;
				justify-content: flex-end;
				margin-top: 20px;
			}
			body.dark-mode .modal-content {
				background-color: #1e293b;
				color: #f1f5f9;
			}
			body.dark-mode .form-group select {
				background-color: #334155;
				border-color: #475569;
				color: #f1f5f9;
			}
		</style>
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
						<li><a href="admin-dashboard.php">Dashboard</a></li>
						<li><a href="manage-products.php">Manage Products</a></li>
						<li>
							<a href="manage-orders.php" class="active">Manage Orders</a>
						</li>
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
			<section class="manage-section">
				<div class="container">
					<h1>Manage Orders</h1>
					<div class="table-container">
						<table class="data-table">
							<thead>
								<tr>
									<th>Order ID</th>
									<th>Customer</th>
									<th>Email</th>
									<th>Date</th>
									<th>Total</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<?php if (empty($orders)): ?>
								<tr>
									<td colspan="7" style="text-align: center; padding: 20px;">No orders found</td>
								</tr>
								<?php else: ?>
								<?php foreach ($orders as $order): ?>
								<tr>
									<td>#<?php echo $order['order_id']; ?></td>
									<td><?php echo htmlspecialchars($order['username'] ?? 'Guest'); ?></td>
									<td><?php echo htmlspecialchars($order['email'] ?? 'N/A'); ?></td>
									<td><?php echo date('M d, Y', strtotime($order['order_date'])); ?></td>
									<td>$<?php echo number_format($order['total_amount'], 2); ?></td>
									<td>
										<?php 
										$status = $order['status'] ?? 'pending';
										$statusClass = 'status-' . strtolower($status);
										?>
										<span class="status-badge <?php echo $statusClass; ?>">
											<?php echo htmlspecialchars(ucfirst($status)); ?>
										</span>
									</td>
									<td>
										<button class="btn-icon edit-status-btn" 
											data-id="<?php echo $order['order_id']; ?>"
											data-status="<?php echo htmlspecialchars($status); ?>"
											title="Edit Status">✏️</button>
									</td>
								</tr>
								<?php endforeach; ?>
								<?php endif; ?>
							</tbody>
						</table>
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

		<!-- Edit Order Status Modal -->
		<div id="statusModal" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<h2>Update Order Status</h2>
					<span class="close">&times;</span>
				</div>
				<form id="statusForm" method="POST">
					<input type="hidden" name="action" value="update_status">
					<input type="hidden" name="order_id" id="orderId">
					
					<div class="form-group">
						<label for="orderStatus">Status</label>
						<select id="orderStatus" name="status" required>
							<option value="pending">Pending</option>
							<option value="processing">Processing</option>
							<option value="shipping">Shipping</option>
							<option value="completed">Completed</option>
							<option value="cancelled">Cancelled</option>
						</select>
					</div>
					
					<div class="modal-buttons">
						<button type="button" class="btn btn-secondary" id="cancelBtn">Cancel</button>
						<button type="submit" class="btn btn-primary">Update Status</button>
					</div>
				</form>
			</div>
		</div>

		<script src="../assets/js/script.js"></script>
		<script>
			const modal = document.getElementById('statusModal');
			const closeBtn = document.querySelector('.close');
			const cancelBtn = document.getElementById('cancelBtn');
			const orderId = document.getElementById('orderId');
			const orderStatus = document.getElementById('orderStatus');

			// Edit order status
			document.querySelectorAll('.edit-status-btn').forEach(btn => {
				btn.onclick = function() {
					const id = this.dataset.id;
					const status = this.dataset.status;

					orderId.value = id;
					orderStatus.value = status;
					modal.style.display = 'block';
				}
			});

			// Close modal
			closeBtn.onclick = function() {
				modal.style.display = 'none';
			}

			cancelBtn.onclick = function() {
				modal.style.display = 'none';
			}

			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = 'none';
				}
			}
		</script>
	</body>
</html>
