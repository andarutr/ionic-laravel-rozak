-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 27, 2024 at 01:46 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tebak_budaya_nusantara`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2024_05_26_124448_create_questions_table', 1),
(8, '2024_05_26_124509_create_results_table', 1),
(9, '2024_05_27_061711_add_bagian_to_questions', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bagian` varchar(128) NOT NULL,
  `picture` varchar(128) DEFAULT NULL,
  `question` text NOT NULL,
  `a` varchar(128) NOT NULL,
  `b` varchar(128) NOT NULL,
  `c` varchar(128) NOT NULL,
  `d` varchar(128) NOT NULL,
  `correct` enum('a','b','c','d') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `bagian`, `picture`, `question`, `a`, `b`, `c`, `d`, `correct`, `created_at`, `updated_at`) VALUES
(1, 'satu', 'avatar_1.png', 'Apa yang menjadi bagian utama dari busana tradisional Jawa Timur?', 'Kain Batik', 'Kebaya dan Jarik', 'Songket', 'Sarung', 'b', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(2, 'satu', NULL, 'Motif apa yang sering ditemui pada kebaya Jawa Timur?', 'Motif tumpal', 'Motif ikat', 'Motif kawung', 'Motif parang', 'c', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(3, 'satu', NULL, 'Apa fungsi dari jarik dalam busana tradisional Jawa Timur?', 'Digunakan sebagai atasan', 'Digunakan sebagai bawahan', 'Digunakan sebagai selendang', 'Digunakan untuk melilit pinggang', 'd', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(4, 'satu', NULL, 'Aksen atau hiasan pada kebaya Jawa Timur sering menggunakan apa?', 'Hiasan dari logam', 'Hiasan berupa sulaman yang rumit', 'Hiasan dari bulu burung', 'Hiasan dari kain songket', 'b', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(5, 'satu', NULL, 'Bagaimana potongan kebaya Jawa Timur umumnya?', 'Longgar dan berlapis', 'Ketat dan berwarna terang', 'Longgar dengan warna mencolok', 'Ketat dengan detail yang minimalis', 'a', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(6, 'dua', 'sasando.png', 'Apa yang merupakan karakteristik utama dari alat musik Sasando?', 'Terbuat dari kayu dan memiliki senar yang dipetik', 'Terbuat dari logam dan memiliki pipa yang ditiup', 'Terbuat dari kulit binatang dan memiliki tabuh', 'Terbuat dari bambu dan memiliki lubang sebagai sumber suara', 'a', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(7, 'dua', 'suling.png', 'Bagian mana dari suling yang biasanya ditekankan untuk menghasilkan berbagai nada?', 'Lubang yang ditiup', 'Lubang jari', 'Lubang ekor', 'Badan suling', 'b', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(8, 'dua', 'gamelan.png', 'Gamelan merupakan ansambel musik tradisional yang berasal dari mana?', 'Thailand', 'Indonesia', 'Jepang', 'Malaysia', 'b', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(9, 'dua', 'gong.png', 'Apa jenis gong yang paling umum digunakan dalam gamelan Jawa dan Bali?', 'Gong Ageng', 'Gong Kempul', 'Gong Suwukan', 'Gong Kebyar', 'a', '2024-05-27 06:19:08', '2024-05-27 06:19:08'),
(10, 'dua', 'tifa.png', 'Alat musik tifa berasal dari daerah mana?', 'Jawa Tengah', 'Papua', 'Bali', 'Sulawesi', 'b', '2024-05-27 06:19:08', '2024-05-27 06:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(128) NOT NULL,
  `username` varchar(50) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Febrian Abdoel Rozak', 'rozaq', '$2y$10$bvgSQ99i/jXuHPYuQH5KA.7LTl8eVsCQgtNcCPxhA/xQRFCHsVD0q', NULL, '2024-05-26 22:59:09', '2024-05-26 22:59:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
