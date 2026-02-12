-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Feb 2026 pada 08.50
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tiket_pdam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_01_07_132834_create_tickets_table', 1),
(6, '2026_01_07_134540_create_ticket_replies_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 2, 'auth_token', 'd2f2c43d98d5a5ebb2f4d610fc2515ce070678037417b43b31b8273f6a72d4a6', '[\"*\"]', NULL, NULL, '2026-01-15 00:52:12', '2026-01-15 00:52:12'),
(3, 'App\\Models\\User', 2, 'auth_token', '393b4bdfac471c663a8366d1aadff308daa60b2bdad334613c2ce4888bdc850d', '[\"*\"]', '2026-01-15 00:53:47', NULL, '2026-01-15 00:53:01', '2026-01-15 00:53:47'),
(4, 'App\\Models\\User', 1, 'auth_token', '4caec991077e572e292b3592b626526ad1b11b4329b2df6e65c607be8948c3da', '[\"*\"]', '2026-01-15 01:36:36', NULL, '2026-01-15 01:13:47', '2026-01-15 01:36:36'),
(5, 'App\\Models\\User', 2, 'auth_token', 'a404a43334909314698f2279243656d7c4687c7f958042965420e3a07a71933d', '[\"*\"]', '2026-01-15 01:25:20', NULL, '2026-01-15 01:24:31', '2026-01-15 01:25:20'),
(6, 'App\\Models\\User', 1, 'auth_token', 'd9313ba9ed52887d9d4d3009220f1cf3690996e71c1c2b835612a8db760ae956', '[\"*\"]', '2026-01-15 01:36:20', NULL, '2026-01-15 01:26:16', '2026-01-15 01:36:20'),
(7, 'App\\Models\\User', 1, 'auth_token', '73694f7b46e940b2fec9b7acc08c5be6f56be2c9e4aa453087ef447ea07204a3', '[\"*\"]', '2026-01-16 20:22:23', NULL, '2026-01-16 20:21:22', '2026-01-16 20:22:23'),
(8, 'App\\Models\\User', 1, 'auth_token', '690c9a957682b98db0f8051ceff41314576f8f1b25c1fefbda4f2ab1e7034657', '[\"*\"]', NULL, NULL, '2026-01-16 21:07:22', '2026-01-16 21:07:22'),
(10, 'App\\Models\\User', 1, 'auth_token', '44a8db097c6ac552ece11b77e425513158a1c996355c40d967a48eb271ae816d', '[\"*\"]', '2026-01-27 01:05:31', NULL, '2026-01-27 01:05:07', '2026-01-27 01:05:31'),
(14, 'App\\Models\\User', 1, 'auth_token', '451b2ad457726d1f8a53b72444dec0e3000cde2c1d5460b649bafa471b9c7e97', '[\"*\"]', '2026-01-27 01:56:19', NULL, '2026-01-27 01:53:42', '2026-01-27 01:56:19'),
(15, 'App\\Models\\User', 1, 'auth_token', '5bc4b14673e1230a49b3daa7fdfd6df9e4f1fdbe13308e909795f9b2f273cd07', '[\"*\"]', '2026-01-28 00:37:47', NULL, '2026-01-28 00:37:44', '2026-01-28 00:37:47'),
(23, 'App\\Models\\User', 4, 'auth_token', '2f2514c404122a36362648ff50c077a5d0e54b8d7858a2dfa787f0ab9135c08c', '[\"*\"]', '2026-02-11 01:40:06', NULL, '2026-02-11 01:36:36', '2026-02-11 01:40:06'),
(24, 'App\\Models\\User', 2, 'auth_token', '07f48fb5f0d82a4b10412928c6018798e31273caea1a208a4e07c5c375ee1c9a', '[\"*\"]', '2026-02-11 01:57:11', NULL, '2026-02-11 01:56:01', '2026-02-11 01:57:11'),
(25, 'App\\Models\\User', 1, 'auth_token', '23003c72a61002d46bf2f7ca674a65da48f8d4dc1b20699bfd8e5fec7c825c6b', '[\"*\"]', NULL, NULL, '2026-02-11 21:00:10', '2026-02-11 21:00:10'),
(33, 'App\\Models\\User', 1, 'auth_token', 'df9d8243fdd1128b0c9a1383c2c93a9bf5f77a76c99767bff8e996e13ad2c1cd', '[\"*\"]', '2026-02-12 00:32:52', NULL, '2026-02-12 00:32:50', '2026-02-12 00:32:52'),
(34, 'App\\Models\\User', 1, 'auth_token', 'f32db026ebb1a39beaf10dbb7b2ca446eb0f1fe79e7cf235574efad0eebda292', '[\"*\"]', '2026-02-12 00:33:21', NULL, '2026-02-12 00:33:15', '2026-02-12 00:33:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('open','onprogress','resolved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `priority` enum('low','medium','hight') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `code`, `title`, `description`, `status`, `priority`, `created_at`, `updated_at`, `completed_at`) VALUES
(7, 6, 'TICPDAM-18244', 'Air Mati Sejak Tadi Malam', 'Kondisi air mati sejak tadi malam, mohon bantuan untuk teknisi memperbaiki saluran air, terimakasih', 'onprogress', 'medium', '2026-02-12 00:45:25', '2026-02-12 00:46:12', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(11, 7, 1, 'baik, kami akan mengirimkan teknisi ke lokasi', '2026-02-12 00:46:12', '2026-02-12 00:46:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'adminpdam@gmail.com', NULL, '$2y$10$91X7rCTXtIml5LPoJl4EfeE8yuScKYG9yrcgwWPQ.7mXCUjQm3bSO', 'admin', NULL, '2026-01-15 00:48:13', '2026-01-15 00:48:13'),
(5, 'Pirdaus', 'daus@gmail.com', NULL, '$2y$10$xfZmqM3a7v4SCKqBxlS91.0/e0xXGkGacZtC0vv/Gooe4G5RCTw4q', 'user', NULL, '2026-02-12 00:39:01', '2026-02-12 00:39:01'),
(6, 'Pirdaus', 'daus01@gmail.com', NULL, '$2y$10$zZYnd8n.esV9rpDXXDe04Ow2a9W9WE0e5jhdDLhffbuRZhJLSIFrG', 'user', NULL, '2026-02-12 00:44:31', '2026-02-12 00:44:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_code_unique` (`code`),
  ADD KEY `tickets_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
