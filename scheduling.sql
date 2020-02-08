-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2020 at 10:01 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scheduling`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisergroups`
--

CREATE TABLE `advisergroups` (
  `ag_id` int(10) UNSIGNED NOT NULL,
  `grp_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advisergroups`
--

INSERT INTO `advisergroups` (`ag_id`, `grp_id`, `id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `calendars`
--

CREATE TABLE `calendars` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_by` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calendars`
--

INSERT INTO `calendars` (`id`, `event_name`, `event_place`, `start_date`, `end_date`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Capstone 1  Meeting', 'h1m', '2020-02-07 08:30:00', '2020-02-07 09:30:00', 1, '2020-02-07 04:32:15', '2020-02-07 04:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `crs_id` int(10) UNSIGNED NOT NULL,
  `crs_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`crs_id`, `crs_title`) VALUES
(1, 'BSIT'),
(2, 'BSCS'),
(3, 'BSIS'),
(4, 'BSEMC');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `grp_id` int(10) UNSIGNED NOT NULL,
  `grp_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grp_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gs_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `crs_id` int(10) UNSIGNED NOT NULL,
  `gsm_docsper` int(11) NOT NULL DEFAULT 0,
  `gsm_sysper` int(11) NOT NULL DEFAULT 0,
  `grp_percent` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`grp_id`, `grp_title`, `grp_code`, `gs_id`, `crs_id`, `gsm_docsper`, `gsm_sysper`, `grp_percent`, `created_at`, `updated_at`) VALUES
(1, 'No Group', 'dummy101', 3, 1, 0, 0, 0, NULL, NULL),
(2, 'ccerms', 'VosJ-0FMex5', 1, 1, 45, 60, 51, NULL, '2020-02-04 04:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `group_statuses`
--

CREATE TABLE `group_statuses` (
  `gs_id` int(10) UNSIGNED NOT NULL,
  `gs_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_statuses`
--

INSERT INTO `group_statuses` (`gs_id`, `gs_title`) VALUES
(1, 'Available'),
(2, 'Full'),
(3, 'Not Available');

-- --------------------------------------------------------

--
-- Table structure for table `group_submissions`
--

CREATE TABLE `group_submissions` (
  `gsm_id` int(10) UNSIGNED NOT NULL,
  `grp_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `revision` int(11) NOT NULL DEFAULT 0,
  `ms_id` int(10) UNSIGNED NOT NULL,
  `ss_id` int(10) UNSIGNED DEFAULT NULL,
  `gsm_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_submissions`
--

INSERT INTO `group_submissions` (`gsm_id`, `grp_id`, `user_id`, `revision`, `ms_id`, `ss_id`, `gsm_file`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 1, 4, 'ccermsChapter 1.docx', '2020-02-03 00:25:31', '2020-02-03 04:13:52'),
(2, 2, 1, 0, 2, 4, 'ccermsChapter 2.docx', '2020-02-04 04:27:03', '2020-02-04 04:28:14'),
(3, 2, 1, 0, 3, 4, 'ccermsChapter 3.docx', '2020-02-04 04:27:29', '2020-02-04 04:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `to` int(10) UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from`, `to`, `read`, `message`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, 'sir', '2020-02-02 05:35:38', '2020-02-03 06:09:39'),
(2, 6, 1, 1, 'tirada sir', '2020-02-02 05:50:02', '2020-02-03 06:09:39'),
(3, 1, 6, 1, 'wala lagi', '2020-02-02 05:50:11', '2020-02-03 15:25:58'),
(4, 6, 1, 1, 'sir asa na man ka?', '2020-02-03 05:50:15', '2020-02-03 06:09:39'),
(5, 6, 1, 1, 'asda', '2020-02-03 05:53:05', '2020-02-03 06:09:39'),
(6, 6, 1, 1, 'as', '2020-02-03 05:54:00', '2020-02-03 06:09:39'),
(7, 6, 1, 1, 'a', '2020-02-03 05:54:58', '2020-02-03 06:09:39'),
(8, 6, 1, 1, 'a', '2020-02-03 05:55:48', '2020-02-03 06:09:39'),
(9, 1, 6, 1, 'rada sir', '2020-02-03 06:09:47', '2020-02-03 15:25:58'),
(10, 6, 1, 0, 'as', '2020-02-03 15:26:02', '2020-02-03 15:26:02'),
(11, 6, 1, 0, 'a', '2020-02-03 15:27:36', '2020-02-03 15:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2010_10_10_021110_create_milestones_table', 1),
(2, '2014_10_10_000000_create_group_statuses_table', 1),
(3, '2014_10_10_000000_create_milestone_subs_table', 1),
(4, '2014_10_10_000000_create_user_status_table', 1),
(5, '2014_10_10_122048_create_sections_table', 1),
(6, '2014_10_11_000000_create_courses_table', 1),
(7, '2014_10_11_000000_create_groups_table', 1),
(8, '2014_10_11_000000_create_user_types_table', 1),
(9, '2014_10_11_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(12, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(14, '2016_06_01_000004_create_oauth_clients_table', 1),
(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(16, '2019_09_10_000000_create_researhfilegroups_table', 1),
(17, '2019_09_11_081836_create_researchfiles_table', 1),
(18, '2019_10_12_021320_create_advisergroups_table', 1),
(19, '2019_12_23_121536_create_messages_table', 1),
(20, '2019_12_26_090352_add_read_to_message', 1),
(21, '2020_01_07_001413_create_calendars_table', 1),
(22, '2020_01_22_122411_create_s_t_sections_table', 1),
(23, '2020_01_28_022508_create__submit_status_table', 1),
(24, '2020_01_29_000001_create_group_submissions_table', 1),
(25, '2020_01_30_035013_create_sub_comments_table', 1),
(26, '2020_02_01_091424_create_panel_defenses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(10) UNSIGNED NOT NULL,
  `mls_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mls_percentage` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `mls_title`, `mls_percentage`, `created_at`, `updated_at`) VALUES
(1, 'Documents', 60, '2020-02-03 00:20:53', '2020-02-03 00:20:53'),
(2, 'System', 40, '2020-02-03 00:21:04', '2020-02-03 00:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `milestone_subs`
--

CREATE TABLE `milestone_subs` (
  `ms_id` int(10) UNSIGNED NOT NULL,
  `ms_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ms_percentage` int(11) NOT NULL,
  `mls_id` int(10) UNSIGNED DEFAULT NULL,
  `disable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milestone_subs`
--

INSERT INTO `milestone_subs` (`ms_id`, `ms_title`, `ms_percentage`, `mls_id`, `disable`, `created_at`, `updated_at`) VALUES
(1, 'Chapter 1', 15, 1, 0, '2020-02-03 00:21:14', '2020-02-03 00:21:14'),
(2, 'Chapter 2', 15, 1, 0, '2020-02-03 00:21:50', '2020-02-03 00:21:50'),
(3, 'Chapter 3', 15, 1, 0, '2020-02-03 00:22:18', '2020-02-03 00:22:18'),
(4, 'Chapter 4', 20, 1, 0, '2020-02-03 00:23:00', '2020-02-03 00:23:00'),
(5, 'Chapter 5', 20, 1, 0, '2020-02-03 00:23:12', '2020-02-03 00:23:12'),
(6, 'Chapter 6', 15, 1, 0, '2020-02-03 00:23:56', '2020-02-03 00:23:56'),
(7, 'Capstone 1 System', 60, 2, 0, '2020-02-03 00:24:08', '2020-02-03 00:24:08'),
(8, 'Capstone 2 System', 40, 2, 0, '2020-02-03 00:24:16', '2020-02-03 00:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_defenses`
--

CREATE TABLE `panel_defenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `pan1_ID` int(11) UNSIGNED DEFAULT NULL,
  `pan2_ID` int(11) UNSIGNED DEFAULT NULL,
  `pan3_ID` int(11) UNSIGNED DEFAULT NULL,
  `grp_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `panel_defenses`
--

INSERT INTO `panel_defenses` (`id`, `pan1_ID`, `pan2_ID`, `pan3_ID`, `grp_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 4, 2, '2020-02-07 16:00:00', '2020-02-07 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `researchfiles`
--

CREATE TABLE `researchfiles` (
  `res_id` int(10) UNSIGNED NOT NULL,
  `res_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfg_id` int(10) UNSIGNED NOT NULL,
  `crs_id` int(10) UNSIGNED NOT NULL,
  `res_ysdate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_yedate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `researhfilegroups`
--

CREATE TABLE `researhfilegroups` (
  `rfg_id` int(10) UNSIGNED NOT NULL,
  `rfg_groupName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfg_author1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfg_author2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfg_author3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rfg_author4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rfg_adviser` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `sch_id` int(11) NOT NULL,
  `styp_id` int(11) UNSIGNED DEFAULT NULL,
  `grp_id` int(11) UNSIGNED DEFAULT NULL,
  `sec_id` int(11) UNSIGNED DEFAULT NULL,
  `cal_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`sch_id`, `styp_id`, `grp_id`, `sec_id`, `cal_id`) VALUES
(1, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `scheduletype`
--

CREATE TABLE `scheduletype` (
  `styp_id` int(11) UNSIGNED NOT NULL,
  `shctyp_title` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scheduletype`
--

INSERT INTO `scheduletype` (`styp_id`, `shctyp_title`) VALUES
(1, 'Event'),
(2, 'Defense');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `sec_id` int(10) UNSIGNED NOT NULL,
  `sec_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_room` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_yrs` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_yre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`sec_id`, `sec_code`, `sec_room`, `sec_time`, `sec_yrs`, `sec_yre`, `created_at`, `updated_at`) VALUES
(1, '123456', 'h3i', '1030-1230', '2019', '2020', '2020-02-03 00:19:50', '2020-02-03 00:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `submit_status`
--

CREATE TABLE `submit_status` (
  `ss_id` int(10) UNSIGNED NOT NULL,
  `ss_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submit_status`
--

INSERT INTO `submit_status` (`ss_id`, `ss_title`, `created_at`, `updated_at`) VALUES
(1, 'Pending', NULL, NULL),
(2, 'Seen', NULL, NULL),
(3, 'Revise', NULL, NULL),
(4, 'Approve', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_comments`
--

CREATE TABLE `sub_comments` (
  `cmt_id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cmt_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmt_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gsm_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_comments`
--

INSERT INTO `sub_comments` (`cmt_id`, `created_by`, `cmt_title`, `cmt_file`, `gsm_id`, `created_at`, `updated_at`) VALUES
(1, 'Ruel Israel jr', 'Chapter 1 sir', NULL, 1, '2020-02-03 00:25:31', '2020-02-03 00:25:31'),
(2, 'Ruel Israel jr', 'Chapter 2 Sir', NULL, 2, '2020-02-04 04:27:03', '2020-02-04 04:27:03'),
(3, 'Ruel Israel jr', 'Chapter 3 sir', NULL, 3, '2020-02-04 04:27:29', '2020-02-04 04:27:29');

-- --------------------------------------------------------

--
-- Table structure for table `s_t_sections`
--

CREATE TABLE `s_t_sections` (
  `stsec_id` int(10) UNSIGNED NOT NULL,
  `sec_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `s_t_sections`
--

INSERT INTO `s_t_sections` (`stsec_id`, `sec_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-02-03 00:19:50', '2020-02-03 00:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile.png',
  `specialty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typ_id` int(10) UNSIGNED NOT NULL,
  `crs_id` int(10) UNSIGNED NOT NULL,
  `sec_id` int(10) UNSIGNED DEFAULT NULL,
  `grp_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `us_id` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `specialty`, `typ_id`, `crs_id`, `sec_id`, `grp_id`, `us_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Meljohn Aborde', 'ccerms@gmail.com', NULL, '$2y$10$5lLjCLIndQNxoWgQn/lkaONHlk6TzzhrDIxTawOpdNDrHj3YUbvta', 'profile.png', 'Programmer', 1, 1, NULL, 1, 1, '2OdMFRnFvqM3HpmxJ3QBAIj4DFUwMjmk8gmq9DxmXxTdsrcuxyCPPrfouOSg', '2020-02-01 03:04:19', '2020-02-01 03:04:19'),
(2, 'Dummy for Groups', 'dummy@gmail.com', NULL, '$2y$10$umyc7eXBpEIyBescPkyRHefLrxhS3KgZCFx4FIErFlgAJwCdR65O2', 'profile.png', NULL, 3, 1, NULL, 1, 3, NULL, '2020-02-01 03:04:20', '2020-02-01 03:04:20'),
(3, 'Ruel Israel jr', 'israel@gmail.com', NULL, '$2y$10$tWJb5PhVNLbPr0gW0ENXRugnQ0KK1OfcKA4FjR5cCW1HjvGsZJ7zy', 'profile.png', NULL, 3, 1, 1, 2, 1, 'CO3OXsmw0Y4La85jM6BhJsGT15qijnEcgGeOHz0eBICkgVmmpUK968LHk0iF', '2020-02-01 03:04:21', '2020-02-03 00:20:33'),
(4, 'Capili', 'capili@gmail.com', NULL, '$2y$10$kX9CstduBAvd.TVsQaiE0.rap7ExpaQDB89.GbnSwafaTmC3YwN7u', 'profile.png', NULL, 3, 1, NULL, 1, 1, 'bVJi5P5q0Gb1MKCBfIH8TTEMR4lQPjHhGAFjNxFK2YaIztkhnKjESZiO3mIP', '2020-02-01 03:04:22', '2020-02-01 03:04:22'),
(5, 'pak u ruel israel', 'aeron@gmail.com', NULL, '$2y$10$GYUoDb..6aidGs2Yb3EZo.ypOtoI38540TO3x/TGCSfAptM/R1ldu', 'profile.png', NULL, 3, 1, NULL, 1, 1, NULL, '2020-02-01 15:17:27', '2020-02-06 01:17:59'),
(6, 'Ryan Pilapil', 'pilapil@gmail.com', NULL, '$2y$10$MpBpd1mZALpRvWsbp1M0P.8uGQCtp3vjK8ua9Izb57YmFp5oDXLVW', 'profile.png', 'Programmer', 2, 1, NULL, 1, 1, 'W53jrIbQek6JDd8nHClokbzylDb7OW4QdjdwzPoqRKkIgFlKNa3pg9MKpBu0', '2020-02-02 05:34:38', '2020-02-02 05:34:38'),
(7, 'Ian Jay Subang', 'subang@gmail.com', NULL, '$2y$10$D58xVG16qSaxtckvQ.FMeukJqIBKPOwGvL9/WiccNpVzXWVlszxuq', 'profile.png', NULL, 3, 1, 1, 2, 1, 'TWrjI8xK1sqOdUwjCb3dDGuDucNxbKGrBs14n0yVlyHXcadCkNr7yJ6yoB2r', '2020-02-06 14:15:24', '2020-02-06 14:15:54');

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE `usertypes` (
  `typ_id` int(10) UNSIGNED NOT NULL,
  `typ_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`typ_id`, `typ_title`) VALUES
(1, 'RC'),
(2, 'Adviser'),
(3, 'Student'),
(4, 'SubjectTeacher'),
(5, 'Panel'),
(6, 'Adviser and Panel');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `us_id` int(10) UNSIGNED NOT NULL,
  `us_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`us_id`, `us_title`) VALUES
(1, 'Approve'),
(2, 'Disapprove'),
(3, 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisergroups`
--
ALTER TABLE `advisergroups`
  ADD PRIMARY KEY (`ag_id`),
  ADD KEY `advisergroups_grp_id_foreign` (`grp_id`),
  ADD KEY `advisergroups_id_foreign` (`id`);

--
-- Indexes for table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_created_by` (`created_by`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`crs_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`grp_id`),
  ADD UNIQUE KEY `groups_grp_title_unique` (`grp_title`),
  ADD UNIQUE KEY `groups_grp_code_unique` (`grp_code`),
  ADD KEY `groups_gs_id_foreign` (`gs_id`),
  ADD KEY `groups_crs_id_foreign` (`crs_id`);

--
-- Indexes for table `group_statuses`
--
ALTER TABLE `group_statuses`
  ADD PRIMARY KEY (`gs_id`);

--
-- Indexes for table `group_submissions`
--
ALTER TABLE `group_submissions`
  ADD PRIMARY KEY (`gsm_id`),
  ADD KEY `group_submissions_grp_id_foreign` (`grp_id`),
  ADD KEY `group_submissions_user_id_foreign` (`user_id`),
  ADD KEY `group_submissions_ss_id_foreign` (`ss_id`),
  ADD KEY `group_submissions_ms_id_foreign` (`ms_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestone_subs`
--
ALTER TABLE `milestone_subs`
  ADD PRIMARY KEY (`ms_id`),
  ADD KEY `milestone_subs_mls_id_foreign` (`mls_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `panel_defenses`
--
ALTER TABLE `panel_defenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pan1_ID` (`pan1_ID`),
  ADD KEY `pan2_ID` (`pan2_ID`),
  ADD KEY `pan3_ID` (`pan3_ID`),
  ADD KEY `grp_id` (`grp_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `researchfiles`
--
ALTER TABLE `researchfiles`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `researchfiles_rfg_id_foreign` (`rfg_id`),
  ADD KEY `researchfiles_crs_id_foreign` (`crs_id`);

--
-- Indexes for table `researhfilegroups`
--
ALTER TABLE `researhfilegroups`
  ADD PRIMARY KEY (`rfg_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`sch_id`),
  ADD KEY `schedtype` (`grp_id`),
  ADD KEY `section` (`sec_id`),
  ADD KEY `calendar` (`cal_id`),
  ADD KEY `styp_id` (`styp_id`);

--
-- Indexes for table `scheduletype`
--
ALTER TABLE `scheduletype`
  ADD PRIMARY KEY (`styp_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`sec_id`);

--
-- Indexes for table `submit_status`
--
ALTER TABLE `submit_status`
  ADD PRIMARY KEY (`ss_id`);

--
-- Indexes for table `sub_comments`
--
ALTER TABLE `sub_comments`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `sub_comments_gsm_id_foreign` (`gsm_id`);

--
-- Indexes for table `s_t_sections`
--
ALTER TABLE `s_t_sections`
  ADD PRIMARY KEY (`stsec_id`),
  ADD KEY `s_t_sections_user_id_foreign` (`user_id`),
  ADD KEY `s_t_sections_sec_id_foreign` (`sec_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_grp_id_foreign` (`grp_id`),
  ADD KEY `users_crs_id_foreign` (`crs_id`),
  ADD KEY `users_typ_id_foreign` (`typ_id`),
  ADD KEY `users_us_id_foreign` (`us_id`),
  ADD KEY `users_sec_id_foreign` (`sec_id`);

--
-- Indexes for table `usertypes`
--
ALTER TABLE `usertypes`
  ADD PRIMARY KEY (`typ_id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`us_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advisergroups`
--
ALTER TABLE `advisergroups`
  MODIFY `ag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `calendars`
--
ALTER TABLE `calendars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `crs_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `grp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_statuses`
--
ALTER TABLE `group_statuses`
  MODIFY `gs_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_submissions`
--
ALTER TABLE `group_submissions`
  MODIFY `gsm_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `milestone_subs`
--
ALTER TABLE `milestone_subs`
  MODIFY `ms_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_defenses`
--
ALTER TABLE `panel_defenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `researchfiles`
--
ALTER TABLE `researchfiles`
  MODIFY `res_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `researhfilegroups`
--
ALTER TABLE `researhfilegroups`
  MODIFY `rfg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `sec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `submit_status`
--
ALTER TABLE `submit_status`
  MODIFY `ss_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_comments`
--
ALTER TABLE `sub_comments`
  MODIFY `cmt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `s_t_sections`
--
ALTER TABLE `s_t_sections`
  MODIFY `stsec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `usertypes`
--
ALTER TABLE `usertypes`
  MODIFY `typ_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `us_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advisergroups`
--
ALTER TABLE `advisergroups`
  ADD CONSTRAINT `advisergroups_grp_id_foreign` FOREIGN KEY (`grp_id`) REFERENCES `groups` (`grp_id`),
  ADD CONSTRAINT `advisergroups_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `calendars`
--
ALTER TABLE `calendars`
  ADD CONSTRAINT `FK_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_crs_id_foreign` FOREIGN KEY (`crs_id`) REFERENCES `courses` (`crs_id`),
  ADD CONSTRAINT `groups_gs_id_foreign` FOREIGN KEY (`gs_id`) REFERENCES `group_statuses` (`gs_id`);

--
-- Constraints for table `group_submissions`
--
ALTER TABLE `group_submissions`
  ADD CONSTRAINT `group_submissions_grp_id_foreign` FOREIGN KEY (`grp_id`) REFERENCES `groups` (`grp_id`),
  ADD CONSTRAINT `group_submissions_ms_id_foreign` FOREIGN KEY (`ms_id`) REFERENCES `milestone_subs` (`ms_id`),
  ADD CONSTRAINT `group_submissions_ss_id_foreign` FOREIGN KEY (`ss_id`) REFERENCES `submit_status` (`ss_id`),
  ADD CONSTRAINT `group_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `milestone_subs`
--
ALTER TABLE `milestone_subs`
  ADD CONSTRAINT `milestone_subs_mls_id_foreign` FOREIGN KEY (`mls_id`) REFERENCES `milestones` (`id`);

--
-- Constraints for table `panel_defenses`
--
ALTER TABLE `panel_defenses`
  ADD CONSTRAINT `panel_defenses_ibfk_1` FOREIGN KEY (`pan1_ID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `panel_defenses_ibfk_2` FOREIGN KEY (`pan2_ID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `panel_defenses_ibfk_3` FOREIGN KEY (`pan3_ID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `panel_defenses_ibfk_4` FOREIGN KEY (`grp_id`) REFERENCES `groups` (`grp_id`);

--
-- Constraints for table `researchfiles`
--
ALTER TABLE `researchfiles`
  ADD CONSTRAINT `researchfiles_crs_id_foreign` FOREIGN KEY (`crs_id`) REFERENCES `courses` (`crs_id`),
  ADD CONSTRAINT `researchfiles_rfg_id_foreign` FOREIGN KEY (`rfg_id`) REFERENCES `researhfilegroups` (`rfg_id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `calendar` FOREIGN KEY (`cal_id`) REFERENCES `calendars` (`id`),
  ADD CONSTRAINT `schedtype` FOREIGN KEY (`grp_id`) REFERENCES `groups` (`grp_id`),
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`styp_id`) REFERENCES `scheduletype` (`styp_id`),
  ADD CONSTRAINT `section` FOREIGN KEY (`sec_id`) REFERENCES `sections` (`sec_id`);

--
-- Constraints for table `sub_comments`
--
ALTER TABLE `sub_comments`
  ADD CONSTRAINT `sub_comments_gsm_id_foreign` FOREIGN KEY (`gsm_id`) REFERENCES `group_submissions` (`gsm_id`);

--
-- Constraints for table `s_t_sections`
--
ALTER TABLE `s_t_sections`
  ADD CONSTRAINT `s_t_sections_sec_id_foreign` FOREIGN KEY (`sec_id`) REFERENCES `sections` (`sec_id`),
  ADD CONSTRAINT `s_t_sections_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_crs_id_foreign` FOREIGN KEY (`crs_id`) REFERENCES `courses` (`crs_id`),
  ADD CONSTRAINT `users_grp_id_foreign` FOREIGN KEY (`grp_id`) REFERENCES `groups` (`grp_id`),
  ADD CONSTRAINT `users_sec_id_foreign` FOREIGN KEY (`sec_id`) REFERENCES `sections` (`sec_id`),
  ADD CONSTRAINT `users_typ_id_foreign` FOREIGN KEY (`typ_id`) REFERENCES `usertypes` (`typ_id`),
  ADD CONSTRAINT `users_us_id_foreign` FOREIGN KEY (`us_id`) REFERENCES `user_status` (`us_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
