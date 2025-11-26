// Mobile Menu Toggle
document.addEventListener("DOMContentLoaded", function () {
	const menuToggle = document.getElementById("menuToggle");
	const navLinks = document.getElementById("navLinks");

	if (menuToggle) {
		menuToggle.addEventListener("click", function () {
			navLinks.classList.toggle("active");
		});
	}

	// Close menu when clicking outside
	document.addEventListener("click", function (event) {
		if (!event.target.closest(".navbar")) {
			navLinks.classList.remove("active");
		}
	});

	// Dark Mode Toggle
	const darkModeToggle = document.getElementById("darkModeToggle");
	const body = document.body;

	// Check for saved dark mode preference
	if (localStorage.getItem("darkMode") === "enabled") {
		body.classList.add("dark-mode");
		if (darkModeToggle) {
			darkModeToggle.querySelector(".icon").textContent = "☀️";
		}
	}

	if (darkModeToggle) {
		darkModeToggle.addEventListener("click", function () {
			body.classList.toggle("dark-mode");
			const icon = this.querySelector(".icon");

			if (body.classList.contains("dark-mode")) {
				icon.textContent = "☀️";
				localStorage.setItem("darkMode", "enabled");
			} else {
				icon.textContent = "🌙";
				localStorage.setItem("darkMode", "disabled");
			}
		});
	}

	// Shopping Cart Functionality
	let cart = JSON.parse(localStorage.getItem("cart")) || [];

	const cartBtn = document.getElementById("cartBtn");
	const cartDropdown = document.getElementById("cartDropdown");
	const closeCart = document.getElementById("closeCart");
	const cartCount = document.getElementById("cartCount");
	const cartItemsContainer = document.getElementById("cartItemsContainer");
	const cartTotal = document.getElementById("cartTotal");

	// Update cart display
	function updateCart() {
		cartCount.textContent = cart.length;

		if (cart.length === 0) {
			cartItemsContainer.innerHTML =
				'<p class="empty-cart">Your cart is empty</p>';
			if (cartTotal) cartTotal.textContent = "$0";
		} else {
			let total = 0;
			cartItemsContainer.innerHTML = cart
				.map((item, index) => {
					total += parseFloat(item.price);
					return `
					<div class="cart-item-card">
						<div class="cart-item-icon">${item.icon}</div>
						<div class="cart-item-details">
							<div class="cart-item-name">${item.name}</div>
							<div class="cart-item-price">$${item.price}</div>
						</div>
						<button class="remove-cart-item" data-index="${index}">🗑️</button>
					</div>
				`;
				})
				.join("");

			if (cartTotal) cartTotal.textContent = `$${total.toLocaleString()}`;

			// Add remove button listeners
			document.querySelectorAll(".remove-cart-item").forEach((btn) => {
				btn.addEventListener("click", function () {
					const index = parseInt(this.dataset.index);
					cart.splice(index, 1);
					localStorage.setItem("cart", JSON.stringify(cart));
					updateCart();
					showNotification("Item removed from cart", "#ef4444");
				});
			});
		}
	}

	// Toggle cart dropdown
	if (cartBtn) {
		cartBtn.addEventListener("click", function (e) {
			e.stopPropagation();
			if (cartDropdown) {
				cartDropdown.classList.toggle("active");
			}
		});
	}

	if (closeCart) {
		closeCart.addEventListener("click", function () {
			if (cartDropdown) {
				cartDropdown.classList.remove("active");
			}
		});
	}

	// Close cart when clicking outside
	document.addEventListener("click", function (event) {
		if (
			cartDropdown &&
			!event.target.closest(".cart-dropdown") &&
			!event.target.closest("#cartBtn")
		) {
			cartDropdown.classList.remove("active");
		}
	});

	// Add to cart functionality
	document.querySelectorAll(".add-to-cart-btn").forEach((button) => {
		button.addEventListener("click", function (e) {
			e.preventDefault();
			const name = this.dataset.name;
			const price = this.dataset.price;
			const icon = this.dataset.icon;

			cart.push({ name, price, icon });
			localStorage.setItem("cart", JSON.stringify(cart));
			updateCart();
			showNotification("Product added to cart!", "#10b981");
		});
	});

	// Notification function
	function showNotification(message, bgColor = "#10b981") {
		const notification = document.createElement("div");
		notification.textContent = message;
		notification.style.cssText = `
			position: fixed;
			top: 100px;
			right: 20px;
			background: ${bgColor};
			color: white;
			padding: 1rem 2rem;
			border-radius: 8px;
			box-shadow: 0 4px 6px rgba(0,0,0,0.1);
			z-index: 10000;
			animation: slideIn 0.3s ease;
		`;
		document.body.appendChild(notification);

		setTimeout(() => {
			notification.style.animation = "slideOut 0.3s ease";
			setTimeout(() => notification.remove(), 300);
		}, 2000);
	}

	// Initialize cart on page load
	updateCart();

	// Product Filter (Products Page)
	const filterButtons = document.querySelectorAll(".filter-btn");
	const productCards = document.querySelectorAll(".product-card");

	filterButtons.forEach((button) => {
		button.addEventListener("click", function () {
			// Remove active class from all buttons
			filterButtons.forEach((btn) => btn.classList.remove("active"));
			// Add active class to clicked button
			this.classList.add("active");

			const category = this.getAttribute("data-category");

			productCards.forEach((card) => {
				if (
					category === "all" ||
					card.getAttribute("data-category") === category
				) {
					card.style.display = "block";
					setTimeout(() => {
						card.style.opacity = "1";
						card.style.transform = "scale(1)";
					}, 10);
				} else {
					card.style.opacity = "0";
					card.style.transform = "scale(0.8)";
					setTimeout(() => {
						card.style.display = "none";
					}, 300);
				}
			});
		});
	});

	// Login Form Handler
	const loginForm = document.getElementById("loginForm");
	if (loginForm) {
		loginForm.addEventListener("submit", function (e) {
			e.preventDefault();

			const email = document.getElementById("email").value;
			const password = document.getElementById("password").value;

			// Simple admin check (in real app, this would be server-side)
			if (email.toLowerCase().includes("admin")) {
				alert("Admin login successful! Redirecting to dashboard...");
				window.location.href = "admin-dashboard.html";
			} else {
				alert("User login successful! Redirecting to profile...");
				window.location.href = "profile.html";
			}
		});
	}

	// Checkout Form Handler
	const checkoutForm = document.getElementById("checkoutForm");
	if (checkoutForm) {
		checkoutForm.addEventListener("submit", function (e) {
			e.preventDefault();
			alert("Order placed successfully! Thank you for your purchase.");
			window.location.href = "order-history.html";
		});
	}

	// Add smooth scrolling
	document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
		anchor.addEventListener("click", function (e) {
			e.preventDefault();
			const target = document.querySelector(this.getAttribute("href"));
			if (target) {
				target.scrollIntoView({
					behavior: "smooth",
					block: "start",
				});
			}
		});
	});

	// Add animation on scroll
	const observerOptions = {
		threshold: 0.1,
		rootMargin: "0px 0px -50px 0px",
	};

	const observer = new IntersectionObserver(function (entries) {
		entries.forEach((entry) => {
			if (entry.isIntersecting) {
				entry.target.style.opacity = "1";
				entry.target.style.transform = "translateY(0)";
			}
		});
	}, observerOptions);

	// Observe elements for animation
	document
		.querySelectorAll(
			".feature-card, .category-card, .product-card, .dashboard-card"
		)
		.forEach((el) => {
			el.style.opacity = "0";
			el.style.transform = "translateY(20px)";
			el.style.transition = "opacity 0.6s ease, transform 0.6s ease";
			observer.observe(el);
		});

	// Add to cart notification
	document.querySelectorAll(".product-card .btn-primary").forEach((button) => {
		if (button.textContent.includes("Add to Cart")) {
			button.addEventListener("click", function (e) {
				// Only show notification if not navigating to checkout
				if (this.tagName !== "A" || !this.href.includes("checkout")) {
					e.preventDefault();
					const notification = document.createElement("div");
					notification.textContent = "Product added to cart!";
					notification.style.cssText = `
                        position: fixed;
                        top: 100px;
                        right: 20px;
                        background: #10b981;
                        color: white;
                        padding: 1rem 2rem;
                        border-radius: 8px;
                        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                        z-index: 10000;
                        animation: slideIn 0.3s ease;
                    `;
					document.body.appendChild(notification);

					setTimeout(() => {
						notification.style.animation = "slideOut 0.3s ease";
						setTimeout(() => notification.remove(), 300);
					}, 2000);
				}
			});
		}
	});

	// Add CSS animation for notifications
	const style = document.createElement("style");
	style.textContent = `
        @keyframes slideIn {
            from {
                transform: translateX(400px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        @keyframes slideOut {
            from {
                transform: translateX(0);
                opacity: 1;
            }
            to {
                transform: translateX(400px);
                opacity: 0;
            }
        }
    `;
	document.head.appendChild(style);
});
