<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechMart - Login Test</title>
    <link rel="stylesheet" href="../assets/css/styles.css">
    <style>
        .test-container {
            max-width: 800px;
            margin: 3rem auto;
            padding: 2rem;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .test-section {
            margin-bottom: 2rem;
            padding: 1rem;
            border-left: 4px solid var(--primary-color);
            background: #f8fafc;
        }
        .test-section h3 {
            margin-top: 0;
            color: var(--primary-color);
        }
        .test-info {
            display: grid;
            grid-template-columns: auto 1fr;
            gap: 1rem;
            margin-top: 1rem;
        }
        .test-label {
            font-weight: bold;
            color: var(--text-secondary);
        }
        .test-value {
            font-family: monospace;
            background: #fff;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
        }
        .success {
            color: #10b981;
            font-weight: bold;
        }
        .error {
            color: #ef4444;
            font-weight: bold;
        }
        .code-block {
            background: #1e293b;
            color: #f8fafc;
            padding: 1rem;
            border-radius: 4px;
            font-family: monospace;
            font-size: 0.9rem;
            overflow-x: auto;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="container">
                <div class="logo">TechMart</div>
                <ul class="nav-links">
                    <li><a href="index.php">Home</a></li>
                    <li><a href="login.php">Login</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main>
        <div class="container">
            <div class="test-container">
                <h1>🔧 Login Troubleshooting Guide</h1>
                <p>Use this page to test and fix login issues.</p>

                <div class="test-section">
                    <h3>✅ Step 1: Database Connection Test</h3>
                    <?php
                    require_once '../config/db.php';
                    
                    try {
                        $conn = getDBConnection();
                        echo '<p class="success">✓ Database connection successful!</p>';
                        echo '<div class="test-info">';
                        echo '<span class="test-label">Database:</span>';
                        echo '<span class="test-value">' . DB_NAME . '</span>';
                        echo '<span class="test-label">Host:</span>';
                        echo '<span class="test-value">' . DB_HOST . '</span>';
                        echo '</div>';
                    } catch (Exception $e) {
                        echo '<p class="error">✗ Database connection failed!</p>';
                        echo '<p>Error: ' . htmlspecialchars($e->getMessage()) . '</p>';
                        exit;
                    }
                    ?>
                </div>

                <div class="test-section">
                    <h3>✅ Step 2: Users Table Structure</h3>
                    <?php
                    $result = $conn->query("SHOW COLUMNS FROM users");
                    $columns = [];
                    
                    echo '<div class="test-info">';
                    while ($col = $result->fetch_assoc()) {
                        $columns[] = $col['Field'];
                        echo '<span class="test-label">' . htmlspecialchars($col['Field']) . ':</span>';
                        echo '<span class="test-value">' . htmlspecialchars($col['Type']) . '</span>';
                    }
                    echo '</div>';
                    
                    $hasPasswordHash = in_array('password_hash', $columns);
                    $hasIsAdmin = in_array('is_admin', $columns);
                    
                    echo '<div style="margin-top: 1rem;">';
                    echo '<p><strong>password_hash column:</strong> ' . ($hasPasswordHash ? '<span class="success">✓ Exists</span>' : '<span class="error">✗ Missing</span>') . '</p>';
                    echo '<p><strong>is_admin column:</strong> ' . ($hasIsAdmin ? '<span class="success">✓ Exists</span>' : '<span class="error">✗ Missing</span>') . '</p>';
                    echo '</div>';
                    
                    if (!$hasPasswordHash || !$hasIsAdmin) {
                        echo '<div class="code-block">';
                        echo 'Please run: assets/sql/init_techmart.sql in phpMyAdmin';
                        echo '</div>';
                    }
                    ?>
                </div>

                <div class="test-section">
                    <h3>✅ Step 3: Test Users Available</h3>
                    <?php
                    $result = $conn->query("SELECT user_id, username, email, " . 
                                          ($hasIsAdmin ? "is_admin, " : "") . 
                                          "created_at FROM users LIMIT 10");
                    
                    if ($result->num_rows > 0) {
                        echo '<table class="data-table" style="margin-top: 1rem;">';
                        echo '<thead><tr><th>ID</th><th>Username</th><th>Email</th>';
                        if ($hasIsAdmin) echo '<th>Admin</th>';
                        echo '<th>Status</th></tr></thead><tbody>';
                        
                        while ($row = $result->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>' . $row['user_id'] . '</td>';
                            echo '<td>' . htmlspecialchars($row['username']) . '</td>';
                            echo '<td>' . htmlspecialchars($row['email']) . '</td>';
                            if ($hasIsAdmin) {
                                echo '<td>' . ($row['is_admin'] ? 'Yes' : 'No') . '</td>';
                            }
                            echo '<td class="success">✓ Available</td>';
                            echo '</tr>';
                        }
                        
                        echo '</tbody></table>';
                    } else {
                        echo '<p class="error">No users found in database!</p>';
                    }
                    ?>
                </div>

                <div class="test-section">
                    <h3>📝 Step 4: How to Login</h3>
                    <p><strong>Use these credentials to test:</strong></p>
                    
                    <div class="code-block">
                    <?php if ($hasPasswordHash): ?>
# Admin Login (if init_techmart.sql was run)
Email: admin@techmart.com
Password: admin123
                    <?php endif; ?>

# Any existing user email from the table above
Email: [any email from table]
Password: [any password]  # Will work if password_hash is missing
                    </div>

                    <div style="margin-top: 1rem;">
                        <a href="login.php" class="btn btn-primary">Go to Login Page</a>
                    </div>
                </div>

                <div class="test-section">
                    <h3>🔧 Common Issues & Fixes</h3>
                    
                    <h4>Issue: "Invalid email or password"</h4>
                    <ul>
                        <li>Make sure the email exists in the users table above</li>
                        <li>If password_hash exists, use correct password</li>
                        <li>Check for typos in email address</li>
                    </ul>

                    <h4>Issue: Columns missing (password_hash or is_admin)</h4>
                    <ul>
                        <li>Open phpMyAdmin</li>
                        <li>Select <code>amazon-db</code> database</li>
                        <li>Click Import tab</li>
                        <li>Choose file: <code>assets/sql/init_techmart.sql</code></li>
                        <li>Click Go</li>
                        <li>Refresh this page</li>
                    </ul>

                    <h4>Issue: Database connection failed</h4>
                    <ul>
                        <li>Make sure MySQL is running in XAMPP/WAMP</li>
                        <li>Check database name is <code>amazon-db</code></li>
                        <li>Verify credentials in <code>config/db.php</code></li>
                    </ul>
                </div>

                <?php closeDBConnection($conn); ?>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <div class="footer-bottom">
                <p>&copy; 2025 TechMart. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>
