<?php
session_start();
require_once '../config/db.php';

// Check if user is admin (optional - comment out if no admin system yet)
// if (!isset($_SESSION['is_admin']) || $_SESSION['is_admin'] != 1) {
//     header("Location: login.php");
//     exit();
// }

// Handle product operations
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = getDBConnection();
    
    if (isset($_POST['action'])) {
        switch ($_POST['action']) {
            case 'add':
                $name = sanitize($_POST['name']);
                $brand = sanitize($_POST['brand']);
                $description = sanitize($_POST['description']);
                $price = floatval($_POST['price']);
                $stock = intval($_POST['stock']);
                $category_id = !empty($_POST['category_id']) ? intval($_POST['category_id']) : null;
                
                if ($category_id) {
                    $stmt = $conn->prepare("INSERT INTO products (name, brand, description, price, stock, category_id) VALUES (?, ?, ?, ?, ?, ?)");
                    $stmt->bind_param("sssdii", $name, $brand, $description, $price, $stock, $category_id);
                } else {
                    $stmt = $conn->prepare("INSERT INTO products (name, brand, description, price, stock) VALUES (?, ?, ?, ?, ?)");
                    $stmt->bind_param("sssdi", $name, $brand, $description, $price, $stock);
                }
                $stmt->execute();
                $stmt->close();
                break;
                
            case 'edit':
                $product_id = intval($_POST['product_id']);
                $name = sanitize($_POST['name']);
                $brand = sanitize($_POST['brand']);
                $description = sanitize($_POST['description']);
                $price = floatval($_POST['price']);
                $stock = intval($_POST['stock']);
                $category_id = !empty($_POST['category_id']) ? intval($_POST['category_id']) : null;
                
                if ($category_id) {
                    $stmt = $conn->prepare("UPDATE products SET name = ?, brand = ?, description = ?, price = ?, stock = ?, category_id = ? WHERE product_id = ?");
                    $stmt->bind_param("sssdiis", $name, $brand, $description, $price, $stock, $category_id, $product_id);
                } else {
                    $stmt = $conn->prepare("UPDATE products SET name = ?, brand = ?, description = ?, price = ?, stock = ? WHERE product_id = ?");
                    $stmt->bind_param("sssdii", $name, $brand, $description, $price, $stock, $product_id);
                }
                $stmt->execute();
                $stmt->close();
                break;
                
            case 'delete':
                $product_id = intval($_POST['product_id']);
                
                $stmt = $conn->prepare("DELETE FROM products WHERE product_id = ?");
                $stmt->bind_param("i", $product_id);
                $stmt->execute();
                $stmt->close();
                break;
        }
    }
    
    closeDBConnection($conn);
    header("Location: manage-products.php");
    exit();
}

