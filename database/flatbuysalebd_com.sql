-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2025 at 07:50 PM
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
-- Database: `flatbuysalebd_com`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `move_in_date` date DEFAULT NULL,
  `application_type` enum('tenant','guarantor') NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `citizenship` enum('yes','no') NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `monthly_income` decimal(10,2) DEFAULT NULL,
  `government_id` varchar(255) DEFAULT NULL,
  `issuing_state` varchar(100) DEFAULT NULL,
  `ssn` varchar(255) DEFAULT NULL,
  `id_front_path` varchar(255) DEFAULT NULL,
  `id_back_path` varchar(255) DEFAULT NULL,
  `selfie_path` varchar(255) DEFAULT NULL,
  `income_path` varchar(255) DEFAULT NULL,
  `payment_path` varchar(255) DEFAULT NULL,
  `status` enum('pending','processing','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `application_successes`
--

CREATE TABLE `application_successes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `icon`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Residential', 'residential', 'fas fa-archway', NULL, 'active', '2025-09-27 10:40:43', '2025-09-27 10:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_submissions`
--

CREATE TABLE `contact_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('unread','read','replied') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` char(2) NOT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', NULL, NULL),
(2, 'AL', 'Albania', NULL, NULL),
(3, 'DZ', 'Algeria', NULL, NULL),
(4, 'AS', 'American Samoa', NULL, NULL),
(5, 'AD', 'Andorra', NULL, NULL),
(6, 'AO', 'Angola', NULL, NULL),
(7, 'AI', 'Anguilla', NULL, NULL),
(8, 'AQ', 'Antarctica', NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', NULL, NULL),
(10, 'AR', 'Argentina', NULL, NULL),
(11, 'AM', 'Armenia', NULL, NULL),
(12, 'AW', 'Aruba', NULL, NULL),
(13, 'AU', 'Australia', NULL, NULL),
(14, 'AT', 'Austria', NULL, NULL),
(15, 'AZ', 'Azerbaijan', NULL, NULL),
(16, 'BS', 'Bahamas', NULL, NULL),
(17, 'BH', 'Bahrain', NULL, NULL),
(18, 'BD', 'Bangladesh', NULL, NULL),
(19, 'BB', 'Barbados', NULL, NULL),
(20, 'BY', 'Belarus', NULL, NULL),
(21, 'BE', 'Belgium', NULL, NULL),
(22, 'BZ', 'Belize', NULL, NULL),
(23, 'BJ', 'Benin', NULL, NULL),
(24, 'BM', 'Bermuda', NULL, NULL),
(25, 'BT', 'Bhutan', NULL, NULL),
(26, 'BO', 'Bolivia', NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(28, 'BW', 'Botswana', NULL, NULL),
(29, 'BV', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'Brazil', NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'Brunei Darussalam', NULL, NULL),
(33, 'BG', 'Bulgaria', NULL, NULL),
(34, 'BF', 'Burkina Faso', NULL, NULL),
(35, 'BI', 'Burundi', NULL, NULL),
(36, 'KH', 'Cambodia', NULL, NULL),
(37, 'CM', 'Cameroon', NULL, NULL),
(38, 'CA', 'Canada', NULL, NULL),
(39, 'CV', 'Cape Verde', NULL, NULL),
(40, 'KY', 'Cayman Islands', NULL, NULL),
(41, 'CF', 'Central African Republic', NULL, NULL),
(42, 'TD', 'Chad', NULL, NULL),
(43, 'CL', 'Chile', NULL, NULL),
(44, 'CN', 'China', NULL, NULL),
(45, 'CX', 'Christmas Island', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'Colombia', NULL, NULL),
(48, 'KM', 'Comoros', NULL, NULL),
(49, 'CD', 'Democratic Republic of the Congo', NULL, NULL),
(50, 'CG', 'Republic of Congo', NULL, NULL),
(51, 'CK', 'Cook Islands', NULL, NULL),
(52, 'CR', 'Costa Rica', NULL, NULL),
(53, 'HR', 'Croatia (Hrvatska)', NULL, NULL),
(54, 'CU', 'Cuba', NULL, NULL),
(55, 'CY', 'Cyprus', NULL, NULL),
(56, 'CZ', 'Czech Republic', NULL, NULL),
(57, 'DK', 'Denmark', NULL, NULL),
(58, 'DJ', 'Djibouti', NULL, NULL),
(59, 'DM', 'Dominica', NULL, NULL),
(60, 'DO', 'Dominican Republic', NULL, NULL),
(61, 'TL', 'East Timor', NULL, NULL),
(62, 'EC', 'Ecuador', NULL, NULL),
(63, 'EG', 'Egypt', NULL, NULL),
(64, 'SV', 'El Salvador', NULL, NULL),
(65, 'GQ', 'Equatorial Guinea', NULL, NULL),
(66, 'ER', 'Eritrea', NULL, NULL),
(67, 'EE', 'Estonia', NULL, NULL),
(68, 'ET', 'Ethiopia', NULL, NULL),
(69, 'FK', 'Falkland Islands (Malvinas)', NULL, NULL),
(70, 'FO', 'Faroe Islands', NULL, NULL),
(71, 'FJ', 'Fiji', NULL, NULL),
(72, 'FI', 'Finland', NULL, NULL),
(73, 'FR', 'France', NULL, NULL),
(74, 'FX', 'France, Metropolitan', NULL, NULL),
(75, 'GF', 'French Guiana', NULL, NULL),
(76, 'PF', 'French Polynesia', NULL, NULL),
(77, 'TF', 'French Southern Territories', NULL, NULL),
(78, 'GA', 'Gabon', NULL, NULL),
(79, 'GM', 'Gambia', NULL, NULL),
(80, 'GE', 'Georgia', NULL, NULL),
(81, 'DE', 'Germany', NULL, NULL),
(82, 'GH', 'Ghana', NULL, NULL),
(83, 'GI', 'Gibraltar', NULL, NULL),
(84, 'GG', 'Guernsey', NULL, NULL),
(85, 'GR', 'Greece', NULL, NULL),
(86, 'GL', 'Greenland', NULL, NULL),
(87, 'GD', 'Grenada', NULL, NULL),
(88, 'GP', 'Guadeloupe', NULL, NULL),
(89, 'GU', 'Guam', NULL, NULL),
(90, 'GT', 'Guatemala', NULL, NULL),
(91, 'GN', 'Guinea', NULL, NULL),
(92, 'GW', 'Guinea-Bissau', NULL, NULL),
(93, 'GY', 'Guyana', NULL, NULL),
(94, 'HT', 'Haiti', NULL, NULL),
(95, 'HM', 'Heard and Mc Donald Islands', NULL, NULL),
(96, 'HN', 'Honduras', NULL, NULL),
(97, 'HK', 'Hong Kong', NULL, NULL),
(98, 'HU', 'Hungary', NULL, NULL),
(99, 'IS', 'Iceland', NULL, NULL),
(100, 'IN', 'India', NULL, NULL),
(101, 'IM', 'Isle of Man', NULL, NULL),
(102, 'ID', 'Indonesia', NULL, NULL),
(103, 'IR', 'Iran (Islamic Republic of)', NULL, NULL),
(104, 'IQ', 'Iraq', NULL, NULL),
(105, 'IE', 'Ireland', NULL, NULL),
(106, 'IL', 'Israel', NULL, NULL),
(107, 'IT', 'Italy', NULL, NULL),
(108, 'CI', 'Ivory Coast', NULL, NULL),
(109, 'JE', 'Jersey', NULL, NULL),
(110, 'JM', 'Jamaica', NULL, NULL),
(111, 'JP', 'Japan', NULL, NULL),
(112, 'JO', 'Jordan', NULL, NULL),
(113, 'KZ', 'Kazakhstan', NULL, NULL),
(114, 'KE', 'Kenya', NULL, NULL),
(115, 'KI', 'Kiribati', NULL, NULL),
(116, 'KP', 'Korea, Democratic People\'s Republic of', NULL, NULL),
(117, 'KR', 'Korea, Republic of', NULL, NULL),
(118, 'XK', 'Kosovo', NULL, NULL),
(119, 'KW', 'Kuwait', NULL, NULL),
(120, 'KG', 'Kyrgyzstan', NULL, NULL),
(121, 'LA', 'Lao People\'s Democratic Republic', NULL, NULL),
(122, 'LV', 'Latvia', NULL, NULL),
(123, 'LB', 'Lebanon', NULL, NULL),
(124, 'LS', 'Lesotho', NULL, NULL),
(125, 'LR', 'Liberia', NULL, NULL),
(126, 'LY', 'Libyan Arab Jamahiriya', NULL, NULL),
(127, 'LI', 'Liechtenstein', NULL, NULL),
(128, 'LT', 'Lithuania', NULL, NULL),
(129, 'LU', 'Luxembourg', NULL, NULL),
(130, 'MO', 'Macau', NULL, NULL),
(131, 'MK', 'North Macedonia', NULL, NULL),
(132, 'MG', 'Madagascar', NULL, NULL),
(133, 'MW', 'Malawi', NULL, NULL),
(134, 'MY', 'Malaysia', NULL, NULL),
(135, 'MV', 'Maldives', NULL, NULL),
(136, 'ML', 'Mali', NULL, NULL),
(137, 'MT', 'Malta', NULL, NULL),
(138, 'MH', 'Marshall Islands', NULL, NULL),
(139, 'MQ', 'Martinique', NULL, NULL),
(140, 'MR', 'Mauritania', NULL, NULL),
(141, 'MU', 'Mauritius', NULL, NULL),
(142, 'YT', 'Mayotte', NULL, NULL),
(143, 'MX', 'Mexico', NULL, NULL),
(144, 'FM', 'Micronesia, Federated States of', NULL, NULL),
(145, 'MD', 'Moldova, Republic of', NULL, NULL),
(146, 'MC', 'Monaco', NULL, NULL),
(147, 'MN', 'Mongolia', NULL, NULL),
(148, 'ME', 'Montenegro', NULL, NULL),
(149, 'MS', 'Montserrat', NULL, NULL),
(150, 'MA', 'Morocco', NULL, NULL),
(151, 'MZ', 'Mozambique', NULL, NULL),
(152, 'MM', 'Myanmar', NULL, NULL),
(153, 'NA', 'Namibia', NULL, NULL),
(154, 'NR', 'Nauru', NULL, NULL),
(155, 'NP', 'Nepal', NULL, NULL),
(156, 'NL', 'Netherlands', NULL, NULL),
(157, 'AN', 'Netherlands Antilles', NULL, NULL),
(158, 'NC', 'New Caledonia', NULL, NULL),
(159, 'NZ', 'New Zealand', NULL, NULL),
(160, 'NI', 'Nicaragua', NULL, NULL),
(161, 'NE', 'Niger', NULL, NULL),
(162, 'NG', 'Nigeria', NULL, NULL),
(163, 'NU', 'Niue', NULL, NULL),
(164, 'NF', 'Norfolk Island', NULL, NULL),
(165, 'MP', 'Northern Mariana Islands', NULL, NULL),
(166, 'NO', 'Norway', NULL, NULL),
(167, 'OM', 'Oman', NULL, NULL),
(168, 'PK', 'Pakistan', NULL, NULL),
(169, 'PW', 'Palau', NULL, NULL),
(170, 'PS', 'Palestine', NULL, NULL),
(171, 'PA', 'Panama', NULL, NULL),
(172, 'PG', 'Papua New Guinea', NULL, NULL),
(173, 'PY', 'Paraguay', NULL, NULL),
(174, 'PE', 'Peru', NULL, NULL),
(175, 'PH', 'Philippines', NULL, NULL),
(176, 'PN', 'Pitcairn', NULL, NULL),
(177, 'PL', 'Poland', NULL, NULL),
(178, 'PT', 'Portugal', NULL, NULL),
(179, 'PR', 'Puerto Rico', NULL, NULL),
(180, 'QA', 'Qatar', NULL, NULL),
(181, 'RE', 'Reunion', NULL, NULL),
(182, 'RO', 'Romania', NULL, NULL),
(183, 'RU', 'Russian Federation', NULL, NULL),
(184, 'RW', 'Rwanda', NULL, NULL),
(185, 'KN', 'Saint Kitts and Nevis', NULL, NULL),
(186, 'LC', 'Saint Lucia', NULL, NULL),
(187, 'VC', 'Saint Vincent and the Grenadines', NULL, NULL),
(188, 'WS', 'Samoa', NULL, NULL),
(189, 'SM', 'San Marino', NULL, NULL),
(190, 'ST', 'Sao Tome and Principe', NULL, NULL),
(191, 'SA', 'Saudi Arabia', NULL, NULL),
(192, 'SN', 'Senegal', NULL, NULL),
(193, 'RS', 'Serbia', NULL, NULL),
(194, 'SC', 'Seychelles', NULL, NULL),
(195, 'SL', 'Sierra Leone', NULL, NULL),
(196, 'SG', 'Singapore', NULL, NULL),
(197, 'SK', 'Slovakia', NULL, NULL),
(198, 'SI', 'Slovenia', NULL, NULL),
(199, 'SB', 'Solomon Islands', NULL, NULL),
(200, 'SO', 'Somalia', NULL, NULL),
(201, 'ZA', 'South Africa', NULL, NULL),
(202, 'GS', 'South Georgia South Sandwich Islands', NULL, NULL),
(203, 'SS', 'South Sudan', NULL, NULL),
(204, 'ES', 'Spain', NULL, NULL),
(205, 'LK', 'Sri Lanka', NULL, NULL),
(206, 'SH', 'St. Helena', NULL, NULL),
(207, 'PM', 'St. Pierre and Miquelon', NULL, NULL),
(208, 'SD', 'Sudan', NULL, NULL),
(209, 'SR', 'Suriname', NULL, NULL),
(210, 'SJ', 'Svalbard and Jan Mayen Islands', NULL, NULL),
(211, 'SZ', 'Eswatini', NULL, NULL),
(212, 'SE', 'Sweden', NULL, NULL),
(213, 'CH', 'Switzerland', NULL, NULL),
(214, 'SY', 'Syrian Arab Republic', NULL, NULL),
(215, 'TW', 'Taiwan', NULL, NULL),
(216, 'TJ', 'Tajikistan', NULL, NULL),
(217, 'TZ', 'Tanzania, United Republic of', NULL, NULL),
(218, 'TH', 'Thailand', NULL, NULL),
(219, 'TG', 'Togo', NULL, NULL),
(220, 'TK', 'Tokelau', NULL, NULL),
(221, 'TO', 'Tonga', NULL, NULL),
(222, 'TT', 'Trinidad and Tobago', NULL, NULL),
(223, 'TN', 'Tunisia', NULL, NULL),
(224, 'TR', 'Turkey', NULL, NULL),
(225, 'TM', 'Turkmenistan', NULL, NULL),
(226, 'TC', 'Turks and Caicos Islands', NULL, NULL),
(227, 'TV', 'Tuvalu', NULL, NULL),
(228, 'UG', 'Uganda', NULL, NULL),
(229, 'UA', 'Ukraine', NULL, NULL),
(230, 'AE', 'United Arab Emirates', NULL, NULL),
(231, 'GB', 'United Kingdom', NULL, NULL),
(232, 'US', 'United States', NULL, NULL),
(233, 'UM', 'United States minor outlying islands', NULL, NULL),
(234, 'UY', 'Uruguay', NULL, NULL),
(235, 'UZ', 'Uzbekistan', NULL, NULL),
(236, 'VU', 'Vanuatu', NULL, NULL),
(237, 'VA', 'Vatican City State', NULL, NULL),
(238, 'VE', 'Venezuela', NULL, NULL),
(239, 'VN', 'Vietnam', NULL, NULL),
(240, 'VG', 'Virgin Islands (British)', NULL, NULL),
(241, 'VI', 'Virgin Islands (U.S.)', NULL, NULL),
(242, 'WF', 'Wallis and Futuna Islands', NULL, NULL),
(243, 'EH', 'Western Sahara', NULL, NULL),
(244, 'YE', 'Yemen', NULL, NULL),
(245, 'ZM', 'Zambia', NULL, NULL),
(246, 'ZW', 'Zimbabwe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feature_name` varchar(255) NOT NULL,
  `icon_class` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `feature_name`, `icon_class`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Swimming pool', 'fas fa-person-swimming', 'active', '2025-09-27 10:41:05', '2025-09-27 10:41:05'),
(2, 'Grage', 'fas fa-diagram-project', 'active', '2025-09-27 10:41:28', '2025-09-27 10:41:28'),
(3, 'Garden', 'fas fa-house-flood-water-circle-arrow-right', 'active', '2025-09-27 10:42:40', '2025-09-27 10:42:40');

-- --------------------------------------------------------

--
-- Table structure for table `hero_banners`
--

CREATE TABLE `hero_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `badge_text` varchar(255) DEFAULT NULL,
  `badge_color` varchar(255) NOT NULL DEFAULT 'bg-green',
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `search_locations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`search_locations`)),
  `popular_searches` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`popular_searches`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hero_banners`
--

INSERT INTO `hero_banners` (`id`, `badge_text`, `badge_color`, `title`, `description`, `image`, `search_locations`, `popular_searches`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Get Discount Contact Our Agent', 'bg-green', 'Find Your Dream House', 'Find homes in 80+ different countries represented by 700 leading member brokerages.', 'uploads/hero-banner/search-img_68d81626b2957.png', '[\"California\",\"Denver\",\"Las Vegas\",\"San Antonio\",\"San Francisco\",\"Los Angeles\",\"New Orleans\",\"San Diego\"]', '[\"2 BHK\",\"Banglaw\",\"Apartment\",\"London\",\"Villa\"]', 1, '2025-09-27 10:51:50', '2025-09-27 10:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_07_27_090636_create_settings_table', 1),
(5, '2024_07_27_093025_create_states_table', 1),
(6, '2025_08_27_060808_create_categories_table', 1),
(7, '2025_08_27_080422_create_features_table', 1),
(8, '2025_08_27_085743_create_properties_table', 1),
(9, '2025_08_27_085816_create_property_features_table', 1),
(10, '2025_08_27_085848_create_property_images_table', 1),
(11, '2025_08_27_085919_create_property_attachments_table', 1),
(12, '2025_08_27_112044_create_permission_tables', 1),
(13, '2025_08_31_050526_create_testimonials_table', 1),
(14, '2025_08_31_081221_create_contact_submissions_table', 1),
(15, '2025_08_31_081221_create_contacts_table', 1),
(16, '2025_08_31_090108_create_stories_table', 1),
(17, '2025_08_31_101835_create_teams_table', 1),
(18, '2025_08_31_110639_create_missions_table', 1),
(19, '2025_09_01_065640_create_applications_table', 1),
(20, '2025_09_01_080310_create_countries_table', 1),
(21, '2025_09_01_092725_create_payment_methods_table', 1),
(22, '2025_09_02_085107_create_achievements_table', 1),
(23, '2025_09_02_091548_create_services_table', 1),
(24, '2025_09_02_103039_create_hero_banners_table', 1),
(25, '2025_09_03_093128_create_application_successes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `missions`
--

CREATE TABLE `missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `mission_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`mission_items`)),
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `logo`, `qr_code`, `instructions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bKash', 'uploads/payment-methods/logos/bkash_68d8187b190f7.png', 'uploads/payment-methods/qr-codes/nagad-qr_68d8187b19d15.jpg', NULL, 1, '2025-09-27 10:59:29', '2025-09-27 11:01:47'),
(2, 'Nagad', 'uploads/payment-methods/logos/nagad_68d8188ca75d4.png', 'uploads/payment-methods/qr-codes/nagad-qr_68d8181a8434b.jpg', NULL, 1, '2025-09-27 11:00:10', '2025-09-27 11:02:04'),
(3, 'Roket', 'uploads/payment-methods/logos/roket_68d818a923f5a.png', 'uploads/payment-methods/qr-codes/nagad-qr_68d818ced89b9.jpg', NULL, 1, '2025-09-27 11:02:33', '2025-09-27 11:03:10'),
(4, 'Upay', 'uploads/payment-methods/logos/upay_68d818c58c1f5.png', 'uploads/payment-methods/qr-codes/nagad-qr_68d818c58c78c.jpg', NULL, 1, '2025-09-27 11:03:01', '2025-09-27 11:03:01'),
(5, 'City Bank', 'uploads/payment-methods/logos/city-bank_68d818ebeafa2.jpg', 'uploads/payment-methods/qr-codes/nagad-qr_68d818ebeb797.jpg', NULL, 1, '2025-09-27 11:03:39', '2025-09-27 11:03:39'),
(6, 'Creadit Card', 'uploads/payment-methods/logos/credit-card_68d8191564c54.png', 'uploads/payment-methods/qr-codes/nagad-qr_68d819156538b.jpg', NULL, 1, '2025-09-27 11:04:21', '2025-09-27 11:04:21'),
(7, 'Cashless', 'uploads/payment-methods/logos/cashless-payment_68d819399c67b.png', NULL, NULL, 1, '2025-09-27 11:04:57', '2025-09-27 11:04:57'),
(8, 'Cash', 'uploads/payment-methods/logos/cash_68d8194c04ec3.png', NULL, NULL, 1, '2025-09-27 11:05:16', '2025-09-27 11:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'property.index', 'web', '2025-09-27 10:38:23', '2025-09-27 10:38:23'),
(2, 'property.create', 'web', '2025-09-27 10:38:23', '2025-09-27 10:38:23'),
(3, 'property.show', 'web', '2025-09-27 10:38:23', '2025-09-27 10:38:23'),
(4, 'property.update', 'web', '2025-09-27 10:38:23', '2025-09-27 10:38:23');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `area_size` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `bed_room` int(11) NOT NULL DEFAULT 0,
  `dining_room` int(11) NOT NULL DEFAULT 0,
  `bath_room` int(11) NOT NULL DEFAULT 0,
  `balcony` int(11) NOT NULL DEFAULT 0,
  `property_status` enum('For Sale','For Rent','Sold','Under Offer') NOT NULL DEFAULT 'For Sale',
  `condition` enum('New','Resale','Under Construction') NOT NULL DEFAULT 'New',
  `built_year` int(11) DEFAULT NULL,
  `dimension` varchar(255) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state_county` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `title`, `slug`, `description`, `area_size`, `price`, `bed_room`, `dining_room`, `bath_room`, `balcony`, `property_status`, `condition`, `built_year`, `dimension`, `location`, `address`, `state_county`, `city`, `zip_code`, `country`, `is_featured`, `category_id`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Quasi odit dolor dol', 'quasi-odit-dolor-dol', '<div class=\"es-property-section es-property_section--basic-facts\" id=\"basic-facts\" style=\"box-sizing: inherit; margin: 40px 0px; color: rgb(65, 64, 66); font-family: \"Open Sans\", sans-serif; font-size: 10px;\"><h3 class=\"es-property-section__title\" style=\"box-sizing: inherit; border: 0px; font-size: 2.2em; font-style: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; color: rgb(176, 190, 197); line-height: 1.5em; font-family: Lato; letter-spacing: 0.2px; position: relative; overflow: hidden;\">Basics</h3><div class=\"es-property-section__content\" style=\"box-sizing: inherit; padding: 20px 100px 0px;\"><ul class=\"es-property-fields es-entity-fields\" style=\"border: 0px; font-style: inherit; font-weight: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; display: grid; grid-template-columns: repeat(auto-fit, minmax(230px, 1fr)); column-gap: 30px;\"><li class=\"es-entity-field es-entity-field--price_per_sqft es-property-field es-property-field--price_per_sqft es-property-field--price\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Price per sqft<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">$435</span></li><li class=\"es-entity-field es-entity-field--date_added es-property-field es-property-field--date_added es-property-field--date_added\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Date added<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">Added 12 months ago</span></li><li class=\"es-entity-field es-entity-field--es_category es-property-field es-property-field--es_category es-property-field--default\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Category<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\"><a href=\"https://rentnowusa.us/property-category/for-rent/\" rel=\"tag\" style=\"box-sizing: inherit; text-decoration: none; color: rgb(38, 50, 56); transition: 0.2s linear; box-shadow: none; border: 0px;\">For rent</a></span></li><li class=\"es-entity-field es-entity-field--es_type es-property-field es-property-field--es_type es-property-field--default\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Type<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\"><a href=\"https://rentnowusa.us/property-type/condo/\" rel=\"tag\" style=\"box-sizing: inherit; text-decoration: none; color: rgb(38, 50, 56); transition: 0.2s linear; box-shadow: none; border: 0px;\">Condo</a></span></li><li class=\"es-entity-field es-entity-field--es_status es-property-field es-property-field--es_status es-property-field--default\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Status<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\"><a href=\"https://rentnowusa.us/es_status/open/\" rel=\"tag\" style=\"box-sizing: inherit; text-decoration: none; color: rgb(38, 50, 56); transition: 0.2s linear; box-shadow: none; border: 0px;\">Open</a></span></li><li class=\"es-entity-field es-entity-field--bedrooms es-property-field es-property-field--bedrooms es-property-field--beds\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Bedrooms<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">5</span></li><li class=\"es-entity-field es-entity-field--bathrooms es-property-field es-property-field--bathrooms es-property-field--baths\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Bathrooms<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">2</span></li><li class=\"es-entity-field es-entity-field--half_baths es-property-field es-property-field--half_baths es-property-field--half_baths\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Half baths<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">0</span></li><li class=\"es-entity-field es-entity-field--total_rooms es-property-field es-property-field--total_rooms es-property-field--default\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Total rooms<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">7</span></li><li class=\"es-entity-field es-entity-field--floors es-property-field es-property-field--floors es-property-field--floors\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Floors<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">2</span></li><li class=\"es-entity-field es-entity-field--area es-property-field es-property-field--area es-property-field--area\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Area<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\"><span style=\"box-sizing: inherit;\">700</span> <span style=\"box-sizing: inherit;\">sq ft</span></span></li><li class=\"es-entity-field es-entity-field--lot_size es-property-field es-property-field--lot_size es-property-field--lot_size\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Lot size<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\"><span style=\"box-sizing: inherit;\">506</span> <span style=\"box-sizing: inherit;\">sq ft</span></span></li><li class=\"es-entity-field es-entity-field--year_built es-property-field es-property-field--year_built es-property-field--default\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Year built<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">1998</span></li><li class=\"es-entity-field es-entity-field--year_remodeled es-property-field es-property-field--year_remodeled es-property-field--default\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 4px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56);\"><span class=\"es-property-field__label\" style=\"box-sizing: inherit; display: inline; margin-bottom: 0px;\">Year remodeled<span class=\"es-property-field__sep\" style=\"box-sizing: inherit; display: inline;\">:</span> </span><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: inline;\">2020</span></li></ul></div></div><div class=\"es-property-section es-property_section--description\" id=\"description\" style=\"box-sizing: inherit; margin: 40px 0px; color: rgb(65, 64, 66); font-family: \"Open Sans\", sans-serif; font-size: 10px;\"><h3 class=\"es-property-section__title\" style=\"box-sizing: inherit; border: 0px; font-size: 2.2em; font-style: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; clear: both; color: rgb(176, 190, 197); line-height: 1.5em; font-family: Lato; letter-spacing: 0.2px; position: relative; overflow: hidden;\">Description</h3><div class=\"es-property-section__content\" style=\"box-sizing: inherit; padding: 20px 100px 0px;\"><ul class=\"es-property-fields es-entity-fields\" style=\"border: 0px; font-style: inherit; font-weight: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; display: grid; grid-template-columns: repeat(auto-fit, minmax(230px, 1fr)); column-gap: 30px;\"><li class=\"es-entity-field es-entity-field--post_content es-property-field es-property-field--post_content es-property-field--default\" style=\"box-sizing: inherit; border: 0px; font-size: 1.4em; font-style: inherit; margin: 5px 0px 20px; outline: 0px; padding: 0px; vertical-align: baseline; list-style: none; line-height: 1.7em; color: rgb(38, 50, 56); flex: 1 0 100%; grid-column: 1 / 3;\"><span class=\"es-property-field__value es-entity-field__value\" style=\"box-sizing: inherit; display: block;\"><p style=\"box-sizing: inherit; border: 0px; font-style: inherit; font-weight: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Condo for sale.<br style=\"box-sizing: inherit;\">This is a demo single property page of Estatik 4.x plugin.<br style=\"box-sizing: inherit;\">Valet, shops, business center, spa, fitness center, sauna jacuzzi, 3 state of the art swimming pools, walk to restaurants, bank, American airlines arena bayside, pharmacies, Whole Foods market. Close to the airport, Miami Adrienne Arsht Center, Perez art</p></span></li></ul></div></div>', '1500', 266.00, 8, 6, 8, 9, 'For Sale', 'Under Construction', 2025, 'Minus aspernatur mol', 'https://www.hitibipuce.org.au', 'Sit eius est quae h', 'Officia maxime persp', 'Est veritatis et aut', '73660', 'Ad enim perferendis', 1, 1, 3, 'active', '2025-09-27 10:46:36', '2025-09-27 11:48:17');

-- --------------------------------------------------------

--
-- Table structure for table `property_attachments`
--

CREATE TABLE `property_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_attachments`
--

INSERT INTO `property_attachments` (`id`, `property_id`, `name`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Floor Plan', 'uploads/properties/attachments/wavier_68d815d3de642.pdf', '2025-09-27 10:50:27', '2025-09-27 10:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `property_features`
--

CREATE TABLE `property_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_features`
--

INSERT INTO `property_features` (`id`, `property_id`, `feature_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image_path`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/properties/img-20250830-wa0029_68d814ed0ed42.jpg', 1, '2025-09-27 10:46:37', '2025-09-27 10:50:27'),
(2, 1, 'uploads/properties/img-20250830-wa0011_68d814ed1af14.jpg', 0, '2025-09-27 10:46:37', '2025-09-27 10:50:27'),
(3, 1, 'uploads/properties/img-20250830-wa0006_68d814ed1c9ba.jpg', 0, '2025-09-27 10:46:37', '2025-09-27 10:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-09-27 10:38:23', '2025-09-27 10:38:23'),
(2, 'editor', 'web', '2025-09-27 10:38:23', '2025-09-27 10:38:23'),
(3, 'viewer', 'web', '2025-09-27 10:38:23', '2025-09-27 10:38:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9ozh5UkZhhWEJtelVIdQ5jiTmgpD83ySEcx8j2dP', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaDZBbzRENVNEODNsdmJnVVZ1R3RrN2tRemZ3a2lhYzI5a2FlQjVYNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWdlL3Byb3BlcnRpZXMtZGV0YWlscy9xdWFzaS1vZGl0LWRvbG9yLWRvbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1758995297);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `success_text` text DEFAULT NULL,
  `fb_pixel_code` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Alabama', 'AL', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(2, 'Alaska', 'AK', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(3, 'Arizona', 'AZ', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(4, 'Arkansas', 'AR', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(5, 'California', 'CA', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(6, 'Colorado', 'CO', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(7, 'Connecticut', 'CT', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(8, 'Delaware', 'DE', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(9, 'District of Columbia', 'DC', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(10, 'Florida', 'FL', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(11, 'Georgia', 'GA', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(12, 'Hawaii', 'HI', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(13, 'Idaho', 'ID', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(14, 'Illinois', 'IL', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(15, 'Indiana', 'IN', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(16, 'Iowa', 'IA', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(17, 'Kansas', 'KS', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(18, 'Kentucky', 'KY', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(19, 'Louisiana', 'LA', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(20, 'Maine', 'ME', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(21, 'Maryland', 'MD', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(22, 'Massachusetts', 'MA', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(23, 'Michigan', 'MI', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(24, 'Minnesota', 'MN', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(25, 'Mississippi', 'MS', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(26, 'Missouri', 'MO', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(27, 'Montana', 'MT', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(28, 'Nebraska', 'NE', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(29, 'Nevada', 'NV', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(30, 'New Hampshire', 'NH', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(31, 'New Jersey', 'NJ', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(32, 'New Mexico', 'NM', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(33, 'New York', 'NY', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(34, 'North Carolina', 'NC', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(35, 'North Dakota', 'ND', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(36, 'Ohio', 'OH', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(37, 'Oklahoma', 'OK', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(38, 'Oregon', 'OR', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(39, 'Pennsylvania', 'PA', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(40, 'Rhode Island', 'RI', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(41, 'South Carolina', 'SC', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(42, 'South Dakota', 'SD', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(43, 'Tennessee', 'TN', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(44, 'Texas', 'TX', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(45, 'Utah', 'UT', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(46, 'Vermont', 'VT', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(47, 'Virginia', 'VA', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(48, 'Washington', 'WA', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(49, 'West Virginia', 'WV', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(50, 'Wisconsin', 'WI', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(51, 'Wyoming', 'WY', '2025-09-27 10:38:26', '2025-09-27 10:38:26');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo_path`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@gmail.com', 'uploads/profile-photo.jpg', '2025-09-27 10:38:25', '$2y$12$oCQitKLK7FiWkSH4giVAwO3sZjZXlvo4jpfRU6TBMG6tbUwP5mT8C', 'mjhESlaCzd', '2025-09-27 10:38:25', '2025-09-27 10:38:25'),
(2, 'Editor User', 'editor@gmail.com', NULL, '2025-09-27 10:38:26', '$2y$12$i0BeC7EGznfU1FucF9HTWOj4.q6XCOuJF7Kx6XQszNcAjeQBx2csq', '6Q5sE0GqCe', '2025-09-27 10:38:26', '2025-09-27 10:38:26'),
(3, 'viewer User', 'viewer@gmail.com', NULL, '2025-09-27 10:38:26', '$2y$12$AWoSE4yeMnUUyUilgJPBT.J0bQASH3.eF5Zg8RaZfe5/nfwodJbgK', 'Hmx8hzcZr5', '2025-09-27 10:38:26', '2025-09-27 10:38:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application_successes`
--
ALTER TABLE `application_successes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_country_code_unique` (`country_code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_banners`
--
ALTER TABLE `hero_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `properties_slug_unique` (`slug`),
  ADD KEY `properties_category_id_foreign` (`category_id`);

--
-- Indexes for table `property_attachments`
--
ALTER TABLE `property_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_attachments_property_id_foreign` (`property_id`);

--
-- Indexes for table `property_features`
--
ALTER TABLE `property_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_features_property_id_foreign` (`property_id`),
  ADD KEY `property_features_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_images_property_id_foreign` (`property_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `application_successes`
--
ALTER TABLE `application_successes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hero_banners`
--
ALTER TABLE `hero_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_attachments`
--
ALTER TABLE `property_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_features`
--
ALTER TABLE `property_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_attachments`
--
ALTER TABLE `property_attachments`
  ADD CONSTRAINT `property_attachments_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_features`
--
ALTER TABLE `property_features`
  ADD CONSTRAINT `property_features_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `property_features_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_images`
--
ALTER TABLE `property_images`
  ADD CONSTRAINT `property_images_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
