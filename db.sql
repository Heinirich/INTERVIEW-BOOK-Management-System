-- Adminer 4.8.1 MySQL 8.0.35-0ubuntu0.22.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `authors` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1,	'Alexa Barton DVM',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(2,	'Ally Hagenes',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(3,	'Jed Skiles',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(4,	'Miss Sophie Luettgen IV',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(5,	'Dr. Jeremy Daniel',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(6,	'Eula Dare',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(7,	'Natalia Goldner',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(8,	'Pascale Crona',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(9,	'Prof. Triston Tillman',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(10,	'Aurelia Doyle',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52');

DROP TABLE IF EXISTS `book_issues`;
CREATE TABLE `book_issues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `book_id` bigint unsigned NOT NULL,
  `apply_date` date DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `late_return_fine` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','accepted','cancel','returned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `returned_date` date DEFAULT NULL,
  `fine_received` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_issues_unique_id_unique` (`unique_id`),
  KEY `book_issues_student_id_foreign` (`student_id`),
  KEY `book_issues_book_id_foreign` (`book_id`),
  CONSTRAINT `book_issues_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `book_issues_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `book_issues` (`id`, `student_id`, `book_id`, `apply_date`, `issue_date`, `return_date`, `late_return_fine`, `unique_id`, `status`, `returned_date`, `fine_received`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	'2023-12-22',	'2023-12-22',	'2023-12-12',	NULL,	'918556',	'accepted',	NULL,	NULL,	'2023-12-22 03:50:15',	'2023-12-22 03:52:28');

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `location_rack_id` bigint unsigned NOT NULL,
  `no_of_copy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `books_category_id_foreign` (`category_id`),
  KEY `books_author_id_foreign` (`author_id`),
  KEY `books_location_rack_id_foreign` (`location_rack_id`),
  CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `books_location_rack_id_foreign` FOREIGN KEY (`location_rack_id`) REFERENCES `location_racks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `books` (`id`, `name`, `isbn_no`, `category_id`, `author_id`, `location_rack_id`, `no_of_copy`, `status`, `created_at`, `updated_at`) VALUES
(1,	'TEST BOOK 1',	'12222222',	1,	1,	10,	'10',	1,	'2023-12-20 14:44:36',	'2023-12-20 14:44:36');

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1,	'Dr. Monroe Nienow',	'dr-monroe-nienow',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(2,	'Prof. Maxwell Hudson',	'prof-maxwell-hudson',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(3,	'Prof. Chanelle Schaden',	'prof-chanelle-schaden',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(4,	'Lydia Bergstrom',	'lydia-bergstrom',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(5,	'David Trantow',	'david-trantow',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(6,	'Claudine Hickle PhD',	'claudine-hickle-phd',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(7,	'Deonte Reilly DDS',	'deonte-reilly-dds',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(8,	'Ismael Grimes',	'ismael-grimes',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(9,	'Danny Hegmann',	'danny-hegmann',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(10,	'Dr. Camren Roob DDS',	'dr-camren-roob-dds',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `location_racks`;
CREATE TABLE `location_racks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `location_racks` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1,	'C4',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(2,	'B2',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(3,	'A3',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(4,	'D1',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(5,	'D2',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(6,	'B1',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(7,	'H2',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(8,	'B3',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(9,	'A1',	0,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52'),
(10,	'H1',	1,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(5,	'2022_11_13_191545_create_categories_table',	1),
(6,	'2022_11_14_083040_create_authors_table',	1),
(7,	'2022_11_14_121803_create_location_racks_table',	1),
(8,	'2022_11_14_133117_create_books_table',	1),
(9,	'2022_11_15_155439_create_students_table',	1),
(10,	'2022_11_17_195957_create_book_issues_table',	1),
(11,	'2022_11_19_060310_add_profile_complete_to_student_table',	1),
(12,	'2022_11_19_170911_create_settings_table',	1);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `library_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `library_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `library_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `library_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fines` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` (`id`, `library_name`, `library_address`, `library_phone`, `library_email`, `fines`, `logo`, `favicon`, `created_at`, `updated_at`) VALUES
(1,	'INTERVIEW LIBRARY',	'Nairobi, Kenya',	'+254746273465',	'smithheinrich254@gmail.com',	'50',	NULL,	NULL,	'2023-12-20 10:12:17',	'2023-12-20 10:12:17'),
(2,	'INTERVIEW LIBRARY',	'Nairobi, Kenya',	'+254746273465',	'smithheinrich254@gmail.com',	'50',	NULL,	NULL,	'2023-12-20 14:26:52',	'2023-12-20 14:26:52');

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `students` (`id`, `name`, `dept`, `year`, `semester`, `session`, `student_id`, `password`, `created_at`, `updated_at`, `is_profile_complete`) VALUES
(1,	'Heinrich Smith',	'CSE',	'1st',	'2nd',	'2021-2023',	'120623',	'$2y$10$L7pMD/IbQfg5sKngvkP6CeP45KmhGNsFekpwn5Glgv9K/mwmzY2Kq',	'2023-12-20 14:33:49',	'2023-12-20 14:34:37',	1);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Test User',	'test@example.com',	'2023-12-20 14:26:52',	'$2y$10$L7pMD/IbQfg5sKngvkP6CeP45KmhGNsFekpwn5Glgv9K/mwmzY2Kq',	'KWjxoMzqxi2pg3qkLysQcukIXwh3Wat0gOYcGtyZmKbHLddErAa32imtpHa7',	'2023-12-20 14:26:52',	'2023-12-20 14:26:52');

-- 2023-12-22 06:55:38