// Fetch all products
$conn = getDBConnection();
$result = $conn->query("SELECT p.*, 
                        (SELECT c.name FROM categories c WHERE c.category_id = p.category_id) as category_name,
                        p.category_id
                        FROM products p 
                        ORDER BY p.product_id DESC");
$products = $result->fetch_all(MYSQLI_ASSOC);

// Fetch categories for dropdown
$categories_result = $conn->query("SELECT category_id, name FROM categories ORDER BY name");
$categories = $categories_result->fetch_all(MYSQLI_ASSOC);

closeDBConnection($conn);
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>TechMart - Manage Products</title>
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
				max-width: 500px;
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
			.form-group input,
			.form-group select,
			.form-group textarea {
				width: 100%;
				padding: 8px;
				border: 1px solid #ddd;
				border-radius: 4px;
				font-family: inherit;
			}
			.form-group textarea {
				resize: vertical;
				min-height: 80px;
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
			body.dark-mode .form-group input,
			body.dark-mode .form-group select,
			body.dark-mode .form-group textarea {
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
						<li>
							<a href="manage-products.php" class="active">Manage Products</a>
						</li>
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
			<section class="manage-section">
				<div class="container">
					<div class="section-header">
						<h1>Manage Products</h1>
						<button class="btn btn-primary" id="addProductBtn">
							Add New Product
						</button>
					</div>
					<div class="table-container">
						<table class="data-table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Product Name</th>
									<th>Brand</th>
									<th>Category</th>
									<th>Price</th>
									<th>Stock</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($products as $product): ?>
								<tr>
									<td><?php echo $product['product_id']; ?></td>
									<td><?php echo htmlspecialchars($product['name']); ?></td>
									<td><?php echo htmlspecialchars($product['brand'] ?? 'N/A'); ?></td>
									<td><?php echo htmlspecialchars(ucfirst($product['category_name'] ?? 'Other')); ?></td>
									<td>$<?php echo number_format($product['price'], 2); ?></td>
									<td><?php echo $product['stock']; ?></td>
									<td>
										<button class="btn-icon edit-btn" 
											data-id="<?php echo $product['product_id']; ?>"
											data-name="<?php echo htmlspecialchars($product['name']); ?>"
											data-brand="<?php echo htmlspecialchars($product['brand'] ?? ''); ?>"
											data-description="<?php echo htmlspecialchars($product['description'] ?? ''); ?>"
											data-price="<?php echo $product['price']; ?>"
											data-stock="<?php echo $product['stock']; ?>"
											data-category="<?php echo $product['category_id'] ?? ''; ?>"
											title="Edit">✏️</button>
										<button class="btn-icon delete-btn" 
											data-id="<?php echo $product['product_id']; ?>"
											data-name="<?php echo htmlspecialchars($product['name']); ?>"
											title="Delete">🗑️</button>
									</td>
								</tr>
								<?php endforeach; ?>
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

		<!-- Add/Edit Product Modal -->
		<div id="productModal" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<h2 id="modalTitle">Add New Product</h2>
					<span class="close">&times;</span>
				</div>
				<form id="productForm" method="POST">
					<input type="hidden" name="action" id="formAction" value="add">
					<input type="hidden" name="product_id" id="productId">
					
					<div class="form-group">
						<label for="productName">Product Name</label>
						<input type="text" id="productName" name="name" required>
					</div>
					
					<div class="form-group">
						<label for="productBrand">Brand</label>
						<input type="text" id="productBrand" name="brand" placeholder="Enter brand name">
					</div>
					
					<div class="form-group">
						<label for="productDescription">Description</label>
						<textarea id="productDescription" name="description"></textarea>
					</div>
					
					<div class="form-group">
						<label for="productPrice">Price</label>
						<input type="number" id="productPrice" name="price" step="0.01" min="0" required>
					</div>
					
					<div class="form-group">
						<label for="productStock">Stock</label>
						<input type="number" id="productStock" name="stock" min="0" value="0" required>
					</div>
					
					<div class="form-group">
						<label for="productCategory">Category</label>
						<select id="productCategory" name="category_id">
							<option value="">-- Select Category --</option>
							<?php foreach ($categories as $category): ?>
								<option value="<?php echo $category['category_id']; ?>">
									<?php echo htmlspecialchars(ucfirst($category['name'])); ?>
								</option>
							<?php endforeach; ?>
						</select>
					</div>
					
					<div class="modal-buttons">
						<button type="button" class="btn btn-secondary" id="cancelBtn">Cancel</button>
						<button type="submit" class="btn btn-primary">Save Product</button>
					</div>
				</form>
			</div>
		</div>

		<script src="../assets/js/script.js"></script>
		<script>
			const modal = document.getElementById('productModal');
			const addBtn = document.getElementById('addProductBtn');
			const closeBtn = document.querySelector('.close');
			const cancelBtn = document.getElementById('cancelBtn');
			const productForm = document.getElementById('productForm');
			const modalTitle = document.getElementById('modalTitle');
			const formAction = document.getElementById('formAction');
			const productId = document.getElementById('productId');

			// Add product
			addBtn.onclick = function() {
				modalTitle.textContent = 'Add New Product';
				formAction.value = 'add';
				productForm.reset();
				productId.value = '';
				modal.style.display = 'block';
			}

			// Edit product
			document.querySelectorAll('.edit-btn').forEach(btn => {
				btn.onclick = function() {
					const id = this.dataset.id;
					const name = this.dataset.name;
					const brand = this.dataset.brand;
					const description = this.dataset.description;
					const price = this.dataset.price;
					const stock = this.dataset.stock;
					const category = this.dataset.category;

					modalTitle.textContent = 'Edit Product';
					formAction.value = 'edit';
					productId.value = id;
					document.getElementById('productName').value = name;
					document.getElementById('productBrand').value = brand;
					document.getElementById('productDescription').value = description;
					document.getElementById('productPrice').value = price;
					document.getElementById('productStock').value = stock;
					document.getElementById('productCategory').value = category;
					modal.style.display = 'block';
				}
			});

			// Delete product
			document.querySelectorAll('.delete-btn').forEach(btn => {
				btn.onclick = function() {
					const id = this.dataset.id;
					const name = this.dataset.name;
					
					if (confirm(`Are you sure you want to delete "${name}"?`)) {
						const form = document.createElement('form');
						form.method = 'POST';
						form.innerHTML = `
							<input type="hidden" name="action" value="delete">
							<input type="hidden" name="product_id" value="${id}">
						`;
						document.body.appendChild(form);
						form.submit();
					}
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
