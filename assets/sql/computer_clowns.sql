-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2025 at 10:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer_clowns`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesstokens`
--

CREATE TABLE `accesstokens` (
  `token_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `issued_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `status` enum('active','revoked','expired') DEFAULT 'active',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `user_id`, `street`, `city`, `country`, `postal_code`) VALUES
(1, 1, '123 Nile Street', 'Cairo', 'Egypt', '11111'),
(2, 2, '456 Pyramid Road', 'Giza', 'Egypt', '22222'),
(3, 3, '789 Corniche', 'Alexandria', 'Egypt', '33333');

-- --------------------------------------------------------

--
-- Table structure for table `admincharts`
--

CREATE TABLE `admincharts` (
  `ChartID` int(11) NOT NULL,
  `ChartName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admincharts`
--

INSERT INTO `admincharts` (`ChartID`, `ChartName`, `CreatedAt`) VALUES
(1, 'Daily Users Chart', '2025-12-01 19:25:41'),
(2, 'System Load Chart', '2025-12-01 19:25:41'),
(3, 'Login Attempts Chart', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `admindashboards`
--

CREATE TABLE `admindashboards` (
  `DashboardID` int(11) NOT NULL,
  `DashboardName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admindashboards`
--

INSERT INTO `admindashboards` (`DashboardID`, `DashboardName`, `CreatedAt`) VALUES
(1, 'Main Admin Dashboard', '2025-12-01 19:25:40'),
(2, 'Security Monitoring Dashboard', '2025-12-01 19:25:40'),
(3, 'Analytics Dashboard', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminexports`
--

CREATE TABLE `adminexports` (
  `ExportID` int(11) NOT NULL,
  `ExportType` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminexports`
--

INSERT INTO `adminexports` (`ExportID`, `ExportType`, `CreatedAt`) VALUES
(1, 'User List Export', '2025-12-01 19:25:41'),
(2, 'Logs Export', '2025-12-01 19:25:41'),
(3, 'Reports Export', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `admingraphs`
--

CREATE TABLE `admingraphs` (
  `GraphID` int(11) NOT NULL,
  `GraphName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admingraphs`
--

INSERT INTO `admingraphs` (`GraphID`, `GraphName`, `CreatedAt`) VALUES
(1, 'Revenue Graph', '2025-12-01 19:25:41'),
(2, 'CPU Usage Graph', '2025-12-01 19:25:41'),
(3, 'Traffic Growth Graph', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `adminimports`
--

CREATE TABLE `adminimports` (
  `ImportID` int(11) NOT NULL,
  `ImportType` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminimports`
--

INSERT INTO `adminimports` (`ImportID`, `ImportType`, `CreatedAt`) VALUES
(1, 'User Data Import', '2025-12-01 19:25:41'),
(2, 'Settings Import', '2025-12-01 19:25:41'),
(3, 'Products Import', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `adminintegrations`
--

CREATE TABLE `adminintegrations` (
  `IntegrationID` int(11) NOT NULL,
  `IntegrationName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminintegrations`
--

INSERT INTO `adminintegrations` (`IntegrationID`, `IntegrationName`, `CreatedAt`) VALUES
(1, 'Payment Gateway Integration', '2025-12-01 19:25:41'),
(2, 'Email Service Integration', '2025-12-01 19:25:41'),
(3, 'Analytics API Integration', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `adminlogs`
--

CREATE TABLE `adminlogs` (
  `LogID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL,
  `Action` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminlogs`
--

INSERT INTO `adminlogs` (`LogID`, `AdminID`, `Action`, `CreatedAt`) VALUES
(1, 1, 'Logged in', '2025-12-01 19:25:40'),
(2, 2, 'Edited user account', '2025-12-01 19:25:40'),
(3, 1, 'Updated system settings', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminmessages`
--

CREATE TABLE `adminmessages` (
  `MessageID` int(11) NOT NULL,
  `MessageText` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminmessages`
--

INSERT INTO `adminmessages` (`MessageID`, `MessageText`, `CreatedAt`) VALUES
(1, 'System update scheduled', '2025-12-01 19:25:40'),
(2, 'New user registered', '2025-12-01 19:25:40'),
(3, 'Server restarted successfully', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminnotes`
--

CREATE TABLE `adminnotes` (
  `NoteID` int(11) NOT NULL,
  `NoteText` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminnotes`
--

INSERT INTO `adminnotes` (`NoteID`, `NoteText`, `CreatedAt`) VALUES
(1, 'Check payment gateway integration', '2025-12-01 19:25:40'),
(2, 'Prepare monthly meeting', '2025-12-01 19:25:40'),
(3, 'Fix UI issues on dashboard', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminnotifications`
--

CREATE TABLE `adminnotifications` (
  `NotificationID` int(11) NOT NULL,
  `NotificationText` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminnotifications`
--

INSERT INTO `adminnotifications` (`NotificationID`, `NotificationText`, `CreatedAt`) VALUES
(1, 'Password will expire soon', '2025-12-01 19:25:40'),
(2, 'New login detected', '2025-12-01 19:25:40'),
(3, 'Backup completed', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminpermissions`
--

CREATE TABLE `adminpermissions` (
  `PermissionID` int(11) NOT NULL,
  `PermissionName` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminpermissions`
--

INSERT INTO `adminpermissions` (`PermissionID`, `PermissionName`, `Description`, `CreatedAt`) VALUES
(1, 'ManageUsers', 'Ability to add, edit, and delete user accounts', '2025-12-01 19:25:40'),
(2, 'ViewReports', 'Access to analytics and system activity reports', '2025-12-01 19:25:40'),
(3, 'EditSettings', 'Permission to modify system configuration settings', '2025-12-01 19:25:40'),
(4, 'ModerateContent', 'Ability to review and moderate user-generated content', '2025-12-01 19:25:40'),
(5, 'AccessLogs', 'Permission to view system and security logs', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminpreferences`
--

CREATE TABLE `adminpreferences` (
  `PreferenceID` int(11) NOT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `PreferenceName` varchar(100) DEFAULT NULL,
  `PreferenceValue` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminpreferences`
--

INSERT INTO `adminpreferences` (`PreferenceID`, `AdminID`, `PreferenceName`, `PreferenceValue`, `CreatedAt`) VALUES
(1, 1, 'SidebarCollapsed', 'true', '2025-12-01 19:25:40'),
(2, 1, 'ItemsPerPage', '20', '2025-12-01 19:25:40'),
(3, 2, 'Theme', 'Light', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminreports`
--

CREATE TABLE `adminreports` (
  `ReportID` int(11) NOT NULL,
  `ReportName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminreports`
--

INSERT INTO `adminreports` (`ReportID`, `ReportName`, `CreatedAt`) VALUES
(1, 'Daily Activity Report', '2025-12-01 19:25:40'),
(2, 'Error Logs Summary', '2025-12-01 19:25:40'),
(3, 'User Growth Analysis', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminroles`
--

CREATE TABLE `adminroles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminroles`
--

INSERT INTO `adminroles` (`RoleID`, `RoleName`, `Description`, `CreatedAt`) VALUES
(1, 'SuperAdmin', 'Full access to all administrative features and system settings', '2025-12-01 19:25:40'),
(2, 'Administrator', 'Standard admin privileges to manage users and content', '2025-12-01 19:25:40'),
(3, 'Moderator', 'Limited access to monitor and moderate platform activity', '2025-12-01 19:25:40'),
(4, 'Support', 'Handles user queries and provides technical support', '2025-12-01 19:25:40'),
(5, 'Viewer', 'Read-only access to dashboards and logs', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminsessions`
--

CREATE TABLE `adminsessions` (
  `SessionID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL,
  `LoginTime` datetime DEFAULT current_timestamp(),
  `LogoutTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminsessions`
--

INSERT INTO `adminsessions` (`SessionID`, `AdminID`, `LoginTime`, `LogoutTime`) VALUES
(1, 1, '2025-12-01 19:25:40', '2025-01-10 12:30:00'),
(2, 2, '2025-12-01 19:25:40', '2025-01-11 19:45:00'),
(3, 3, '2025-12-01 19:25:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adminsettings`
--

CREATE TABLE `adminsettings` (
  `SettingID` int(11) NOT NULL,
  `SettingName` varchar(100) DEFAULT NULL,
  `SettingValue` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminsettings`
--

INSERT INTO `adminsettings` (`SettingID`, `SettingName`, `SettingValue`, `CreatedAt`) VALUES
(1, 'Theme', 'Dark', '2025-12-01 19:25:40'),
(2, 'Language', 'English', '2025-12-01 19:25:40'),
(3, 'Timezone', 'UTC+2', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `admintasks`
--

CREATE TABLE `admintasks` (
  `TaskID` int(11) NOT NULL,
  `TaskName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admintasks`
--

INSERT INTO `admintasks` (`TaskID`, `TaskName`, `CreatedAt`) VALUES
(1, 'Review pending accounts', '2025-12-01 19:25:40'),
(2, 'Backup system database', '2025-12-01 19:25:40'),
(3, 'Check server performance', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminthemes`
--

CREATE TABLE `adminthemes` (
  `ThemeID` int(11) NOT NULL,
  `ThemeName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminthemes`
--

INSERT INTO `adminthemes` (`ThemeID`, `ThemeName`, `CreatedAt`) VALUES
(1, 'Dark Mode', '2025-12-01 19:25:40'),
(2, 'Light Mode', '2025-12-01 19:25:40'),
(3, 'Blue Neon', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `adminusers`
--

CREATE TABLE `adminusers` (
  `AdminID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Role` varchar(50) DEFAULT 'Administrator',
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `LastLogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminusers`
--

INSERT INTO `adminusers` (`AdminID`, `Username`, `Email`, `PasswordHash`, `Role`, `CreatedAt`, `LastLogin`) VALUES
(1, 'admin_master', 'admin.master@example.com', 'hashed_password_123', 'SuperAdmin', '2025-12-01 19:25:40', '2025-02-01 10:23:00'),
(2, 'john_admin', 'john.admin@example.com', 'hash_john_456', 'Moderator', '2025-12-01 19:25:40', '2025-01-28 08:15:20'),
(3, 'sara_control', 'sara.control@example.com', 'sara_hash_789', 'Administrator', '2025-12-01 19:25:40', '2025-01-30 19:47:10'),
(4, 'support_team', 'support@example.com', 'supp_hash_001', 'Support', '2025-12-01 19:25:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adminwidgets`
--

CREATE TABLE `adminwidgets` (
  `WidgetID` int(11) NOT NULL,
  `WidgetName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminwidgets`
--

INSERT INTO `adminwidgets` (`WidgetID`, `WidgetName`, `CreatedAt`) VALUES
(1, 'User Stats Widget', '2025-12-01 19:25:40'),
(2, 'Traffic Overview Widget', '2025-12-01 19:25:40'),
(3, 'Quick Actions Widget', '2025-12-01 19:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `affiliateclicks`
--

CREATE TABLE `affiliateclicks` (
  `click_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `click_time` datetime NOT NULL,
  `user_ip` varchar(45) DEFAULT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') NOT NULL,
  `referrer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `affiliateclicks`
--

INSERT INTO `affiliateclicks` (`click_id`, `link_id`, `affiliate_id`, `click_time`, `user_ip`, `device_type`, `referrer`) VALUES
(1, 1, 1, '2025-06-05 14:22:10', '102.54.22.18', 'Mobile', 'https://facebook.com/ads'),
(2, 1, 1, '2025-06-06 09:11:45', '156.203.44.91', 'Desktop', 'https://twitter.com/post'),
(3, 2, 2, '2025-08-20 18:55:30', '41.68.101.77', 'Mobile', 'https://instagram.com/promo'),
(4, 3, 3, '2025-12-22 12:44:03', '197.33.200.55', 'Desktop', 'https://google.com/search'),
(5, 5, 5, '2025-03-14 21:07:18', '156.211.88.40', 'Tablet', 'https://tiktok.com/video'),
(6, 1, 1, '2025-06-05 14:22:10', '102.54.22.18', 'Mobile', 'https://facebook.com/ads'),
(7, 1, 1, '2025-06-06 09:11:45', '156.203.44.91', 'Desktop', 'https://twitter.com/post'),
(8, 2, 2, '2025-08-20 18:55:30', '41.68.101.77', 'Mobile', 'https://instagram.com/promo'),
(9, 3, 3, '2025-12-22 12:44:03', '197.33.200.55', 'Desktop', 'https://google.com/search'),
(10, 5, 5, '2025-03-14 21:07:18', '156.211.88.40', 'Tablet', 'https://tiktok.com/video'),
(11, 1, 1, '2025-06-05 14:22:10', '102.54.22.18', 'Mobile', 'https://facebook.com/ads'),
(12, 1, 1, '2025-06-06 09:11:45', '156.203.44.91', 'Desktop', 'https://twitter.com/post'),
(13, 2, 2, '2025-08-20 18:55:30', '41.68.101.77', 'Mobile', 'https://instagram.com/promo'),
(14, 3, 3, '2025-12-22 12:44:03', '197.33.200.55', 'Desktop', 'https://google.com/search'),
(15, 5, 5, '2025-03-14 21:07:18', '156.211.88.40', 'Tablet', 'https://tiktok.com/video'),
(16, 1, 1, '2025-06-05 14:22:10', '102.54.22.18', 'Mobile', 'https://facebook.com/ads'),
(17, 1, 1, '2025-06-06 09:11:45', '156.203.44.91', 'Desktop', 'https://twitter.com/post'),
(18, 2, 2, '2025-08-20 18:55:30', '41.68.101.77', 'Mobile', 'https://instagram.com/promo'),
(19, 3, 3, '2025-12-22 12:44:03', '197.33.200.55', 'Desktop', 'https://google.com/search'),
(20, 5, 5, '2025-03-14 21:07:18', '156.211.88.40', 'Tablet', 'https://tiktok.com/video'),
(21, 1, 1, '2025-06-05 14:22:10', '102.54.22.18', 'Mobile', 'https://facebook.com/ads'),
(22, 1, 1, '2025-06-06 09:11:45', '156.203.44.91', 'Desktop', 'https://twitter.com/post'),
(23, 2, 2, '2025-08-20 18:55:30', '41.68.101.77', 'Mobile', 'https://instagram.com/promo'),
(24, 3, 3, '2025-12-22 12:44:03', '197.33.200.55', 'Desktop', 'https://google.com/search'),
(25, 5, 5, '2025-03-14 21:07:18', '156.211.88.40', 'Tablet', 'https://tiktok.com/video');

-- --------------------------------------------------------

--
-- Table structure for table `affiliatelinks`
--

CREATE TABLE `affiliatelinks` (
  `link_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `link_url` varchar(255) NOT NULL,
  `creation_date` date NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `status` enum('active','inactive','expired') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `affiliatelinks`
--

INSERT INTO `affiliatelinks` (`link_id`, `affiliate_id`, `product_id`, `campaign_id`, `link_url`, `creation_date`, `expiration_date`, `status`) VALUES
(1, 1, 101, 1, 'https://techmart.com/ref/techguru-laptop', '2025-06-01', '2025-06-30', 'expired'),
(2, 2, 205, 2, 'https://techmart.com/ref/gadgetworld-tablet', '2025-08-15', '2025-09-10', 'expired'),
(3, 3, 310, 3, 'https://techmart.com/ref/pcmasters-gamingpc', '2025-12-20', '2026-01-05', 'active'),
(4, 4, 405, NULL, 'https://techmart.com/ref/tabletzone-storewide', '2025-04-01', '2025-04-15', 'inactive'),
(5, 5, 502, 4, 'https://techmart.com/ref/accessoryking-gaming', '2025-03-14', '2025-03-14', 'expired');

-- --------------------------------------------------------

--
-- Table structure for table `affiliatepayments`
--

CREATE TABLE `affiliatepayments` (
  `payment_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_method` enum('Bank Transfer','PayPal','Check','Other') DEFAULT 'Bank Transfer',
  `status` enum('pending','completed','failed') DEFAULT 'pending',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `affiliatepayments`
--

INSERT INTO `affiliatepayments` (`payment_id`, `affiliate_id`, `payment_date`, `amount`, `payment_method`, `status`, `notes`) VALUES
(1, 1, '2025-07-05', 1200.00, 'Bank Transfer', 'completed', 'Payment for June affiliate commissions.'),
(2, 2, '2025-09-15', 900.00, 'PayPal', 'completed', 'Payment for August affiliate commissions.'),
(3, 3, '2026-01-10', 750.00, 'Bank Transfer', 'completed', 'Payment for December affiliate commissions.'),
(4, 4, '2025-04-20', 500.00, 'Check', 'completed', 'Payment for April inactive affiliate.'),
(5, 5, '2025-03-20', 1100.00, 'Bank Transfer', 'completed', 'Payment for March affiliate earnings.'),
(6, 1, '2025-07-05', 1200.00, 'Bank Transfer', 'completed', 'Payment for June affiliate commissions.'),
(7, 2, '2025-09-15', 900.00, 'PayPal', 'completed', 'Payment for August affiliate commissions.'),
(8, 3, '2026-01-10', 750.00, 'Bank Transfer', 'completed', 'Payment for December affiliate commissions.'),
(9, 4, '2025-04-20', 500.00, 'Check', 'completed', 'Payment for April inactive affiliate.'),
(10, 5, '2025-03-20', 1100.00, 'Bank Transfer', 'completed', 'Payment for March affiliate earnings.'),
(11, 1, '2025-07-05', 1200.00, 'Bank Transfer', 'completed', 'Payment for June affiliate commissions.'),
(12, 2, '2025-09-15', 900.00, 'PayPal', 'completed', 'Payment for August affiliate commissions.'),
(13, 3, '2026-01-10', 750.00, 'Bank Transfer', 'completed', 'Payment for December affiliate commissions.'),
(14, 4, '2025-04-20', 500.00, 'Check', 'completed', 'Payment for April inactive affiliate.'),
(15, 5, '2025-03-20', 1100.00, 'Bank Transfer', 'completed', 'Payment for March affiliate earnings.'),
(16, 1, '2025-07-05', 1200.00, 'Bank Transfer', 'completed', 'Payment for June affiliate commissions.'),
(17, 2, '2025-09-15', 900.00, 'PayPal', 'completed', 'Payment for August affiliate commissions.'),
(18, 3, '2026-01-10', 750.00, 'Bank Transfer', 'completed', 'Payment for December affiliate commissions.'),
(19, 4, '2025-04-20', 500.00, 'Check', 'completed', 'Payment for April inactive affiliate.'),
(20, 5, '2025-03-20', 1100.00, 'Bank Transfer', 'completed', 'Payment for March affiliate earnings.'),
(21, 1, '2025-07-05', 1200.00, 'Bank Transfer', 'completed', 'Payment for June affiliate commissions.'),
(22, 2, '2025-09-15', 900.00, 'PayPal', 'completed', 'Payment for August affiliate commissions.'),
(23, 3, '2026-01-10', 750.00, 'Bank Transfer', 'completed', 'Payment for December affiliate commissions.'),
(24, 4, '2025-04-20', 500.00, 'Check', 'completed', 'Payment for April inactive affiliate.'),
(25, 5, '2025-03-20', 1100.00, 'Bank Transfer', 'completed', 'Payment for March affiliate earnings.');

-- --------------------------------------------------------

--
-- Table structure for table `affiliateprograms`
--

CREATE TABLE `affiliateprograms` (
  `affiliate_id` int(11) NOT NULL,
  `affiliate_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `join_date` date NOT NULL,
  `commission_rate` decimal(5,2) NOT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `affiliateprograms`
--

INSERT INTO `affiliateprograms` (`affiliate_id`, `affiliate_name`, `email`, `website`, `join_date`, `commission_rate`, `status`, `notes`) VALUES
(1, 'TechGuru Egypt', 'contact@techguru.com', 'https://techguru.com', '2025-01-10', 10.00, 'active', 'Promotes laptops and gaming gear.'),
(2, 'GadgetWorld', 'info@gadgetworld.com', 'https://gadgetworld.com', '2025-02-15', 12.50, 'active', 'Focuses on accessories and peripherals.'),
(3, 'PCMasters', 'support@pcmasters.com', 'https://pcmasters.com', '2025-03-05', 8.00, 'active', 'Targets high-end gaming PCs.'),
(4, 'TabletZone', 'sales@tabletz.com', 'https://tabletz.com', '2025-04-01', 15.00, 'inactive', 'Promotes tablets and student devices.'),
(5, 'AccessoryKing', 'hello@accessoryking.com', 'https://accessoryking.com', '2025-05-12', 10.00, 'active', 'Focuses on mobile and computer accessories.');

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE `affiliates` (
  `affiliate_id` int(11) NOT NULL,
  `affiliate_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `join_date` date NOT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `total_earnings` decimal(12,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `affiliates`
--

INSERT INTO `affiliates` (`affiliate_id`, `affiliate_name`, `email`, `website`, `join_date`, `status`, `total_earnings`, `notes`) VALUES
(1, 'TechGuru Egypt', 'contact@techguru.com', 'https://techguru.com', '2025-01-10', 'active', 1200.00, 'Promotes laptops and gaming gear.'),
(2, 'GadgetWorld', 'info@gadgetworld.com', 'https://gadgetworld.com', '2025-02-15', 'active', 900.00, 'Focuses on accessories and peripherals.'),
(3, 'PCMasters', 'support@pcmasters.com', 'https://pcmasters.com', '2025-03-05', 'active', 750.00, 'Targets high-end gaming PCs.'),
(4, 'TabletZone', 'sales@tabletz.com', 'https://tabletz.com', '2025-04-01', 'inactive', 500.00, 'Promotes tablets and student devices.'),
(5, 'AccessoryKing', 'hello@accessoryking.com', 'https://accessoryking.com', '2025-05-12', 'active', 1100.00, 'Focuses on mobile and computer accessories.');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_text` varchar(255) DEFAULT NULL,
  `answer_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`answer_id`, `question_id`, `user_id`, `answer_text`, `answer_date`) VALUES
(1, 1, 1, 'Yes, it supports Windows 11.', '2025-12-05'),
(2, 2, 2, 'Yes, it has dual SIM slots.', '2025-11-24'),
(3, 3, 3, 'No, they are not waterproof.', '2025-10-19'),
(4, 1, 1, 'Yes, it supports Windows 11.', '2025-12-05'),
(5, 2, 2, 'Yes, it has dual SIM slots.', '2025-11-24'),
(6, 3, 3, 'No, they are not waterproof.', '2025-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `apikeys`
--

CREATE TABLE `apikeys` (
  `api_key_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `api_key` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `issued_at` datetime NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `status` enum('active','revoked','expired') DEFAULT 'active',
  `permissions` set('read','write','delete','admin') DEFAULT 'read',
  `ip_restrictions` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apirequests`
--

CREATE TABLE `apirequests` (
  `request_id` int(11) NOT NULL,
  `api_key_id` int(11) NOT NULL,
  `request_time` datetime NOT NULL,
  `endpoint` varchar(255) NOT NULL,
  `http_method` enum('GET','POST','PUT','DELETE','PATCH') NOT NULL,
  `status_code` int(11) NOT NULL,
  `response_time_ms` int(11) DEFAULT NULL,
  `client_ip` varchar(45) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apiresponses`
--

CREATE TABLE `apiresponses` (
  `response_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `response_time` datetime NOT NULL,
  `status_code` int(11) NOT NULL,
  `response_body` text DEFAULT NULL,
  `response_size_bytes` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auditlogs`
--

CREATE TABLE `auditlogs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(100) NOT NULL,
  `action_time` datetime NOT NULL,
  `entity_type` varchar(100) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auditlogs`
--

INSERT INTO `auditlogs` (`log_id`, `user_id`, `action_type`, `action_time`, `entity_type`, `entity_id`, `ip_address`, `device_type`, `notes`) VALUES
(1, 101, 'login', '2025-06-05 08:12:15', NULL, NULL, '102.54.22.18', 'Desktop', 'User logged in successfully.'),
(2, 102, 'update_order', '2025-08-18 10:30:05', 'Order', 5105, '41.68.101.77', 'Mobile', 'User updated shipping address.'),
(3, 103, 'delete_product', '2025-12-22 12:50:30', 'Product', 410, '197.33.200.55', 'Desktop', 'Admin deleted discontinued GPU product.'),
(4, 104, 'password_change', '2025-04-05 09:55:00', 'User', 104, '156.211.88.40', 'Tablet', 'User changed password.'),
(5, NULL, 'system_backup', '2025-03-14 23:00:00', NULL, NULL, NULL, NULL, 'Automated database backup completed.'),
(6, 101, 'login', '2025-06-05 08:12:15', NULL, NULL, '102.54.22.18', 'Desktop', 'User logged in successfully.'),
(7, 102, 'update_order', '2025-08-18 10:30:05', 'Order', 5105, '41.68.101.77', 'Mobile', 'User updated shipping address.'),
(8, 103, 'delete_product', '2025-12-22 12:50:30', 'Product', 410, '197.33.200.55', 'Desktop', 'Admin deleted discontinued GPU product.'),
(9, 104, 'password_change', '2025-04-05 09:55:00', 'User', 104, '156.211.88.40', 'Tablet', 'User changed password.'),
(10, NULL, 'system_backup', '2025-03-14 23:00:00', NULL, NULL, NULL, NULL, 'Automated database backup completed.'),
(11, 101, 'login', '2025-06-05 08:12:15', NULL, NULL, '102.54.22.18', 'Desktop', 'User logged in successfully.'),
(12, 102, 'update_order', '2025-08-18 10:30:05', 'Order', 5105, '41.68.101.77', 'Mobile', 'User updated shipping address.'),
(13, 103, 'delete_product', '2025-12-22 12:50:30', 'Product', 410, '197.33.200.55', 'Desktop', 'Admin deleted discontinued GPU product.'),
(14, 104, 'password_change', '2025-04-05 09:55:00', 'User', 104, '156.211.88.40', 'Tablet', 'User changed password.'),
(15, NULL, 'system_backup', '2025-03-14 23:00:00', NULL, NULL, NULL, NULL, 'Automated database backup completed.'),
(16, 101, 'login', '2025-06-05 08:12:15', NULL, NULL, '102.54.22.18', 'Desktop', 'User logged in successfully.'),
(17, 102, 'update_order', '2025-08-18 10:30:05', 'Order', 5105, '41.68.101.77', 'Mobile', 'User updated shipping address.'),
(18, 103, 'delete_product', '2025-12-22 12:50:30', 'Product', 410, '197.33.200.55', 'Desktop', 'Admin deleted discontinued GPU product.'),
(19, 104, 'password_change', '2025-04-05 09:55:00', 'User', 104, '156.211.88.40', 'Tablet', 'User changed password.'),
(20, NULL, 'system_backup', '2025-03-14 23:00:00', NULL, NULL, NULL, NULL, 'Automated database backup completed.'),
(21, 101, 'login', '2025-06-05 08:12:15', NULL, NULL, '102.54.22.18', 'Desktop', 'User logged in successfully.'),
(22, 102, 'update_order', '2025-08-18 10:30:05', 'Order', 5105, '41.68.101.77', 'Mobile', 'User updated shipping address.'),
(23, 103, 'delete_product', '2025-12-22 12:50:30', 'Product', 410, '197.33.200.55', 'Desktop', 'Admin deleted discontinued GPU product.'),
(24, 104, 'password_change', '2025-04-05 09:55:00', 'User', 104, '156.211.88.40', 'Tablet', 'User changed password.'),
(25, NULL, 'system_backup', '2025-03-14 23:00:00', NULL, NULL, NULL, NULL, 'Automated database backup completed.');

-- --------------------------------------------------------

--
-- Table structure for table `backuplogs`
--

CREATE TABLE `backuplogs` (
  `LogID` int(11) NOT NULL,
  `LogMessage` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `backuplogs`
--

INSERT INTO `backuplogs` (`LogID`, `LogMessage`, `CreatedAt`) VALUES
(1, 'Backup completed', '2025-12-01 19:25:41'),
(2, 'Backup failed due to disk error', '2025-12-01 19:25:41'),
(3, 'Backup scheduled', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `bankaccounts`
--

CREATE TABLE `bankaccounts` (
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `iban` varchar(34) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bankaccounts`
--

INSERT INTO `bankaccounts` (`account_id`, `user_id`, `bank_name`, `account_number`, `iban`) VALUES
(1, 1, 'CIB', '1234567890', 'EG123456789012345678901234'),
(2, 2, 'HSBC', '9876543210', 'EG987654321098765432109876'),
(3, 3, 'Banque Misr', '5555555555', 'EG555555555555555555555555');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `name`, `country`) VALUES
(1, 'Samsung', 'South Korea'),
(2, 'Nike', 'USA'),
(3, 'LG', 'South Korea'),
(4, 'Samsung', 'South Korea'),
(5, 'Nike', 'USA'),
(6, 'LG', 'South Korea');

-- --------------------------------------------------------

--
-- Table structure for table `bundleitems`
--

CREATE TABLE `bundleitems` (
  `bundle_item_id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bundleitems`
--

INSERT INTO `bundleitems` (`bundle_item_id`, `bundle_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 1, 1, 1),
(5, 1, 3, 1),
(6, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `campaignads`
--

CREATE TABLE `campaignads` (
  `ad_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `ad_title` varchar(150) NOT NULL,
  `ad_content` text DEFAULT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `platform` enum('Facebook','Instagram','Google','YouTube','TikTok') NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','paused','completed') DEFAULT 'paused'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `campaignads`
--

INSERT INTO `campaignads` (`ad_id`, `campaign_id`, `ad_title`, `ad_content`, `media_url`, `platform`, `budget`, `start_date`, `end_date`, `status`) VALUES
(1, 1, 'Summer Laptop Deals', 'Save up to 15% on top laptops at TechMart.', 'https://techmart.com/media/summer_laptops_banner.jpg', 'Facebook', 5000.00, '2025-06-01', '2025-06-30', 'completed'),
(2, 2, 'Back to School Tablet Promo', 'Affordable tablets for students with great discounts.', 'https://techmart.com/media/school_tablets_ad.mp4', 'Instagram', 3000.00, '2025-08-15', '2025-09-10', 'completed'),
(3, 3, 'New Year Gaming Gear', 'Upgrade your setup with TechMart’s New Year offers.', 'https://techmart.com/media/newyear_gaming.jpg', 'Google', 7500.00, '2025-12-20', '2026-01-05', 'active'),
(4, 3, 'Mega Deals Video Ad', 'Watch our top deals for the new year!', 'https://techmart.com/media/newyear_video.mp4', 'YouTube', 9000.00, '2025-12-22', '2026-01-05', 'active'),
(5, 4, 'Flash Friday GPUs', 'Exclusive one-day discount on graphics cards.', 'https://techmart.com/media/flash_friday_gpu.jpg', 'TikTok', 1500.00, '2025-03-14', '2025-03-14', 'completed'),
(6, 1, 'Summer Laptop Deals', 'Save up to 15% on top laptops at TechMart.', 'https://techmart.com/media/summer_laptops_banner.jpg', 'Facebook', 5000.00, '2025-06-01', '2025-06-30', 'completed'),
(7, 2, 'Back to School Tablet Promo', 'Affordable tablets for students with great discounts.', 'https://techmart.com/media/school_tablets_ad.mp4', 'Instagram', 3000.00, '2025-08-15', '2025-09-10', 'completed'),
(8, 3, 'New Year Gaming Gear', 'Upgrade your setup with TechMart’s New Year offers.', 'https://techmart.com/media/newyear_gaming.jpg', 'Google', 7500.00, '2025-12-20', '2026-01-05', 'active'),
(9, 3, 'Mega Deals Video Ad', 'Watch our top deals for the new year!', 'https://techmart.com/media/newyear_video.mp4', 'YouTube', 9000.00, '2025-12-22', '2026-01-05', 'active'),
(10, 4, 'Flash Friday GPUs', 'Exclusive one-day discount on graphics cards.', 'https://techmart.com/media/flash_friday_gpu.jpg', 'TikTok', 1500.00, '2025-03-14', '2025-03-14', 'completed'),
(11, 1, 'Summer Laptop Deals', 'Save up to 15% on top laptops at TechMart.', 'https://techmart.com/media/summer_laptops_banner.jpg', 'Facebook', 5000.00, '2025-06-01', '2025-06-30', 'completed'),
(12, 2, 'Back to School Tablet Promo', 'Affordable tablets for students with great discounts.', 'https://techmart.com/media/school_tablets_ad.mp4', 'Instagram', 3000.00, '2025-08-15', '2025-09-10', 'completed'),
(13, 3, 'New Year Gaming Gear', 'Upgrade your setup with TechMart’s New Year offers.', 'https://techmart.com/media/newyear_gaming.jpg', 'Google', 7500.00, '2025-12-20', '2026-01-05', 'active'),
(14, 3, 'Mega Deals Video Ad', 'Watch our top deals for the new year!', 'https://techmart.com/media/newyear_video.mp4', 'YouTube', 9000.00, '2025-12-22', '2026-01-05', 'active'),
(15, 4, 'Flash Friday GPUs', 'Exclusive one-day discount on graphics cards.', 'https://techmart.com/media/flash_friday_gpu.jpg', 'TikTok', 1500.00, '2025-03-14', '2025-03-14', 'completed'),
(16, 1, 'Summer Laptop Deals', 'Save up to 15% on top laptops at TechMart.', 'https://techmart.com/media/summer_laptops_banner.jpg', 'Facebook', 5000.00, '2025-06-01', '2025-06-30', 'completed'),
(17, 2, 'Back to School Tablet Promo', 'Affordable tablets for students with great discounts.', 'https://techmart.com/media/school_tablets_ad.mp4', 'Instagram', 3000.00, '2025-08-15', '2025-09-10', 'completed'),
(18, 3, 'New Year Gaming Gear', 'Upgrade your setup with TechMart’s New Year offers.', 'https://techmart.com/media/newyear_gaming.jpg', 'Google', 7500.00, '2025-12-20', '2026-01-05', 'active'),
(19, 3, 'Mega Deals Video Ad', 'Watch our top deals for the new year!', 'https://techmart.com/media/newyear_video.mp4', 'YouTube', 9000.00, '2025-12-22', '2026-01-05', 'active'),
(20, 4, 'Flash Friday GPUs', 'Exclusive one-day discount on graphics cards.', 'https://techmart.com/media/flash_friday_gpu.jpg', 'TikTok', 1500.00, '2025-03-14', '2025-03-14', 'completed'),
(21, 1, 'Summer Laptop Deals', 'Save up to 15% on top laptops at TechMart.', 'https://techmart.com/media/summer_laptops_banner.jpg', 'Facebook', 5000.00, '2025-06-01', '2025-06-30', 'completed'),
(22, 2, 'Back to School Tablet Promo', 'Affordable tablets for students with great discounts.', 'https://techmart.com/media/school_tablets_ad.mp4', 'Instagram', 3000.00, '2025-08-15', '2025-09-10', 'completed'),
(23, 3, 'New Year Gaming Gear', 'Upgrade your setup with TechMart’s New Year offers.', 'https://techmart.com/media/newyear_gaming.jpg', 'Google', 7500.00, '2025-12-20', '2026-01-05', 'active'),
(24, 3, 'Mega Deals Video Ad', 'Watch our top deals for the new year!', 'https://techmart.com/media/newyear_video.mp4', 'YouTube', 9000.00, '2025-12-22', '2026-01-05', 'active'),
(25, 4, 'Flash Friday GPUs', 'Exclusive one-day discount on graphics cards.', 'https://techmart.com/media/flash_friday_gpu.jpg', 'TikTok', 1500.00, '2025-03-14', '2025-03-14', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `campaignclicks`
--

CREATE TABLE `campaignclicks` (
  `click_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `user_ip` varchar(45) DEFAULT NULL,
  `click_time` datetime NOT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') NOT NULL,
  `referrer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `campaignclicks`
--

INSERT INTO `campaignclicks` (`click_id`, `ad_id`, `campaign_id`, `user_ip`, `click_time`, `device_type`, `referrer`) VALUES
(1, 1, 1, '102.54.22.18', '2025-06-05 14:22:10', 'Mobile', 'https://facebook.com/ads'),
(2, 1, 1, '156.203.44.91', '2025-06-10 09:11:45', 'Desktop', 'https://facebook.com/ads'),
(3, 2, 2, '41.68.101.77', '2025-08-20 18:55:30', 'Mobile', 'https://instagram.com/promo'),
(4, 3, 3, '197.33.200.55', '2025-12-22 12:44:03', 'Desktop', 'https://google.com/search'),
(5, 4, 3, '156.211.88.40', '2025-12-28 21:07:18', 'Tablet', 'https://youtube.com/video'),
(6, 1, 1, '102.54.22.18', '2025-06-05 14:22:10', 'Mobile', 'https://facebook.com/ads'),
(7, 1, 1, '156.203.44.91', '2025-06-10 09:11:45', 'Desktop', 'https://facebook.com/ads'),
(8, 2, 2, '41.68.101.77', '2025-08-20 18:55:30', 'Mobile', 'https://instagram.com/promo'),
(9, 3, 3, '197.33.200.55', '2025-12-22 12:44:03', 'Desktop', 'https://google.com/search'),
(10, 4, 3, '156.211.88.40', '2025-12-28 21:07:18', 'Tablet', 'https://youtube.com/video'),
(11, 1, 1, '102.54.22.18', '2025-06-05 14:22:10', 'Mobile', 'https://facebook.com/ads'),
(12, 1, 1, '156.203.44.91', '2025-06-10 09:11:45', 'Desktop', 'https://facebook.com/ads'),
(13, 2, 2, '41.68.101.77', '2025-08-20 18:55:30', 'Mobile', 'https://instagram.com/promo'),
(14, 3, 3, '197.33.200.55', '2025-12-22 12:44:03', 'Desktop', 'https://google.com/search'),
(15, 4, 3, '156.211.88.40', '2025-12-28 21:07:18', 'Tablet', 'https://youtube.com/video'),
(16, 1, 1, '102.54.22.18', '2025-06-05 14:22:10', 'Mobile', 'https://facebook.com/ads'),
(17, 1, 1, '156.203.44.91', '2025-06-10 09:11:45', 'Desktop', 'https://facebook.com/ads'),
(18, 2, 2, '41.68.101.77', '2025-08-20 18:55:30', 'Mobile', 'https://instagram.com/promo'),
(19, 3, 3, '197.33.200.55', '2025-12-22 12:44:03', 'Desktop', 'https://google.com/search'),
(20, 4, 3, '156.211.88.40', '2025-12-28 21:07:18', 'Tablet', 'https://youtube.com/video'),
(21, 1, 1, '102.54.22.18', '2025-06-05 14:22:10', 'Mobile', 'https://facebook.com/ads'),
(22, 1, 1, '156.203.44.91', '2025-06-10 09:11:45', 'Desktop', 'https://facebook.com/ads'),
(23, 2, 2, '41.68.101.77', '2025-08-20 18:55:30', 'Mobile', 'https://instagram.com/promo'),
(24, 3, 3, '197.33.200.55', '2025-12-22 12:44:03', 'Desktop', 'https://google.com/search'),
(25, 4, 3, '156.211.88.40', '2025-12-28 21:07:18', 'Tablet', 'https://youtube.com/video');

-- --------------------------------------------------------

--
-- Table structure for table `campaignconversions`
--

CREATE TABLE `campaignconversions` (
  `conversion_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `conversion_time` datetime NOT NULL,
  `conversion_type` enum('Purchase','Signup','Add_to_Cart') NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `revenue` decimal(12,2) DEFAULT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') NOT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `campaignconversions`
--

INSERT INTO `campaignconversions` (`conversion_id`, `ad_id`, `campaign_id`, `conversion_time`, `conversion_type`, `order_id`, `revenue`, `device_type`, `location`) VALUES
(1, 1, 1, '2025-06-06 15:40:22', 'Purchase', 5011, 18999.00, 'Mobile', 'Cairo'),
(2, 1, 1, '2025-06-09 12:05:10', 'Add_to_Cart', NULL, NULL, 'Desktop', 'Alexandria'),
(3, 2, 2, '2025-08-21 19:44:37', 'Signup', NULL, NULL, 'Mobile', 'Giza'),
(4, 3, 3, '2025-12-23 13:55:18', 'Purchase', 6124, 34999.00, 'Desktop', 'Dubai'),
(5, 4, 3, '2025-12-29 08:25:03', 'Add_to_Cart', NULL, NULL, 'Tablet', 'Riyadh'),
(6, 1, 1, '2025-06-06 15:40:22', 'Purchase', 5011, 18999.00, 'Mobile', 'Cairo'),
(7, 1, 1, '2025-06-09 12:05:10', 'Add_to_Cart', NULL, NULL, 'Desktop', 'Alexandria'),
(8, 2, 2, '2025-08-21 19:44:37', 'Signup', NULL, NULL, 'Mobile', 'Giza'),
(9, 3, 3, '2025-12-23 13:55:18', 'Purchase', 6124, 34999.00, 'Desktop', 'Dubai'),
(10, 4, 3, '2025-12-29 08:25:03', 'Add_to_Cart', NULL, NULL, 'Tablet', 'Riyadh'),
(11, 1, 1, '2025-06-06 15:40:22', 'Purchase', 5011, 18999.00, 'Mobile', 'Cairo'),
(12, 1, 1, '2025-06-09 12:05:10', 'Add_to_Cart', NULL, NULL, 'Desktop', 'Alexandria'),
(13, 2, 2, '2025-08-21 19:44:37', 'Signup', NULL, NULL, 'Mobile', 'Giza'),
(14, 3, 3, '2025-12-23 13:55:18', 'Purchase', 6124, 34999.00, 'Desktop', 'Dubai'),
(15, 4, 3, '2025-12-29 08:25:03', 'Add_to_Cart', NULL, NULL, 'Tablet', 'Riyadh'),
(16, 1, 1, '2025-06-06 15:40:22', 'Purchase', 5011, 18999.00, 'Mobile', 'Cairo'),
(17, 1, 1, '2025-06-09 12:05:10', 'Add_to_Cart', NULL, NULL, 'Desktop', 'Alexandria'),
(18, 2, 2, '2025-08-21 19:44:37', 'Signup', NULL, NULL, 'Mobile', 'Giza'),
(19, 3, 3, '2025-12-23 13:55:18', 'Purchase', 6124, 34999.00, 'Desktop', 'Dubai'),
(20, 4, 3, '2025-12-29 08:25:03', 'Add_to_Cart', NULL, NULL, 'Tablet', 'Riyadh'),
(21, 1, 1, '2025-06-06 15:40:22', 'Purchase', 5011, 18999.00, 'Mobile', 'Cairo'),
(22, 1, 1, '2025-06-09 12:05:10', 'Add_to_Cart', NULL, NULL, 'Desktop', 'Alexandria'),
(23, 2, 2, '2025-08-21 19:44:37', 'Signup', NULL, NULL, 'Mobile', 'Giza'),
(24, 3, 3, '2025-12-23 13:55:18', 'Purchase', 6124, 34999.00, 'Desktop', 'Dubai'),
(25, 4, 3, '2025-12-29 08:25:03', 'Add_to_Cart', NULL, NULL, 'Tablet', 'Riyadh');

-- --------------------------------------------------------

--
-- Table structure for table `campaignimpressions`
--

CREATE TABLE `campaignimpressions` (
  `impression_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `impression_time` datetime NOT NULL,
  `platform` enum('Facebook','Instagram','Google','YouTube','TikTok') NOT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') NOT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `campaignimpressions`
--

INSERT INTO `campaignimpressions` (`impression_id`, `ad_id`, `campaign_id`, `impression_time`, `platform`, `device_type`, `location`) VALUES
(1, 1, 1, '2025-06-05 13:20:45', 'Facebook', 'Mobile', 'Cairo'),
(2, 1, 1, '2025-06-08 16:51:10', 'Facebook', 'Desktop', 'Alexandria'),
(3, 2, 2, '2025-08-18 11:09:30', 'Instagram', 'Mobile', 'Giza'),
(4, 3, 3, '2025-12-22 10:45:12', 'Google', 'Desktop', 'Dubai'),
(5, 4, 3, '2025-12-28 20:15:55', 'YouTube', 'Tablet', 'Riyadh'),
(6, 1, 1, '2025-06-05 13:20:45', 'Facebook', 'Mobile', 'Cairo'),
(7, 1, 1, '2025-06-08 16:51:10', 'Facebook', 'Desktop', 'Alexandria'),
(8, 2, 2, '2025-08-18 11:09:30', 'Instagram', 'Mobile', 'Giza'),
(9, 3, 3, '2025-12-22 10:45:12', 'Google', 'Desktop', 'Dubai'),
(10, 4, 3, '2025-12-28 20:15:55', 'YouTube', 'Tablet', 'Riyadh'),
(11, 1, 1, '2025-06-05 13:20:45', 'Facebook', 'Mobile', 'Cairo'),
(12, 1, 1, '2025-06-08 16:51:10', 'Facebook', 'Desktop', 'Alexandria'),
(13, 2, 2, '2025-08-18 11:09:30', 'Instagram', 'Mobile', 'Giza'),
(14, 3, 3, '2025-12-22 10:45:12', 'Google', 'Desktop', 'Dubai'),
(15, 4, 3, '2025-12-28 20:15:55', 'YouTube', 'Tablet', 'Riyadh'),
(16, 1, 1, '2025-06-05 13:20:45', 'Facebook', 'Mobile', 'Cairo'),
(17, 1, 1, '2025-06-08 16:51:10', 'Facebook', 'Desktop', 'Alexandria'),
(18, 2, 2, '2025-08-18 11:09:30', 'Instagram', 'Mobile', 'Giza'),
(19, 3, 3, '2025-12-22 10:45:12', 'Google', 'Desktop', 'Dubai'),
(20, 4, 3, '2025-12-28 20:15:55', 'YouTube', 'Tablet', 'Riyadh'),
(21, 1, 1, '2025-06-05 13:20:45', 'Facebook', 'Mobile', 'Cairo'),
(22, 1, 1, '2025-06-08 16:51:10', 'Facebook', 'Desktop', 'Alexandria'),
(23, 2, 2, '2025-08-18 11:09:30', 'Instagram', 'Mobile', 'Giza'),
(24, 3, 3, '2025-12-22 10:45:12', 'Google', 'Desktop', 'Dubai'),
(25, 4, 3, '2025-12-28 20:15:55', 'YouTube', 'Tablet', 'Riyadh');

-- --------------------------------------------------------

--
-- Table structure for table `campaignreports`
--

CREATE TABLE `campaignreports` (
  `report_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `total_clicks` int(11) DEFAULT 0,
  `total_impressions` int(11) DEFAULT 0,
  `total_conversions` int(11) DEFAULT 0,
  `revenue_generated` decimal(12,2) DEFAULT 0.00,
  `report_date` date NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `campaignreports`
--

INSERT INTO `campaignreports` (`report_id`, `campaign_id`, `total_clicks`, `total_impressions`, `total_conversions`, `revenue_generated`, `report_date`, `notes`) VALUES
(1, 1, 4500, 120000, 320, 185000.00, '2025-06-30', 'End-of-campaign report for Summer Sale.'),
(2, 2, 2900, 90000, 210, 95000.00, '2025-09-10', 'Back to School promo performed well with tablets.'),
(3, 3, 7200, 200000, 480, 320000.00, '2026-01-05', 'New Year campaign exceeded expectations.'),
(4, 3, 1800, 65000, 95, 52000.00, '2025-12-28', 'Mid-campaign performance check.'),
(5, 4, 1100, 45000, 60, 30000.00, '2025-03-14', 'Flash Friday one-day event performed strongly.'),
(6, 1, 4500, 120000, 320, 185000.00, '2025-06-30', 'End-of-campaign report for Summer Sale.'),
(7, 2, 2900, 90000, 210, 95000.00, '2025-09-10', 'Back to School promo performed well with tablets.'),
(8, 3, 7200, 200000, 480, 320000.00, '2026-01-05', 'New Year campaign exceeded expectations.'),
(9, 3, 1800, 65000, 95, 52000.00, '2025-12-28', 'Mid-campaign performance check.'),
(10, 4, 1100, 45000, 60, 30000.00, '2025-03-14', 'Flash Friday one-day event performed strongly.'),
(11, 1, 4500, 120000, 320, 185000.00, '2025-06-30', 'End-of-campaign report for Summer Sale.'),
(12, 2, 2900, 90000, 210, 95000.00, '2025-09-10', 'Back to School promo performed well with tablets.'),
(13, 3, 7200, 200000, 480, 320000.00, '2026-01-05', 'New Year campaign exceeded expectations.'),
(14, 3, 1800, 65000, 95, 52000.00, '2025-12-28', 'Mid-campaign performance check.'),
(15, 4, 1100, 45000, 60, 30000.00, '2025-03-14', 'Flash Friday one-day event performed strongly.'),
(16, 1, 4500, 120000, 320, 185000.00, '2025-06-30', 'End-of-campaign report for Summer Sale.'),
(17, 2, 2900, 90000, 210, 95000.00, '2025-09-10', 'Back to School promo performed well with tablets.'),
(18, 3, 7200, 200000, 480, 320000.00, '2026-01-05', 'New Year campaign exceeded expectations.'),
(19, 3, 1800, 65000, 95, 52000.00, '2025-12-28', 'Mid-campaign performance check.'),
(20, 4, 1100, 45000, 60, 30000.00, '2025-03-14', 'Flash Friday one-day event performed strongly.'),
(21, 1, 4500, 120000, 320, 185000.00, '2025-06-30', 'End-of-campaign report for Summer Sale.'),
(22, 2, 2900, 90000, 210, 95000.00, '2025-09-10', 'Back to School promo performed well with tablets.'),
(23, 3, 7200, 200000, 480, 320000.00, '2026-01-05', 'New Year campaign exceeded expectations.'),
(24, 3, 1800, 65000, 95, 52000.00, '2025-12-28', 'Mid-campaign performance check.'),
(25, 4, 1100, 45000, 60, 30000.00, '2025-03-14', 'Flash Friday one-day event performed strongly.');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `campaign_id` int(11) NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `status` enum('active','inactive','expired') DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`campaign_id`, `campaign_name`, `description`, `start_date`, `end_date`, `discount_type`, `discount_value`, `status`) VALUES
(1, 'TechMart Summer Sale', 'Seasonal discount on laptops and gaming accessories.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(2, 'Back to School Promo', 'Great deals for students on tablets and budget laptops.', '2025-08-15', '2025-09-10', 'fixed', 200.00, 'expired'),
(3, 'New Year Mega Deals', 'Massive discounts on all categories including PCs and monitors.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(4, 'TechMart Flash Friday', '24-hour flash sale on gaming hardware.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(5, 'Accessories Bundle Offer', 'Buy 2 accessories and get a fixed discount.', '2025-04-01', '2025-04-15', 'fixed', 50.00, 'inactive'),
(6, 'TechMart Summer Sale', 'Seasonal discount on laptops and gaming accessories.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(7, 'Back to School Promo', 'Great deals for students on tablets and budget laptops.', '2025-08-15', '2025-09-10', 'fixed', 200.00, 'expired'),
(8, 'New Year Mega Deals', 'Massive discounts on all categories including PCs and monitors.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(9, 'TechMart Flash Friday', '24-hour flash sale on gaming hardware.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(10, 'Accessories Bundle Offer', 'Buy 2 accessories and get a fixed discount.', '2025-04-01', '2025-04-15', 'fixed', 50.00, 'inactive'),
(11, 'TechMart Summer Sale', 'Seasonal discount on laptops and gaming accessories.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(12, 'Back to School Promo', 'Great deals for students on tablets and budget laptops.', '2025-08-15', '2025-09-10', 'fixed', 200.00, 'expired'),
(13, 'New Year Mega Deals', 'Massive discounts on all categories including PCs and monitors.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(14, 'TechMart Flash Friday', '24-hour flash sale on gaming hardware.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(15, 'Accessories Bundle Offer', 'Buy 2 accessories and get a fixed discount.', '2025-04-01', '2025-04-15', 'fixed', 50.00, 'inactive'),
(16, 'TechMart Summer Sale', 'Seasonal discount on laptops and gaming accessories.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(17, 'Back to School Promo', 'Great deals for students on tablets and budget laptops.', '2025-08-15', '2025-09-10', 'fixed', 200.00, 'expired'),
(18, 'New Year Mega Deals', 'Massive discounts on all categories including PCs and monitors.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(19, 'TechMart Flash Friday', '24-hour flash sale on gaming hardware.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(20, 'Accessories Bundle Offer', 'Buy 2 accessories and get a fixed discount.', '2025-04-01', '2025-04-15', 'fixed', 50.00, 'inactive'),
(21, 'TechMart Summer Sale', 'Seasonal discount on laptops and gaming accessories.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(22, 'Back to School Promo', 'Great deals for students on tablets and budget laptops.', '2025-08-15', '2025-09-10', 'fixed', 200.00, 'expired'),
(23, 'New Year Mega Deals', 'Massive discounts on all categories including PCs and monitors.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(24, 'TechMart Flash Friday', '24-hour flash sale on gaming hardware.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(25, 'Accessories Bundle Offer', 'Buy 2 accessories and get a fixed discount.', '2025-04-01', '2025-04-15', 'fixed', 50.00, 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `cancelreasons`
--

CREATE TABLE `cancelreasons` (
  `reason_id` int(11) NOT NULL,
  `reason_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cancelreasons`
--

INSERT INTO `cancelreasons` (`reason_id`, `reason_text`) VALUES
(1, 'Ordered by mistake'),
(2, 'Found a better price elsewhere'),
(3, 'Delivery was too slow'),
(4, 'Item no longer needed'),
(5, 'Payment processing issue');

-- --------------------------------------------------------

--
-- Table structure for table `cancelrequests`
--

CREATE TABLE `cancelrequests` (
  `cancel_request_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cancelrequests`
--

INSERT INTO `cancelrequests` (`cancel_request_id`, `order_id`, `user_id`, `request_date`, `status`) VALUES
(1, 1101, 2101, '2025-02-09 08:15:00', 'Pending'),
(2, 1102, 2102, '2025-02-10 11:00:00', 'Approved'),
(3, 1103, 2103, '2025-02-11 14:20:00', 'Rejected'),
(4, 1104, 2104, '2025-02-12 16:50:00', 'Pending'),
(5, 1105, 2105, '2025-02-13 17:40:00', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cartitems`
--

INSERT INTO `cartitems` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'Electronics', 'Devices and gadgets'),
(2, 'Fashion', 'Clothing and accessories'),
(3, 'Home Appliances', 'Appliances for household use'),
(4, 'Electronics', 'Devices and gadgets'),
(5, 'Fashion', 'Clothing and accessories'),
(6, 'Home Appliances', 'Appliances for household use');

-- --------------------------------------------------------

--
-- Table structure for table `contactnumbers`
--

CREATE TABLE `contactnumbers` (
  `contact_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contactnumbers`
--

INSERT INTO `contactnumbers` (`contact_id`, `user_id`, `phone_number`, `type`) VALUES
(1, 1, '+201234567890', 'Mobile'),
(2, 2, '+201098765432', 'Home'),
(3, 3, '+201112223344', 'Work');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `usage_limit` int(11) DEFAULT 1,
  `min_order_value` decimal(10,2) DEFAULT 0.00,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','expired','inactive') DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `coupon_code`, `description`, `discount_type`, `discount_value`, `usage_limit`, `min_order_value`, `start_date`, `end_date`, `status`) VALUES
(1, 'TECH15', '15% off on all laptops at TechMart.', 'percentage', 15.00, 1, 0.00, '2025-06-01', '2025-06-30', 'expired'),
(2, 'BACK2SCHOOL50', 'EGP 50 discount for students on selected tablets.', 'fixed', 50.00, 2, 500.00, '2025-08-15', '2025-09-10', 'expired'),
(3, 'NEWYEAR20', '20% off store-wide for New Year.', 'percentage', 20.00, 1, 1000.00, '2025-12-20', '2026-01-05', 'active'),
(4, 'FLASH10', '10% off on gaming accessories for 24 hours.', 'percentage', 10.00, 1, 0.00, '2025-03-14', '2025-03-14', 'expired'),
(5, 'ACCESSORY80', 'EGP 80 discount when buying 2 accessories.', 'fixed', 80.00, 3, 300.00, '2025-04-01', '2025-04-15', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `couponusage`
--

CREATE TABLE `couponusage` (
  `usage_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `usage_date` datetime NOT NULL,
  `discount_applied` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `couponusage`
--

INSERT INTO `couponusage` (`usage_id`, `coupon_id`, `user_id`, `order_id`, `usage_date`, `discount_applied`) VALUES
(1, 1, 101, 5001, '2025-06-15 14:22:10', 750.00),
(2, 2, 102, 5105, '2025-08-20 09:44:31', 50.00),
(3, 3, 103, 6124, '2025-12-22 11:05:55', 1200.00),
(4, 3, 104, 6127, '2025-12-23 18:17:40', 850.00),
(5, 5, 105, 4503, '2025-04-05 16:11:09', 80.00),
(6, 1, 101, 5001, '2025-06-15 14:22:10', 750.00),
(7, 2, 102, 5105, '2025-08-20 09:44:31', 50.00),
(8, 3, 103, 6124, '2025-12-22 11:05:55', 1200.00),
(9, 3, 104, 6127, '2025-12-23 18:17:40', 850.00),
(10, 5, 105, 4503, '2025-04-05 16:11:09', 80.00),
(11, 1, 101, 5001, '2025-06-15 14:22:10', 750.00),
(12, 2, 102, 5105, '2025-08-20 09:44:31', 50.00),
(13, 3, 103, 6124, '2025-12-22 11:05:55', 1200.00),
(14, 3, 104, 6127, '2025-12-23 18:17:40', 850.00),
(15, 5, 105, 4503, '2025-04-05 16:11:09', 80.00),
(16, 1, 101, 5001, '2025-06-15 14:22:10', 750.00),
(17, 2, 102, 5105, '2025-08-20 09:44:31', 50.00),
(18, 3, 103, 6124, '2025-12-22 11:05:55', 1200.00),
(19, 3, 104, 6127, '2025-12-23 18:17:40', 850.00),
(20, 5, 105, 4503, '2025-04-05 16:11:09', 80.00),
(21, 1, 101, 5001, '2025-06-15 14:22:10', 750.00),
(22, 2, 102, 5105, '2025-08-20 09:44:31', 50.00),
(23, 3, 103, 6124, '2025-12-22 11:05:55', 1200.00),
(24, 3, 104, 6127, '2025-12-23 18:17:40', 850.00),
(25, 5, 105, 4503, '2025-04-05 16:11:09', 80.00);

-- --------------------------------------------------------

--
-- Table structure for table `creditcards`
--

CREATE TABLE `creditcards` (
  `card_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `cvv` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `creditcards`
--

INSERT INTO `creditcards` (`card_id`, `user_id`, `card_number`, `expiry_date`, `cvv`) VALUES
(1, 1, '4111111111111111', '2027-12-01', '123'),
(2, 2, '5500000000000004', '2026-11-01', '456'),
(3, 3, '340000000000009', '2028-10-01', '789');

-- --------------------------------------------------------

--
-- Table structure for table `crosssellproducts`
--

CREATE TABLE `crosssellproducts` (
  `cross_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cross_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `crosssellproducts`
--

INSERT INTO `crosssellproducts` (`cross_id`, `product_id`, `cross_product_id`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 2),
(4, 1, 3),
(5, 2, 1),
(6, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`) VALUES
(1, 'Mariam Abdel Rahman', 'mariam.ar@example.com'),
(2, 'Youssef Naguib', 'youssef.n@example.com'),
(3, 'Dina Fouad', 'dina.fouad@example.com'),
(4, 'Karim Hosny', 'karim.h@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `customsdeclarations`
--

CREATE TABLE `customsdeclarations` (
  `declaration_id` int(11) NOT NULL,
  `tracking_id` int(11) NOT NULL,
  `declaration_number` varchar(50) NOT NULL,
  `shipment_value` decimal(12,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'USD',
  `items_description` text DEFAULT NULL,
  `country_of_origin` varchar(100) DEFAULT NULL,
  `status` enum('submitted','under_review','approved','rejected','released') DEFAULT 'submitted',
  `submission_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customsdeclarations`
--

INSERT INTO `customsdeclarations` (`declaration_id`, `tracking_id`, `declaration_number`, `shipment_value`, `currency`, `items_description`, `country_of_origin`, `status`, `submission_date`) VALUES
(1, 2, 'EG-CUST-2024-00891', 15000.00, 'USD', 'Electronics: 50x Smartphone units', 'China', 'under_review', '2024-11-30 10:00:00'),
(2, 4, 'EG-CUST-2024-00892', 8500.00, 'USD', 'Textile: Cotton fabrics 200kg', 'Turkey', 'approved', '2024-11-28 09:00:00'),
(3, 5, 'EG-CUST-2024-00893', 22000.00, 'EUR', 'Machinery: Industrial parts', 'Germany', 'released', '2024-11-25 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customslogs`
--

CREATE TABLE `customslogs` (
  `log_id` int(11) NOT NULL,
  `declaration_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `log_type` enum('status_update','document_request','inspection','system_note') NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customslogs`
--

INSERT INTO `customslogs` (`log_id`, `declaration_id`, `log_time`, `log_type`, `message`) VALUES
(1, 1, '2024-11-30 08:15:00', 'status_update', 'Declaration submitted successfully'),
(2, 1, '2024-11-30 10:00:00', 'document_request', 'Additional certificate of origin required'),
(3, 2, '2024-11-28 12:30:00', 'inspection', 'Physical inspection completed - No issues found'),
(4, 3, '2024-11-26 14:00:00', 'status_update', 'Goods released for delivery');

-- --------------------------------------------------------

--
-- Table structure for table `customspayments`
--

CREATE TABLE `customspayments` (
  `payment_id` int(11) NOT NULL,
  `declaration_id` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_type` enum('duty','tax','inspection_fee','other') NOT NULL,
  `method` enum('bank_transfer','online','cash') DEFAULT 'online'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customspayments`
--

INSERT INTO `customspayments` (`payment_id`, `declaration_id`, `payment_date`, `amount`, `payment_type`, `method`) VALUES
(1, 1, '2024-11-30 15:30:00', 2250.00, 'duty', 'bank_transfer'),
(2, 2, '2024-11-28 11:00:00', 1275.00, 'duty', 'online'),
(3, 2, '2024-11-28 11:05:00', 425.00, 'inspection_fee', 'online'),
(4, 3, '2024-11-26 10:00:00', 3300.00, 'tax', 'bank_transfer');

-- --------------------------------------------------------

--
-- Table structure for table `databackups`
--

CREATE TABLE `databackups` (
  `BackupID` int(11) NOT NULL,
  `BackupType` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `databackups`
--

INSERT INTO `databackups` (`BackupID`, `BackupType`, `CreatedAt`) VALUES
(1, 'Full System Backup', '2025-12-01 19:25:41'),
(2, 'User Data Backup', '2025-12-01 19:25:41'),
(3, 'Logs Backup', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryagents`
--

CREATE TABLE `deliveryagents` (
  `agent_id` int(11) NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `deliveryagents`
--

INSERT INTO `deliveryagents` (`agent_id`, `agent_name`, `phone`, `vehicle_type`, `active`) VALUES
(1, 'Michael Johnson', '+1-555-9000', 'Motorcycle', 1),
(2, 'Sara Ahmed', '+20-111-888-222', 'Car', 1),
(3, 'David Brown', '+1-555-7777', 'Van', 1),
(4, 'Emily White', '+44-20-5000-1111', 'Bicycle', 0),
(5, 'Omar Khaled', '+20-120-333-444', 'Pickup Truck', 1),
(6, 'Michael Johnson', '+1-555-9000', 'Motorcycle', 1),
(7, 'Sara Ahmed', '+20-111-888-222', 'Car', 1),
(8, 'David Brown', '+1-555-7777', 'Van', 1),
(9, 'Emily White', '+44-20-5000-1111', 'Bicycle', 0),
(10, 'Omar Khaled', '+20-120-333-444', 'Pickup Truck', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deliveryslots`
--

CREATE TABLE `deliveryslots` (
  `slot_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `deliveryslots`
--

INSERT INTO `deliveryslots` (`slot_id`, `agent_id`, `delivery_date`, `start_time`, `end_time`, `is_available`) VALUES
(1, 1, '2025-01-15', '09:00:00', '11:00:00', 1),
(2, 2, '2025-01-15', '11:00:00', '13:00:00', 0),
(3, 3, '2025-01-16', '14:00:00', '16:00:00', 1),
(4, 1, '2025-01-16', '16:00:00', '18:00:00', 1),
(5, 4, '2025-01-17', '08:00:00', '10:00:00', 0),
(6, 1, '2025-01-15', '09:00:00', '11:00:00', 1),
(7, 2, '2025-01-15', '11:00:00', '13:00:00', 0),
(8, 3, '2025-01-16', '14:00:00', '16:00:00', 1),
(9, 1, '2025-01-16', '16:00:00', '18:00:00', 1),
(10, 4, '2025-01-17', '08:00:00', '10:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `encryptionkeys`
--

CREATE TABLE `encryptionkeys` (
  `KeyID` int(11) NOT NULL,
  `KeyName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `encryptionkeys`
--

INSERT INTO `encryptionkeys` (`KeyID`, `KeyName`, `CreatedAt`) VALUES
(1, 'Master Encryption Key', '2025-12-01 19:25:41'),
(2, 'Backup Key', '2025-12-01 19:25:41'),
(3, 'Temporary Session Key', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `encryptionlogs`
--

CREATE TABLE `encryptionlogs` (
  `LogID` int(11) NOT NULL,
  `Action` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `encryptionlogs`
--

INSERT INTO `encryptionlogs` (`LogID`, `Action`, `CreatedAt`) VALUES
(1, 'Key rotation started', '2025-12-01 19:25:41'),
(2, 'Key rotated successfully', '2025-12-01 19:25:41'),
(3, 'Decryption request logged', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `exchangeitems`
--

CREATE TABLE `exchangeitems` (
  `exchange_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `original_item_id` int(11) NOT NULL,
  `new_item_id` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `exchange_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchanges`
--

CREATE TABLE `exchanges` (
  `exchange_id` int(11) NOT NULL,
  `return_item_id` int(11) NOT NULL,
  `new_product_name` varchar(100) NOT NULL,
  `exchange_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exchanges`
--

INSERT INTO `exchanges` (`exchange_id`, `return_item_id`, `new_product_name`, `exchange_date`, `status`, `notes`) VALUES
(1, 1, 'Wireless Mouse - Replacement', '2025-01-22', 'Completed', 'Shipped to customer'),
(2, 2, 'T-Shirt - Large', '2025-01-23', 'Processing', 'Awaiting stock'),
(3, 4, 'Laptop Charger Model X', '2025-01-25', 'Completed', 'Delivered'),
(4, 5, 'Coffee Mug - Blue Edition', '2025-01-26', 'Pending', 'Customer requested color change'),
(5, 3, 'Bluetooth Speaker - New Model', '2025-01-24', 'Rejected', 'Not eligible');

-- --------------------------------------------------------

--
-- Table structure for table `firewalllogs`
--

CREATE TABLE `firewalllogs` (
  `log_id` int(11) NOT NULL,
  `log_time` datetime NOT NULL,
  `source_ip` varchar(45) NOT NULL,
  `destination_ip` varchar(45) NOT NULL,
  `source_port` int(11) DEFAULT NULL,
  `destination_port` int(11) DEFAULT NULL,
  `protocol` enum('TCP','UDP','ICMP','Other') NOT NULL,
  `action` enum('allowed','blocked','dropped') NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `severity` enum('low','medium','high','critical') DEFAULT 'medium',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `firewalllogs`
--

INSERT INTO `firewalllogs` (`log_id`, `log_time`, `source_ip`, `destination_ip`, `source_port`, `destination_port`, `protocol`, `action`, `rule_id`, `severity`, `notes`) VALUES
(1, '2025-06-05 08:12:00', '203.0.113.45', '10.0.0.10', 44321, 443, 'TCP', 'allowed', 101, 'low', 'HTTPS request allowed.'),
(2, '2025-08-18 10:15:05', '198.51.100.23', '10.0.0.15', 53421, 22, 'TCP', 'blocked', 202, 'high', 'Unauthorized SSH attempt blocked.'),
(3, '2025-12-22 12:50:30', '192.0.2.55', '10.0.0.20', 12345, 80, 'TCP', 'allowed', 101, 'low', 'HTTP request allowed.'),
(4, '2025-04-05 09:55:00', '203.0.113.88', '10.0.0.25', NULL, NULL, 'ICMP', 'blocked', 303, 'medium', 'Ping request blocked.'),
(5, '2025-03-14 23:00:00', '198.51.100.99', '10.0.0.30', 60000, 443, 'TCP', 'dropped', 404, 'critical', 'Potential DDoS traffic dropped.');

-- --------------------------------------------------------

--
-- Table structure for table `firewallrules`
--

CREATE TABLE `firewallrules` (
  `RuleID` int(11) NOT NULL,
  `RuleName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `firewallrules`
--

INSERT INTO `firewallrules` (`RuleID`, `RuleName`, `CreatedAt`) VALUES
(1, 'Block suspicious IPs', '2025-12-01 19:25:41'),
(2, 'Allow admin-only ports', '2025-12-01 19:25:41'),
(3, 'Limit failed login attempts', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `fraudchecks`
--

CREATE TABLE `fraudchecks` (
  `fraud_check_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `risk_score` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `checked_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fraudchecks`
--

INSERT INTO `fraudchecks` (`fraud_check_id`, `order_id`, `risk_score`, `status`, `checked_at`) VALUES
(1, 1101, 15, 'Low', '2025-02-09 06:30:00'),
(2, 1102, 42, 'Medium', '2025-02-10 09:15:00'),
(3, 1103, 75, 'High', '2025-02-11 12:50:00'),
(4, 1104, 25, 'Low', '2025-02-12 14:45:00'),
(5, 1105, 92, 'Critical', '2025-02-13 16:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `gatewayerrors`
--

CREATE TABLE `gatewayerrors` (
  `error_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `error_code` varchar(50) DEFAULT NULL,
  `error_message` text NOT NULL,
  `error_time` datetime NOT NULL,
  `severity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gatewayerrors`
--

INSERT INTO `gatewayerrors` (`error_id`, `transaction_id`, `error_code`, `error_message`, `error_time`, `severity`) VALUES
(1, 3, 'ERR-DECLINE', 'Payment declined by bank', '2025-01-11 11:01:22', 'High'),
(2, 3, 'CARD-001', 'Invalid CVV', '2025-01-11 11:01:25', 'Medium'),
(3, 2, 'NET-408', 'Gateway request timeout', '2025-01-11 09:22:05', 'Low'),
(4, 4, 'WARN-01', 'Minor delay in gateway sync', '2025-01-12 17:31:20', 'Low'),
(5, 5, 'SYS-REF', 'Automatic refund log entry', '2025-01-12 20:11:30', 'Info'),
(6, 3, 'ERR-DECLINE', 'Payment declined by bank', '2025-01-11 11:01:22', 'High'),
(7, 3, 'CARD-001', 'Invalid CVV', '2025-01-11 11:01:25', 'Medium'),
(8, 2, 'NET-408', 'Gateway request timeout', '2025-01-11 09:22:05', 'Low'),
(9, 4, 'WARN-01', 'Minor delay in gateway sync', '2025-01-12 17:31:20', 'Low'),
(10, 5, 'SYS-REF', 'Automatic refund log entry', '2025-01-12 20:11:30', 'Info');

-- --------------------------------------------------------

--
-- Table structure for table `gatewaylogs`
--

CREATE TABLE `gatewaylogs` (
  `log_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `log_timestamp` datetime NOT NULL,
  `message` text DEFAULT NULL,
  `log_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gatewaylogs`
--

INSERT INTO `gatewaylogs` (`log_id`, `transaction_id`, `log_timestamp`, `message`, `log_level`) VALUES
(1, 1, '2025-01-10 13:46:10', 'Transaction sent to gateway', 'INFO'),
(2, 1, '2025-01-10 13:46:11', 'Gateway approved payment', 'SUCCESS'),
(3, 3, '2025-01-11 11:01:20', 'Card declined by issuer', 'ERROR'),
(4, 2, '2025-01-11 09:21:40', 'Awaiting PayPal confirmation', 'INFO'),
(5, 5, '2025-01-12 20:11:10', 'Refund processed successfully', 'SUCCESS'),
(6, 1, '2025-01-10 13:46:10', 'Transaction sent to gateway', 'INFO'),
(7, 1, '2025-01-10 13:46:11', 'Gateway approved payment', 'SUCCESS'),
(8, 3, '2025-01-11 11:01:20', 'Card declined by issuer', 'ERROR'),
(9, 2, '2025-01-11 09:21:40', 'Awaiting PayPal confirmation', 'INFO'),
(10, 5, '2025-01-12 20:11:10', 'Refund processed successfully', 'SUCCESS');

-- --------------------------------------------------------

--
-- Table structure for table `gdprlogs`
--

CREATE TABLE `gdprlogs` (
  `LogID` int(11) NOT NULL,
  `LogMessage` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gdprlogs`
--

INSERT INTO `gdprlogs` (`LogID`, `LogMessage`, `CreatedAt`) VALUES
(1, 'GDPR request processed', '2025-12-01 19:25:41'),
(2, 'User data anonymized', '2025-12-01 19:25:41'),
(3, 'Compliance check completed', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `gdprreports`
--

CREATE TABLE `gdprreports` (
  `ReportID` int(11) NOT NULL,
  `ReportName` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gdprreports`
--

INSERT INTO `gdprreports` (`ReportID`, `ReportName`, `CreatedAt`) VALUES
(1, 'Annual GDPR Compliance Report', '2025-12-01 19:25:41'),
(2, 'User Data Activity Report', '2025-12-01 19:25:41'),
(3, 'Privacy Audit Report', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `gdprrequests`
--

CREATE TABLE `gdprrequests` (
  `RequestID` int(11) NOT NULL,
  `RequestType` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gdprrequests`
--

INSERT INTO `gdprrequests` (`RequestID`, `RequestType`, `CreatedAt`) VALUES
(1, 'Delete User Data', '2025-12-01 19:25:41'),
(2, 'Export User Data', '2025-12-01 19:25:41'),
(3, 'Access User Data', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `giftcards`
--

CREATE TABLE `giftcards` (
  `giftcard_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `issued_to_email` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `issue_date` datetime DEFAULT current_timestamp(),
  `expiry_date` datetime DEFAULT NULL,
  `status` enum('active','redeemed','expired','cancelled') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `giftcards`
--

INSERT INTO `giftcards` (`giftcard_id`, `code`, `issued_to_email`, `amount`, `balance`, `issue_date`, `expiry_date`, `status`) VALUES
(1, 'GC-2024-ABC123XYZ', 'gift@example.com', 500.00, 500.00, '2024-11-01 10:00:00', '2025-11-01 23:59:59', 'active'),
(2, 'GC-2024-DEF456UVW', 'receiver@example.com', 1000.00, 350.00, '2024-10-15 14:30:00', '2025-10-15 23:59:59', 'active'),
(3, 'GC-2024-GHI789RST', 'client@example.com', 250.00, 0.00, '2024-09-20 09:00:00', '2025-09-20 23:59:59', 'redeemed'),
(4, 'GC-2023-JKL012MNO', 'old@example.com', 300.00, 300.00, '2023-11-30 12:00:00', '2024-11-30 23:59:59', 'expired');

-- --------------------------------------------------------

--
-- Table structure for table `giftcardtransactions`
--

CREATE TABLE `giftcardtransactions` (
  `transaction_id` int(11) NOT NULL,
  `giftcard_id` int(11) NOT NULL,
  `transaction_date` datetime DEFAULT current_timestamp(),
  `transaction_type` enum('redeem','top_up','adjustment') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `order_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `giftcardtransactions`
--

INSERT INTO `giftcardtransactions` (`transaction_id`, `giftcard_id`, `transaction_date`, `transaction_type`, `amount`, `order_id`) VALUES
(1, 2, '2024-10-20 11:00:00', 'redeem', 150.00, 'ORD-2024-001100'),
(2, 2, '2024-11-05 15:30:00', 'redeem', 500.00, 'ORD-2024-001201'),
(3, 3, '2024-10-01 10:00:00', 'redeem', 250.00, 'ORD-2024-000950'),
(4, 2, '2024-11-25 09:00:00', 'top_up', 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventorylogs`
--

CREATE TABLE `inventorylogs` (
  `log_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `quantity_change` int(11) DEFAULT NULL,
  `log_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inventorylogs`
--

INSERT INTO `inventorylogs` (`log_id`, `product_id`, `action`, `quantity_change`, `log_date`) VALUES
(1, 1, 'Added', 5, '2025-12-01'),
(2, 2, 'Removed', -2, '2025-11-20'),
(3, 3, 'Adjusted', -10, '2025-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `loginhistory`
--

CREATE TABLE `loginhistory` (
  `login_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_date` date DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `loginhistory`
--

INSERT INTO `loginhistory` (`login_id`, `user_id`, `login_date`, `ip_address`) VALUES
(1, 1, '2025-12-01', '192.168.1.1'),
(2, 2, '2025-11-20', '192.168.1.2'),
(3, 3, '2025-10-15', '192.168.1.3');

-- --------------------------------------------------------

--
-- Table structure for table `logisticsagents`
--

CREATE TABLE `logisticsagents` (
  `agent_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticsagents`
--

INSERT INTO `logisticsagents` (`agent_id`, `partner_id`, `agent_name`, `phone`, `email`, `region`) VALUES
(1, 1, 'Khaled Farouk', '+20-100-123-4567', 'khaled.f@fastship.eg', 'Cairo Metro'),
(2, 1, 'Nadia Samir', '+20-100-234-5678', 'nadia.s@fastship.eg', 'Giza District'),
(3, 2, 'Omar Youssef', '+20-101-345-6789', 'omar.y@egyptexpress.com', 'Delta Region'),
(4, 3, 'Layla Ahmed', '+20-102-456-7890', 'layla.a@deltafreight.eg', 'Alexandria Port'),
(5, 4, 'Hassan Mustafa', '+20-111-567-8901', 'hassan.m@niletransport.eg', 'Upper Egypt');

-- --------------------------------------------------------

--
-- Table structure for table `logisticscontracts`
--

CREATE TABLE `logisticscontracts` (
  `contract_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `contract_start` date NOT NULL,
  `contract_end` date DEFAULT NULL,
  `service_level` varchar(100) DEFAULT NULL,
  `price_per_kg` decimal(10,2) DEFAULT NULL,
  `contract_status` enum('active','expired','terminated') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticscontracts`
--

INSERT INTO `logisticscontracts` (`contract_id`, `partner_id`, `contract_start`, `contract_end`, `service_level`, `price_per_kg`, `contract_status`) VALUES
(1, 1, '2024-01-15', '2025-01-14', 'Express Delivery - 24hrs', 8.50, 'active'),
(2, 2, '2023-06-01', '2024-12-31', 'Standard SLA - 3-5 days', 5.75, 'active'),
(3, 3, '2024-03-10', '2025-03-09', 'Premium Express - Same Day', 12.00, 'active'),
(4, 4, '2023-11-20', '2024-11-19', 'Economy Service - 7 days', 3.50, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `logisticsevents`
--

CREATE TABLE `logisticsevents` (
  `event_id` int(11) NOT NULL,
  `tracking_id` int(11) NOT NULL,
  `event_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `location` varchar(150) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticsevents`
--

INSERT INTO `logisticsevents` (`event_id`, `tracking_id`, `event_time`, `location`, `description`) VALUES
(1, 1, '2024-11-28 06:30:00', 'Cairo Distribution Center', 'Package picked up from sender'),
(2, 1, '2024-11-28 12:45:00', 'Giza Hub', 'In transit to destination'),
(3, 1, '2024-11-29 08:20:00', 'Delivery Address, Nasr City', 'Successfully delivered to recipient'),
(4, 2, '2024-11-30 07:15:00', 'Alexandria Port', 'Customs clearance in progress'),
(5, 3, '2024-12-01 05:00:00', 'Delta Sorting Facility', 'Out for delivery - Assigned to driver');

-- --------------------------------------------------------

--
-- Table structure for table `logisticsinvoices`
--

CREATE TABLE `logisticsinvoices` (
  `invoice_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('paid','unpaid','overdue') DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticsinvoices`
--

INSERT INTO `logisticsinvoices` (`invoice_id`, `contract_id`, `invoice_date`, `amount`, `status`) VALUES
(1, 1, '2024-11-01', 12500.00, 'paid'),
(2, 1, '2024-12-01', 15200.00, 'unpaid'),
(3, 2, '2024-11-15', 8900.50, 'paid'),
(4, 3, '2024-11-20', 22400.75, 'paid'),
(5, 4, '2024-10-30', 5600.00, 'overdue');

-- --------------------------------------------------------

--
-- Table structure for table `logisticspartners`
--

CREATE TABLE `logisticspartners` (
  `partner_id` int(11) NOT NULL,
  `partner_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticspartners`
--

INSERT INTO `logisticspartners` (`partner_id`, `partner_name`, `contact_person`, `contact_email`, `contact_phone`, `address`, `rating`, `is_active`, `created_at`) VALUES
(1, 'FastShip Logistics', 'Ahmed Hassan', 'ahmed.hassan@fastship.eg', '+20-2-1234-5678', '15 Tahrir Street, Cairo, Egypt', 4.75, 1, '2025-12-01 17:17:09'),
(2, 'EgyptExpress Cargo', 'Fatma Ibrahim', 'fatma.ibrahim@egyptexpress.com', '+20-2-8765-4321', '42 Ramses Avenue, Giza, Egypt', 4.50, 1, '2025-12-01 17:17:09'),
(3, 'Delta Freight Services', 'Mohamed Ali', 'moh.ali@deltafreight.eg', '+20-3-5555-1234', '78 Corniche Road, Alexandria, Egypt', 4.85, 1, '2025-12-01 17:17:09'),
(4, 'Nile Transport Co.', 'Sara Mahmoud', 'sara.m@niletransport.eg', '+20-95-2223-4567', '12 Nile Street, Luxor, Egypt', 4.20, 1, '2025-12-01 17:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `logisticspayments`
--

CREATE TABLE `logisticspayments` (
  `payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` enum('card','bank_transfer','cash') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticspayments`
--

INSERT INTO `logisticspayments` (`payment_id`, `invoice_id`, `payment_date`, `amount`, `method`) VALUES
(1, 1, '2024-11-10', 12500.00, 'bank_transfer'),
(2, 3, '2024-11-18', 8900.50, 'bank_transfer'),
(3, 4, '2024-11-25', 22400.75, 'card');

-- --------------------------------------------------------

--
-- Table structure for table `logisticsreports`
--

CREATE TABLE `logisticsreports` (
  `report_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `report_type` enum('delay','incident','delivery','maintenance') NOT NULL,
  `description` text DEFAULT NULL,
  `report_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticsreports`
--

INSERT INTO `logisticsreports` (`report_id`, `schedule_id`, `report_type`, `description`, `report_date`) VALUES
(1, 1, 'delivery', 'All packages delivered successfully on time', '2024-12-01 10:00:00'),
(2, 2, 'delay', 'Traffic congestion on Ring Road caused 45-minute delay', '2024-12-01 11:30:00'),
(3, 4, 'maintenance', 'Vehicle requires brake inspection before next trip', '2024-11-30 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `logisticsroutes`
--

CREATE TABLE `logisticsroutes` (
  `route_id` int(11) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `distance_km` decimal(8,2) DEFAULT NULL,
  `estimated_time_hours` decimal(5,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticsroutes`
--

INSERT INTO `logisticsroutes` (`route_id`, `origin`, `destination`, `distance_km`, `estimated_time_hours`, `is_active`, `created_at`) VALUES
(1, 'Cairo', 'Alexandria', 220.50, 3.00, 1, '2025-12-01 17:17:09'),
(2, 'Cairo', 'Luxor', 670.00, 8.50, 1, '2025-12-01 17:17:09'),
(3, 'Giza', 'Port Said', 280.00, 4.00, 1, '2025-12-01 17:17:09'),
(4, 'Alexandria', 'Hurghada', 560.00, 7.00, 1, '2025-12-01 17:17:09'),
(5, 'Cairo', 'Aswan', 880.00, 11.00, 1, '2025-12-01 17:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `logisticsschedules`
--

CREATE TABLE `logisticsschedules` (
  `schedule_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `status` enum('scheduled','in_progress','completed','cancelled') DEFAULT 'scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticsschedules`
--

INSERT INTO `logisticsschedules` (`schedule_id`, `vehicle_id`, `route_id`, `departure_time`, `arrival_time`, `status`) VALUES
(1, 1, 1, '2024-12-01 06:00:00', '2024-12-01 09:30:00', 'completed'),
(2, 2, 3, '2024-12-01 08:00:00', '2024-12-01 12:30:00', 'in_progress'),
(3, 3, 1, '2024-12-01 14:00:00', NULL, 'scheduled'),
(4, 1, 2, '2024-12-02 05:00:00', NULL, 'scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `logisticstracking`
--

CREATE TABLE `logisticstracking` (
  `tracking_id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `current_status` enum('pending','picked_up','in_transit','out_for_delivery','delivered','delayed') NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticstracking`
--

INSERT INTO `logisticstracking` (`tracking_id`, `order_id`, `current_status`, `last_updated`) VALUES
(1, 'ORD-2024-001234', 'delivered', '2025-12-01 17:17:09'),
(2, 'ORD-2024-001235', 'in_transit', '2025-12-01 17:17:09'),
(3, 'ORD-2024-001236', 'out_for_delivery', '2025-12-01 17:17:09'),
(4, 'ORD-2024-001237', 'picked_up', '2025-12-01 17:17:09'),
(5, 'ORD-2024-001238', 'delayed', '2025-12-01 17:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `logisticsvehicles`
--

CREATE TABLE `logisticsvehicles` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `plate_number` varchar(20) NOT NULL,
  `capacity_kg` int(11) NOT NULL,
  `status` enum('available','in_transit','maintenance','inactive') DEFAULT 'available',
  `last_service_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticsvehicles`
--

INSERT INTO `logisticsvehicles` (`vehicle_id`, `vehicle_type`, `plate_number`, `capacity_kg`, `status`, `last_service_date`, `created_at`) VALUES
(1, 'Truck', 'CAI-1234-A', 5000, 'available', '2024-10-15', '2025-12-01 17:17:09'),
(2, 'Van', 'GIZ-5678-B', 1500, 'in_transit', '2024-11-01', '2025-12-01 17:17:09'),
(3, 'Motorcycle', 'ALX-9101-C', 50, 'available', '2024-11-20', '2025-12-01 17:17:09'),
(4, 'Truck', 'CAI-2345-D', 7000, 'maintenance', '2024-09-30', '2025-12-01 17:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `logisticswarehouses`
--

CREATE TABLE `logisticswarehouses` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_name` varchar(100) NOT NULL,
  `location` varchar(150) NOT NULL,
  `capacity_units` int(11) NOT NULL,
  `manager_name` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logisticswarehouses`
--

INSERT INTO `logisticswarehouses` (`warehouse_id`, `warehouse_name`, `location`, `capacity_units`, `manager_name`, `contact_phone`, `created_at`) VALUES
(1, 'Cairo Central Warehouse', '5th Settlement, New Cairo', 50000, 'Ibrahim Saleh', '+20-100-111-2222', '2025-12-01 17:17:09'),
(2, 'Alexandria Port Warehouse', 'Port District, Alexandria', 35000, 'Mona Kamal', '+20-101-222-3333', '2025-12-01 17:17:09'),
(3, 'Giza Distribution Center', '6th October City, Giza', 40000, 'Tarek Nabil', '+20-102-333-4444', '2025-12-01 17:17:09'),
(4, 'Delta Regional Hub', 'Tanta, Gharbia', 25000, 'Amira Hassan', '+20-103-444-5555', '2025-12-01 17:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `loyaltypoints`
--

CREATE TABLE `loyaltypoints` (
  `point_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `last_updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `loyaltypoints`
--

INSERT INTO `loyaltypoints` (`point_id`, `user_id`, `points`, `last_updated`) VALUES
(1, 1, 100, '2025-12-01'),
(2, 2, 200, '2025-11-20'),
(3, 3, 150, '2025-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturerdetails`
--

CREATE TABLE `manufacturerdetails` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `manufacturerdetails`
--

INSERT INTO `manufacturerdetails` (`manufacturer_id`, `name`, `country`, `contact_email`) VALUES
(1, 'Dell Inc.', 'USA', 'support@dell.com'),
(2, 'Sony Corp.', 'Japan', 'info@sony.com'),
(3, 'Adidas AG', 'Germany', 'contact@adidas.com'),
(4, 'Dell Inc.', 'USA', 'support@dell.com'),
(5, 'Sony Corp.', 'Japan', 'info@sony.com'),
(6, 'Adidas AG', 'Germany', 'contact@adidas.com');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `sent_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `receiver_id`, `content`, `sent_at`) VALUES
(1, 1, 2, 'Hello Sara!', '2025-12-01'),
(2, 2, 3, 'Hi Ahmed!', '2025-11-20'),
(3, 3, 1, 'Hey Mohamed!', '2025-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `message`, `created_at`) VALUES
(1, 1, 'Your order has been shipped.', '2025-12-01'),
(2, 2, 'New discount available!', '2025-11-20'),
(3, 3, 'Password changed successfully.', '2025-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

CREATE TABLE `orderhistory` (
  `history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `change_date` datetime NOT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orderhistory`
--

INSERT INTO `orderhistory` (`history_id`, `order_id`, `status_id`, `change_date`, `comments`) VALUES
(1, 1, 1, '2025-01-10 14:05:00', 'Order created'),
(2, 1, 2, '2025-01-10 15:30:00', 'Order moved to processing'),
(3, 4, 3, '2025-01-12 19:00:00', 'Order shipped via UPS'),
(4, 3, 5, '2025-01-12 17:00:00', 'Customer cancellation'),
(5, 2, 4, '2025-01-11 12:30:00', 'Order delivered successfully');

-- --------------------------------------------------------

--
-- Table structure for table `orderinvoices`
--

CREATE TABLE `orderinvoices` (
  `invoice_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'USD',
  `status` varchar(20) NOT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orderinvoices`
--

INSERT INTO `orderinvoices` (`invoice_id`, `order_id`, `invoice_date`, `due_date`, `total_amount`, `currency`, `status`, `billing_address`, `notes`) VALUES
(1, 1001, '2025-01-10 10:00:00', '2025-02-10 00:00:00', 299.99, 'USD', 'Paid', '123 Main St, NY', 'Paid via credit card'),
(2, 1002, '2025-01-11 12:20:00', '2025-02-11 00:00:00', 149.50, 'EUR', 'Unpaid', '45 Berlin Rd, DE', NULL),
(3, 1003, '2025-01-12 09:45:00', '2025-02-12 00:00:00', 560.75, 'USD', 'Overdue', '901 River Rd, TX', 'Customer overdue'),
(4, 1004, '2025-01-13 14:30:00', '2025-02-13 00:00:00', 89.99, 'GBP', 'Paid', '12 Oxford St, London', NULL),
(5, 1005, '2025-01-14 11:10:00', '2025-02-14 00:00:00', 24.99, 'USD', 'Pending', '55 Lakeview Dr, CA', 'Pending confirmation');

-- --------------------------------------------------------

--
-- Table structure for table `ordernotes`
--

CREATE TABLE `ordernotes` (
  `note_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note_text` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ordernotes`
--

INSERT INTO `ordernotes` (`note_id`, `order_id`, `user_id`, `note_text`, `created_at`) VALUES
(1, 1101, 2101, 'Customer requested faster shipping.', '2025-02-09 07:55:00'),
(2, 1102, 2102, 'Billing address verified manually.', '2025-02-10 10:40:00'),
(3, 1103, 2103, 'Payment verification pending.', '2025-02-11 13:05:00'),
(4, 1104, 2104, 'Customer requested gift wrap.', '2025-02-12 09:30:00'),
(5, 1105, 2105, 'Order flagged for manual fraud review.', '2025-02-13 15:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `orderpayments`
--

CREATE TABLE `orderpayments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `transaction_reference` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orderpayments`
--

INSERT INTO `orderpayments` (`payment_id`, `order_id`, `payment_method`, `amount_paid`, `payment_date`, `payment_status`, `transaction_reference`) VALUES
(1, 1, 'Credit Card', 299.99, '2025-01-10 14:02:00', 'Success', 'PAY-20250110-001'),
(2, 2, 'PayPal', 79.50, '2025-01-11 09:47:00', 'Success', 'PAY-20250111-002'),
(3, 3, 'Credit Card', 150.00, '2025-01-12 16:35:00', 'Failed', 'PAY-20250112-003'),
(4, 4, 'Bank Transfer', 49.99, '2025-01-12 18:20:00', 'Success', 'PAY-20250112-004'),
(5, 5, 'Credit Card', 560.75, '2025-01-13 10:10:00', 'Pending', 'PAY-20250113-005');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'USD',
  `status` varchar(20) NOT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `currency`, `status`, `shipping_address`, `notes`) VALUES
(1, 501, '2025-01-10 14:00:00', 299.99, 'USD', 'Processing', '123 Main St, NY', 'Fast delivery please'),
(2, 502, '2025-01-11 09:45:00', 79.50, 'EUR', 'Completed', '45 Berlin Rd, DE', NULL),
(3, 503, '2025-01-12 16:30:00', 150.00, 'USD', 'Cancelled', '88 Sunset Ave, CA', 'Customer requested cancellation'),
(4, 504, '2025-01-12 18:15:00', 49.99, 'GBP', 'Shipped', '12 Oxford St, London', NULL),
(5, 505, '2025-01-13 10:05:00', 560.75, 'USD', 'Pending', '901 River Rd, TX', 'Gift wrap');

-- --------------------------------------------------------

--
-- Table structure for table `ordershipments`
--

CREATE TABLE `ordershipments` (
  `shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `carrier_id` int(11) NOT NULL,
  `method_id` int(11) NOT NULL,
  `shipment_date` datetime NOT NULL,
  `estimated_delivery` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ordershipments`
--

INSERT INTO `ordershipments` (`shipment_id`, `order_id`, `carrier_id`, `method_id`, `shipment_date`, `estimated_delivery`, `status`, `tracking_number`) VALUES
(1, 1001, 1, 2, '2025-01-11 09:00:00', '2025-01-13 18:00:00', 'Shipped', 'FDX-20250111-001'),
(2, 1002, 2, 1, '2025-01-12 10:15:00', '2025-01-18 17:00:00', 'In Transit', 'UPS-20250112-002'),
(3, 1003, 3, 3, '2025-01-13 08:30:00', '2025-01-14 20:00:00', 'Delivered', 'DHL-20250113-003'),
(4, 1004, 4, 2, '2025-01-14 14:45:00', '2025-01-16 19:00:00', 'Shipped', 'RM-20250114-004'),
(5, 1005, 1, 5, '2025-01-15 07:50:00', '2025-01-15 23:00:00', 'Processing', 'FDX-20250115-005');

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_final` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`status_id`, `status_name`, `description`, `is_final`) VALUES
(1, 'Pending', 'Order created but payment not completed', 0),
(2, 'Processing', 'Order is being prepared', 0),
(3, 'Shipped', 'Order sent to the carrier', 0),
(4, 'Delivered', 'Order delivered to customer', 1),
(5, 'Cancelled', 'Order cancelled and closed', 1),
(6, 'Pending', 'Order created but payment not completed', 0),
(7, 'Processing', 'Order is being prepared', 0),
(8, 'Shipped', 'Order sent to the carrier', 0),
(9, 'Delivered', 'Order delivered to customer', 1),
(10, 'Cancelled', 'Order cancelled and closed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentdisputelogs`
--

CREATE TABLE `paymentdisputelogs` (
  `log_id` int(11) NOT NULL,
  `dispute_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `log_type` enum('message','status_update','evidence','system_note') NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymentdisputelogs`
--

INSERT INTO `paymentdisputelogs` (`log_id`, `dispute_id`, `log_time`, `log_type`, `message`) VALUES
(1, 1, '2024-11-26 09:15:00', 'message', 'Customer submitted invoice discrepancy evidence'),
(2, 1, '2024-11-27 12:00:00', 'status_update', 'Finance team reviewing case'),
(3, 1, '2024-11-28 14:00:00', 'status_update', 'Dispute resolved - Refund processed'),
(4, 2, '2024-11-29 08:30:00', 'evidence', 'Tracking logs attached showing delay');

-- --------------------------------------------------------

--
-- Table structure for table `paymentdisputes`
--

CREATE TABLE `paymentdisputes` (
  `dispute_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `dispute_reason` varchar(255) NOT NULL,
  `dispute_status` enum('open','under_review','resolved','rejected') DEFAULT 'open',
  `opened_date` datetime DEFAULT current_timestamp(),
  `resolved_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymentdisputes`
--

INSERT INTO `paymentdisputes` (`dispute_id`, `payment_id`, `dispute_reason`, `dispute_status`, `opened_date`, `resolved_date`) VALUES
(1, 3, 'Incorrect billing amount - overcharged by 500 EGP', 'resolved', '2024-11-26 11:00:00', '2024-11-28 16:00:00'),
(2, 1, 'Delayed delivery beyond agreed timeline', 'under_review', '2024-11-29 10:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paymentgateways`
--

CREATE TABLE `paymentgateways` (
  `gateway_id` int(11) NOT NULL,
  `gateway_name` varchar(50) NOT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymentgateways`
--

INSERT INTO `paymentgateways` (`gateway_id`, `gateway_name`, `provider`, `active`, `created_at`) VALUES
(1, 'Stripe', 'Stripe Inc.', 1, '2025-12-01 19:57:13'),
(2, 'PayPal', 'PayPal Holdings', 1, '2025-12-01 19:57:13'),
(3, 'CashApp', 'Block Inc.', 1, '2025-12-01 19:57:13'),
(4, 'BankAPI', 'National Bank', 0, '2025-12-01 19:57:13'),
(5, 'Klarna', 'Klarna AB', 1, '2025-12-01 19:57:13'),
(6, 'Stripe', 'Stripe Inc.', 1, '2025-12-01 20:00:34'),
(7, 'PayPal', 'PayPal Holdings', 1, '2025-12-01 20:00:34'),
(8, 'CashApp', 'Block Inc.', 1, '2025-12-01 20:00:34'),
(9, 'BankAPI', 'National Bank', 0, '2025-12-01 20:00:34'),
(10, 'Klarna', 'Klarna AB', 1, '2025-12-01 20:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethods`
--

CREATE TABLE `paymentmethods` (
  `method_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `method_type` varchar(50) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymentmethods`
--

INSERT INTO `paymentmethods` (`method_id`, `user_id`, `method_type`, `provider`) VALUES
(1, 1, 'Credit Card', 'Visa'),
(2, 2, 'PayPal', 'PayPal Inc.'),
(3, 3, 'Bank Transfer', 'CIB Bank');

-- --------------------------------------------------------

--
-- Table structure for table `paymentrefunds`
--

CREATE TABLE `paymentrefunds` (
  `refund_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `refund_amount` decimal(10,2) NOT NULL,
  `refund_reason` varchar(255) DEFAULT NULL,
  `refund_status` enum('requested','approved','declined','processed') DEFAULT 'requested',
  `request_date` datetime DEFAULT current_timestamp(),
  `processed_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymentrefunds`
--

INSERT INTO `paymentrefunds` (`refund_id`, `payment_id`, `refund_amount`, `refund_reason`, `refund_status`, `request_date`, `processed_date`) VALUES
(1, 1, 1200.00, 'Partial shipment cancellation', 'processed', '2024-11-15 10:00:00', '2024-11-17 14:30:00'),
(2, 2, 8900.50, 'Service not delivered as per SLA', 'approved', '2024-11-20 09:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'USD',
  `payment_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `user_id`, `amount`, `currency`, `payment_date`, `status`, `description`) VALUES
(1, 101, 120.00, 'USD', '2025-01-10 13:45:00', 'Completed', 'Subscription payment'),
(2, 102, 75.50, 'EUR', '2025-01-11 09:20:00', 'Pending', 'E-commerce order'),
(3, 103, 250.00, 'USD', '2025-01-11 11:00:00', 'Failed', 'Card declined'),
(4, 104, 35.99, 'GBP', '2025-01-12 17:30:00', 'Completed', 'Mobile purchase'),
(5, 105, 500.00, 'USD', '2025-01-12 20:10:00', 'Refunded', 'Refund processed'),
(6, 101, 120.00, 'USD', '2025-01-10 13:45:00', 'Completed', 'Subscription payment'),
(7, 102, 75.50, 'EUR', '2025-01-11 09:20:00', 'Pending', 'E-commerce order'),
(8, 103, 250.00, 'USD', '2025-01-11 11:00:00', 'Failed', 'Card declined'),
(9, 104, 35.99, 'GBP', '2025-01-12 17:30:00', 'Completed', 'Mobile purchase'),
(10, 105, 500.00, 'USD', '2025-01-12 20:10:00', 'Refunded', 'Refund processed');

-- --------------------------------------------------------

--
-- Table structure for table `paymentsettlement`
--

CREATE TABLE `paymentsettlement` (
  `settlement_id` int(11) NOT NULL,
  `settlement_date` date NOT NULL,
  `total_transactions` int(11) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `status` enum('pending','completed','reconciled') DEFAULT 'pending',
  `gateway` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymentsettlement`
--

INSERT INTO `paymentsettlement` (`settlement_id`, `settlement_date`, `total_transactions`, `total_amount`, `status`, `gateway`) VALUES
(1, '2024-11-30', 145, 235670.50, 'completed', 'Paymob'),
(2, '2024-11-29', 132, 198450.75, 'reconciled', 'Fawry'),
(3, '2024-12-01', 89, 167200.00, 'pending', 'Stripe');

-- --------------------------------------------------------

--
-- Table structure for table `paymentsubscriptions`
--

CREATE TABLE `paymentsubscriptions` (
  `subscription_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `billing_cycle` enum('weekly','monthly','yearly') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','paused','cancelled','expired') DEFAULT 'active',
  `last_billed_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymentsubscriptions`
--

INSERT INTO `paymentsubscriptions` (`subscription_id`, `customer_id`, `plan_name`, `price`, `billing_cycle`, `start_date`, `end_date`, `status`, `last_billed_date`) VALUES
(1, 1, 'Professional', 899.00, 'monthly', '2024-06-01', NULL, 'active', '2024-11-01'),
(2, 2, 'Basic Shipper', 299.00, 'monthly', '2024-09-15', NULL, 'active', '2024-11-15'),
(3, 3, 'Enterprise', 2499.00, 'monthly', '2024-01-01', NULL, 'active', '2024-11-01'),
(4, 4, 'Professional', 899.00, 'monthly', '2024-08-01', '2024-10-31', 'cancelled', '2024-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttransactions`
--

CREATE TABLE `paymenttransactions` (
  `transaction_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gateway_id` int(11) NOT NULL,
  `transaction_reference` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymenttransactions`
--

INSERT INTO `paymenttransactions` (`transaction_id`, `payment_id`, `gateway_id`, `transaction_reference`, `amount`, `transaction_date`, `status`) VALUES
(1, 1, 1, 'TXN-20250110-001', 120.00, '2025-01-10 13:46:00', 'Success'),
(2, 2, 2, 'TXN-20250111-002', 75.50, '2025-01-11 09:21:30', 'Pending'),
(3, 3, 1, 'TXN-20250111-003', 250.00, '2025-01-11 11:01:15', 'Failed'),
(4, 4, 3, 'TXN-20250112-004', 35.99, '2025-01-12 17:31:10', 'Success'),
(5, 5, 1, 'TXN-20250112-005', 500.00, '2025-01-12 20:11:05', 'Refunded');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `role_id`, `permission_name`) VALUES
(1, 1, 'Manage Products'),
(2, 2, 'Place Orders'),
(3, 3, 'Reply Tickets');

-- --------------------------------------------------------

--
-- Table structure for table `productbundles`
--

CREATE TABLE `productbundles` (
  `bundle_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productbundles`
--

INSERT INTO `productbundles` (`bundle_id`, `name`, `description`, `discount`) VALUES
(1, 'Laptop + Headphones', 'Dell Laptop with Sony Headphones', 10.00),
(2, 'Smartphone + Case', 'Samsung Smartphone with protective case', 5.00),
(3, 'Shoes + Socks', 'Nike Shoes with matching socks', 15.00),
(4, 'Laptop + Headphones', 'Dell Laptop with Sony Headphones', 10.00),
(5, 'Smartphone + Case', 'Samsung Smartphone with protective case', 5.00),
(6, 'Shoes + Socks', 'Nike Shoes with matching socks', 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `productcoupons`
--

CREATE TABLE `productcoupons` (
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productcoupons`
--

INSERT INTO `productcoupons` (`coupon_id`, `product_id`, `code`, `discount_amount`, `expiry_date`) VALUES
(1, 1, 'LAPTOP10', 1000.00, '2025-12-31'),
(2, 2, 'PHONE5', 400.00, '2025-11-30'),
(3, 3, 'HEAD20', 100.00, '2025-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

CREATE TABLE `productdetails` (
  `detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `specifications` varchar(255) DEFAULT NULL,
  `warranty_period` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productdetails`
--

INSERT INTO `productdetails` (`detail_id`, `product_id`, `description`, `specifications`, `warranty_period`) VALUES
(1, 1, 'High performance laptop', 'Intel i7, 16GB RAM, 512GB SSD', '2 years'),
(2, 2, 'Latest smartphone model', '128GB storage, 8GB RAM, 5G', '1 year'),
(3, 3, 'Noise cancelling headphones', 'Bluetooth, 20h battery life', '6 months'),
(4, 1, 'High performance laptop', 'Intel i7, 16GB RAM, 512GB SSD', '2 years'),
(5, 2, 'Latest smartphone model', '128GB storage, 8GB RAM, 5G', '1 year'),
(6, 3, 'Noise cancelling headphones', 'Bluetooth, 20h battery life', '6 months');

-- --------------------------------------------------------

--
-- Table structure for table `productdiscounts`
--

CREATE TABLE `productdiscounts` (
  `discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productdiscounts`
--

INSERT INTO `productdiscounts` (`discount_id`, `product_id`, `discount_percentage`, `start_date`, `end_date`) VALUES
(1, 1, 10.00, '2025-12-01', '2025-12-10'),
(2, 2, 5.00, '2025-11-15', '2025-11-30'),
(3, 3, 15.00, '2025-10-01', '2025-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`image_id`, `product_id`, `image_url`, `alt_text`) VALUES
(1, 1, 'images/laptop.jpg', 'Dell Laptop Front View'),
(2, 2, 'images/smartphone.jpg', 'Samsung Smartphone Display'),
(3, 3, 'images/headphones.jpg', 'Sony Headphones Side View'),
(4, 1, 'images/laptop.jpg', 'Dell Laptop Front View'),
(5, 2, 'images/smartphone.jpg', 'Samsung Smartphone Display'),
(6, 3, 'images/headphones.jpg', 'Sony Headphones Side View');

-- --------------------------------------------------------

--
-- Table structure for table `productratings`
--

CREATE TABLE `productratings` (
  `rating_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productratings`
--

INSERT INTO `productratings` (`rating_id`, `product_id`, `user_id`, `rating`) VALUES
(1, 1, 1, 5),
(2, 2, 2, 4),
(3, 3, 3, 3),
(4, 1, 1, 5),
(5, 2, 2, 4),
(6, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `productreports`
--

CREATE TABLE `productreports` (
  `report_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `report_type` varchar(50) DEFAULT NULL,
  `report_date` date NOT NULL,
  `details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productreports`
--

INSERT INTO `productreports` (`report_id`, `product_id`, `report_type`, `report_date`, `details`) VALUES
(1, 1, 'Sales', '2025-12-01', 'Laptop sales increased by 20%'),
(2, 2, 'Returns', '2025-11-20', 'Smartphone return rate 5%'),
(3, 3, 'Stock', '2025-10-15', 'Headphones stock running low'),
(4, 1, 'Sales', '2025-12-01', 'Laptop sales increased by 20%'),
(5, 2, 'Returns', '2025-11-20', 'Smartphone return rate 5%'),
(6, 3, 'Stock', '2025-10-15', 'Headphones stock running low');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_text` varchar(255) DEFAULT NULL,
  `review_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`review_id`, `product_id`, `user_id`, `review_text`, `review_date`) VALUES
(1, 1, 1, 'Great laptop, very fast!', '2025-12-02'),
(2, 2, 2, 'Good phone but battery drains quickly.', '2025-11-22'),
(3, 3, 3, 'Average sound quality.', '2025-10-17'),
(4, 1, 1, 'Great laptop, very fast!', '2025-12-02'),
(5, 2, 2, 'Good phone but battery drains quickly.', '2025-11-22'),
(6, 3, 3, 'Average sound quality.', '2025-10-17');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `category_id`, `brand`, `price`, `stock`, `image_url`) VALUES
(1, 'Laptop', 'High-performance laptop for work and gaming', 1, 'Dell', 15000.00, 10, NULL),
(2, 'Smartphone', 'Latest smartphone with advanced features', 1, 'Samsung', 8000.00, 25, NULL),
(3, 'Headphones', 'Premium quality headphones with noise cancellation', 2, 'Sony', 500.00, 50, NULL),
(4, 'Laptop', 'High-performance laptop for work and gaming', 1, 'Dell', 15000.00, 10, NULL),
(5, 'Smartphone', 'Latest smartphone with advanced features', 1, 'Samsung', 8000.00, 25, NULL),
(6, 'Headphones', 'Premium quality headphones with noise cancellation', 2, 'Sony', 500.00, 50, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productspecifications`
--

CREATE TABLE `productspecifications` (
  `spec_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `spec_name` varchar(100) DEFAULT NULL,
  `spec_value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productspecifications`
--

INSERT INTO `productspecifications` (`spec_id`, `product_id`, `spec_name`, `spec_value`) VALUES
(1, 1, 'Processor', 'Intel i7'),
(2, 2, 'Storage', '128GB'),
(3, 3, 'Connectivity', 'Bluetooth 5.0'),
(4, 1, 'Processor', 'Intel i7'),
(5, 2, 'Storage', '128GB'),
(6, 3, 'Connectivity', 'Bluetooth 5.0');

-- --------------------------------------------------------

--
-- Table structure for table `productstock`
--

CREATE TABLE `productstock` (
  `stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `last_updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productstock`
--

INSERT INTO `productstock` (`stock_id`, `product_id`, `quantity`, `last_updated`) VALUES
(1, 1, 10, '2025-12-01'),
(2, 2, 25, '2025-11-20'),
(3, 3, 50, '2025-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `producttags`
--

CREATE TABLE `producttags` (
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `producttags`
--

INSERT INTO `producttags` (`tag_id`, `product_id`, `tag`) VALUES
(1, 1, 'Gaming'),
(2, 2, '5G'),
(3, 3, 'Wireless'),
(4, 1, 'Gaming'),
(5, 2, '5G'),
(6, 3, 'Wireless');

-- --------------------------------------------------------

--
-- Table structure for table `productvariants`
--

CREATE TABLE `productvariants` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productvariants`
--

INSERT INTO `productvariants` (`variant_id`, `product_id`, `variant_name`, `price`, `stock`) VALUES
(1, 1, 'Laptop 16GB RAM', 16000.00, 5),
(2, 2, 'Smartphone 256GB', 9500.00, 15),
(3, 3, 'Headphones Wireless', 700.00, 20),
(4, 1, 'Laptop 16GB RAM', 16000.00, 5),
(5, 2, 'Smartphone 256GB', 9500.00, 15),
(6, 3, 'Headphones Wireless', 700.00, 20);

-- --------------------------------------------------------

--
-- Table structure for table `productvideos`
--

CREATE TABLE `productvideos` (
  `video_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productvideos`
--

INSERT INTO `productvideos` (`video_id`, `product_id`, `video_url`, `title`) VALUES
(1, 1, 'videos/laptop_review.mp4', 'Dell Laptop Review'),
(2, 2, 'videos/smartphone_demo.mp4', 'Samsung Smartphone Demo'),
(3, 3, 'videos/headphones_unboxing.mp4', 'Sony Headphones Unboxing'),
(4, 1, 'videos/laptop_review.mp4', 'Dell Laptop Review'),
(5, 2, 'videos/smartphone_demo.mp4', 'Samsung Smartphone Demo'),
(6, 3, 'videos/headphones_unboxing.mp4', 'Sony Headphones Unboxing');

-- --------------------------------------------------------

--
-- Table structure for table `promotionreports`
--

CREATE TABLE `promotionreports` (
  `report_id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `total_redemptions` int(11) DEFAULT 0,
  `total_revenue` decimal(12,2) DEFAULT 0.00,
  `total_customers` int(11) DEFAULT 0,
  `report_date` date NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `promotionreports`
--

INSERT INTO `promotionreports` (`report_id`, `promotion_id`, `total_redemptions`, `total_revenue`, `total_customers`, `report_date`, `notes`) VALUES
(1, 1, 320, 185000.00, 280, '2025-06-30', 'End-of-campaign report for Summer Laptop Sale.'),
(2, 2, 210, 95000.00, 200, '2025-09-10', 'Back to School Tablet Offer performed well.'),
(3, 3, 480, 320000.00, 450, '2026-01-05', 'New Year Store-Wide Deals exceeded expectations.'),
(4, 4, 60, 30000.00, 55, '2025-03-14', 'Flash Friday Gaming Gear one-day event results.'),
(5, 5, 95, 52000.00, 90, '2025-04-15', 'Accessory Bundle Offer mid-month summary.'),
(6, 1, 320, 185000.00, 280, '2025-06-30', 'End-of-campaign report for Summer Laptop Sale.'),
(7, 2, 210, 95000.00, 200, '2025-09-10', 'Back to School Tablet Offer performed well.'),
(8, 3, 480, 320000.00, 450, '2026-01-05', 'New Year Store-Wide Deals exceeded expectations.'),
(9, 4, 60, 30000.00, 55, '2025-03-14', 'Flash Friday Gaming Gear one-day event results.'),
(10, 5, 95, 52000.00, 90, '2025-04-15', 'Accessory Bundle Offer mid-month summary.'),
(11, 1, 320, 185000.00, 280, '2025-06-30', 'End-of-campaign report for Summer Laptop Sale.'),
(12, 2, 210, 95000.00, 200, '2025-09-10', 'Back to School Tablet Offer performed well.'),
(13, 3, 480, 320000.00, 450, '2026-01-05', 'New Year Store-Wide Deals exceeded expectations.'),
(14, 4, 60, 30000.00, 55, '2025-03-14', 'Flash Friday Gaming Gear one-day event results.'),
(15, 5, 95, 52000.00, 90, '2025-04-15', 'Accessory Bundle Offer mid-month summary.'),
(16, 1, 320, 185000.00, 280, '2025-06-30', 'End-of-campaign report for Summer Laptop Sale.'),
(17, 2, 210, 95000.00, 200, '2025-09-10', 'Back to School Tablet Offer performed well.'),
(18, 3, 480, 320000.00, 450, '2026-01-05', 'New Year Store-Wide Deals exceeded expectations.'),
(19, 4, 60, 30000.00, 55, '2025-03-14', 'Flash Friday Gaming Gear one-day event results.'),
(20, 5, 95, 52000.00, 90, '2025-04-15', 'Accessory Bundle Offer mid-month summary.'),
(21, 1, 320, 185000.00, 280, '2025-06-30', 'End-of-campaign report for Summer Laptop Sale.'),
(22, 2, 210, 95000.00, 200, '2025-09-10', 'Back to School Tablet Offer performed well.'),
(23, 3, 480, 320000.00, 450, '2026-01-05', 'New Year Store-Wide Deals exceeded expectations.'),
(24, 4, 60, 30000.00, 55, '2025-03-14', 'Flash Friday Gaming Gear one-day event results.'),
(25, 5, 95, 52000.00, 90, '2025-04-15', 'Accessory Bundle Offer mid-month summary.');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int(11) NOT NULL,
  `promotion_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_type` enum('percentage','fixed','buy_one_get_one') NOT NULL,
  `discount_value` decimal(10,2) DEFAULT NULL,
  `status` enum('active','inactive','expired') DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`promotion_id`, `promotion_name`, `description`, `start_date`, `end_date`, `discount_type`, `discount_value`, `status`) VALUES
(1, 'Summer Laptop Sale', 'Get 15% off on all laptops during June.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(2, 'Back to School Tablet Offer', 'Students save EGP 50 on selected tablets.', '2025-08-15', '2025-09-10', 'fixed', 50.00, 'expired'),
(3, 'New Year Store-Wide Deals', '20% off everything for New Year.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(4, 'Flash Friday Gaming Gear', '10% off gaming hardware for 24 hours.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(5, 'Accessory Bundle Offer', 'Buy 2 accessories and get EGP 80 off.', '2025-04-01', '2025-04-15', 'fixed', 80.00, 'inactive'),
(6, 'Summer Laptop Sale', 'Get 15% off on all laptops during June.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(7, 'Back to School Tablet Offer', 'Students save EGP 50 on selected tablets.', '2025-08-15', '2025-09-10', 'fixed', 50.00, 'expired'),
(8, 'New Year Store-Wide Deals', '20% off everything for New Year.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(9, 'Flash Friday Gaming Gear', '10% off gaming hardware for 24 hours.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(10, 'Accessory Bundle Offer', 'Buy 2 accessories and get EGP 80 off.', '2025-04-01', '2025-04-15', 'fixed', 80.00, 'inactive'),
(11, 'Summer Laptop Sale', 'Get 15% off on all laptops during June.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(12, 'Back to School Tablet Offer', 'Students save EGP 50 on selected tablets.', '2025-08-15', '2025-09-10', 'fixed', 50.00, 'expired'),
(13, 'New Year Store-Wide Deals', '20% off everything for New Year.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(14, 'Flash Friday Gaming Gear', '10% off gaming hardware for 24 hours.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(15, 'Accessory Bundle Offer', 'Buy 2 accessories and get EGP 80 off.', '2025-04-01', '2025-04-15', 'fixed', 80.00, 'inactive'),
(16, 'Summer Laptop Sale', 'Get 15% off on all laptops during June.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(17, 'Back to School Tablet Offer', 'Students save EGP 50 on selected tablets.', '2025-08-15', '2025-09-10', 'fixed', 50.00, 'expired'),
(18, 'New Year Store-Wide Deals', '20% off everything for New Year.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(19, 'Flash Friday Gaming Gear', '10% off gaming hardware for 24 hours.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(20, 'Accessory Bundle Offer', 'Buy 2 accessories and get EGP 80 off.', '2025-04-01', '2025-04-15', 'fixed', 80.00, 'inactive'),
(21, 'Summer Laptop Sale', 'Get 15% off on all laptops during June.', '2025-06-01', '2025-06-30', 'percentage', 15.00, 'expired'),
(22, 'Back to School Tablet Offer', 'Students save EGP 50 on selected tablets.', '2025-08-15', '2025-09-10', 'fixed', 50.00, 'expired'),
(23, 'New Year Store-Wide Deals', '20% off everything for New Year.', '2025-12-20', '2026-01-05', 'percentage', 20.00, 'active'),
(24, 'Flash Friday Gaming Gear', '10% off gaming hardware for 24 hours.', '2025-03-14', '2025-03-14', 'percentage', 10.00, 'expired'),
(25, 'Accessory Bundle Offer', 'Buy 2 accessories and get EGP 80 off.', '2025-04-01', '2025-04-15', 'fixed', 80.00, 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_text` varchar(255) DEFAULT NULL,
  `question_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `product_id`, `user_id`, `question_text`, `question_date`) VALUES
(1, 1, 2, 'Does this laptop support Windows 11?', '2025-12-04'),
(2, 2, 3, 'Is this phone dual SIM?', '2025-11-23'),
(3, 3, 1, 'Are these headphones waterproof?', '2025-10-18'),
(4, 1, 2, 'Does this laptop support Windows 11?', '2025-12-04'),
(5, 2, 3, 'Is this phone dual SIM?', '2025-11-23'),
(6, 3, 1, 'Are these headphones waterproof?', '2025-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `recommendationlogs`
--

CREATE TABLE `recommendationlogs` (
  `log_id` int(11) NOT NULL,
  `recommendation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` enum('viewed','clicked','ignored','purchased') NOT NULL,
  `action_time` datetime NOT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') NOT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `recommendationlogs`
--

INSERT INTO `recommendationlogs` (`log_id`, `recommendation_id`, `user_id`, `action`, `action_time`, `device_type`, `referrer`, `notes`) VALUES
(1, 1, 101, 'clicked', '2025-06-10 14:35:00', 'Desktop', 'https://techmart.com/home', 'User clicked on recommended laptop.'),
(2, 2, 102, 'viewed', '2025-08-18 10:20:00', 'Mobile', 'https://techmart.com/campaigns', 'Viewed Back to School promotion.'),
(3, 3, 103, 'purchased', '2025-12-22 12:30:00', 'Desktop', 'https://techmart.com/affiliate/techguru', 'Purchased product via affiliate recommendation.'),
(4, 4, 104, 'ignored', '2025-04-05 09:50:00', 'Tablet', 'https://techmart.com/accessories', 'Ignored recommended accessory bundle.'),
(5, 5, 105, 'clicked', '2025-03-14 20:15:00', 'Mobile', 'https://techmart.com/gaming', 'Clicked on recommended gaming peripheral.'),
(6, 1, 101, 'clicked', '2025-06-10 14:35:00', 'Desktop', 'https://techmart.com/home', 'User clicked on recommended laptop.'),
(7, 2, 102, 'viewed', '2025-08-18 10:20:00', 'Mobile', 'https://techmart.com/campaigns', 'Viewed Back to School promotion.'),
(8, 3, 103, 'purchased', '2025-12-22 12:30:00', 'Desktop', 'https://techmart.com/affiliate/techguru', 'Purchased product via affiliate recommendation.'),
(9, 4, 104, 'ignored', '2025-04-05 09:50:00', 'Tablet', 'https://techmart.com/accessories', 'Ignored recommended accessory bundle.'),
(10, 5, 105, 'clicked', '2025-03-14 20:15:00', 'Mobile', 'https://techmart.com/gaming', 'Clicked on recommended gaming peripheral.');

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `recommendation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recommended_by` enum('algorithm','campaign','affiliate','manual') NOT NULL,
  `recommendation_date` datetime NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `recommendations`
--

INSERT INTO `recommendations` (`recommendation_id`, `user_id`, `product_id`, `recommended_by`, `recommendation_date`, `notes`) VALUES
(1, 101, 201, 'algorithm', '2025-06-10 14:30:00', 'Recommended based on previous laptop purchase.'),
(2, 102, 305, 'campaign', '2025-08-18 10:15:00', 'Back to School campaign promotion.'),
(3, 103, 410, 'affiliate', '2025-12-22 12:00:00', 'Recommended via affiliate link TechGuru.'),
(4, 104, 512, 'manual', '2025-04-05 09:45:00', 'Customer service recommended accessory bundle.'),
(5, 105, 603, 'algorithm', '2025-03-14 20:10:00', 'Recommended based on browsing gaming peripherals.'),
(6, 101, 201, 'algorithm', '2025-06-10 14:30:00', 'Recommended based on previous laptop purchase.'),
(7, 102, 305, 'campaign', '2025-08-18 10:15:00', 'Back to School campaign promotion.'),
(8, 103, 410, 'affiliate', '2025-12-22 12:00:00', 'Recommended via affiliate link TechGuru.'),
(9, 104, 512, 'manual', '2025-04-05 09:45:00', 'Customer service recommended accessory bundle.'),
(10, 105, 603, 'algorithm', '2025-03-14 20:10:00', 'Recommended based on browsing gaming peripherals.');

-- --------------------------------------------------------

--
-- Table structure for table `refreshtokens`
--

CREATE TABLE `refreshtokens` (
  `refresh_token_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `issued_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `status` enum('active','revoked','expired') DEFAULT 'active',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `refund_id` int(11) NOT NULL,
  `return_item_id` int(11) NOT NULL,
  `refund_amount` decimal(10,2) NOT NULL,
  `refund_status` varchar(20) NOT NULL,
  `approved_by` varchar(100) DEFAULT NULL,
  `refund_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`refund_id`, `return_item_id`, `refund_amount`, `refund_status`, `approved_by`, `refund_date`) VALUES
(1, 1, 25.99, 'Approved', 'Manager A', '2025-01-21'),
(2, 2, 39.99, 'Pending', NULL, NULL),
(3, 3, 79.50, 'Rejected', 'Manager B', '2025-01-23'),
(4, 4, 45.00, 'Approved', 'Manager C', '2025-01-24'),
(5, 5, 12.99, 'Processing', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `refundtransactions`
--

CREATE TABLE `refundtransactions` (
  `transaction_id` int(11) NOT NULL,
  `refund_id` int(11) NOT NULL,
  `transaction_reference` varchar(100) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `refundtransactions`
--

INSERT INTO `refundtransactions` (`transaction_id`, `refund_id`, `transaction_reference`, `payment_method`, `transaction_date`, `status`) VALUES
(1, 1, 'RFND-20250121-001', 'Credit Card', '2025-01-21 09:30:00', 'Success'),
(2, 2, 'RFND-20250122-002', 'PayPal', '2025-01-22 14:10:00', 'Processing'),
(3, 4, 'RFND-20250124-003', 'Bank Transfer', '2025-01-24 11:50:00', 'Success'),
(4, 5, 'RFND-20250124-004', 'Credit Card', '2025-01-24 15:05:00', 'Pending'),
(5, 3, 'RFND-20250123-005', 'Credit Card', '2025-01-23 16:40:00', 'Failed');

-- --------------------------------------------------------

--
-- Table structure for table `relatedproducts`
--

CREATE TABLE `relatedproducts` (
  `relation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `related_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `relatedproducts`
--

INSERT INTO `relatedproducts` (`relation_id`, `product_id`, `related_product_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 1, 2),
(5, 2, 3),
(6, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `restorelogs`
--

CREATE TABLE `restorelogs` (
  `LogID` int(11) NOT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `restorelogs`
--

INSERT INTO `restorelogs` (`LogID`, `Message`, `CreatedAt`) VALUES
(1, 'Restore completed successfully', '2025-12-01 19:25:41'),
(2, 'Restore failed: corrupted file', '2025-12-01 19:25:41'),
(3, 'Restore operation started', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `restorerequests`
--

CREATE TABLE `restorerequests` (
  `RequestID` int(11) NOT NULL,
  `RequestType` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `restorerequests`
--

INSERT INTO `restorerequests` (`RequestID`, `RequestType`, `CreatedAt`) VALUES
(1, 'User Data Restore', '2025-12-01 19:25:41'),
(2, 'System Restore', '2025-12-01 19:25:41'),
(3, 'Log Restore', '2025-12-01 19:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `returnitems`
--

CREATE TABLE `returnitems` (
  `return_item_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL,
  `condition_received` varchar(50) DEFAULT NULL,
  `return_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `returnitems`
--

INSERT INTO `returnitems` (`return_item_id`, `return_id`, `product_name`, `quantity`, `reason_id`, `condition_received`, `return_date`) VALUES
(1, 3001, 'Wireless Mouse', 1, 1, 'Damaged', '2025-01-20'),
(2, 3002, 'T-Shirt - Medium', 2, 2, 'Good', '2025-01-21'),
(3, 3003, 'Bluetooth Speaker', 1, 3, 'Used', '2025-01-22'),
(4, 3004, 'Laptop Charger', 1, 5, 'Faulty', '2025-01-23'),
(5, 3005, 'Coffee Mug', 3, 4, 'Unused', '2025-01-24');

-- --------------------------------------------------------

--
-- Table structure for table `returnreasons`
--

CREATE TABLE `returnreasons` (
  `reason_id` int(11) NOT NULL,
  `reason_title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `returnreasons`
--

INSERT INTO `returnreasons` (`reason_id`, `reason_title`, `description`) VALUES
(1, 'Damaged Item', 'Product arrived physically damaged'),
(2, 'Wrong Size', 'Item size does not match order'),
(3, 'Not as Described', 'Product differs from listing'),
(4, 'Changed Mind', 'Customer no longer wants the item'),
(5, 'Defective Product', 'Item malfunctions or does not work');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`return_id`, `order_id`, `return_date`, `reason`, `status`, `refund_amount`) VALUES
(1, 2001, '2025-01-20', 'Item damaged', 'Approved', 49.99),
(2, 2002, '2025-01-21', 'Wrong size', 'Pending', 29.99),
(3, 2003, '2025-01-22', 'Not as described', 'Rejected', 0.00),
(4, 2004, '2025-01-23', 'Changed mind', 'Approved', 19.99),
(5, 2005, '2025-01-24', 'Defective product', 'Processing', 39.50),
(6, 2001, '2025-01-20', 'Item damaged', 'Approved', 49.99),
(7, 2002, '2025-01-21', 'Wrong size', 'Pending', 29.99),
(8, 2003, '2025-01-22', 'Not as described', 'Rejected', 0.00),
(9, 2004, '2025-01-23', 'Changed mind', 'Approved', 19.99),
(10, 2005, '2025-01-24', 'Defective product', 'Processing', 39.50);

-- --------------------------------------------------------

--
-- Table structure for table `reviewreplies`
--

CREATE TABLE `reviewreplies` (
  `reply_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_text` varchar(255) DEFAULT NULL,
  `reply_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reviewreplies`
--

INSERT INTO `reviewreplies` (`reply_id`, `review_id`, `user_id`, `reply_text`, `reply_date`) VALUES
(1, 1, 2, 'Thanks for your feedback!', '2025-12-03'),
(2, 2, 1, 'We will improve battery life.', '2025-11-23'),
(3, 3, 2, 'Appreciate your honest review.', '2025-10-18'),
(4, 1, 2, 'Thanks for your feedback!', '2025-12-03'),
(5, 2, 1, 'We will improve battery life.', '2025-11-23'),
(6, 3, 2, 'Appreciate your honest review.', '2025-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `reviewvotes`
--

CREATE TABLE `reviewvotes` (
  `vote_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote_type` enum('upvote','downvote') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reviewvotes`
--

INSERT INTO `reviewvotes` (`vote_id`, `review_id`, `user_id`, `vote_type`) VALUES
(1, 1, 2, 'upvote'),
(2, 2, 3, 'downvote'),
(3, 3, 1, 'upvote'),
(4, 1, 2, 'upvote'),
(5, 2, 3, 'downvote'),
(6, 3, 1, 'upvote');

-- --------------------------------------------------------

--
-- Table structure for table `searchqueries`
--

CREATE TABLE `searchqueries` (
  `query_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `query_text` varchar(255) NOT NULL,
  `query_time` datetime NOT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') NOT NULL,
  `results_count` int(11) DEFAULT 0,
  `referrer` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `searchqueries`
--

INSERT INTO `searchqueries` (`query_id`, `user_id`, `query_text`, `query_time`, `device_type`, `results_count`, `referrer`, `notes`) VALUES
(1, 101, 'Gaming laptops under 20k', '2025-06-05 14:22:10', 'Desktop', 25, 'https://techmart.com/home', 'User searched for laptops.'),
(2, 102, 'Affordable tablets for students', '2025-08-18 10:15:00', 'Mobile', 12, 'https://techmart.com/backtoschool', 'Search related to campaign.'),
(3, 103, 'RTX 4070 graphics card', '2025-12-22 12:44:03', 'Desktop', 7, 'https://techmart.com/gaming', 'High-end GPU search.'),
(4, 104, 'Wireless mouse deals', '2025-04-05 09:50:00', 'Tablet', 15, 'https://techmart.com/accessories', 'Looking for mouse discounts.'),
(5, 105, 'Mechanical keyboards', '2025-03-14 21:07:18', 'Mobile', 10, 'https://techmart.com/gaming', 'Searching for keyboards.'),
(6, 101, 'Gaming laptops under 20k', '2025-06-05 14:22:10', 'Desktop', 25, 'https://techmart.com/home', 'User searched for laptops.'),
(7, 102, 'Affordable tablets for students', '2025-08-18 10:15:00', 'Mobile', 12, 'https://techmart.com/backtoschool', 'Search related to campaign.'),
(8, 103, 'RTX 4070 graphics card', '2025-12-22 12:44:03', 'Desktop', 7, 'https://techmart.com/gaming', 'High-end GPU search.'),
(9, 104, 'Wireless mouse deals', '2025-04-05 09:50:00', 'Tablet', 15, 'https://techmart.com/accessories', 'Looking for mouse discounts.'),
(10, 105, 'Mechanical keyboards', '2025-03-14 21:07:18', 'Mobile', 10, 'https://techmart.com/gaming', 'Searching for keyboards.'),
(11, 101, 'Gaming laptops under 20k', '2025-06-05 14:22:10', 'Desktop', 25, 'https://techmart.com/home', 'User searched for laptops.'),
(12, 102, 'Affordable tablets for students', '2025-08-18 10:15:00', 'Mobile', 12, 'https://techmart.com/backtoschool', 'Search related to campaign.'),
(13, 103, 'RTX 4070 graphics card', '2025-12-22 12:44:03', 'Desktop', 7, 'https://techmart.com/gaming', 'High-end GPU search.'),
(14, 104, 'Wireless mouse deals', '2025-04-05 09:50:00', 'Tablet', 15, 'https://techmart.com/accessories', 'Looking for mouse discounts.'),
(15, 105, 'Mechanical keyboards', '2025-03-14 21:07:18', 'Mobile', 10, 'https://techmart.com/gaming', 'Searching for keyboards.'),
(16, 101, 'Gaming laptops under 20k', '2025-06-05 14:22:10', 'Desktop', 25, 'https://techmart.com/home', 'User searched for laptops.'),
(17, 102, 'Affordable tablets for students', '2025-08-18 10:15:00', 'Mobile', 12, 'https://techmart.com/backtoschool', 'Search related to campaign.'),
(18, 103, 'RTX 4070 graphics card', '2025-12-22 12:44:03', 'Desktop', 7, 'https://techmart.com/gaming', 'High-end GPU search.'),
(19, 104, 'Wireless mouse deals', '2025-04-05 09:50:00', 'Tablet', 15, 'https://techmart.com/accessories', 'Looking for mouse discounts.'),
(20, 105, 'Mechanical keyboards', '2025-03-14 21:07:18', 'Mobile', 10, 'https://techmart.com/gaming', 'Searching for keyboards.'),
(21, 101, 'Gaming laptops under 20k', '2025-06-05 14:22:10', 'Desktop', 25, 'https://techmart.com/home', 'User searched for laptops.'),
(22, 102, 'Affordable tablets for students', '2025-08-18 10:15:00', 'Mobile', 12, 'https://techmart.com/backtoschool', 'Search related to campaign.'),
(23, 103, 'RTX 4070 graphics card', '2025-12-22 12:44:03', 'Desktop', 7, 'https://techmart.com/gaming', 'High-end GPU search.'),
(24, 104, 'Wireless mouse deals', '2025-04-05 09:50:00', 'Tablet', 15, 'https://techmart.com/accessories', 'Looking for mouse discounts.'),
(25, 105, 'Mechanical keyboards', '2025-03-14 21:07:18', 'Mobile', 10, 'https://techmart.com/gaming', 'Searching for keyboards.');

-- --------------------------------------------------------

--
-- Table structure for table `searchreports`
--

CREATE TABLE `searchreports` (
  `report_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `total_queries` int(11) DEFAULT 0,
  `total_clicks` int(11) DEFAULT 0,
  `total_conversions` int(11) DEFAULT 0,
  `most_searched_term` varchar(255) DEFAULT NULL,
  `top_clicked_product_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `searchreports`
--

INSERT INTO `searchreports` (`report_id`, `report_date`, `total_queries`, `total_clicks`, `total_conversions`, `most_searched_term`, `top_clicked_product_id`, `notes`) VALUES
(1, '2025-06-05', 150, 120, 30, 'Gaming laptops under 20k', 201, 'June 5th search activity summary.'),
(2, '2025-08-18', 90, 65, 15, 'Affordable tablets for students', 305, 'Back to School campaign period.'),
(3, '2025-12-22', 200, 180, 50, 'RTX 4070 graphics card', 410, 'High-end GPU search peak during December.'),
(4, '2025-04-05', 75, 50, 10, 'Wireless mouse deals', 512, 'Accessory searches mid-April.'),
(5, '2025-03-14', 60, 45, 12, 'Mechanical keyboards', 603, 'March gaming peripherals search report.'),
(6, '2025-06-05', 150, 120, 30, 'Gaming laptops under 20k', 201, 'June 5th search activity summary.'),
(7, '2025-08-18', 90, 65, 15, 'Affordable tablets for students', 305, 'Back to School campaign period.'),
(8, '2025-12-22', 200, 180, 50, 'RTX 4070 graphics card', 410, 'High-end GPU search peak during December.'),
(9, '2025-04-05', 75, 50, 10, 'Wireless mouse deals', 512, 'Accessory searches mid-April.'),
(10, '2025-03-14', 60, 45, 12, 'Mechanical keyboards', 603, 'March gaming peripherals search report.'),
(11, '2025-06-05', 150, 120, 30, 'Gaming laptops under 20k', 201, 'June 5th search activity summary.'),
(12, '2025-08-18', 90, 65, 15, 'Affordable tablets for students', 305, 'Back to School campaign period.'),
(13, '2025-12-22', 200, 180, 50, 'RTX 4070 graphics card', 410, 'High-end GPU search peak during December.'),
(14, '2025-04-05', 75, 50, 10, 'Wireless mouse deals', 512, 'Accessory searches mid-April.'),
(15, '2025-03-14', 60, 45, 12, 'Mechanical keyboards', 603, 'March gaming peripherals search report.'),
(16, '2025-06-05', 150, 120, 30, 'Gaming laptops under 20k', 201, 'June 5th search activity summary.'),
(17, '2025-08-18', 90, 65, 15, 'Affordable tablets for students', 305, 'Back to School campaign period.'),
(18, '2025-12-22', 200, 180, 50, 'RTX 4070 graphics card', 410, 'High-end GPU search peak during December.'),
(19, '2025-04-05', 75, 50, 10, 'Wireless mouse deals', 512, 'Accessory searches mid-April.'),
(20, '2025-03-14', 60, 45, 12, 'Mechanical keyboards', 603, 'March gaming peripherals search report.'),
(21, '2025-06-05', 150, 120, 30, 'Gaming laptops under 20k', 201, 'June 5th search activity summary.'),
(22, '2025-08-18', 90, 65, 15, 'Affordable tablets for students', 305, 'Back to School campaign period.'),
(23, '2025-12-22', 200, 180, 50, 'RTX 4070 graphics card', 410, 'High-end GPU search peak during December.'),
(24, '2025-04-05', 75, 50, 10, 'Wireless mouse deals', 512, 'Accessory searches mid-April.'),
(25, '2025-03-14', 60, 45, 12, 'Mechanical keyboards', 603, 'March gaming peripherals search report.');

-- --------------------------------------------------------

--
-- Table structure for table `searchresults`
--

CREATE TABLE `searchresults` (
  `result_id` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `displayed_time` datetime NOT NULL,
  `clicked` tinyint(1) DEFAULT 0,
  `click_time` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `searchresults`
--

INSERT INTO `searchresults` (`result_id`, `query_id`, `product_id`, `position`, `displayed_time`, `clicked`, `click_time`, `notes`) VALUES
(1, 1, 201, 1, '2025-06-05 14:22:15', 1, '2025-06-05 14:22:20', 'Top recommended gaming laptop clicked.'),
(2, 1, 202, 2, '2025-06-05 14:22:15', 0, NULL, 'Second laptop result not clicked.'),
(3, 2, 305, 1, '2025-08-18 10:15:05', 1, '2025-08-18 10:15:10', 'Clicked tablet from Back to School promo.'),
(4, 3, 410, 1, '2025-12-22 12:44:05', 1, '2025-12-22 12:44:15', 'High-end GPU clicked.'),
(5, 4, 512, 3, '2025-04-05 09:50:05', 0, NULL, 'Accessory result displayed but not clicked.'),
(6, 1, 201, 1, '2025-06-05 14:22:15', 1, '2025-06-05 14:22:20', 'Top recommended gaming laptop clicked.'),
(7, 1, 202, 2, '2025-06-05 14:22:15', 0, NULL, 'Second laptop result not clicked.'),
(8, 2, 305, 1, '2025-08-18 10:15:05', 1, '2025-08-18 10:15:10', 'Clicked tablet from Back to School promo.'),
(9, 3, 410, 1, '2025-12-22 12:44:05', 1, '2025-12-22 12:44:15', 'High-end GPU clicked.'),
(10, 4, 512, 3, '2025-04-05 09:50:05', 0, NULL, 'Accessory result displayed but not clicked.'),
(11, 1, 201, 1, '2025-06-05 14:22:15', 1, '2025-06-05 14:22:20', 'Top recommended gaming laptop clicked.'),
(12, 1, 202, 2, '2025-06-05 14:22:15', 0, NULL, 'Second laptop result not clicked.'),
(13, 2, 305, 1, '2025-08-18 10:15:05', 1, '2025-08-18 10:15:10', 'Clicked tablet from Back to School promo.'),
(14, 3, 410, 1, '2025-12-22 12:44:05', 1, '2025-12-22 12:44:15', 'High-end GPU clicked.'),
(15, 4, 512, 3, '2025-04-05 09:50:05', 0, NULL, 'Accessory result displayed but not clicked.'),
(16, 1, 201, 1, '2025-06-05 14:22:15', 1, '2025-06-05 14:22:20', 'Top recommended gaming laptop clicked.'),
(17, 1, 202, 2, '2025-06-05 14:22:15', 0, NULL, 'Second laptop result not clicked.'),
(18, 2, 305, 1, '2025-08-18 10:15:05', 1, '2025-08-18 10:15:10', 'Clicked tablet from Back to School promo.'),
(19, 3, 410, 1, '2025-12-22 12:44:05', 1, '2025-12-22 12:44:15', 'High-end GPU clicked.'),
(20, 4, 512, 3, '2025-04-05 09:50:05', 0, NULL, 'Accessory result displayed but not clicked.'),
(21, 1, 201, 1, '2025-06-05 14:22:15', 1, '2025-06-05 14:22:20', 'Top recommended gaming laptop clicked.'),
(22, 1, 202, 2, '2025-06-05 14:22:15', 0, NULL, 'Second laptop result not clicked.'),
(23, 2, 305, 1, '2025-08-18 10:15:05', 1, '2025-08-18 10:15:10', 'Clicked tablet from Back to School promo.'),
(24, 3, 410, 1, '2025-12-22 12:44:05', 1, '2025-12-22 12:44:15', 'High-end GPU clicked.'),
(25, 4, 512, 3, '2025-04-05 09:50:05', 0, NULL, 'Accessory result displayed but not clicked.');

-- --------------------------------------------------------

--
-- Table structure for table `securityalerts`
--

CREATE TABLE `securityalerts` (
  `alert_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `alert_type` enum('email','sms','dashboard','push_notification') NOT NULL,
  `alert_time` datetime NOT NULL,
  `status` enum('pending','sent','acknowledged','resolved') DEFAULT 'pending',
  `severity` enum('low','medium','high','critical') DEFAULT 'medium',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `securityalerts`
--

INSERT INTO `securityalerts` (`alert_id`, `event_id`, `alert_type`, `alert_time`, `status`, `severity`, `notes`) VALUES
(1, 1, 'email', '2025-06-05 08:12:00', 'sent', 'medium', 'Alert sent for failed login attempt.'),
(2, 2, 'dashboard', '2025-08-18 10:16:00', 'acknowledged', 'low', 'User login success notification.'),
(3, 4, 'sms', '2025-04-05 10:00:00', 'pending', 'high', 'Suspicious activity detected, alert pending review.'),
(4, 5, 'push_notification', '2025-03-14 23:05:00', 'resolved', 'critical', 'Account locked due to multiple failed attempts.'),
(5, 3, 'email', '2025-12-22 13:00:00', 'sent', 'medium', 'User changed password, security alert sent.'),
(6, 1, 'email', '2025-06-05 08:12:00', 'sent', 'medium', 'Alert sent for failed login attempt.'),
(7, 2, 'dashboard', '2025-08-18 10:16:00', 'acknowledged', 'low', 'User login success notification.'),
(8, 4, 'sms', '2025-04-05 10:00:00', 'pending', 'high', 'Suspicious activity detected, alert pending review.'),
(9, 5, 'push_notification', '2025-03-14 23:05:00', 'resolved', 'critical', 'Account locked due to multiple failed attempts.'),
(10, 3, 'email', '2025-12-22 13:00:00', 'sent', 'medium', 'User changed password, security alert sent.'),
(11, 1, 'email', '2025-06-05 08:12:00', 'sent', 'medium', 'Alert sent for failed login attempt.'),
(12, 2, 'dashboard', '2025-08-18 10:16:00', 'acknowledged', 'low', 'User login success notification.'),
(13, 4, 'sms', '2025-04-05 10:00:00', 'pending', 'high', 'Suspicious activity detected, alert pending review.'),
(14, 5, 'push_notification', '2025-03-14 23:05:00', 'resolved', 'critical', 'Account locked due to multiple failed attempts.'),
(15, 3, 'email', '2025-12-22 13:00:00', 'sent', 'medium', 'User changed password, security alert sent.'),
(16, 1, 'email', '2025-06-05 08:12:00', 'sent', 'medium', 'Alert sent for failed login attempt.'),
(17, 2, 'dashboard', '2025-08-18 10:16:00', 'acknowledged', 'low', 'User login success notification.'),
(18, 4, 'sms', '2025-04-05 10:00:00', 'pending', 'high', 'Suspicious activity detected, alert pending review.'),
(19, 5, 'push_notification', '2025-03-14 23:05:00', 'resolved', 'critical', 'Account locked due to multiple failed attempts.'),
(20, 3, 'email', '2025-12-22 13:00:00', 'sent', 'medium', 'User changed password, security alert sent.'),
(21, 1, 'email', '2025-06-05 08:12:00', 'sent', 'medium', 'Alert sent for failed login attempt.'),
(22, 2, 'dashboard', '2025-08-18 10:16:00', 'acknowledged', 'low', 'User login success notification.'),
(23, 4, 'sms', '2025-04-05 10:00:00', 'pending', 'high', 'Suspicious activity detected, alert pending review.'),
(24, 5, 'push_notification', '2025-03-14 23:05:00', 'resolved', 'critical', 'Account locked due to multiple failed attempts.'),
(25, 3, 'email', '2025-12-22 13:00:00', 'sent', 'medium', 'User changed password, security alert sent.');

-- --------------------------------------------------------

--
-- Table structure for table `securityevents`
--

CREATE TABLE `securityevents` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_type` enum('login_failed','login_success','password_change','suspicious_activity','access_denied','account_locked') NOT NULL,
  `event_time` datetime NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `device_type` enum('Desktop','Mobile','Tablet') DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `severity` enum('low','medium','high','critical') DEFAULT 'medium',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `securityevents`
--

INSERT INTO `securityevents` (`event_id`, `user_id`, `event_type`, `event_time`, `ip_address`, `device_type`, `location`, `severity`, `notes`) VALUES
(1, 101, 'login_failed', '2025-06-05 08:10:15', '102.54.22.18', 'Desktop', 'Cairo', 'medium', 'Incorrect password attempt.'),
(2, 102, 'login_success', '2025-08-18 10:15:05', '41.68.101.77', 'Mobile', 'Giza', 'low', 'User logged in successfully.'),
(3, 103, 'password_change', '2025-12-22 12:50:30', '197.33.200.55', 'Desktop', 'Dubai', 'medium', 'User updated password.'),
(4, 104, 'suspicious_activity', '2025-04-05 09:55:00', '156.211.88.40', 'Tablet', 'Alexandria', 'high', 'Multiple failed login attempts detected.'),
(5, NULL, 'account_locked', '2025-03-14 23:00:00', NULL, NULL, NULL, 'critical', 'System locked user account due to security policy.'),
(6, 101, 'login_failed', '2025-06-05 08:10:15', '102.54.22.18', 'Desktop', 'Cairo', 'medium', 'Incorrect password attempt.'),
(7, 102, 'login_success', '2025-08-18 10:15:05', '41.68.101.77', 'Mobile', 'Giza', 'low', 'User logged in successfully.'),
(8, 103, 'password_change', '2025-12-22 12:50:30', '197.33.200.55', 'Desktop', 'Dubai', 'medium', 'User updated password.'),
(9, 104, 'suspicious_activity', '2025-04-05 09:55:00', '156.211.88.40', 'Tablet', 'Alexandria', 'high', 'Multiple failed login attempts detected.'),
(10, NULL, 'account_locked', '2025-03-14 23:00:00', NULL, NULL, NULL, 'critical', 'System locked user account due to security policy.'),
(11, 101, 'login_failed', '2025-06-05 08:10:15', '102.54.22.18', 'Desktop', 'Cairo', 'medium', 'Incorrect password attempt.'),
(12, 102, 'login_success', '2025-08-18 10:15:05', '41.68.101.77', 'Mobile', 'Giza', 'low', 'User logged in successfully.'),
(13, 103, 'password_change', '2025-12-22 12:50:30', '197.33.200.55', 'Desktop', 'Dubai', 'medium', 'User updated password.'),
(14, 104, 'suspicious_activity', '2025-04-05 09:55:00', '156.211.88.40', 'Tablet', 'Alexandria', 'high', 'Multiple failed login attempts detected.'),
(15, NULL, 'account_locked', '2025-03-14 23:00:00', NULL, NULL, NULL, 'critical', 'System locked user account due to security policy.'),
(16, 101, 'login_failed', '2025-06-05 08:10:15', '102.54.22.18', 'Desktop', 'Cairo', 'medium', 'Incorrect password attempt.'),
(17, 102, 'login_success', '2025-08-18 10:15:05', '41.68.101.77', 'Mobile', 'Giza', 'low', 'User logged in successfully.'),
(18, 103, 'password_change', '2025-12-22 12:50:30', '197.33.200.55', 'Desktop', 'Dubai', 'medium', 'User updated password.'),
(19, 104, 'suspicious_activity', '2025-04-05 09:55:00', '156.211.88.40', 'Tablet', 'Alexandria', 'high', 'Multiple failed login attempts detected.'),
(20, NULL, 'account_locked', '2025-03-14 23:00:00', NULL, NULL, NULL, 'critical', 'System locked user account due to security policy.'),
(21, 101, 'login_failed', '2025-06-05 08:10:15', '102.54.22.18', 'Desktop', 'Cairo', 'medium', 'Incorrect password attempt.'),
(22, 102, 'login_success', '2025-08-18 10:15:05', '41.68.101.77', 'Mobile', 'Giza', 'low', 'User logged in successfully.'),
(23, 103, 'password_change', '2025-12-22 12:50:30', '197.33.200.55', 'Desktop', 'Dubai', 'medium', 'User updated password.'),
(24, 104, 'suspicious_activity', '2025-04-05 09:55:00', '156.211.88.40', 'Tablet', 'Alexandria', 'high', 'Multiple failed login attempts detected.'),
(25, NULL, 'account_locked', '2025-03-14 23:00:00', NULL, NULL, NULL, 'critical', 'System locked user account due to security policy.');

-- --------------------------------------------------------

--
-- Table structure for table `securityreports`
--

CREATE TABLE `securityreports` (
  `report_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `total_events` int(11) DEFAULT 0,
  `total_alerts` int(11) DEFAULT 0,
  `high_severity_events` int(11) DEFAULT 0,
  `critical_alerts` int(11) DEFAULT 0,
  `most_common_event_type` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `securityreports`
--

INSERT INTO `securityreports` (`report_id`, `report_date`, `total_events`, `total_alerts`, `high_severity_events`, `critical_alerts`, `most_common_event_type`, `notes`) VALUES
(1, '2025-06-05', 25, 5, 3, 1, 'login_failed', 'Daily security report: multiple failed login attempts.'),
(2, '2025-08-18', 18, 3, 2, 0, 'login_success', 'Monitoring Back to School campaign login events.'),
(3, '2025-12-22', 40, 10, 5, 2, 'password_change', 'High activity during holiday season, many password updates.'),
(4, '2025-04-05', 12, 4, 3, 1, 'suspicious_activity', 'Mid-April suspicious activity monitoring.'),
(5, '2025-03-14', 15, 6, 4, 3, 'account_locked', 'Critical security events during March maintenance.'),
(6, '2025-06-05', 25, 5, 3, 1, 'login_failed', 'Daily security report: multiple failed login attempts.'),
(7, '2025-08-18', 18, 3, 2, 0, 'login_success', 'Monitoring Back to School campaign login events.'),
(8, '2025-12-22', 40, 10, 5, 2, 'password_change', 'High activity during holiday season, many password updates.'),
(9, '2025-04-05', 12, 4, 3, 1, 'suspicious_activity', 'Mid-April suspicious activity monitoring.'),
(10, '2025-03-14', 15, 6, 4, 3, 'account_locked', 'Critical security events during March maintenance.'),
(11, '2025-06-05', 25, 5, 3, 1, 'login_failed', 'Daily security report: multiple failed login attempts.'),
(12, '2025-08-18', 18, 3, 2, 0, 'login_success', 'Monitoring Back to School campaign login events.'),
(13, '2025-12-22', 40, 10, 5, 2, 'password_change', 'High activity during holiday season, many password updates.'),
(14, '2025-04-05', 12, 4, 3, 1, 'suspicious_activity', 'Mid-April suspicious activity monitoring.'),
(15, '2025-03-14', 15, 6, 4, 3, 'account_locked', 'Critical security events during March maintenance.'),
(16, '2025-06-05', 25, 5, 3, 1, 'login_failed', 'Daily security report: multiple failed login attempts.'),
(17, '2025-08-18', 18, 3, 2, 0, 'login_success', 'Monitoring Back to School campaign login events.'),
(18, '2025-12-22', 40, 10, 5, 2, 'password_change', 'High activity during holiday season, many password updates.'),
(19, '2025-04-05', 12, 4, 3, 1, 'suspicious_activity', 'Mid-April suspicious activity monitoring.'),
(20, '2025-03-14', 15, 6, 4, 3, 'account_locked', 'Critical security events during March maintenance.'),
(21, '2025-06-05', 25, 5, 3, 1, 'login_failed', 'Daily security report: multiple failed login attempts.'),
(22, '2025-08-18', 18, 3, 2, 0, 'login_success', 'Monitoring Back to School campaign login events.'),
(23, '2025-12-22', 40, 10, 5, 2, 'password_change', 'High activity during holiday season, many password updates.'),
(24, '2025-04-05', 12, 4, 3, 1, 'suspicious_activity', 'Mid-April suspicious activity monitoring.'),
(25, '2025-03-14', 15, 6, 4, 3, 'account_locked', 'Critical security events during March maintenance.');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `token`, `created_at`) VALUES
(1, 1, 'abc123token', '2025-12-01'),
(2, 2, 'xyz456token', '2025-11-20'),
(3, 3, 'def789token', '2025-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `settlementreports`
--

CREATE TABLE `settlementreports` (
  `report_id` int(11) NOT NULL,
  `settlement_id` int(11) NOT NULL,
  `report_date` datetime DEFAULT current_timestamp(),
  `report_type` enum('daily','weekly','monthly') NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `settlementreports`
--

INSERT INTO `settlementreports` (`report_id`, `settlement_id`, `report_date`, `report_type`, `file_path`, `notes`) VALUES
(1, 1, '2024-11-30 23:59:00', 'daily', '/reports/2024/11/settlement_20241130.pdf', 'All transactions settled successfully'),
(2, 2, '2024-11-29 23:59:00', 'daily', '/reports/2024/11/settlement_20241129.pdf', 'Reconciliation completed with bank statements'),
(3, 1, '2024-11-30 23:59:00', 'weekly', '/reports/2024/11/weekly_w48.pdf', 'Week 48 settlement summary');

-- --------------------------------------------------------

--
-- Table structure for table `shipmentcarriers`
--

CREATE TABLE `shipmentcarriers` (
  `carrier_id` int(11) NOT NULL,
  `carrier_name` varchar(100) NOT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shipmentcarriers`
--

INSERT INTO `shipmentcarriers` (`carrier_id`, `carrier_name`, `contact_number`, `country`, `active`) VALUES
(1, 'FedEx', '+1-800-123-456', 'USA', 1),
(2, 'UPS', '+1-800-555-789', 'USA', 1),
(3, 'DHL', '+49-30-123456', 'Germany', 1),
(4, 'Royal Mail', '+44-20-1234-5678', 'UK', 1),
(5, 'Aramex', '+971-4-503-1111', 'UAE', 1),
(6, 'FedEx', '+1-800-123-456', 'USA', 1),
(7, 'UPS', '+1-800-555-789', 'USA', 1),
(8, 'DHL', '+49-30-123456', 'Germany', 1),
(9, 'Royal Mail', '+44-20-1234-5678', 'UK', 1),
(10, 'Aramex', '+971-4-503-1111', 'UAE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipmentevents`
--

CREATE TABLE `shipmentevents` (
  `event_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `event_time` datetime NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shipmentevents`
--

INSERT INTO `shipmentevents` (`event_id`, `shipment_id`, `event_type`, `event_time`, `location`, `notes`) VALUES
(1, 3001, 'Package Received', '2025-01-10 09:15:00', 'New York Hub', 'Shipment created'),
(2, 3001, 'In Transit', '2025-01-10 18:30:00', 'Philadelphia, PA', NULL),
(3, 3002, 'Out for Delivery', '2025-01-11 08:45:00', 'Chicago, IL', 'Courier assigned'),
(4, 3003, 'Customs Clearance', '2025-01-12 13:25:00', 'Cairo Airport', 'Awaiting release'),
(5, 3003, 'Delivered', '2025-01-12 20:10:00', 'Cairo, Egypt', 'Package handed to recipient'),
(6, 3001, 'Package Received', '2025-01-10 09:15:00', 'New York Hub', 'Shipment created'),
(7, 3001, 'In Transit', '2025-01-10 18:30:00', 'Philadelphia, PA', NULL),
(8, 3002, 'Out for Delivery', '2025-01-11 08:45:00', 'Chicago, IL', 'Courier assigned'),
(9, 3003, 'Customs Clearance', '2025-01-12 13:25:00', 'Cairo Airport', 'Awaiting release'),
(10, 3003, 'Delivered', '2025-01-12 20:10:00', 'Cairo, Egypt', 'Package handed to recipient');

-- --------------------------------------------------------

--
-- Table structure for table `shipmentmethods`
--

CREATE TABLE `shipmentmethods` (
  `method_id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `delivery_speed` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shipmentmethods`
--

INSERT INTO `shipmentmethods` (`method_id`, `method_name`, `description`, `delivery_speed`) VALUES
(1, 'Standard', 'Affordable standard delivery', '5-7 days'),
(2, 'Express', 'Fast delivery with priority', '2-3 days'),
(3, 'Overnight', 'Next-day delivery', '1 day'),
(4, 'Economy', 'Low-cost slow shipping', '10-15 days'),
(5, 'Same Day', 'Delivery on the same day', 'Same day'),
(6, 'Standard', 'Affordable standard delivery', '5-7 days'),
(7, 'Express', 'Fast delivery with priority', '2-3 days'),
(8, 'Overnight', 'Next-day delivery', '1 day'),
(9, 'Economy', 'Low-cost slow shipping', '10-15 days'),
(10, 'Same Day', 'Delivery on the same day', 'Same day');

-- --------------------------------------------------------

--
-- Table structure for table `shipmenttracking`
--

CREATE TABLE `shipmenttracking` (
  `tracking_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shipmenttracking`
--

INSERT INTO `shipmenttracking` (`tracking_id`, `shipment_id`, `status`, `location`, `update_time`) VALUES
(1, 1, 'Package accepted', 'New York, NY', '2025-01-11 09:30:00'),
(2, 1, 'In transit', 'Philadelphia, PA', '2025-01-11 15:20:00'),
(3, 2, 'Departed Facility', 'Chicago, IL', '2025-01-12 16:45:00'),
(4, 3, 'Out for delivery', 'Berlin, DE', '2025-01-13 10:00:00'),
(5, 3, 'Delivered', 'Berlin, DE', '2025-01-13 19:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcarts`
--

CREATE TABLE `shoppingcarts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shoppingcarts`
--

INSERT INTO `shoppingcarts` (`cart_id`, `user_id`, `created_at`) VALUES
(1, 1, '2025-12-01'),
(2, 2, '2025-11-20'),
(3, 3, '2025-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `subcategory_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`subcategory_id`, `category_id`, `name`, `description`) VALUES
(1, 1, 'Smartphones', 'Mobile phones and accessories'),
(2, 1, 'Laptops', 'Portable computers'),
(3, 2, 'Shoes', 'Footwear for men and women'),
(4, 1, 'Smartphones', 'Mobile phones and accessories'),
(5, 1, 'Laptops', 'Portable computers'),
(6, 2, 'Shoes', 'Footwear for men and women');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptioninvoices`
--

CREATE TABLE `subscriptioninvoices` (
  `invoice_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `invoice_date` datetime DEFAULT current_timestamp(),
  `due_date` datetime DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('unpaid','paid','failed','refunded') DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subscriptioninvoices`
--

INSERT INTO `subscriptioninvoices` (`invoice_id`, `subscription_id`, `plan_id`, `invoice_date`, `due_date`, `amount`, `status`) VALUES
(1, 1, 2, '2024-11-01 00:00:00', '2024-11-10 23:59:59', 899.00, 'paid'),
(2, 1, 2, '2024-12-01 00:00:00', '2024-12-10 23:59:59', 899.00, 'unpaid'),
(3, 2, 1, '2024-11-15 00:00:00', '2024-11-25 23:59:59', 299.00, 'paid'),
(4, 3, 3, '2024-11-01 00:00:00', '2024-11-10 23:59:59', 2499.00, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptionlogs`
--

CREATE TABLE `subscriptionlogs` (
  `log_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `log_type` enum('status_change','billing_attempt','payment_failed','system_note') NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subscriptionlogs`
--

INSERT INTO `subscriptionlogs` (`log_id`, `subscription_id`, `log_time`, `log_type`, `message`) VALUES
(1, 1, '2024-10-31 22:05:00', 'billing_attempt', 'Monthly billing processed successfully'),
(2, 2, '2024-11-14 22:05:00', 'billing_attempt', 'Monthly billing processed successfully'),
(3, 4, '2024-10-25 12:30:00', 'status_change', 'Customer requested subscription cancellation'),
(4, 4, '2024-10-31 21:59:00', 'status_change', 'Subscription cancelled - No further billing');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptionpayments`
--

CREATE TABLE `subscriptionpayments` (
  `payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` enum('card','wallet','bank_transfer','paypal') NOT NULL,
  `status` enum('success','failed','pending') DEFAULT 'success',
  `transaction_reference` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subscriptionpayments`
--

INSERT INTO `subscriptionpayments` (`payment_id`, `invoice_id`, `payment_date`, `amount`, `method`, `status`, `transaction_reference`) VALUES
(1, 1, '2024-11-05 14:30:00', 899.00, 'card', 'success', 'TXN-PM-20241105-7891'),
(2, 3, '2024-11-17 10:15:00', 299.00, 'wallet', 'success', 'TXN-FW-20241117-4562'),
(3, 4, '2024-11-03 09:00:00', 2499.00, 'bank_transfer', 'success', 'TXN-BT-20241103-1123');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptionplans`
--

CREATE TABLE `subscriptionplans` (
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `billing_cycle` enum('weekly','monthly','yearly') NOT NULL,
  `features` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subscriptionplans`
--

INSERT INTO `subscriptionplans` (`plan_id`, `plan_name`, `description`, `price`, `billing_cycle`, `features`, `is_active`, `created_at`) VALUES
(1, 'Basic Shipper', 'Up to 50 shipments per month with standard tracking', 299.00, 'monthly', 'Standard tracking, Email support, 50 shipments/month', 1, '2025-12-01 17:17:10'),
(2, 'Professional', 'Up to 200 shipments with priority support', 899.00, 'monthly', 'Priority tracking, Phone support, 200 shipments/month, API access', 1, '2025-12-01 17:17:10'),
(3, 'Enterprise', 'Unlimited shipments with dedicated account manager', 2499.00, 'monthly', 'All features, Dedicated manager, Custom integrations, SLA guarantee', 1, '2025-12-01 17:17:10'),
(4, 'Annual Basic', 'Basic plan with annual discount', 2990.00, 'yearly', 'Same as Basic but annual billing with 2 months free', 1, '2025-12-01 17:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact_email`, `phone`) VALUES
(1, 'Tech Distributors', 'contact@techdist.com', '+201234567890'),
(2, 'Fashion Hub', 'info@fashionhub.com', '+201098765432'),
(3, 'Home Supply Co.', 'sales@homesupply.com', '+201112223344'),
(4, 'Tech Distributors', 'contact@techdist.com', '+201234567890'),
(5, 'Fashion Hub', 'info@fashionhub.com', '+201098765432'),
(6, 'Home Supply Co.', 'sales@homesupply.com', '+201112223344');

-- --------------------------------------------------------

--
-- Table structure for table `supporttickets`
--

CREATE TABLE `supporttickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `supporttickets`
--

INSERT INTO `supporttickets` (`ticket_id`, `user_id`, `subject`, `status`, `created_at`) VALUES
(1, 1, 'Laptop issue', 'Open', '2025-12-01'),
(2, 2, 'Payment problem', 'Closed', '2025-11-20'),
(3, 3, 'Delivery delay', 'Pending', '2025-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `tax_id` int(11) NOT NULL,
  `tax_name` varchar(100) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  `applicable_region` varchar(100) DEFAULT NULL,
  `applicable_category` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`tax_id`, `tax_name`, `tax_rate`, `applicable_region`, `applicable_category`, `created_at`) VALUES
(1, 'Egypt VAT', 14.00, 'Egypt', 'All Services', '2023-12-31 22:00:00'),
(2, 'Cairo Local Tax', 2.50, 'Cairo', 'Logistics', '2023-12-31 22:00:00'),
(3, 'Alexandria Port Fee', 5.00, 'Alexandria', 'Import/Export', '2023-12-31 22:00:00'),
(4, 'Express Service Tax', 8.00, 'Egypt', 'Express Delivery', '2023-12-31 22:00:00'),
(5, 'Fuel Surcharge', 3.50, 'Egypt', 'All Services', '2024-05-31 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ticketreplies`
--

CREATE TABLE `ticketreplies` (
  `reply_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_text` varchar(255) DEFAULT NULL,
  `reply_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ticketreplies`
--

INSERT INTO `ticketreplies` (`reply_id`, `ticket_id`, `user_id`, `reply_text`, `reply_date`) VALUES
(1, 1, 2, 'We are checking your issue.', '2025-12-02'),
(2, 2, 3, 'Payment confirmed.', '2025-11-21'),
(3, 3, 1, 'Delivery will be tomorrow.', '2025-10-16');

-- --------------------------------------------------------

--
-- Table structure for table `upsellproducts`
--

CREATE TABLE `upsellproducts` (
  `upsell_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `upsell_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `upsellproducts`
--

INSERT INTO `upsellproducts` (`upsell_id`, `product_id`, `upsell_product_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 1, 2),
(5, 2, 3),
(6, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userprofiles`
--

CREATE TABLE `userprofiles` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `userprofiles`
--

INSERT INTO `userprofiles` (`profile_id`, `user_id`, `full_name`, `birth_date`, `gender`) VALUES
(1, 1, 'Mohamed Ali', '2000-05-10', 'Male'),
(2, 2, 'Sara Ahmed', '1999-08-20', 'Female'),
(3, 3, 'Ahmed Hassan', '2001-03-15', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`role_id`, `user_id`, `role_name`) VALUES
(1, 1, 'Admin'),
(2, 2, 'Customer'),
(3, 3, 'Support');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `is_admin`, `created_at`) VALUES
(1, 'mohamed', 'mohamed@example.com', '', 0, '2025-12-01'),
(2, 'sara', 'sara@example.com', '', 0, '2025-11-20'),
(3, 'ahmed', 'ahmed@example.com', '', 0, '2025-10-15'),
(10, 'admin', 'admin@techmart.com', '$2a$12$S8azBJzNlZRSM6nbE.QaNuA0XfA0E990jR1zBElpHETIPDV3OgUMe', 1, '2025-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `variantattributes`
--

CREATE TABLE `variantattributes` (
  `attribute_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `attribute_name` varchar(100) DEFAULT NULL,
  `attribute_value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `variantattributes`
--

INSERT INTO `variantattributes` (`attribute_id`, `variant_id`, `attribute_name`, `attribute_value`) VALUES
(1, 1, 'Color', 'Silver'),
(2, 2, 'Color', 'Black'),
(3, 3, 'Battery Life', '20 hours'),
(4, 1, 'Color', 'Silver'),
(5, 2, 'Color', 'Black'),
(6, 3, 'Battery Life', '20 hours');

-- --------------------------------------------------------

--
-- Table structure for table `voucherredemptions`
--

CREATE TABLE `voucherredemptions` (
  `redemption_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `redemption_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `voucherredemptions`
--

INSERT INTO `voucherredemptions` (`redemption_id`, `voucher_id`, `customer_id`, `order_id`, `redemption_date`) VALUES
(1, 2, 2, 'ORD-2024-001050', '2024-09-20 11:30:00'),
(2, 3, 1, 'ORD-2024-001180', '2024-11-29 14:45:00'),
(3, 4, 3, 'ORD-2024-001205', '2024-11-28 10:00:00'),
(4, 1, 1, 'ORD-2024-001220', '2024-12-01 09:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `voucher_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `min_purchase_amount` decimal(10,2) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` enum('active','expired','used') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`voucher_id`, `code`, `description`, `discount_percentage`, `min_purchase_amount`, `start_date`, `end_date`, `status`) VALUES
(1, 'WINTER2024', 'Winter seasonal discount', 15.00, 500.00, '2024-12-01 00:00:00', '2024-12-31 23:59:59', 'active'),
(2, 'FIRSTSHIP', 'First-time shipper discount', 25.00, 200.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 'active'),
(3, 'BLACKFRI50', 'Black Friday special offer', 50.00, 1000.00, '2024-11-29 00:00:00', '2024-11-29 23:59:59', 'expired'),
(4, 'LOYAL10', 'Loyalty program discount', 10.00, 100.00, '2024-11-01 00:00:00', '2025-01-31 23:59:59', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `warehouselocations`
--

CREATE TABLE `warehouselocations` (
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `warehouselocations`
--

INSERT INTO `warehouselocations` (`warehouse_id`, `name`, `address`, `city`, `country`) VALUES
(1, 'Main Warehouse', '123 Industrial Zone', 'Cairo', 'Egypt'),
(2, 'Secondary Warehouse', '456 Logistics Park', 'Alexandria', 'Egypt'),
(3, 'Regional Warehouse', '789 Distribution Center', 'Giza', 'Egypt');

-- --------------------------------------------------------

--
-- Table structure for table `warehousestock`
--

CREATE TABLE `warehousestock` (
  `warehouse_stock_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `warehousestock`
--

INSERT INTO `warehousestock` (`warehouse_stock_id`, `warehouse_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 5),
(2, 2, 2, 10),
(3, 3, 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `wishlistitems`
--

CREATE TABLE `wishlistitems` (
  `item_id` int(11) NOT NULL,
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wishlistitems`
--

INSERT INTO `wishlistitems` (`item_id`, `wishlist_id`, `product_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`wishlist_id`, `user_id`, `name`, `created_at`) VALUES
(1, 1, 'Mohamed Wishlist', '2025-12-01'),
(2, 2, 'Sara Wishlist', '2025-11-20'),
(3, 3, 'Ahmed Wishlist', '2025-10-15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesstokens`
--
ALTER TABLE `accesstokens`
  ADD PRIMARY KEY (`token_id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admincharts`
--
ALTER TABLE `admincharts`
  ADD PRIMARY KEY (`ChartID`);

--
-- Indexes for table `admindashboards`
--
ALTER TABLE `admindashboards`
  ADD PRIMARY KEY (`DashboardID`);

--
-- Indexes for table `adminexports`
--
ALTER TABLE `adminexports`
  ADD PRIMARY KEY (`ExportID`);

--
-- Indexes for table `admingraphs`
--
ALTER TABLE `admingraphs`
  ADD PRIMARY KEY (`GraphID`);

--
-- Indexes for table `adminimports`
--
ALTER TABLE `adminimports`
  ADD PRIMARY KEY (`ImportID`);

--
-- Indexes for table `adminintegrations`
--
ALTER TABLE `adminintegrations`
  ADD PRIMARY KEY (`IntegrationID`);

--
-- Indexes for table `adminlogs`
--
ALTER TABLE `adminlogs`
  ADD PRIMARY KEY (`LogID`);

--
-- Indexes for table `adminmessages`
--
ALTER TABLE `adminmessages`
  ADD PRIMARY KEY (`MessageID`);

--
-- Indexes for table `adminnotes`
--
ALTER TABLE `adminnotes`
  ADD PRIMARY KEY (`NoteID`);

--
-- Indexes for table `adminnotifications`
--
ALTER TABLE `adminnotifications`
  ADD PRIMARY KEY (`NotificationID`);

--
-- Indexes for table `adminpermissions`
--
ALTER TABLE `adminpermissions`
  ADD PRIMARY KEY (`PermissionID`),
  ADD UNIQUE KEY `PermissionName` (`PermissionName`);

--
-- Indexes for table `adminpreferences`
--
ALTER TABLE `adminpreferences`
  ADD PRIMARY KEY (`PreferenceID`);

--
-- Indexes for table `adminreports`
--
ALTER TABLE `adminreports`
  ADD PRIMARY KEY (`ReportID`);

--
-- Indexes for table `adminroles`
--
ALTER TABLE `adminroles`
  ADD PRIMARY KEY (`RoleID`),
  ADD UNIQUE KEY `RoleName` (`RoleName`);

--
-- Indexes for table `adminsessions`
--
ALTER TABLE `adminsessions`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `adminsettings`
--
ALTER TABLE `adminsettings`
  ADD PRIMARY KEY (`SettingID`);

--
-- Indexes for table `admintasks`
--
ALTER TABLE `admintasks`
  ADD PRIMARY KEY (`TaskID`);

--
-- Indexes for table `adminthemes`
--
ALTER TABLE `adminthemes`
  ADD PRIMARY KEY (`ThemeID`);

--
-- Indexes for table `adminusers`
--
ALTER TABLE `adminusers`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `adminwidgets`
--
ALTER TABLE `adminwidgets`
  ADD PRIMARY KEY (`WidgetID`);

--
-- Indexes for table `affiliateclicks`
--
ALTER TABLE `affiliateclicks`
  ADD PRIMARY KEY (`click_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `affiliate_id` (`affiliate_id`);

--
-- Indexes for table `affiliatelinks`
--
ALTER TABLE `affiliatelinks`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `link_url` (`link_url`),
  ADD KEY `affiliate_id` (`affiliate_id`);

--
-- Indexes for table `affiliatepayments`
--
ALTER TABLE `affiliatepayments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `affiliate_id` (`affiliate_id`);

--
-- Indexes for table `affiliateprograms`
--
ALTER TABLE `affiliateprograms`
  ADD PRIMARY KEY (`affiliate_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`affiliate_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `apikeys`
--
ALTER TABLE `apikeys`
  ADD PRIMARY KEY (`api_key_id`),
  ADD UNIQUE KEY `api_key` (`api_key`);

--
-- Indexes for table `apirequests`
--
ALTER TABLE `apirequests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `api_key_id` (`api_key_id`);

--
-- Indexes for table `apiresponses`
--
ALTER TABLE `apiresponses`
  ADD PRIMARY KEY (`response_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `auditlogs`
--
ALTER TABLE `auditlogs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `backuplogs`
--
ALTER TABLE `backuplogs`
  ADD PRIMARY KEY (`LogID`);

--
-- Indexes for table `bankaccounts`
--
ALTER TABLE `bankaccounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `bundleitems`
--
ALTER TABLE `bundleitems`
  ADD PRIMARY KEY (`bundle_item_id`),
  ADD KEY `bundle_id` (`bundle_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `campaignads`
--
ALTER TABLE `campaignads`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `campaignclicks`
--
ALTER TABLE `campaignclicks`
  ADD PRIMARY KEY (`click_id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `campaignconversions`
--
ALTER TABLE `campaignconversions`
  ADD PRIMARY KEY (`conversion_id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `campaignimpressions`
--
ALTER TABLE `campaignimpressions`
  ADD PRIMARY KEY (`impression_id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `campaignreports`
--
ALTER TABLE `campaignreports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`campaign_id`);

--
-- Indexes for table `cancelreasons`
--
ALTER TABLE `cancelreasons`
  ADD PRIMARY KEY (`reason_id`);

--
-- Indexes for table `cancelrequests`
--
ALTER TABLE `cancelrequests`
  ADD PRIMARY KEY (`cancel_request_id`);

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contactnumbers`
--
ALTER TABLE `contactnumbers`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `couponusage`
--
ALTER TABLE `couponusage`
  ADD PRIMARY KEY (`usage_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `creditcards`
--
ALTER TABLE `creditcards`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `crosssellproducts`
--
ALTER TABLE `crosssellproducts`
  ADD PRIMARY KEY (`cross_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cross_product_id` (`cross_product_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customsdeclarations`
--
ALTER TABLE `customsdeclarations`
  ADD PRIMARY KEY (`declaration_id`),
  ADD UNIQUE KEY `declaration_number` (`declaration_number`),
  ADD KEY `tracking_id` (`tracking_id`);

--
-- Indexes for table `customslogs`
--
ALTER TABLE `customslogs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `declaration_id` (`declaration_id`);

--
-- Indexes for table `customspayments`
--
ALTER TABLE `customspayments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `declaration_id` (`declaration_id`);

--
-- Indexes for table `databackups`
--
ALTER TABLE `databackups`
  ADD PRIMARY KEY (`BackupID`);

--
-- Indexes for table `deliveryagents`
--
ALTER TABLE `deliveryagents`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `deliveryslots`
--
ALTER TABLE `deliveryslots`
  ADD PRIMARY KEY (`slot_id`);

--
-- Indexes for table `encryptionkeys`
--
ALTER TABLE `encryptionkeys`
  ADD PRIMARY KEY (`KeyID`);

--
-- Indexes for table `encryptionlogs`
--
ALTER TABLE `encryptionlogs`
  ADD PRIMARY KEY (`LogID`);

--
-- Indexes for table `exchangeitems`
--
ALTER TABLE `exchangeitems`
  ADD PRIMARY KEY (`exchange_item_id`);

--
-- Indexes for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`exchange_id`),
  ADD KEY `return_item_id` (`return_item_id`);

--
-- Indexes for table `firewalllogs`
--
ALTER TABLE `firewalllogs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `firewallrules`
--
ALTER TABLE `firewallrules`
  ADD PRIMARY KEY (`RuleID`);

--
-- Indexes for table `fraudchecks`
--
ALTER TABLE `fraudchecks`
  ADD PRIMARY KEY (`fraud_check_id`);

--
-- Indexes for table `gatewayerrors`
--
ALTER TABLE `gatewayerrors`
  ADD PRIMARY KEY (`error_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `gatewaylogs`
--
ALTER TABLE `gatewaylogs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `gdprlogs`
--
ALTER TABLE `gdprlogs`
  ADD PRIMARY KEY (`LogID`);

--
-- Indexes for table `gdprreports`
--
ALTER TABLE `gdprreports`
  ADD PRIMARY KEY (`ReportID`);

--
-- Indexes for table `gdprrequests`
--
ALTER TABLE `gdprrequests`
  ADD PRIMARY KEY (`RequestID`);

--
-- Indexes for table `giftcards`
--
ALTER TABLE `giftcards`
  ADD PRIMARY KEY (`giftcard_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `giftcardtransactions`
--
ALTER TABLE `giftcardtransactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `giftcard_id` (`giftcard_id`);

--
-- Indexes for table `inventorylogs`
--
ALTER TABLE `inventorylogs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `loginhistory`
--
ALTER TABLE `loginhistory`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `logisticsagents`
--
ALTER TABLE `logisticsagents`
  ADD PRIMARY KEY (`agent_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `logisticscontracts`
--
ALTER TABLE `logisticscontracts`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `logisticsevents`
--
ALTER TABLE `logisticsevents`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `tracking_id` (`tracking_id`);

--
-- Indexes for table `logisticsinvoices`
--
ALTER TABLE `logisticsinvoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `contract_id` (`contract_id`);

--
-- Indexes for table `logisticspartners`
--
ALTER TABLE `logisticspartners`
  ADD PRIMARY KEY (`partner_id`);

--
-- Indexes for table `logisticspayments`
--
ALTER TABLE `logisticspayments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `logisticsreports`
--
ALTER TABLE `logisticsreports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `logisticsroutes`
--
ALTER TABLE `logisticsroutes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `logisticsschedules`
--
ALTER TABLE `logisticsschedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `logisticstracking`
--
ALTER TABLE `logisticstracking`
  ADD PRIMARY KEY (`tracking_id`);

--
-- Indexes for table `logisticsvehicles`
--
ALTER TABLE `logisticsvehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `plate_number` (`plate_number`);

--
-- Indexes for table `logisticswarehouses`
--
ALTER TABLE `logisticswarehouses`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- Indexes for table `loyaltypoints`
--
ALTER TABLE `loyaltypoints`
  ADD PRIMARY KEY (`point_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `manufacturerdetails`
--
ALTER TABLE `manufacturerdetails`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `orderinvoices`
--
ALTER TABLE `orderinvoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `ordernotes`
--
ALTER TABLE `ordernotes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `orderpayments`
--
ALTER TABLE `orderpayments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `ordershipments`
--
ALTER TABLE `ordershipments`
  ADD PRIMARY KEY (`shipment_id`),
  ADD UNIQUE KEY `tracking_number` (`tracking_number`),
  ADD KEY `carrier_id` (`carrier_id`),
  ADD KEY `method_id` (`method_id`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `paymentdisputelogs`
--
ALTER TABLE `paymentdisputelogs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `dispute_id` (`dispute_id`);

--
-- Indexes for table `paymentdisputes`
--
ALTER TABLE `paymentdisputes`
  ADD PRIMARY KEY (`dispute_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `paymentgateways`
--
ALTER TABLE `paymentgateways`
  ADD PRIMARY KEY (`gateway_id`);

--
-- Indexes for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD PRIMARY KEY (`method_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `paymentrefunds`
--
ALTER TABLE `paymentrefunds`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `paymentsettlement`
--
ALTER TABLE `paymentsettlement`
  ADD PRIMARY KEY (`settlement_id`);

--
-- Indexes for table `paymentsubscriptions`
--
ALTER TABLE `paymentsubscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `paymenttransactions`
--
ALTER TABLE `paymenttransactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `transaction_reference` (`transaction_reference`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `productbundles`
--
ALTER TABLE `productbundles`
  ADD PRIMARY KEY (`bundle_id`);

--
-- Indexes for table `productcoupons`
--
ALTER TABLE `productcoupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productdiscounts`
--
ALTER TABLE `productdiscounts`
  ADD PRIMARY KEY (`discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productratings`
--
ALTER TABLE `productratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `productreports`
--
ALTER TABLE `productreports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `productspecifications`
--
ALTER TABLE `productspecifications`
  ADD PRIMARY KEY (`spec_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productstock`
--
ALTER TABLE `productstock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `producttags`
--
ALTER TABLE `producttags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productvariants`
--
ALTER TABLE `productvariants`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `productvideos`
--
ALTER TABLE `productvideos`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `promotionreports`
--
ALTER TABLE `promotionreports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `promotion_id` (`promotion_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `recommendationlogs`
--
ALTER TABLE `recommendationlogs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `recommendation_id` (`recommendation_id`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`recommendation_id`);

--
-- Indexes for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD PRIMARY KEY (`refresh_token_id`),
  ADD UNIQUE KEY `refresh_token` (`refresh_token`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `return_item_id` (`return_item_id`);

--
-- Indexes for table `refundtransactions`
--
ALTER TABLE `refundtransactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `transaction_reference` (`transaction_reference`),
  ADD KEY `refund_id` (`refund_id`);

--
-- Indexes for table `relatedproducts`
--
ALTER TABLE `relatedproducts`
  ADD PRIMARY KEY (`relation_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `related_product_id` (`related_product_id`);

--
-- Indexes for table `restorelogs`
--
ALTER TABLE `restorelogs`
  ADD PRIMARY KEY (`LogID`);

--
-- Indexes for table `restorerequests`
--
ALTER TABLE `restorerequests`
  ADD PRIMARY KEY (`RequestID`);

--
-- Indexes for table `returnitems`
--
ALTER TABLE `returnitems`
  ADD PRIMARY KEY (`return_item_id`),
  ADD KEY `reason_id` (`reason_id`);

--
-- Indexes for table `returnreasons`
--
ALTER TABLE `returnreasons`
  ADD PRIMARY KEY (`reason_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `reviewreplies`
--
ALTER TABLE `reviewreplies`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `review_id` (`review_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reviewvotes`
--
ALTER TABLE `reviewvotes`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `review_id` (`review_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `searchqueries`
--
ALTER TABLE `searchqueries`
  ADD PRIMARY KEY (`query_id`);

--
-- Indexes for table `searchreports`
--
ALTER TABLE `searchreports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `searchresults`
--
ALTER TABLE `searchresults`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `query_id` (`query_id`);

--
-- Indexes for table `securityalerts`
--
ALTER TABLE `securityalerts`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `securityevents`
--
ALTER TABLE `securityevents`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `securityreports`
--
ALTER TABLE `securityreports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `settlementreports`
--
ALTER TABLE `settlementreports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `settlement_id` (`settlement_id`);

--
-- Indexes for table `shipmentcarriers`
--
ALTER TABLE `shipmentcarriers`
  ADD PRIMARY KEY (`carrier_id`);

--
-- Indexes for table `shipmentevents`
--
ALTER TABLE `shipmentevents`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `shipmentmethods`
--
ALTER TABLE `shipmentmethods`
  ADD PRIMARY KEY (`method_id`);

--
-- Indexes for table `shipmenttracking`
--
ALTER TABLE `shipmenttracking`
  ADD PRIMARY KEY (`tracking_id`),
  ADD KEY `shipment_id` (`shipment_id`);

--
-- Indexes for table `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `subscriptioninvoices`
--
ALTER TABLE `subscriptioninvoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `subscription_id` (`subscription_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `subscriptionlogs`
--
ALTER TABLE `subscriptionlogs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `subscription_id` (`subscription_id`);

--
-- Indexes for table `subscriptionpayments`
--
ALTER TABLE `subscriptionpayments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `subscriptionplans`
--
ALTER TABLE `subscriptionplans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `supporttickets`
--
ALTER TABLE `supporttickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `ticketreplies`
--
ALTER TABLE `ticketreplies`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `upsellproducts`
--
ALTER TABLE `upsellproducts`
  ADD PRIMARY KEY (`upsell_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `upsell_product_id` (`upsell_product_id`);

--
-- Indexes for table `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `variantattributes`
--
ALTER TABLE `variantattributes`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `voucherredemptions`
--
ALTER TABLE `voucherredemptions`
  ADD PRIMARY KEY (`redemption_id`),
  ADD KEY `voucher_id` (`voucher_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`voucher_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `warehouselocations`
--
ALTER TABLE `warehouselocations`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- Indexes for table `warehousestock`
--
ALTER TABLE `warehousestock`
  ADD PRIMARY KEY (`warehouse_stock_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wishlistitems`
--
ALTER TABLE `wishlistitems`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `wishlist_id` (`wishlist_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesstokens`
--
ALTER TABLE `accesstokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admincharts`
--
ALTER TABLE `admincharts`
  MODIFY `ChartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admindashboards`
--
ALTER TABLE `admindashboards`
  MODIFY `DashboardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminexports`
--
ALTER TABLE `adminexports`
  MODIFY `ExportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admingraphs`
--
ALTER TABLE `admingraphs`
  MODIFY `GraphID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminimports`
--
ALTER TABLE `adminimports`
  MODIFY `ImportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminintegrations`
--
ALTER TABLE `adminintegrations`
  MODIFY `IntegrationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminlogs`
--
ALTER TABLE `adminlogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminmessages`
--
ALTER TABLE `adminmessages`
  MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminnotes`
--
ALTER TABLE `adminnotes`
  MODIFY `NoteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminnotifications`
--
ALTER TABLE `adminnotifications`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminpermissions`
--
ALTER TABLE `adminpermissions`
  MODIFY `PermissionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adminpreferences`
--
ALTER TABLE `adminpreferences`
  MODIFY `PreferenceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminreports`
--
ALTER TABLE `adminreports`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminroles`
--
ALTER TABLE `adminroles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adminsessions`
--
ALTER TABLE `adminsessions`
  MODIFY `SessionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminsettings`
--
ALTER TABLE `adminsettings`
  MODIFY `SettingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admintasks`
--
ALTER TABLE `admintasks`
  MODIFY `TaskID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminthemes`
--
ALTER TABLE `adminthemes`
  MODIFY `ThemeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adminusers`
--
ALTER TABLE `adminusers`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `adminwidgets`
--
ALTER TABLE `adminwidgets`
  MODIFY `WidgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `affiliateclicks`
--
ALTER TABLE `affiliateclicks`
  MODIFY `click_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `affiliatelinks`
--
ALTER TABLE `affiliatelinks`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `affiliatepayments`
--
ALTER TABLE `affiliatepayments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `affiliateprograms`
--
ALTER TABLE `affiliateprograms`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `apikeys`
--
ALTER TABLE `apikeys`
  MODIFY `api_key_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apirequests`
--
ALTER TABLE `apirequests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apiresponses`
--
ALTER TABLE `apiresponses`
  MODIFY `response_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auditlogs`
--
ALTER TABLE `auditlogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `backuplogs`
--
ALTER TABLE `backuplogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bankaccounts`
--
ALTER TABLE `bankaccounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bundleitems`
--
ALTER TABLE `bundleitems`
  MODIFY `bundle_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `campaignads`
--
ALTER TABLE `campaignads`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `campaignclicks`
--
ALTER TABLE `campaignclicks`
  MODIFY `click_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `campaignconversions`
--
ALTER TABLE `campaignconversions`
  MODIFY `conversion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `campaignimpressions`
--
ALTER TABLE `campaignimpressions`
  MODIFY `impression_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `campaignreports`
--
ALTER TABLE `campaignreports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `campaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cancelreasons`
--
ALTER TABLE `cancelreasons`
  MODIFY `reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cancelrequests`
--
ALTER TABLE `cancelrequests`
  MODIFY `cancel_request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contactnumbers`
--
ALTER TABLE `contactnumbers`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `couponusage`
--
ALTER TABLE `couponusage`
  MODIFY `usage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `creditcards`
--
ALTER TABLE `creditcards`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crosssellproducts`
--
ALTER TABLE `crosssellproducts`
  MODIFY `cross_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customsdeclarations`
--
ALTER TABLE `customsdeclarations`
  MODIFY `declaration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customslogs`
--
ALTER TABLE `customslogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customspayments`
--
ALTER TABLE `customspayments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `databackups`
--
ALTER TABLE `databackups`
  MODIFY `BackupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliveryagents`
--
ALTER TABLE `deliveryagents`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `deliveryslots`
--
ALTER TABLE `deliveryslots`
  MODIFY `slot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `encryptionkeys`
--
ALTER TABLE `encryptionkeys`
  MODIFY `KeyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `encryptionlogs`
--
ALTER TABLE `encryptionlogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exchangeitems`
--
ALTER TABLE `exchangeitems`
  MODIFY `exchange_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchanges`
--
ALTER TABLE `exchanges`
  MODIFY `exchange_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `firewalllogs`
--
ALTER TABLE `firewalllogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `firewallrules`
--
ALTER TABLE `firewallrules`
  MODIFY `RuleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fraudchecks`
--
ALTER TABLE `fraudchecks`
  MODIFY `fraud_check_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gatewayerrors`
--
ALTER TABLE `gatewayerrors`
  MODIFY `error_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gatewaylogs`
--
ALTER TABLE `gatewaylogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gdprlogs`
--
ALTER TABLE `gdprlogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gdprreports`
--
ALTER TABLE `gdprreports`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gdprrequests`
--
ALTER TABLE `gdprrequests`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `giftcards`
--
ALTER TABLE `giftcards`
  MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `giftcardtransactions`
--
ALTER TABLE `giftcardtransactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventorylogs`
--
ALTER TABLE `inventorylogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loginhistory`
--
ALTER TABLE `loginhistory`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logisticsagents`
--
ALTER TABLE `logisticsagents`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logisticscontracts`
--
ALTER TABLE `logisticscontracts`
  MODIFY `contract_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `logisticsevents`
--
ALTER TABLE `logisticsevents`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logisticsinvoices`
--
ALTER TABLE `logisticsinvoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logisticspartners`
--
ALTER TABLE `logisticspartners`
  MODIFY `partner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `logisticspayments`
--
ALTER TABLE `logisticspayments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logisticsreports`
--
ALTER TABLE `logisticsreports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logisticsroutes`
--
ALTER TABLE `logisticsroutes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logisticsschedules`
--
ALTER TABLE `logisticsschedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `logisticstracking`
--
ALTER TABLE `logisticstracking`
  MODIFY `tracking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logisticsvehicles`
--
ALTER TABLE `logisticsvehicles`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `logisticswarehouses`
--
ALTER TABLE `logisticswarehouses`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `loyaltypoints`
--
ALTER TABLE `loyaltypoints`
  MODIFY `point_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manufacturerdetails`
--
ALTER TABLE `manufacturerdetails`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderhistory`
--
ALTER TABLE `orderhistory`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orderinvoices`
--
ALTER TABLE `orderinvoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ordernotes`
--
ALTER TABLE `ordernotes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orderpayments`
--
ALTER TABLE `orderpayments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ordershipments`
--
ALTER TABLE `ordershipments`
  MODIFY `shipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentdisputelogs`
--
ALTER TABLE `paymentdisputelogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paymentdisputes`
--
ALTER TABLE `paymentdisputes`
  MODIFY `dispute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paymentgateways`
--
ALTER TABLE `paymentgateways`
  MODIFY `gateway_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  MODIFY `method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paymentrefunds`
--
ALTER TABLE `paymentrefunds`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `paymentsettlement`
--
ALTER TABLE `paymentsettlement`
  MODIFY `settlement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paymentsubscriptions`
--
ALTER TABLE `paymentsubscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paymenttransactions`
--
ALTER TABLE `paymenttransactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `productbundles`
--
ALTER TABLE `productbundles`
  MODIFY `bundle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productcoupons`
--
ALTER TABLE `productcoupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `productdetails`
--
ALTER TABLE `productdetails`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productdiscounts`
--
ALTER TABLE `productdiscounts`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `productimages`
--
ALTER TABLE `productimages`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productratings`
--
ALTER TABLE `productratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productreports`
--
ALTER TABLE `productreports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productspecifications`
--
ALTER TABLE `productspecifications`
  MODIFY `spec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productstock`
--
ALTER TABLE `productstock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `producttags`
--
ALTER TABLE `producttags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productvariants`
--
ALTER TABLE `productvariants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productvideos`
--
ALTER TABLE `productvideos`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `promotionreports`
--
ALTER TABLE `promotionreports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recommendationlogs`
--
ALTER TABLE `recommendationlogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `recommendation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  MODIFY `refresh_token_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `refundtransactions`
--
ALTER TABLE `refundtransactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `relatedproducts`
--
ALTER TABLE `relatedproducts`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `restorelogs`
--
ALTER TABLE `restorelogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `restorerequests`
--
ALTER TABLE `restorerequests`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `returnitems`
--
ALTER TABLE `returnitems`
  MODIFY `return_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `returnreasons`
--
ALTER TABLE `returnreasons`
  MODIFY `reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviewreplies`
--
ALTER TABLE `reviewreplies`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviewvotes`
--
ALTER TABLE `reviewvotes`
  MODIFY `vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `searchqueries`
--
ALTER TABLE `searchqueries`
  MODIFY `query_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `searchreports`
--
ALTER TABLE `searchreports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `searchresults`
--
ALTER TABLE `searchresults`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `securityalerts`
--
ALTER TABLE `securityalerts`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `securityevents`
--
ALTER TABLE `securityevents`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `securityreports`
--
ALTER TABLE `securityreports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settlementreports`
--
ALTER TABLE `settlementreports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipmentcarriers`
--
ALTER TABLE `shipmentcarriers`
  MODIFY `carrier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipmentevents`
--
ALTER TABLE `shipmentevents`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipmentmethods`
--
ALTER TABLE `shipmentmethods`
  MODIFY `method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipmenttracking`
--
ALTER TABLE `shipmenttracking`
  MODIFY `tracking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscriptioninvoices`
--
ALTER TABLE `subscriptioninvoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscriptionlogs`
--
ALTER TABLE `subscriptionlogs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscriptionpayments`
--
ALTER TABLE `subscriptionpayments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscriptionplans`
--
ALTER TABLE `subscriptionplans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supporttickets`
--
ALTER TABLE `supporttickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ticketreplies`
--
ALTER TABLE `ticketreplies`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `upsellproducts`
--
ALTER TABLE `upsellproducts`
  MODIFY `upsell_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userprofiles`
--
ALTER TABLE `userprofiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `variantattributes`
--
ALTER TABLE `variantattributes`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `voucherredemptions`
--
ALTER TABLE `voucherredemptions`
  MODIFY `redemption_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warehouselocations`
--
ALTER TABLE `warehouselocations`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehousestock`
--
ALTER TABLE `warehousestock`
  MODIFY `warehouse_stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlistitems`
--
ALTER TABLE `wishlistitems`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `affiliateclicks`
--
ALTER TABLE `affiliateclicks`
  ADD CONSTRAINT `affiliateclicks_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `affiliatelinks` (`link_id`),
  ADD CONSTRAINT `affiliateclicks_ibfk_2` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliates` (`affiliate_id`);

--
-- Constraints for table `affiliatelinks`
--
ALTER TABLE `affiliatelinks`
  ADD CONSTRAINT `affiliatelinks_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliates` (`affiliate_id`);

--
-- Constraints for table `affiliatepayments`
--
ALTER TABLE `affiliatepayments`
  ADD CONSTRAINT `affiliatepayments_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliates` (`affiliate_id`);

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `apirequests`
--
ALTER TABLE `apirequests`
  ADD CONSTRAINT `apirequests_ibfk_1` FOREIGN KEY (`api_key_id`) REFERENCES `apikeys` (`api_key_id`);

--
-- Constraints for table `apiresponses`
--
ALTER TABLE `apiresponses`
  ADD CONSTRAINT `apiresponses_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `apirequests` (`request_id`);

--
-- Constraints for table `bankaccounts`
--
ALTER TABLE `bankaccounts`
  ADD CONSTRAINT `bankaccounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `bundleitems`
--
ALTER TABLE `bundleitems`
  ADD CONSTRAINT `bundleitems_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `productbundles` (`bundle_id`),
  ADD CONSTRAINT `bundleitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `campaignads`
--
ALTER TABLE `campaignads`
  ADD CONSTRAINT `campaignads_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`);

--
-- Constraints for table `campaignclicks`
--
ALTER TABLE `campaignclicks`
  ADD CONSTRAINT `campaignclicks_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `campaignads` (`ad_id`),
  ADD CONSTRAINT `campaignclicks_ibfk_2` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`);

--
-- Constraints for table `campaignconversions`
--
ALTER TABLE `campaignconversions`
  ADD CONSTRAINT `campaignconversions_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `campaignads` (`ad_id`),
  ADD CONSTRAINT `campaignconversions_ibfk_2` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`);

--
-- Constraints for table `campaignimpressions`
--
ALTER TABLE `campaignimpressions`
  ADD CONSTRAINT `campaignimpressions_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `campaignads` (`ad_id`),
  ADD CONSTRAINT `campaignimpressions_ibfk_2` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`);

--
-- Constraints for table `campaignreports`
--
ALTER TABLE `campaignreports`
  ADD CONSTRAINT `campaignreports_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`campaign_id`);

--
-- Constraints for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `shoppingcarts` (`cart_id`),
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `contactnumbers`
--
ALTER TABLE `contactnumbers`
  ADD CONSTRAINT `contactnumbers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `couponusage`
--
ALTER TABLE `couponusage`
  ADD CONSTRAINT `couponusage_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`coupon_id`);

--
-- Constraints for table `creditcards`
--
ALTER TABLE `creditcards`
  ADD CONSTRAINT `creditcards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `crosssellproducts`
--
ALTER TABLE `crosssellproducts`
  ADD CONSTRAINT `crosssellproducts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `crosssellproducts_ibfk_2` FOREIGN KEY (`cross_product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `customsdeclarations`
--
ALTER TABLE `customsdeclarations`
  ADD CONSTRAINT `customsdeclarations_ibfk_1` FOREIGN KEY (`tracking_id`) REFERENCES `logisticstracking` (`tracking_id`);

--
-- Constraints for table `customslogs`
--
ALTER TABLE `customslogs`
  ADD CONSTRAINT `customslogs_ibfk_1` FOREIGN KEY (`declaration_id`) REFERENCES `customsdeclarations` (`declaration_id`);

--
-- Constraints for table `customspayments`
--
ALTER TABLE `customspayments`
  ADD CONSTRAINT `customspayments_ibfk_1` FOREIGN KEY (`declaration_id`) REFERENCES `customsdeclarations` (`declaration_id`);

--
-- Constraints for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD CONSTRAINT `exchanges_ibfk_1` FOREIGN KEY (`return_item_id`) REFERENCES `returnitems` (`return_item_id`);

--
-- Constraints for table `gatewayerrors`
--
ALTER TABLE `gatewayerrors`
  ADD CONSTRAINT `gatewayerrors_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `paymenttransactions` (`transaction_id`);

--
-- Constraints for table `gatewaylogs`
--
ALTER TABLE `gatewaylogs`
  ADD CONSTRAINT `gatewaylogs_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `paymenttransactions` (`transaction_id`);

--
-- Constraints for table `giftcardtransactions`
--
ALTER TABLE `giftcardtransactions`
  ADD CONSTRAINT `giftcardtransactions_ibfk_1` FOREIGN KEY (`giftcard_id`) REFERENCES `giftcards` (`giftcard_id`);

--
-- Constraints for table `inventorylogs`
--
ALTER TABLE `inventorylogs`
  ADD CONSTRAINT `inventorylogs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `loginhistory`
--
ALTER TABLE `loginhistory`
  ADD CONSTRAINT `loginhistory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `logisticsagents`
--
ALTER TABLE `logisticsagents`
  ADD CONSTRAINT `logisticsagents_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `logisticspartners` (`partner_id`);

--
-- Constraints for table `logisticscontracts`
--
ALTER TABLE `logisticscontracts`
  ADD CONSTRAINT `logisticscontracts_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `logisticspartners` (`partner_id`);

--
-- Constraints for table `logisticsevents`
--
ALTER TABLE `logisticsevents`
  ADD CONSTRAINT `logisticsevents_ibfk_1` FOREIGN KEY (`tracking_id`) REFERENCES `logisticstracking` (`tracking_id`);

--
-- Constraints for table `logisticsinvoices`
--
ALTER TABLE `logisticsinvoices`
  ADD CONSTRAINT `logisticsinvoices_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `logisticscontracts` (`contract_id`);

--
-- Constraints for table `logisticspayments`
--
ALTER TABLE `logisticspayments`
  ADD CONSTRAINT `logisticspayments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `logisticsinvoices` (`invoice_id`);

--
-- Constraints for table `logisticsreports`
--
ALTER TABLE `logisticsreports`
  ADD CONSTRAINT `logisticsreports_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `logisticsschedules` (`schedule_id`);

--
-- Constraints for table `logisticsschedules`
--
ALTER TABLE `logisticsschedules`
  ADD CONSTRAINT `logisticsschedules_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `logisticsvehicles` (`vehicle_id`),
  ADD CONSTRAINT `logisticsschedules_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `logisticsroutes` (`route_id`);

--
-- Constraints for table `loyaltypoints`
--
ALTER TABLE `loyaltypoints`
  ADD CONSTRAINT `loyaltypoints_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderhistory_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `orderstatus` (`status_id`);

--
-- Constraints for table `orderpayments`
--
ALTER TABLE `orderpayments`
  ADD CONSTRAINT `orderpayments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `ordershipments`
--
ALTER TABLE `ordershipments`
  ADD CONSTRAINT `ordershipments_ibfk_1` FOREIGN KEY (`carrier_id`) REFERENCES `shipmentcarriers` (`carrier_id`),
  ADD CONSTRAINT `ordershipments_ibfk_2` FOREIGN KEY (`method_id`) REFERENCES `shipmentmethods` (`method_id`);

--
-- Constraints for table `paymentdisputelogs`
--
ALTER TABLE `paymentdisputelogs`
  ADD CONSTRAINT `paymentdisputelogs_ibfk_1` FOREIGN KEY (`dispute_id`) REFERENCES `paymentdisputes` (`dispute_id`);

--
-- Constraints for table `paymentdisputes`
--
ALTER TABLE `paymentdisputes`
  ADD CONSTRAINT `paymentdisputes_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `logisticspayments` (`payment_id`);

--
-- Constraints for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD CONSTRAINT `paymentmethods_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `paymentrefunds`
--
ALTER TABLE `paymentrefunds`
  ADD CONSTRAINT `paymentrefunds_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `logisticspayments` (`payment_id`);

--
-- Constraints for table `paymentsubscriptions`
--
ALTER TABLE `paymentsubscriptions`
  ADD CONSTRAINT `paymentsubscriptions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `paymenttransactions`
--
ALTER TABLE `paymenttransactions`
  ADD CONSTRAINT `paymenttransactions_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `userroles` (`role_id`);

--
-- Constraints for table `productcoupons`
--
ALTER TABLE `productcoupons`
  ADD CONSTRAINT `productcoupons_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD CONSTRAINT `productdetails_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productdiscounts`
--
ALTER TABLE `productdiscounts`
  ADD CONSTRAINT `productdiscounts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productratings`
--
ALTER TABLE `productratings`
  ADD CONSTRAINT `productratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `productratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `productreports`
--
ALTER TABLE `productreports`
  ADD CONSTRAINT `productreports_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD CONSTRAINT `productreviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `productreviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `productspecifications`
--
ALTER TABLE `productspecifications`
  ADD CONSTRAINT `productspecifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productstock`
--
ALTER TABLE `productstock`
  ADD CONSTRAINT `productstock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `producttags`
--
ALTER TABLE `producttags`
  ADD CONSTRAINT `producttags_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productvariants`
--
ALTER TABLE `productvariants`
  ADD CONSTRAINT `productvariants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `productvideos`
--
ALTER TABLE `productvideos`
  ADD CONSTRAINT `productvideos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `promotionreports`
--
ALTER TABLE `promotionreports`
  ADD CONSTRAINT `promotionreports_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`promotion_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `recommendationlogs`
--
ALTER TABLE `recommendationlogs`
  ADD CONSTRAINT `recommendationlogs_ibfk_1` FOREIGN KEY (`recommendation_id`) REFERENCES `recommendations` (`recommendation_id`);

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_ibfk_1` FOREIGN KEY (`return_item_id`) REFERENCES `returnitems` (`return_item_id`);

--
-- Constraints for table `refundtransactions`
--
ALTER TABLE `refundtransactions`
  ADD CONSTRAINT `refundtransactions_ibfk_1` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`refund_id`);

--
-- Constraints for table `relatedproducts`
--
ALTER TABLE `relatedproducts`
  ADD CONSTRAINT `relatedproducts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `relatedproducts_ibfk_2` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `returnitems`
--
ALTER TABLE `returnitems`
  ADD CONSTRAINT `returnitems_ibfk_1` FOREIGN KEY (`reason_id`) REFERENCES `returnreasons` (`reason_id`);

--
-- Constraints for table `reviewreplies`
--
ALTER TABLE `reviewreplies`
  ADD CONSTRAINT `reviewreplies_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `productreviews` (`review_id`),
  ADD CONSTRAINT `reviewreplies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reviewvotes`
--
ALTER TABLE `reviewvotes`
  ADD CONSTRAINT `reviewvotes_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `productreviews` (`review_id`),
  ADD CONSTRAINT `reviewvotes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `searchresults`
--
ALTER TABLE `searchresults`
  ADD CONSTRAINT `searchresults_ibfk_1` FOREIGN KEY (`query_id`) REFERENCES `searchqueries` (`query_id`);

--
-- Constraints for table `securityalerts`
--
ALTER TABLE `securityalerts`
  ADD CONSTRAINT `securityalerts_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `securityevents` (`event_id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `settlementreports`
--
ALTER TABLE `settlementreports`
  ADD CONSTRAINT `settlementreports_ibfk_1` FOREIGN KEY (`settlement_id`) REFERENCES `paymentsettlement` (`settlement_id`);

--
-- Constraints for table `shipmenttracking`
--
ALTER TABLE `shipmenttracking`
  ADD CONSTRAINT `shipmenttracking_ibfk_1` FOREIGN KEY (`shipment_id`) REFERENCES `ordershipments` (`shipment_id`);

--
-- Constraints for table `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  ADD CONSTRAINT `shoppingcarts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `subscriptioninvoices`
--
ALTER TABLE `subscriptioninvoices`
  ADD CONSTRAINT `subscriptioninvoices_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `paymentsubscriptions` (`subscription_id`),
  ADD CONSTRAINT `subscriptioninvoices_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `subscriptionplans` (`plan_id`);

--
-- Constraints for table `subscriptionlogs`
--
ALTER TABLE `subscriptionlogs`
  ADD CONSTRAINT `subscriptionlogs_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `paymentsubscriptions` (`subscription_id`);

--
-- Constraints for table `subscriptionpayments`
--
ALTER TABLE `subscriptionpayments`
  ADD CONSTRAINT `subscriptionpayments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `subscriptioninvoices` (`invoice_id`);

--
-- Constraints for table `supporttickets`
--
ALTER TABLE `supporttickets`
  ADD CONSTRAINT `supporttickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `ticketreplies`
--
ALTER TABLE `ticketreplies`
  ADD CONSTRAINT `ticketreplies_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `supporttickets` (`ticket_id`),
  ADD CONSTRAINT `ticketreplies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `upsellproducts`
--
ALTER TABLE `upsellproducts`
  ADD CONSTRAINT `upsellproducts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `upsellproducts_ibfk_2` FOREIGN KEY (`upsell_product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD CONSTRAINT `userprofiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `variantattributes`
--
ALTER TABLE `variantattributes`
  ADD CONSTRAINT `variantattributes_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `productvariants` (`variant_id`);

--
-- Constraints for table `voucherredemptions`
--
ALTER TABLE `voucherredemptions`
  ADD CONSTRAINT `voucherredemptions_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`voucher_id`),
  ADD CONSTRAINT `voucherredemptions_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `warehousestock`
--
ALTER TABLE `warehousestock`
  ADD CONSTRAINT `warehousestock_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouselocations` (`warehouse_id`),
  ADD CONSTRAINT `warehousestock_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `wishlistitems`
--
ALTER TABLE `wishlistitems`
  ADD CONSTRAINT `wishlistitems_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists` (`wishlist_id`),
  ADD CONSTRAINT `wishlistitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
