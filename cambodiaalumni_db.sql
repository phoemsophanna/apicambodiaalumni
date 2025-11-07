-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 06, 2025 at 09:57 PM
-- Server version: 10.11.14-MariaDB-cll-lve
-- PHP Version: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cambodiaalumni_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `titleKh` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `subtitleKh` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `descriptionKh` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `linkLabel` varchar(255) DEFAULT NULL,
  `linkLabelKh` varchar(255) DEFAULT NULL,
  `linkTo` text DEFAULT NULL,
  `titleCh` varchar(255) DEFAULT NULL,
  `subtitleCh` varchar(255) DEFAULT NULL,
  `linkLabelCh` varchar(255) DEFAULT NULL,
  `descriptionCh` varchar(255) DEFAULT NULL,
  `redirectNewTap` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `titleKh`, `subtitle`, `subtitleKh`, `description`, `descriptionKh`, `image`, `linkLabel`, `linkLabelKh`, `linkTo`, `titleCh`, `subtitleCh`, `linkLabelCh`, `descriptionCh`, `redirectNewTap`, `ordering`, `isActive`, `created_at`, `updated_at`) VALUES
(9, '', 'សមាគមអតីតសិស្ស-និស្សិតនៅកម្ពុជា', '', 'សូមស្វាគមន៍មកកាន់', '', '', '/banner/CamGoTech_zilQ71uvBcX6q71BUTA9TskRMxw2UnGBPowUvCEs.jpg', NULL, NULL, NULL, '', '', NULL, '', 0, 0, 1, '2025-09-16 12:34:21', '2025-11-01 09:16:18'),
(10, '', '', '', '', '', '', '/banner/CamGoTech_RCn83CODAc8cNcSxaiNgYhrXZ1lw69lBT6GGD4Gl.jpg', NULL, NULL, NULL, '', '', NULL, '', 0, 1, 1, '2025-09-16 12:35:03', '2025-11-01 09:15:00'),
(12, '', '', '', '', '', '', '/banner/CamGoTech_7gcM2UW19dRonqGDdPIzdE3zuoRc38LiK7FK7fRw.jpg', NULL, NULL, NULL, '', '', NULL, '', 0, 2, 1, '2025-11-01 09:13:54', '2025-11-01 09:14:48'),
(13, '', '', '', '', '', '', '/banner/CamGoTech_uC5qYvgtaQPlnriv7BrpwK6we9hDDcs7fl16x3bD.jpg', NULL, NULL, NULL, '', '', NULL, '', 0, 0, 1, '2025-11-01 09:16:43', '2025-11-01 09:16:43'),
(14, '', '', '', '', '', '', '/banner/CamGoTech_EehLOIapoQQeqOqU8rm9iP0pBUGNus3x1mYb92Pp.jpg', NULL, NULL, NULL, '', '', NULL, '', 0, 0, 1, '2025-11-01 09:18:13', '2025-11-01 09:18:39'),
(15, '', '', '', '', '', '', '/banner/CamGoTech_dR8vFuQO9rreaBXgQCZxszFcseceKlIqeqaFxG4C.jpg', NULL, NULL, NULL, '', '', NULL, '', 0, 0, 1, '2025-11-01 09:19:04', '2025-11-01 09:19:04');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creatorId` bigint(20) NOT NULL,
  `campaignCategoryId` bigint(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `campaignTile` varchar(255) DEFAULT NULL,
  `campaignTileKm` varchar(255) DEFAULT NULL,
  `campaignTileCh` varchar(255) DEFAULT NULL,
  `fullStory` text DEFAULT NULL,
  `fullStoryKm` text DEFAULT NULL,
  `fullStoryCh` text DEFAULT NULL,
  `additionalInformation` text DEFAULT NULL,
  `additionalInformationKm` text DEFAULT NULL,
  `additionalInformationCh` text DEFAULT NULL,
  `involvement` text DEFAULT NULL,
  `involvementKm` text DEFAULT NULL,
  `involvementCh` text DEFAULT NULL,
  `referenceLink` text DEFAULT NULL,
  `goal` double NOT NULL DEFAULT 0,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `gratitude` text DEFAULT NULL,
  `gratitudeKm` text DEFAULT NULL,
  `gratitudeCh` text DEFAULT NULL,
  `campaignFor` int(11) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `documentType` varchar(255) DEFAULT NULL,
  `identityNumber` varchar(255) DEFAULT NULL,
  `creatorLocation` varchar(255) DEFAULT NULL,
  `creatorCity` varchar(255) DEFAULT NULL,
  `receiveByBank` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `accountNumber` varchar(255) DEFAULT NULL,
  `videoLink` text DEFAULT NULL,
  `campaignGallery` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `videoFile` text DEFAULT NULL,
  `idCardBack` text DEFAULT NULL,
  `idCardFront` text DEFAULT NULL,
  `passport` text DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isInNeed` tinyint(1) NOT NULL DEFAULT 0,
  `isTrending` tinyint(1) NOT NULL DEFAULT 0,
  `isLatest` tinyint(1) NOT NULL DEFAULT 0,
  `totalTip` double NOT NULL DEFAULT 0,
  `totalRaised` double NOT NULL DEFAULT 0,
  `totalDonation` int(11) NOT NULL DEFAULT 0,
  `totalReaction` int(11) NOT NULL DEFAULT 0,
  `totalShare` int(11) NOT NULL DEFAULT 0,
  `allowEdit` tinyint(1) DEFAULT NULL,
  `qrCode` varchar(255) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `totalWithdraw` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `creatorId`, `campaignCategoryId`, `location`, `city`, `campaignTile`, `campaignTileKm`, `campaignTileCh`, `fullStory`, `fullStoryKm`, `fullStoryCh`, `additionalInformation`, `additionalInformationKm`, `additionalInformationCh`, `involvement`, `involvementKm`, `involvementCh`, `referenceLink`, `goal`, `startDate`, `endDate`, `gratitude`, `gratitudeKm`, `gratitudeCh`, `campaignFor`, `phoneNumber`, `fullName`, `documentType`, `identityNumber`, `creatorLocation`, `creatorCity`, `receiveByBank`, `accountName`, `accountNumber`, `videoLink`, `campaignGallery`, `videoFile`, `idCardBack`, `idCardFront`, `passport`, `profile`, `status`, `ordering`, `isActive`, `created_at`, `updated_at`, `isInNeed`, `isTrending`, `isLatest`, `totalTip`, `totalRaised`, `totalDonation`, `totalReaction`, `totalShare`, `allowEdit`, `qrCode`, `balance`, `totalWithdraw`) VALUES
(4, 1, 14, 'Phnom Penh', 'Phnom Penh', 'One tree, one life', 'ដើមឈើមួយដើម ជីវិតមួយ', NULL, '<p>One Tree One Life Campaign<br><br></p>', '<p>យុទ្ធនាការដើមឈើមួយជីវិត</p>', NULL, 'One Tree One Life Campaign', NULL, NULL, NULL, NULL, NULL, NULL, 10000, '2025-02-09', '2025-12-31', 'Thank You', NULL, NULL, NULL, NULL, 'CAA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"\\/campaign\\/CamGoTech_VvBGRkJxTjsnlYjdh72rA7CzUPQZp2pngqAzBLqT.jpg\"]', NULL, NULL, NULL, NULL, '/campaign/CamGoTech_K4plJMpMoWVBXIzIEzVfheMxLLzSWkR0Cyiz60TZ.png', 'COMPLETE', 0, 1, '2025-09-25 01:25:08', '2025-10-25 06:55:05', 1, 0, 1, 0, 1098, 7, 0, 0, NULL, '/qrcode/1758767126_qr_code.svg', 1098, 0),
(5, 1, 9, 'Phnom Penh', 'Phnom Penh', 'Mask and alcohol campaign', NULL, 'Chinese', '<p>យុទ្ធនាការ ម៉ាស់ និងទឹកអាកុល</p>', NULL, '<p>Chinese</p>', 'Thank You', NULL, NULL, 'Mask and alcohol campaign', NULL, NULL, NULL, 50000, '2025-01-01', '2025-10-31', NULL, NULL, NULL, NULL, NULL, 'CAA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"\\/campaign\\/CamGoTech_WDqgxaNYFkvNZI6v7AjUfTqmzUF0acj61MpyYxfO.jpg\"]', NULL, NULL, NULL, NULL, NULL, 'COMPLETE', 0, 1, '2025-09-25 03:40:30', '2025-10-30 07:48:44', 1, 0, 1, 0, 0, 0, 0, 0, NULL, '/qrcode/1760695021_qr_code.svg', 0, 0),
(6, 34, 14, NULL, NULL, 'Test-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"\\/campaign\\/CamGoTech_tvziewVq9sypAG1DMapYr1hCejt3610YNl4bzZce.png\"]', NULL, NULL, NULL, NULL, NULL, 'COMPLETE', 0, 1, '2025-11-01 08:56:43', '2025-11-01 08:56:43', 1, 0, 1, 0, 0, 0, 0, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_categories`
--

CREATE TABLE `campaign_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nameKh` varchar(255) DEFAULT NULL,
  `nameCh` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `descKh` text DEFAULT NULL,
  `descCh` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `isDisplayHomePage` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_categories`
--

INSERT INTO `campaign_categories` (`id`, `name`, `nameKh`, `nameCh`, `image`, `ordering`, `isActive`, `created_at`, `updated_at`, `desc`, `descKh`, `descCh`, `thumbnail`, `color`, `isDisplayHomePage`) VALUES
(1, 'Educations', 'ការអប់រំ', NULL, '/campaign-categories/CamGoTech_w4ah8QQRzz4ajsI4V5ZYbaVztgTNhnjyCE0qB5Lj.png', 1, 0, '2024-07-01 05:21:57', '2025-10-27 07:29:41', 'Education in Cambodia need your help to improved', 'ការអប់រំនៅកម្ពុជាត្រូវការជំនួយរបស់អ្នកដើម្បីកែលម្អ', '0', '/campaign-categories/CamGoTech_enIvHbO28Ugc5n11jCCHGQbyPyXPiVcnC4okqdKm.jpg', 'Green', 1),
(7, 'Medical', 'វេជ្ជសាស្ត្រ', NULL, '/campaign-categories/CamGoTech_c9U4Pp3x0PVESQdHZJabv1Unlz2ETsFDJoKblla3.png', 4, 0, '2024-07-01 05:32:00', '2025-10-27 07:52:00', '', '', '0', '', '', 1),
(8, 'Environment', 'បរិស្ថាន', NULL, '/campaign-categories/CamGoTech_XyqXfJjC3ewgmEryZEJUq1X9aPvLrRb1jdyLvxOt.png', 9, 0, '2024-07-17 09:49:51', '2025-10-27 07:51:42', '', '', '0', '', 'red', 1),
(9, 'Society', 'សង្គម', '', '/campaign-categories/CamGoTech_mlpTnUvdPd8rlTwfrocWWHG1muXH5BsPNcaikIqw.png', 7, 1, '2024-08-24 14:15:56', '2025-10-31 06:44:56', '', '', '0', '', 'red', 1),
(10, 'Youth Development', 'អភិវឌ្ឍន៍យុវជន', NULL, '/campaign-categories/CamGoTech_CtXfOn0CXN6C8iWlYhiYSkVAtpoWe4XXGYFggoot.png', 7, 0, '2024-08-24 14:16:30', '2025-10-27 07:47:04', '', '', '0', '', 'pink', 1),
(11, 'Heath Food', 'គម្រោងស្បៀងអាហារ', NULL, '/campaign-categories/CamGoTech_gocSeKQJOxSKx13u5bwbRS2vl31U3PS4yZkdanQb.png', 9, 0, '2024-08-24 14:18:01', '2025-10-27 07:46:51', '', '', '0', '', 'orange', 1),
(14, 'Charity', '', 'Chinese', '/campaign-categories/CamGoTech_4G7XR6esBwAjobjfy4qy7M7tnifMKtG0ToObxvfu.png', 0, 1, '2025-09-18 03:21:04', '2025-10-31 06:44:35', '', '', '0', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `userId`, `campaignId`, `comment`, `created_at`, `updated_at`) VALUES
(14, 5, 11, 'Hello Dear', '2024-08-27 15:33:21', '2024-08-27 15:33:21'),
(15, 5, 11, 'Yes hi\nCan I help you', '2024-08-27 15:33:37', '2024-08-27 15:33:37'),
(16, 10, 17, 'ចូលរួមទាំងអស់គ្នា', '2024-09-18 01:23:35', '2024-09-18 01:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `donorId` bigint(20) DEFAULT NULL,
  `donateType` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `tip` double NOT NULL DEFAULT 0,
  `total` double NOT NULL DEFAULT 0,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `isConfirmAgreement` tinyint(1) NOT NULL DEFAULT 0,
  `donationDate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `campaignId`, `donorId`, `donateType`, `amount`, `tip`, `total`, `paymentMethod`, `note`, `isConfirmAgreement`, `donationDate`, `created_at`, `updated_at`) VALUES
(1, 3, 3, NULL, 100, 0, 100, 'CREDIT_DEBIT_CARD', NULL, 1, '2025-10-17 09:28:31', '2025-10-17 01:28:31', '2025-10-17 01:28:31'),
(2, 4, 32, NULL, 1000, 0, 1000, 'KHQR', NULL, 1, '2025-10-17 09:34:45', '2025-10-17 01:34:45', '2025-10-17 01:34:45'),
(3, 4, 32, NULL, 1, 0, 1, 'CREDIT_DEBIT_CARD', NULL, 1, '2025-10-17 10:02:56', '2025-10-17 02:02:56', '2025-10-17 02:02:56'),
(4, 4, 3, NULL, 50, 0, 50, 'CREDIT_DEBIT_CARD', NULL, 1, '2025-10-17 16:51:29', '2025-10-17 08:51:29', '2025-10-17 08:51:29'),
(5, 4, 33, NULL, 40, 0, 40, 'CREDIT_DEBIT_CARD', NULL, 1, '2025-10-17 17:00:58', '2025-10-17 09:00:58', '2025-10-17 09:00:58'),
(6, 4, NULL, NULL, 1, 0, 1, 'KHQR', NULL, 1, '2025-10-25 12:09:02', '2025-10-25 04:09:02', '2025-10-25 04:09:02'),
(7, 4, NULL, NULL, 1, 0, 1, 'KHQR', NULL, 1, '2025-10-25 14:45:56', '2025-10-25 06:45:56', '2025-10-25 06:45:56'),
(8, 4, NULL, NULL, 5, 0, 5, 'KHQR', NULL, 1, '2025-10-25 14:55:05', '2025-10-25 06:55:05', '2025-10-25 06:55:05');

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
-- Table structure for table `feeds`
--

CREATE TABLE `feeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creatorId` bigint(20) DEFAULT NULL,
  `feedType` varchar(255) DEFAULT NULL,
  `campaignId` bigint(20) DEFAULT NULL,
  `donationId` bigint(20) DEFAULT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feeds`
--

INSERT INTO `feeds` (`id`, `creatorId`, `feedType`, `campaignId`, `donationId`, `publishedAt`, `created_at`, `updated_at`) VALUES
(1, 3, 'APPROVE', 11, NULL, '2024-07-20 04:54:59', '2024-07-19 21:54:59', '2024-07-19 21:54:59'),
(2, 3, 'APPROVE', 11, NULL, '2024-07-20 07:53:56', '2024-07-20 00:53:56', '2024-07-20 00:53:56'),
(3, 3, 'APPROVE', 3, NULL, '2024-07-20 08:05:51', '2024-07-20 01:05:51', '2024-07-20 01:05:51'),
(4, 3, 'APPROVE', 2, NULL, '2024-07-20 08:06:03', '2024-07-20 01:06:03', '2024-07-20 01:06:03'),
(5, 3, 'APPROVE', 1, NULL, '2024-07-20 08:06:16', '2024-07-20 01:06:16', '2024-07-20 01:06:16'),
(6, 4, 'DONATION', 3, 41, '2024-07-20 08:13:24', '2024-07-20 01:13:24', '2024-07-20 01:13:24'),
(7, 4, 'DONATION', 11, 42, '2024-07-20 12:53:48', '2024-07-20 05:53:48', '2024-07-20 05:53:48'),
(8, 3, 'APPROVE', 11, NULL, '2024-07-21 07:18:18', '2024-07-21 00:18:18', '2024-07-21 00:18:18'),
(9, 3, 'APPROVE', 11, NULL, '2024-07-21 07:19:07', '2024-07-21 00:19:07', '2024-07-21 00:19:07'),
(10, 5, 'DONATION', 11, 43, '2024-07-21 11:40:32', '2024-07-21 04:40:32', '2024-07-21 04:40:32'),
(11, 5, 'DONATION', 11, 44, '2024-07-21 11:41:08', '2024-07-21 04:41:08', '2024-07-21 04:41:08'),
(12, 3, 'APPROVE', 10, NULL, '2024-07-21 12:21:14', '2024-07-21 05:21:14', '2024-07-21 05:21:14'),
(13, 5, 'APPROVE', 12, NULL, '2024-07-21 12:27:38', '2024-07-21 05:27:38', '2024-07-21 05:27:38'),
(14, 4, 'DONATION', 1, 45, '2024-07-21 13:21:11', '2024-07-21 06:21:11', '2024-07-21 06:21:11'),
(15, 4, 'DONATION', 1, 46, '2024-07-21 13:25:34', '2024-07-21 06:25:34', '2024-07-21 06:25:34'),
(16, 4, 'DONATION', 1, 47, '2024-07-21 13:32:19', '2024-07-21 06:32:19', '2024-07-21 06:32:19'),
(17, 4, 'DONATION', 1, 48, '2024-07-21 13:32:50', '2024-07-21 06:32:50', '2024-07-21 06:32:50'),
(18, 4, 'DONATION', 3, 49, '2024-07-21 13:36:09', '2024-07-21 06:36:09', '2024-07-21 06:36:09'),
(19, 5, 'APPROVE', 14, NULL, '2024-07-21 15:01:31', '2024-07-21 08:01:31', '2024-07-21 08:01:31'),
(20, 5, 'DONATION', 14, 54, '2024-07-22 13:36:06', '2024-07-22 06:36:06', '2024-07-22 06:36:06'),
(21, 9, 'DONATION', 12, 56, '2024-07-22 13:50:50', '2024-07-22 06:50:50', '2024-07-22 06:50:50'),
(22, 3, 'APPROVE', 10, NULL, '2024-07-23 07:11:57', '2024-07-23 00:11:57', '2024-07-23 00:11:57'),
(23, 3, 'APPROVE', 3, NULL, '2024-07-23 07:12:33', '2024-07-23 00:12:33', '2024-07-23 00:12:33'),
(24, 3, 'APPROVE', 2, NULL, '2024-07-23 07:12:41', '2024-07-23 00:12:41', '2024-07-23 00:12:41'),
(25, 3, 'APPROVE', 10, NULL, '2024-07-23 07:13:10', '2024-07-23 00:13:10', '2024-07-23 00:13:10'),
(26, 3, 'APPROVE', 11, NULL, '2024-07-23 07:13:51', '2024-07-23 00:13:51', '2024-07-23 00:13:51'),
(27, 5, 'APPROVE', 14, NULL, '2024-07-23 07:20:41', '2024-07-23 00:20:41', '2024-07-23 00:20:41'),
(28, 5, 'APPROVE', 14, NULL, '2024-07-23 07:20:55', '2024-07-23 00:20:55', '2024-07-23 00:20:55'),
(29, 5, 'APPROVE', 14, NULL, '2024-07-23 07:21:02', '2024-07-23 00:21:02', '2024-07-23 00:21:02'),
(30, 5, 'APPROVE', 14, NULL, '2024-07-23 07:21:11', '2024-07-23 00:21:11', '2024-07-23 00:21:11'),
(31, 13, 'APPROVE', 15, NULL, '2024-07-24 07:40:42', '2024-07-24 00:40:42', '2024-07-24 00:40:42'),
(32, 13, 'DONATION', 15, 58, '2024-07-24 07:42:32', '2024-07-24 00:42:32', '2024-07-24 00:42:32'),
(33, 13, 'APPROVE', 15, NULL, '2024-07-24 07:47:37', '2024-07-24 00:47:37', '2024-07-24 00:47:37'),
(34, 13, 'APPROVE', 15, NULL, '2024-07-24 07:48:01', '2024-07-24 00:48:01', '2024-07-24 00:48:01'),
(35, 5, 'APPROVE', 12, NULL, '2024-07-24 08:12:12', '2024-07-24 01:12:12', '2024-07-24 01:12:12'),
(36, 3, 'APPROVE', 9, NULL, '2024-07-28 05:48:18', '2024-07-27 22:48:18', '2024-07-27 22:48:18'),
(37, 2, 'APPROVE', 5, NULL, '2024-07-28 05:48:51', '2024-07-27 22:48:51', '2024-07-27 22:48:51'),
(38, 2, 'APPROVE', 8, NULL, '2024-07-28 05:50:36', '2024-07-27 22:50:36', '2024-07-27 22:50:36'),
(39, 13, 'APPROVE', 15, NULL, '2024-07-28 10:12:00', '2024-07-28 03:12:00', '2024-07-28 03:12:00'),
(40, 5, 'APPROVE', 12, NULL, '2024-07-28 10:18:06', '2024-07-28 03:18:06', '2024-07-28 03:18:06'),
(41, 5, 'APPROVE', 12, NULL, '2024-07-28 10:26:48', '2024-07-28 03:26:48', '2024-07-28 03:26:48'),
(42, 5, 'APPROVE', 12, NULL, '2024-07-28 10:27:01', '2024-07-28 03:27:01', '2024-07-28 03:27:01'),
(43, 5, 'APPROVE', 12, NULL, '2024-07-28 11:03:10', '2024-07-28 04:03:10', '2024-07-28 04:03:10'),
(44, 13, 'APPROVE', 15, NULL, '2024-07-28 11:03:56', '2024-07-28 04:03:56', '2024-07-28 04:03:56'),
(45, 3, 'APPROVE', 11, NULL, '2024-07-28 11:05:29', '2024-07-28 04:05:29', '2024-07-28 04:05:29'),
(46, 3, 'APPROVE', 10, NULL, '2024-07-28 11:05:55', '2024-07-28 04:05:55', '2024-07-28 04:05:55'),
(47, 3, 'APPROVE', 10, NULL, '2024-07-28 11:06:19', '2024-07-28 04:06:19', '2024-07-28 04:06:19'),
(48, 3, 'APPROVE', 11, NULL, '2024-07-28 11:06:25', '2024-07-28 04:06:25', '2024-07-28 04:06:25'),
(49, 3, 'APPROVE', 10, NULL, '2024-07-28 11:08:02', '2024-07-28 04:08:02', '2024-07-28 04:08:02'),
(50, 19, 'DONATION', 15, 64, '2024-07-30 08:50:09', '2024-07-30 01:50:09', '2024-07-30 01:50:09'),
(51, 5, 'DONATION', 12, 67, '2024-08-03 15:09:33', '2024-08-03 08:09:33', '2024-08-03 08:09:33'),
(52, 5, 'APPROVE', 12, NULL, '2024-08-06 11:52:09', '2024-08-06 04:52:09', '2024-08-06 04:52:09'),
(53, 24, 'DONATION', 12, 68, '2024-08-09 13:30:15', '2024-08-09 06:30:15', '2024-08-09 06:30:15'),
(54, 24, 'DONATION', 15, 71, '2024-08-21 08:38:44', '2024-08-21 12:38:44', '2024-08-21 12:38:44'),
(55, 3, 'APPROVE', 9, NULL, '2024-08-25 07:58:04', '2024-08-25 11:58:04', '2024-08-25 11:58:04'),
(56, 2, 'APPROVE', 5, NULL, '2024-08-25 07:58:41', '2024-08-25 11:58:41', '2024-08-25 11:58:41'),
(57, 2, 'APPROVE', 8, NULL, '2024-08-25 07:59:07', '2024-08-25 11:59:07', '2024-08-25 11:59:07'),
(58, 5, 'APPROVE', 12, NULL, '2024-08-25 07:59:49', '2024-08-25 11:59:49', '2024-08-25 11:59:49'),
(59, 3, 'APPROVE', 1, NULL, '2024-08-25 08:00:16', '2024-08-25 12:00:16', '2024-08-25 12:00:16'),
(60, 3, 'APPROVE', 2, NULL, '2024-08-25 08:00:24', '2024-08-25 12:00:24', '2024-08-25 12:00:24'),
(61, 5, 'DONATION', 12, 73, '2024-08-27 12:27:41', '2024-08-27 16:27:41', '2024-08-27 16:27:41'),
(62, 5, 'APPROVE', 17, NULL, '2024-08-27 19:59:06', '2024-08-27 23:59:06', '2024-08-27 23:59:06'),
(63, 24, 'DONATION', 17, 74, '2024-08-27 20:01:23', '2024-08-28 00:01:23', '2024-08-28 00:01:23'),
(64, 24, 'DONATION', 17, 75, '2024-08-27 20:21:17', '2024-08-28 00:21:17', '2024-08-28 00:21:17'),
(65, 3, 'DONATION', 12, 76, '2024-09-02 17:07:12', '2024-09-02 21:07:12', '2024-09-02 21:07:12'),
(66, 5, 'APPROVE', 18, NULL, '2024-09-08 20:37:17', '2024-09-09 00:37:17', '2024-09-09 00:37:17'),
(67, 5, 'APPROVE', 20, NULL, '2024-09-08 21:47:27', '2024-09-09 01:47:27', '2024-09-09 01:47:27'),
(68, 26, 'APPROVE', 22, NULL, '2024-09-13 17:42:39', '2024-09-13 21:42:39', '2024-09-13 21:42:39'),
(69, 26, 'DONATION', 22, 79, '2024-09-13 20:23:50', '2024-09-14 00:23:50', '2024-09-14 00:23:50'),
(70, 5, 'DONATION', 11, 85, '2024-10-13 15:37:53', '2024-10-13 19:37:53', '2024-10-13 19:37:53'),
(71, 30, 'DONATION', 3, 91, '2025-10-16 14:06:40', '2025-10-16 06:06:40', '2025-10-16 06:06:40'),
(72, 3, 'DONATION', 4, 93, '2025-10-16 15:10:26', '2025-10-16 07:10:26', '2025-10-16 07:10:26'),
(73, 3, 'DONATION', 3, 1, '2025-10-17 09:28:31', '2025-10-17 01:28:31', '2025-10-17 01:28:31'),
(74, 32, 'DONATION', 4, 2, '2025-10-17 09:34:45', '2025-10-17 01:34:45', '2025-10-17 01:34:45'),
(75, 32, 'DONATION', 4, 3, '2025-10-17 10:02:56', '2025-10-17 02:02:56', '2025-10-17 02:02:56'),
(76, 3, 'DONATION', 4, 4, '2025-10-17 16:51:29', '2025-10-17 08:51:29', '2025-10-17 08:51:29'),
(77, 33, 'DONATION', 4, 5, '2025-10-17 17:00:58', '2025-10-17 09:00:58', '2025-10-17 09:00:58');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(11) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `image`, `isActive`, `ordering`, `created_at`, `updated_at`) VALUES
(3, '/gallery/CamGoTech_UBWdHNfYHfWtNof0B4eOghGL6KiI6LPf6pyqAVEr.png', 1, 2, '2025-11-01 09:02:53', '2025-11-01 09:03:24');

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
(123, '2023_10_20_020156_create_project_categories_table', 1),
(131, '2014_10_12_000000_create_users_table', 2),
(132, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(133, '2019_08_19_000000_create_failed_jobs_table', 2),
(134, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(135, '2023_10_19_072713_create_performances_table', 2),
(136, '2023_10_19_095945_create_news_table', 2),
(137, '2023_10_20_020156_create_campaign_categories_table', 2),
(138, '2023_10_20_040811_create_projects_table', 2),
(139, '2023_10_23_075315_create_testimonials_table', 2),
(140, '2023_10_23_091524_create_technologies_table', 2),
(141, '2023_10_23_102456_create_banners_table', 2),
(142, '2023_10_27_134236_create_site_settings_table', 2),
(143, '2023_11_09_015606_create_page_banners_table', 2),
(144, '2024_06_28_053113_create_verification_codes_table', 2),
(149, '2024_07_06_041520_create_campaigns_table', 3),
(150, '2024_07_16_163711_create_donations_table', 4),
(151, '2024_07_20_043922_create_feeds_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `titleKh` varchar(255) DEFAULT NULL,
  `titleCh` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `summaryKh` text DEFAULT NULL,
  `summaryCh` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `contentKh` longtext DEFAULT NULL,
  `contentCh` longtext DEFAULT NULL,
  `isDisplayHomepage` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `titleKh`, `titleCh`, `summary`, `summaryKh`, `summaryCh`, `content`, `contentKh`, `contentCh`, `isDisplayHomepage`, `image`, `type`, `date`, `ordering`, `isActive`, `created_at`, `updated_at`) VALUES
(4, 'Donation is People in Cambodia', '2', NULL, 'Donation is People in Cambodia', '2', NULL, '<p class=\"news-details__text-one\">Tliq is notm hendr erit a augue insu image pellen tes que id erat quis sollicitud. Lorem ipsum dolor sit amet, consectetur adipiscing ullam blandit hendrerit faucibus suspendisse. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.</p>\r\n<p class=\"news-details__text-two\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ley of type and scrambled it to make a type specimen book.</p>\r\n<p class=\"news-details__text-three\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including version.</p>', '', NULL, 1, '/news/CamGoTech_APRK1x6U1AwjGxYvIjrvkhWzVpdv7LSXp0Fd8z1M.jpg', 'EVENT', NULL, 4, 1, '2024-07-31 23:40:41', '2025-09-25 04:00:51'),
(5, 'News & Events 001', '', NULL, 'Stay updated with the latest news and upcoming events', '', NULL, '<p data-start=\"141\" data-end=\"371\">Stay updated with the latest news and upcoming events from our organization. We are committed to sharing important milestones, achievements, and activities that reflect our mission to support education and community development.</p>\n<ul data-start=\"373\" data-end=\"719\">\n<li data-start=\"373\" data-end=\"473\">\n<p data-start=\"375\" data-end=\"473\"><strong data-start=\"375\" data-end=\"391\">Latest News:</strong> Updates on our ongoing projects, student success stories, and community impact.</p>\n</li>\n<li data-start=\"474\" data-end=\"611\">\n<p data-start=\"476\" data-end=\"611\"><strong data-start=\"476\" data-end=\"496\">Upcoming Events:</strong> Announcements of bicycle distribution ceremonies, school outreach programs, and community engagement activities.</p>\n</li>\n<li data-start=\"612\" data-end=\"719\">\n<p data-start=\"614\" data-end=\"719\"><strong data-start=\"614\" data-end=\"629\">Highlights:</strong> Special features on partners, donors, and volunteers who make our initiatives possible.</p>\n</li>\n</ul>\n<p data-start=\"721\" data-end=\"864\">Follow our News &amp; Events section regularly to stay connected with our journey and to be part of the positive change we are creating together.</p>', '', NULL, 1, '/news/CamGoTech_K1AuN32m3pyNPFaHsCwj3CJBAAzDPICooOPLYWii.jpg', 'NEWS', NULL, 1, 1, '2025-09-16 13:04:28', '2025-10-25 06:22:50'),
(6, 'Under Developing', 'កម្មវិធីជួបជុំ សមាជិក', '', '', '', '', '<p data-start=\"141\" data-end=\"371\">Under Developing</p>', '', '', 1, '/news/CamGoTech_jmMabIeLyc0XOAjHoPxvqmhtqdyymiH9f5g1bCEN.jpg', 'NEWS', '2019-07-19', 1, 1, '2025-09-16 13:07:13', '2025-11-01 09:29:39'),
(7, 'News and events 4', 'សកម្មភាពដាំកូនឈើ', 'Chinese', 'Stay updated with the latest news and upcoming events', '', 'Chinese', '<p>News and events&nbsp;</p>\n<p><img src=\"https://api.cambodiaalumni.org/uploads/content/CamGoTech_Qhb7aLyT2iTi9gLfmTu2CFzzmzNmuLQNzxEEgzrG.jpg\" alt=\"\" width=\"100%\" height=\"auto\"><br><br><img src=\"https://api.cambodiaalumni.org/uploads/content/CamGoTech_GDYGnqKo5abe01DG8coQV7EQwkDEStZwN4zhkWr2.jpg\" alt=\"\" width=\"100%\" height=\"auto\"></p>\n<p><img src=\"https://api.cambodiaalumni.org/uploads/content/CamGoTech_MBHuq7dePnfBKSXiy7BwAlnh9w0i3A22x9l393zX.jpg\" alt=\"\" width=\"100%\" height=\"auto\"><br><br><img src=\"https://api.cambodiaalumni.org/uploads/content/CamGoTech_HhlWDfAyRDCA0mgpId982ZDuuNL06CqvlYF7Vuz3.jpg\" alt=\"\" width=\"100%\" height=\"auto\"></p>\n<p>&nbsp;</p>', '<p>Chinese</p>', '<p>Chinese Content</p>', 1, '/news/CamGoTech_Fq13YelOHe6VWZ3Yn6PgPC1qcqnQ3GF5iwdcrrzD.jpg', 'NEWS', '2025-10-14', 2, 1, '2025-09-27 01:33:59', '2025-11-01 09:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `page_banners`
--

CREATE TABLE `page_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pageTitle` varchar(255) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_banners`
--

INSERT INTO `page_banners` (`id`, `image`, `pageTitle`, `isActive`, `created_at`, `updated_at`) VALUES
(1, '/pageBanner-profile/CamGoTech_qTen7tKqD3foOOQTGXoThnX0ktzIzZKFvDAKDZux.jpg', 'CONTACT_PAGE', 1, '2024-08-02 16:01:24', '2025-09-29 06:26:42'),
(2, '/pageBanner-profile/CamGoTech_FQEqXatLqgYIZtHkFcLYGlWP37nV7j4mCtwYzpao.jpg', 'ABOUT_PAGE', 1, '2024-08-02 16:01:59', '2025-09-29 06:26:14'),
(3, '/pageBanner-profile/CamGoTech_bEoxuhtVNksxfUAWlRxtKOmJrObqfegOx8tv3CxP.jpg', 'EVENT_PAGE', 1, '2024-08-02 16:02:38', '2025-09-29 06:27:17'),
(4, '/pageBanner-profile/CamGoTech_6BtLGHzuvAbRxJoftplzeiuU5w5LTWIcOZi2IUeo.jpg', 'NEWS_PAGE', 1, '2024-08-02 16:02:53', '2025-09-29 06:28:10'),
(5, '/pageBanner-profile/CamGoTech_3qVWq4tvhc8tVZ9rIDvYjwj5gO9D2mGJ07YJPzMR.jpg', 'FEED_PAGE', 1, '2024-08-02 16:03:44', '2024-08-02 16:09:03'),
(6, '/pageBanner-profile/CamGoTech_dEtirdLjpPuWwUlvCnpIoomb2qXOgpS6JtCV8g6g.jpg', 'DONORS_PAGE', 1, '2024-08-02 16:04:00', '2025-09-29 06:27:46'),
(7, '/pageBanner-profile/CamGoTech_kNRnCcRgVg7ZcQ2BLS58eDR0S4lgKQkiKVoPuvgQ.jpg', 'RAISE_FUND_PAGE', 1, '2024-08-02 16:04:18', '2024-08-02 16:08:11'),
(8, '/pageBanner-profile/CamGoTech_spYG6nb9wYxjh3LlHGf20fBH8gOe2j1J26VeW9P2.jpg', 'CAMPAIGN_PAGE', 1, '2024-08-02 16:04:39', '2025-09-29 06:26:28'),
(9, '/pageBanner-profile/CamGoTech_g6xdER6lsVkOIA32BifQF7h56n4fAwIqmk7ktamP.jpg', 'TERM_CONDITION', 1, '2024-08-02 16:12:25', '2024-08-02 16:12:25'),
(10, '/pageBanner-profile/CamGoTech_WFoSt3gsNFGaC4WiMhMTYPOO5jZxxwrMzaB5mMY2.jpg', 'PRIVACY_POLICY', 1, '2024-08-02 16:12:59', '2024-08-02 16:12:59'),
(11, '/pageBanner-profile/CamGoTech_1JXyspCSxvbXpoeebeHZi8MvewmCO1qXq2TQK2bg.jpg', 'PROJECT_PAGE', 1, '2024-08-02 16:12:59', '2025-09-29 06:27:32'),
(12, '/pageBanner-profile/CamGoTech_1JXyspCSxvbXpoeebeHZi8MvewmCO1qXq2TQK2bg.jpg', 'MEMBER_PAGE', 1, '2024-08-02 16:12:59', '2025-09-29 06:27:32'),
(13, '/pageBanner-profile/CamGoTech_kNRnCcRgVg7ZcQ2BLS58eDR0S4lgKQkiKVoPuvgQ.jpg', 'GALLERY', 1, '2024-08-02 16:04:18', '2024-08-02 16:08:11'),
(14, '/pageBanner-profile/CamGoTech_kNRnCcRgVg7ZcQ2BLS58eDR0S4lgKQkiKVoPuvgQ.jpg', 'VIDEO', 1, '2024-08-02 16:04:18', '2024-08-02 16:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `title`, `image`, `ordering`, `isActive`, `created_at`, `updated_at`) VALUES
(6, 'Partner 1', '/partner-profile/CamGoTech_pl63RIBf6oeHFshlfdrkpQ6ZoN8b9iFaoWbjrWxO.png', 0, 1, '2024-08-23 15:47:45', '2025-09-25 02:06:44'),
(7, 'Partner 2', '/partner-profile/CamGoTech_dIw30iwdASujB2DM7L8kJH4tfr9tc7UMdGOM8CZt.png', 1, 1, '2024-08-23 15:48:04', '2025-09-25 02:07:00'),
(8, 'Partner 3', '/partner-profile/CamGoTech_3GJfAJ6Ed8gNk8U28HeKIfGz8DFYhdXEFSLW5efr.png', 2, 1, '2024-08-23 15:48:19', '2025-09-25 02:07:14'),
(9, 'Partner 4', '/partner-profile/CamGoTech_BbPPDuf1FVJ3cgYHDBlDzYGQnxX1OtezBf20ZaoI.png', 3, 1, '2024-08-23 15:48:45', '2025-09-25 02:07:29'),
(10, 'Partner 5', '/partner-profile/CamGoTech_qB0B5QT6ze0b4l1wrQLf7dkmShCPDCDMSTtHJQog.png', 4, 1, '2024-08-23 15:49:00', '2025-09-25 02:07:46'),
(15, 'Partner 6', '/partner-profile/CamGoTech_BkyE3E1xwSOVC3KeesFfgTkmyp7hddRREMfqNa8l.png', 5, 1, '2025-09-25 02:07:59', '2025-09-25 02:08:22');

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
-- Table structure for table `performances`
--

CREATE TABLE `performances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `titleKh` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `descriptionKh` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `performances`
--

INSERT INTO `performances` (`id`, `title`, `titleKh`, `description`, `descriptionKh`, `image`, `ordering`, `isActive`, `created_at`, `updated_at`) VALUES
(2, 'Goal', 'គោលដៅ', 'Finally, set your goals and what you hope to achieve from your campaign.', 'ជាចុងក្រោយ កំណត់គោលដៅរបស់អ្នក និងអ្វីដែលអ្នកសង្ឃឹមថានឹងសម្រេចបានពីយុទ្ធនាការរបស់អ្នក', '/performance/CamGoTech_jolLOkckaFphIcEjZ0xtIT79fKMxGfmqK0MNlHRV.png', 3, 1, '2024-08-02 19:56:48', '2024-09-22 19:51:51'),
(3, 'Photos & Video', 'រូបថត និងវីដេអូ', 'Donors are more likely to connect with your campaign with story telling visuals.', 'ម្ចាស់ជំនួយទំនងជាភ្ជាប់ជាមួយយុទ្ធនាការរបស់អ្នកជាមួយនឹងរូបភាពនិទានរឿង', '/performance/CamGoTech_wzL6ZAsODbzfDe8wMaOOjgiOzWqPOfAlLxYrBM6G.png', 2, 1, '2024-08-02 19:57:23', '2024-09-22 19:51:28'),
(4, 'Your Story', 'រឿងរបស់អ្នក', 'Provide your potential donors with a moving and poweful cause.', 'ផ្តល់ឱ្យម្ចាស់ជំនួយដែលមានសក្តានុពលរបស់អ្នកជាមួយនឹងបុព្វហេតុផ្លាស់ប្តូរ និងថាមពល', '/performance/CamGoTech_SmJDZyaF9KVuqmaZLtCVIDiTwKDCLZraDWCq9cF9.png', 1, 1, '2024-08-02 19:57:49', '2024-09-22 19:50:59'),
(5, 'Basic Information', 'ព័ត៌មានមូលដ្ឋាន', 'Enter your personal information so you can verify your account to continue', 'បញ្ចូលព័ត៌មានផ្ទាល់ខ្លួនរបស់អ្នក ដូច្នេះអ្នកអាចផ្ទៀងផ្ទាត់គណនីរបស់អ្នកដើម្បីបន្ត', '/performance/CamGoTech_58x297xB7TAwQQ6bIO7wXiio5dz5pWXDLQVZnmLL.png', 4, 1, '2024-08-02 19:58:11', '2024-09-22 19:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `titleKh` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `contentKh` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `isDisplayHomepage` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id`, `title`, `titleKh`, `content`, `contentKh`, `image`, `fromDate`, `toDate`, `location`, `inProgress`, `isDisplayHomepage`, `ordering`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'Agreement for Social', 'ខ្មែរ', '<p class=\"event-details__text-1\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.</p>\n<p class=\"event-details__text-2\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ley of type and scrambled it to make a type specimen book.</p>', '', '/portfolio/CamGoTech_EqMZ2mQpMyTtYCvevc4Il2GyHWC41L0CXG8E2WRT.jpg', '2025-09-16', NULL, '', 0, 0, 10, 0, '2025-09-15 08:57:25', '2025-09-16 13:01:53'),
(2, 'Project: Bicycles for Students', '', '<p data-start=\"145\" data-end=\"506\">In many rural and underserved communities, students face long and difficult journeys to reach school each day. Some children walk several kilometers under the hot sun or through unsafe conditions, which often leads to fatigue, absenteeism, and even school dropouts. To address this challenge, we propose the <em data-start=\"472\" data-end=\"503\">Bicycles for Students Project</em>.</p>\n<p data-start=\"508\" data-end=\"698\"><strong data-start=\"508\" data-end=\"521\">Objective</strong><br data-start=\"521\" data-end=\"524\">The main goal of this project is to provide bicycles to students who live far from school, helping them save time, reduce exhaustion, and improve their access to education.</p>\n<p data-start=\"700\" data-end=\"718\"><strong data-start=\"700\" data-end=\"716\">Key Benefits</strong></p>\n<ul data-start=\"719\" data-end=\"1149\">\n<li data-start=\"719\" data-end=\"803\">\n<p data-start=\"721\" data-end=\"803\"><strong data-start=\"721\" data-end=\"745\">Improved Attendance:</strong> Students can reach school faster and more consistently.</p>\n</li>\n<li data-start=\"804\" data-end=\"913\">\n<p data-start=\"806\" data-end=\"913\"><strong data-start=\"806\" data-end=\"838\">Better Academic Performance:</strong> With reduced travel time, students can dedicate more energy to learning.</p>\n</li>\n<li data-start=\"914\" data-end=\"1033\">\n<p data-start=\"916\" data-end=\"1033\"><strong data-start=\"916\" data-end=\"943\">Safety and Convenience:</strong> Bicycles offer a safer and more reliable mode of transport than walking long distances.</p>\n</li>\n<li data-start=\"1034\" data-end=\"1149\">\n<p data-start=\"1036\" data-end=\"1149\"><strong data-start=\"1036\" data-end=\"1057\">Community Impact:</strong> Families benefit when their children can focus more on studies rather than long commutes.</p>\n</li>\n</ul>\n<p data-start=\"1151\" data-end=\"1176\"><strong data-start=\"1151\" data-end=\"1174\">Implementation Plan</strong></p>\n<ol data-start=\"1177\" data-end=\"1515\">\n<li data-start=\"1177\" data-end=\"1294\">\n<p data-start=\"1180\" data-end=\"1294\">Identify target schools and students in need through surveys and collaboration with local education authorities.</p>\n</li>\n<li data-start=\"1295\" data-end=\"1373\">\n<p data-start=\"1298\" data-end=\"1373\">Procure durable, student-friendly bicycles suitable for rural conditions.</p>\n</li>\n<li data-start=\"1374\" data-end=\"1456\">\n<p data-start=\"1377\" data-end=\"1456\">Distribute bicycles along with basic training on maintenance and safe riding.</p>\n</li>\n<li data-start=\"1457\" data-end=\"1515\">\n<p data-start=\"1460\" data-end=\"1515\">Monitor usage and impact through periodic follow-ups.</p>\n</li>\n</ol>\n<p data-start=\"1517\" data-end=\"1540\"><strong data-start=\"1517\" data-end=\"1538\">Expected Outcomes</strong></p>\n<ul data-start=\"1541\" data-end=\"1758\">\n<li data-start=\"1541\" data-end=\"1589\">\n<p data-start=\"1543\" data-end=\"1589\">Increased school attendance and punctuality.</p>\n</li>\n<li data-start=\"1590\" data-end=\"1637\">\n<p data-start=\"1592\" data-end=\"1637\">Reduced dropout rates among rural students.</p>\n</li>\n<li data-start=\"1638\" data-end=\"1687\">\n<p data-start=\"1640\" data-end=\"1687\">Enhanced motivation and academic performance.</p>\n</li>\n<li data-start=\"1688\" data-end=\"1758\">\n<p data-start=\"1690\" data-end=\"1758\">Empowerment of children to pursue education with dignity and hope.</p>\n</li>\n</ul>', '', '/portfolio/CamGoTech_fV7cmi0DhYz2O4iZDjW60VJRCSgxHNps0RujZvHy.jpg', '2024-09-03', NULL, '', 0, 0, 3, 0, '2025-09-16 12:59:20', '2025-09-16 13:01:43'),
(3, 'Project 3', '', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '', '/portfolio/CamGoTech_iBiF73Hipl7swBq7Nb1sse5cbcvqeGYgEenU5Iyy.jpg', '2024-01-02', NULL, '', 1, 0, 5, 1, '2025-09-16 13:01:24', '2025-09-16 13:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `websiteLink` text DEFAULT NULL,
  `facebookLink` text DEFAULT NULL,
  `instagramLink` text DEFAULT NULL,
  `telegramLink` text DEFAULT NULL,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `isDisplayHomepage` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_categories`
--

CREATE TABLE `project_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nameKh` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `titleKh` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `contentKh` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `isDisplayHomepage` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `titleKh`, `content`, `contentKh`, `image`, `fromDate`, `toDate`, `inProgress`, `isDisplayHomepage`, `ordering`, `isActive`, `created_at`, `updated_at`) VALUES
(3, 'Service Two', 'សេវាកម្ម ២', '<p data-start=\"105\" data-end=\"251\">Planting trees in the right place is important for their healthy growth and long-term benefits. Consider the following when choosing a location:</p>\n<ol data-start=\"253\" data-end=\"982\">\n<li data-start=\"253\" data-end=\"354\">\n<p data-start=\"256\" data-end=\"354\"><strong data-start=\"256\" data-end=\"270\">Open Space</strong> &ndash; Select areas with enough room for the tree to grow both above and below ground.</p>\n</li>\n<li data-start=\"355\" data-end=\"438\">\n<p data-start=\"358\" data-end=\"438\"><strong data-start=\"358\" data-end=\"370\">Sunlight</strong> &ndash; Most trees need at least 6&ndash;8 hours of direct sunlight each day.</p>\n</li>\n<li data-start=\"439\" data-end=\"524\">\n<p data-start=\"442\" data-end=\"524\"><strong data-start=\"442\" data-end=\"458\">Soil Quality</strong> &ndash; Choose well-drained soil and avoid areas with standing water.</p>\n</li>\n<li data-start=\"525\" data-end=\"642\">\n<p data-start=\"528\" data-end=\"642\"><strong data-start=\"528\" data-end=\"556\">Distance from Structures</strong> &ndash; Plant trees away from buildings, fences, and underground pipes to prevent damage.</p>\n</li>\n</ol>', '', '/service/CamGoTech_a0mHxTUQkHHFS7z785wiAEoh2ArB7WuhD6s7sojb.jpg', NULL, NULL, 0, 0, 10, 0, '2025-09-14 12:34:33', '2025-09-29 01:29:21'),
(5, 'Service One', 'សេវាកម្ម ១', '<p data-start=\"105\" data-end=\"251\">Planting trees in the right place is important for their healthy growth and long-term benefits. Consider the following when choosing a location:</p>\n<ol data-start=\"253\" data-end=\"982\">\n<li data-start=\"253\" data-end=\"354\">\n<p data-start=\"256\" data-end=\"354\"><strong data-start=\"256\" data-end=\"270\">Open Space</strong> &ndash; Select areas with enough room for the tree to grow both above and below ground.</p>\n</li>\n<li data-start=\"355\" data-end=\"438\">\n<p data-start=\"358\" data-end=\"438\"><strong data-start=\"358\" data-end=\"370\">Sunlight</strong> &ndash; Most trees need at least 6&ndash;8 hours of direct sunlight each day.</p>\n</li>\n<li data-start=\"439\" data-end=\"524\">\n<p data-start=\"442\" data-end=\"524\"><strong data-start=\"442\" data-end=\"458\">Soil Quality</strong> &ndash; Choose well-drained soil and avoid areas with standing water.</p>\n</li>\n<li data-start=\"525\" data-end=\"642\">\n<p data-start=\"528\" data-end=\"642\"><strong data-start=\"528\" data-end=\"556\">Distance from Structures</strong> &ndash; Plant trees away from buildings, fences, and underground pipes to prevent damage.</p>\n</li>\n<li data-start=\"643\" data-end=\"750\">\n<p data-start=\"646\" data-end=\"750\"><strong data-start=\"646\" data-end=\"664\">Wind and Shade</strong> &ndash; Use trees to provide natural shade around homes, or as windbreaks in open fields.</p>\n</li>\n<li data-start=\"751\" data-end=\"878\">\n<p data-start=\"754\" data-end=\"878\"><strong data-start=\"754\" data-end=\"774\">Community Spaces</strong> &ndash; Parks, schools, roadsides, and open public land are ideal for planting trees that benefit everyone.</p>\n</li>\n<li data-start=\"879\" data-end=\"982\">\n<p data-start=\"882\" data-end=\"982\"><strong data-start=\"882\" data-end=\"899\">Water Sources</strong> &ndash; Ensure access to water, especially for young trees during the first few years.</p>\n</li>\n</ol>', '', '/service/CamGoTech_pyFlC9z8DOD8dv7ZU8BfyVXQproni1C4ZRLNoVJT.jpg', NULL, NULL, 0, 0, 1, 0, '2025-09-16 09:36:45', '2025-09-29 01:29:11'),
(6, 'Service 3', 'សេវាកម្ម ៣', '', '', '/service/CamGoTech_PlCyOSfPfte8sba5MN10DIZtgUmti8A0QCy4VoeT.jpg', NULL, NULL, 0, 0, 3, 1, '2025-09-16 12:37:56', '2025-09-29 01:29:03'),
(7, 'Service 4', 'សេវាកម្ម ៤', '', '', '/service/CamGoTech_Venw71OwsNcJvAR1PdInrY21u5SYqRAUZeIBIN57.jpg', NULL, NULL, 0, 0, 0, 1, '2025-09-25 03:32:21', '2025-09-29 01:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `type`, `content`, `created_at`, `updated_at`) VALUES
(1, 'CONTACT', '{\"pageTitle\":\"Have a question or need assistance? <br \\/>Get in touch with us today \\u2013 we\\u2019re always happy to help!\",\"pageTitleKh\":\"\\u1798\\u17b6\\u1793\\u179f\\u17c6\\u178e\\u17bd\\u179a \\u17ac\\u178f\\u17d2\\u179a\\u17bc\\u179c\\u1780\\u17b6\\u179a\\u1787\\u17c6\\u1793\\u17bd\\u1799? <br \\/>\\u1791\\u17b6\\u1780\\u17cb\\u1791\\u1784\\u1798\\u1780\\u1799\\u17be\\u1784\\u1790\\u17d2\\u1784\\u17c3\\u1793\\u17c1\\u17c7 - \\u1799\\u17be\\u1784\\u179a\\u17b8\\u1780\\u179a\\u17b6\\u1799\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1780\\u17b6\\u179a\\u1787\\u17bd\\u1799\\u1787\\u17b6\\u1793\\u17b7\\u1785\\u17d2\\u1785!\",\"pageTitleCh\":\"Chinese\",\"pageDescription\":\"We\\u2019re here to help and answer any questions you may have. Reach out to us anytime \\u2013 our team will get back to you as soon as possible\",\"pageDescriptionKh\":\"\\u1799\\u17be\\u1784\\u1793\\u17c5\\u1791\\u17b8\\u1793\\u17c1\\u17c7\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1787\\u17bd\\u1799 \\u1793\\u17b7\\u1784\\u1786\\u17d2\\u179b\\u17be\\u1799\\u179f\\u17c6\\u178e\\u17bd\\u179a\\u1791\\u17b6\\u17c6\\u1784\\u17a1\\u17b6\\u1799\\u178a\\u17c2\\u179b\\u17a2\\u17d2\\u1793\\u1780\\u1794\\u17d2\\u179a\\u17a0\\u17c2\\u179b\\u1787\\u17b6\\u1798\\u17b6\\u1793\\u17d4 \\u1791\\u17b6\\u1780\\u17cb\\u1791\\u1784\\u1798\\u1780\\u1796\\u17bd\\u1780\\u1799\\u17be\\u1784\\u1794\\u17b6\\u1793\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u1796\\u17c1\\u179b - \\u1780\\u17d2\\u179a\\u17bb\\u1798\\u1780\\u17b6\\u179a\\u1784\\u17b6\\u179a\\u179a\\u1794\\u179f\\u17cb\\u1799\\u17be\\u1784\\u1793\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u179b\\u1794\\u17cb\\u1798\\u1780\\u17a2\\u17d2\\u1793\\u1780\\u179c\\u17b7\\u1789\\u17b1\\u17d2\\u1799\\u1794\\u17b6\\u1793\\u1786\\u17b6\\u1794\\u17cb\\u178f\\u17b6\\u1798\\u178a\\u17c2\\u179b\\u17a2\\u17b6\\u1785\\u1792\\u17d2\\u179c\\u17be\\u1791\\u17c5\\u1794\\u17b6\\u1793\",\"pageDescriptionCh\":\"Chinese\",\"thumbnail\":\"\\/site-setting\\/CamGoTech_ox9DQjxz4XsLJZZmxzKyUvxJDaMn8MgI4Ct3UUBA.jpg\",\"email1\":\"info@cambodiaalumni.org\",\"email2\":\"\",\"phoneNumber1\":\"+855 12 963 111\",\"phoneNumber2\":\"+855 12 963 111\",\"address\":\"Preaek Thleong, Preaek Kampus, Khan Dangkor,  Phnom Penh, Cambodia\",\"addressKh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1790\\u17d2\\u179b\\u17b9\\u1784 \\u179f\\u1784\\u17d2\\u1780\\u17b6\\u178f\\u17cb\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u1781\\u178e\\u17d2\\u178c\\u178a\\u1784\\u17d2\\u1780\\u17c4 \\u179a\\u17b6\\u1787\\u1792\\u17b6\\u1793\\u17b8\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789 \\u1794\\u17d2\\u179a\\u1791\\u17c1\\u179f\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\",\"addressCh\":\"Chinese\",\"embedMap\":\"<iframe src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3910.3795490334637!2d104.9069425!3d11.452506699999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31095b0934edc2c7%3A0xfb6c105979386085!2z4Z6f4Z6Y4Z624Z6C4Z6Y4Z6i4Z6P4Z644Z6P4Z6f4Z634Z6f4Z-S4Z6f4Z6T4Z634Z6f4Z-S4Z6f4Z634Z6P4Z6T4Z-F4Z6A4Z6Y4Z-S4Z6W4Z674Z6H4Z62!5e0!3m2!1skm!2skh!4v1761624114342!5m2!1skm!2skh\\\" width=\\\"100%\\\" height=\\\"450\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" loading=\\\"lazy\\\" referrerpolicy=\\\"no-referrer-when-downgrade\\\"><\\/iframe>\",\"facebookLink\":\"https:\\/\\/www.facebook.com\\/profile.php?id=100069908061589\",\"instagramLink\":\"https:\\/\\/www.instagram.com\\/\",\"telegramLink\":\"https:\\/\\/web.telegram.org\\/\",\"linkedinLink\":\"https:\\/\\/linkedin.com\\/feed\\/\"}', '2024-08-01 15:13:41', '2025-10-30 08:44:19'),
(2, 'HOME_PAGE', '{\"subtitle\":\"Welcome to\",\"subtitleKh\":\"\\u179f\\u17bc\\u1798\\u179f\\u17d2\\u179c\\u17b6\\u1782\\u1798\\u1793\\u17cd\\u1798\\u1780\\u1780\\u17b6\\u1793\\u17cb\",\"subtitleCh\":\"Chinese\",\"title\":\"Cambodia Alumni Association\",\"titleKh\":\"\\u179f\\u1798\\u17b6\\u1782\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1793\\u17b7\\u179f\\u17d2\\u179f\\u17b7\\u178f\\u1793\\u17c5\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6\",\"titleCh\":\"Chinese\",\"des\":\"<p>We are a non-profit organization dedicated to creating positive change and improving the lives of those in need. Guided by compassion, transparency, and accountability, our mission is to empower communities, provide opportunities, and bring hope to the most vulnerable. Through education, healthcare, livelihood support, and community development projects, we strive to break the cycle of poverty and build a brighter future.<\\/p>\",\"desKh\":\"<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: 0in; text-align: justify; text-indent: .5in; line-height: normal;\\\"><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u17a2\\u1793\\u17bb\\u179c\\u17b7\\u1791\\u17d2\\u1799\\u17b6\\u179b\\u17d0\\u1799 \\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u1798\\u17bd\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u1793\\u17c3\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb\\u1794\\u1793\\u17d2\\u178f\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1794\\u17cb\\u1782\\u17d2\\u1793\\u17b6\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u179f\\u17b7\\u1780\\u17d2\\u179f\\u17b6 \\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e1\\u17e9\\u17e9\\u17e1<\\/span><span style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\';\\\">-<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u17e2\\u17e0\\u17e0\\u17e1 \\u1794\\u1785\\u17d2\\u1785\\u17bb\\u1794\\u17d2\\u1794\\u1793\\u17d2\\u1793\\u1787\\u17b6\\u179c\\u17b7\\u1791\\u17d2\\u1799\\u17b6\\u179b\\u17d0\\u1799<strong>\\u179f\\u1798\\u17d2\\u178f\\u17c1\\u1785<\\/strong> <\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Muol Light\'; mso-bidi-language: KHM;\\\">\\u17a0\\u17ca\\u17bb\\u1793 \\u179f\\u17c2\\u1793<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\"> \\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u179f\\u17d2\\u1790\\u17b7\\u178f\\u1793\\u17c5\\u1795\\u17d2\\u179b\\u17bc\\u179c\\u1787\\u17b6\\u178f\\u17b7\\u179b\\u17c1\\u1781\\u17e2 \\u1797\\u17bc\\u1798\\u17b7\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179a\\u1791\\u17b6\\u17c6\\u1784 \\u179f\\u1784\\u17d2\\u1780\\u17b6\\u178f\\u17cb\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u1781\\u178e\\u17d2\\u178c\\u178a\\u1784\\u17d2\\u1780\\u17c4 \\u179a\\u17b6\\u1787\\u1792\\u17b6\\u1793\\u17b8\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789 \\u17d4 <\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: 0in; text-align: justify; text-indent: .5in; line-height: normal;\\\"><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u1798\\u17bb\\u1793\\u1796\\u17c1\\u179b\\u178a\\u17c2\\u179b\\u179f\\u1798\\u17d2\\u179a\\u17c1\\u1785\\u1794\\u1784\\u17d2\\u1780\\u17be\\u178f\\u179f\\u1798\\u17b6\\u1782\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f<\\/span><span style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">-<span lang=\\\"KHM\\\">\\u1793\\u17b7\\u179f\\u17d2\\u179f\\u17b7\\u178f\\u1793\\u17c5\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6\\u1793\\u17c1\\u17c7\\u17a1\\u17be\\u1784 \\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb\\u1781\\u17b6\\u1784\\u179b\\u17be\\u1793\\u17c1\\u17c7 \\u1794\\u17b6\\u1793\\u179a\\u17c0\\u1794\\u1785<\\/span><\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-ansi-language: CA; mso-bidi-language: KHM;\\\">\\u17c6\\u1780\\u1798\\u17d2\\u1798\\u179c\\u17b7\\u1792\\u17b8\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u1782\\u17d2\\u1793\\u17b6\\u1787\\u17b6\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u1792\\u1798\\u17d2\\u1798\\u178f\\u17b6\\u17d7 \\u17d4 \\u178a\\u17c4\\u1799\\u17a1\\u17c2\\u1780\\u1793\\u17c5\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e2\\u17e0\\u17e1\\u17e3 \\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb\\u1781\\u17b6\\u1784\\u179b\\u17be\\u1794\\u17b6\\u1793\\u1780\\u17c0\\u1784\\u1782\\u179a\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb \\u1793\\u17c3\\u179c\\u17b7\\u1791\\u17d2\\u1799\\u17b6\\u179b\\u17d0\\u1799<strong>\\u179f\\u1798\\u17d2\\u178f\\u17c1\\u1785<\\/strong> <\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Muol Light\'; mso-bidi-language: KHM;\\\">\\u17a0\\u17ca\\u17bb\\u1793 \\u179f\\u17c2\\u1793<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\"> \\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-ansi-language: CA; mso-bidi-language: KHM;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp; <\\/span>\\u179a\\u17c0\\u1794\\u1785\\u17c6<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u1796\\u17b7\\u1792\\u17b8\\u1787\\u1794\\u17cb\\u179b\\u17c0\\u1784\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f \\u1793\\u17b7\\u1784\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u17b6\\u1793\\u17bb\\u179f\\u17b7\\u179f\\u17d2\\u179f \\u178a\\u17c4\\u1799\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1785\\u17bc\\u179b\\u179a\\u17bd\\u1798\\u1787\\u17b6\\u1780\\u17b7\\u178f\\u17d2\\u178f\\u17b7\\u1799\\u179f\\u178a\\u17cf\\u1781\\u17d2\\u1796\\u1784\\u17cb\\u1781\\u17d2\\u1796\\u179f\\u17cb\\u1796\\u17b8 <strong>\\u17af\\u1780\\u17a7\\u178f\\u17d2\\u178f\\u1798<\\/strong> <\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Muol Light\'; mso-bidi-language: KHM;\\\">\\u17a0\\u17ca\\u17bb\\u1793 \\u1798\\u17c9\\u17b6\\u178e\\u17c2\\u178f<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\"> (<strong>\\u179f\\u1798\\u17d2\\u178f\\u17c1\\u1785\\u1798\\u17a0\\u17b6\\u1794\\u179c\\u179a\\u1792\\u17b7\\u1794\\u178f\\u17b8<\\/strong> <\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Muol Light\'; mso-bidi-language: KHM;\\\">\\u17a0\\u17ca\\u17bb\\u1793 \\u1798\\u17c9\\u17b6\\u178e\\u17c2\\u178f)<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\"> \\u17d4 <\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: 0in; text-align: justify; text-indent: .5in; line-height: normal;\\\"><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; letter-spacing: -.3pt; mso-bidi-language: KHM;\\\">\\u1785\\u17b6\\u1794\\u17cb\\u1796\\u17b8\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e2\\u17e0\\u17e1\\u17e3 \\u179a\\u17a0\\u17bc\\u178f\\u1798\\u1780\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1794\\u17b6\\u1793\\u179f\\u17a0\\u1780\\u17b6\\u179a\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u179b\\u17c4\\u1780\\u1782\\u17d2\\u179a\\u17bc\\u17a2\\u17d2\\u1793\\u1780\\u1782\\u17d2\\u179a\\u17bc \\u179f\\u17b7\\u179f\\u17d2\\u179f\\u17b6\\u1793\\u17bb\\u179f\\u17b7\\u179f\\u17d2\\u179f<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u200b \\u1798\\u17b6\\u178f\\u17b6\\u1794\\u17b7\\u178f\\u17b6\\u179f\\u17b7\\u179f\\u17d2\\u179f \\u1793\\u17b7\\u1784\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1792\\u179a\\u1798\\u17bc\\u179b\\u178a\\u17d2\\u178b\\u17b6\\u1793 \\u179a\\u17c0\\u1794\\u1785\\u17c6\\u1780\\u1798\\u17d2\\u1798\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u179f\\u17b6\\u1798\\u1789\\u17d2\\u1789\\u17d7\\u1787\\u17b6\\u179a\\u17c0\\u1784\\u179a\\u17b6\\u179b\\u17cb\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u1794\\u1793\\u17d2\\u178f\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1794\\u17cb\\u1798\\u1780 \\u17d4 \\u1780\\u17b6\\u179a\\u179a\\u17c0\\u1794\\u1785\\u17c6\\u1780\\u1798\\u17d2\\u1798\\u179c\\u17b7\\u1792\\u17b8\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u1793\\u17c1\\u17c7\\u1782\\u17d2\\u179a\\u17b6\\u1793\\u17cb\\u178f\\u17c2\\u1792\\u17d2\\u179c\\u17be\\u17a1\\u17be\\u1784\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1782\\u17c4\\u179b\\u1794\\u17c6\\u178e\\u1784\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u1798\\u17b7\\u178f\\u17d2\\u178f\\u1785\\u17b6\\u179f\\u17cb \\u1793\\u17b7\\u1784\\u179a\\u1780\\u17d2\\u179f\\u17b6\\u1791\\u17c6\\u1793\\u17b6\\u1780\\u17cb\\u1791\\u17c6\\u1793\\u1784\\u1794\\u17c9\\u17bb\\u178e\\u17d2\\u178e\\u17c4\\u17c7 \\u17a0\\u17be\\u1799\\u178a\\u17c4\\u1799\\u179f\\u17b6\\u179a\\u178f\\u17c2\\u1798\\u17b7\\u178f\\u17d2\\u178f\\u1797\\u17b6\\u1796 \\u1780\\u17b6\\u179a\\u1791\\u17c6\\u1793\\u17b6\\u1780\\u17cb\\u1791\\u17c6\\u1793\\u1784 \\u1793\\u17b7\\u1784\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\\u1797\\u17b6\\u1796 \\u1780\\u17b6\\u179a\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u1798\\u17bd\\u1799\\u1793\\u17c1\\u17c7 \\u1794\\u17b6\\u1793\\u1794\\u17c6\\u1795\\u17bb\\u179f\\u1782\\u17c6\\u1793\\u17b7\\u178f\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1781\\u17b6\\u1784\\u179b\\u17be\\u1792\\u17d2\\u179c\\u17be\\u179a\\u17bf\\u1784\\u179a\\u17bd\\u1798\\u1782\\u17d2\\u1793\\u17b6\\u1798\\u17bd\\u1799\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u179b\\u17be\\u179f\\u1796\\u17b8\\u1782\\u17c4\\u179b\\u1794\\u17c6\\u178e\\u1784 \\u1793\\u17b7\\u1784\\u1780\\u17b6\\u179a\\u179a\\u17c6\\u1796\\u17b9\\u1784\\u1791\\u17bb\\u1780\\u1793\\u17b6\\u1796\\u17c1\\u179b\\u178a\\u17c6\\u1794\\u17bc\\u1784 \\u178a\\u17bc\\u1785\\u1787\\u17b6\\u1780\\u17b6\\u179a\\u1787\\u17bd\\u1799\\u1787\\u17b6\\u1792\\u1793\\u1792\\u17b6\\u1793\\u1798\\u17bd\\u1799\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u179f\\u1798\\u17d2\\u179a\\u17b6\\u1794\\u17cb\\u1792\\u17d2\\u179c\\u17be\\u1781\\u17d2\\u179b\\u17c4\\u1784\\u1791\\u17d2\\u179c\\u17b6\\u179a\\u179f\\u17b6\\u179b\\u17b6 \\u179f\\u1798\\u17d2\\u1797\\u17b6\\u179a\\u179f\\u17b7\\u1780\\u17d2\\u179f\\u17b6 \\u1787\\u17c6\\u1793\\u17bd\\u1799\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1796\\u17c1\\u179b<span style=\\\"letter-spacing: -.8pt;\\\">\\u1791\\u17b9\\u1780\\u179b\\u17b7\\u1785\\u179f\\u17b6\\u179b\\u17b6 \\u1793\\u17b7\\u1784\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u1781\\u17d2\\u179f\\u17b6\\u1785\\u17cb\\u1785\\u17b6\\u1780\\u17cb\\u1793\\u17c5\\u1791\\u17b8\\u1792\\u17d2\\u179b\\u17b6\\u179f\\u17b6\\u179b\\u17b6\\u1787\\u17b6\\u178a\\u17be\\u1798 \\u17d4 <\\/span><\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: 0in; text-align: justify; text-indent: .5in; line-height: normal;\\\"><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; letter-spacing: -.8pt; mso-bidi-language: KHM;\\\">\\u178a\\u17c4\\u1799\\u1799\\u179b\\u17cb\\u1783\\u17be\\u1789\\u1790\\u17b6 \\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\\u1797\\u17b6\\u1796\\u179a\\u1794\\u179f\\u17cb\\u1780\\u17d2\\u179a\\u17bb\\u1798<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7<span style=\\\"letter-spacing: -.4pt;\\\">\\u179f\\u17d2\\u179f\\u1798\\u17b6\\u1793\\u1797\\u17b6\\u1796\\u1780\\u17d2\\u179b\\u17c0\\u179c\\u1780\\u17d2\\u179b\\u17b6 \\u1793\\u17b7\\u1784\\u1798\\u17c4\\u17c7\\u1798\\u17bb\\u178f\\u1794\\u17b6\\u1793\\u178f\\u17d2\\u179a\\u17b9\\u1798\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1780\\u1798\\u17d2\\u179a\\u17b7\\u178f\\u1787\\u17b6\\u1780\\u17d2\\u179a\\u17bb\\u1798 \\u17d4 \\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1796\\u1784\\u17d2\\u179a\\u17b8\\u1780\\u179c\\u17b7\\u179f\\u17b6\\u179b\\u1797\\u17b6\\u1796\\u1793\\u17c3\\u1780\\u17b6\\u179a\\u1785\\u17c2\\u1780\\u179a\\u17c6\\u179b\\u17c2\\u1780 \\u1793\\u17b7\\u1784\\u1794\\u17c6\\u1795\\u17bb\\u179f\\u1785\\u179b\\u1793\\u17b6\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\\u1797\\u17b6\\u1796 \\u1780\\u178f\\u1789\\u17d2\\u1789\\u17bc \\u1793\\u17b7\\u1784\\u1782\\u17bb\\u178e\\u1792\\u1798\\u17cc \\u178a\\u179b\\u17cb\\u179f\\u1784\\u17d2\\u1782\\u1798\\u1787\\u17b6\\u178f\\u17b7 \\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1799\\u17bb\\u1791\\u17d2\\u1792\\u179f\\u17b6\\u179f\\u17d2\\u178f\\u17d2\\u179a\\u17a2\\u1797\\u17b7\\u179c\\u178c\\u17d2\\u178d\\u1793\\u17cd\\u179a\\u1794\\u179f\\u17cb\\u179a\\u17b6\\u1787\\u179a\\u178a\\u17d2\\u178b\\u17b6\\u1797\\u17b7\\u1794\\u17b6\\u179b \\u1787\\u17b6\\u1796\\u17b7\\u179f\\u17c1\\u179f \\u1782\\u17ba\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780\\u179b\\u17be\\u1780\\u1780\\u1798\\u17d2\\u1796\\u179f\\u17cb\\u179c\\u17b7\\u179f\\u17d0\\u1799\\u17a2\\u1794\\u17cb\\u179a\\u17c6 \\u1793\\u17b7\\u1784\\u1794\\u179a\\u17b7\\u179f\\u17d2\\u1790\\u17b6\\u1793\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1794\\u17d2\\u179a\\u1791\\u17c1\\u179f \\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1793\\u17c1\\u17c7<\\/span> \\u1780\\u17cf\\u1794\\u17b6\\u1793\\u179a\\u17bd\\u1798\\u1782\\u17d2\\u1793\\u17b6\\u179f\\u1798\\u17d2\\u179a\\u17c1\\u1785\\u1794\\u1784\\u17d2\\u1780\\u17be\\u178f\\u1787\\u17b6 <strong>\\u179f\\u1798\\u17b6\\u1782\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f<\\/strong><\\/span><strong><span style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">-<span lang=\\\"KHM\\\">\\u1793\\u17b7\\u179f\\u17d2\\u179f\\u17b7\\u178f\\u1793\\u17c5\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6 <\\/span><\\/span><\\/strong><span style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">(CAMBODIA ALUMNI ASSOCIATION)<strong> <\\/strong><span lang=\\\"KHM\\\">\\u179f\\u17d2\\u179a\\u1794\\u178f\\u17b6\\u1798\\u1785\\u17d2\\u1794\\u17b6\\u1794\\u17cb\\u1793\\u17c3\\u1796\\u17d2\\u179a\\u17c7\\u179a\\u17b6\\u1787\\u17b6\\u178e\\u17b6\\u1785\\u1780\\u17d2\\u179a\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6 \\u1780\\u17d2\\u179a\\u17c4\\u1798\\u1794\\u17d2\\u179a\\u1780\\u17b6\\u179f\\u179b\\u17c1\\u1781 \\u17e0\\u17e9\\u17e2 \\u1794\\u17d2\\u179a\\u1780 \\u1785\\u17bb\\u17c7\\u1790\\u17d2\\u1784\\u17c3\\u1791\\u17b8\\u17e1\\u17e7 \\u1781\\u17c2\\u1798\\u1780\\u179a\\u17b6 \\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e2\\u17e0\\u17e1\\u17e9 \\u179a\\u1794\\u179f\\u17cb\\u1780\\u17d2\\u179a\\u179f\\u17bd\\u1784\\u1798\\u17a0\\u17b6\\u1795\\u17d2\\u1791\\u17c3 \\u1798\\u17b6\\u1793\\u1791\\u17b8\\u178f\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u1793\\u17b6\\u1780\\u17cb\\u1780\\u17b6\\u179a\\u1780\\u178e\\u17d2\\u178f\\u17b6\\u179b\\u179f\\u17d2\\u1790\\u17b7\\u178f\\u1793\\u17c5\\u1797\\u17bc\\u1798\\u17b7\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1790\\u17d2\\u179b\\u17b9\\u1784 \\u179f\\u1784\\u17d2\\u1780\\u17b6\\u178f\\u17cb\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u1781\\u178e\\u17d2\\u178c\\u178a\\u1784\\u17d2\\u1780\\u17c4 \\u179a\\u17b6\\u1787\\u1792\\u17b6\\u1793\\u17b8\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789 \\u17d4 <\\/span><\\/span><\\/p>\",\"desCh\":\"\",\"latestProject\":\"Find the popular project <br \\/> and donate them\",\"latestProjectKh\":\"\\u179f\\u17d2\\u179c\\u17c2\\u1784\\u179a\\u1780\\u1794\\u17bb\\u1796\\u17d2\\u179c\\u17a0\\u17c1\\u178f\\u17bb\\u178a\\u17cf\\u1796\\u17c1\\u1789\\u1793\\u17b7\\u1799\\u1798 <br \\/> \\u17a0\\u17be\\u1799\\u1794\\u179a\\u17b7\\u1785\\u17d2\\u1785\\u17b6\\u1782\\u1796\\u17bd\\u1780\\u1782\\u17c1\",\"latestProjectCh\":\"\",\"bannerDesc\":\"Join the community<be \\/> to\\u200b  get benefit our country\",\"bannerDescKh\":\"\\u1785\\u17bc\\u179b\\u179a\\u17bd\\u1798\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd<br \\/> \\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u1780\\u17b6\\u179a\\u17a2\\u1794\\u17cb\\u179a\\u17c6\\u178a\\u179b\\u17cb\\u1780\\u17bb\\u1798\\u17b6\\u179a\",\"bannerDescCh\":\"\\u52a0\\u5165\\u793e\\u533a\\uff0c\\u5171\\u540c\\u4e3a\\u6211\\u4eec\\u7684\\u56fd\\u5bb6\\u5e26\\u6765\\u76ca\\u5904\\u3002\",\"bannerLabel\":\"Join Us\",\"bannerLabelKh\":\"\\u179f\\u17d2\\u179c\\u17c2\\u1784\\u1799\\u179b\\u17cb\\u1794\\u1793\\u17d2\\u1790\\u17c2\\u1798\",\"bannerLabelCh\":\"\",\"bannerLinkTo\":\"\\/about\",\"thumbnail\":\"\\/site-setting\\/CamGoTech_QYHCB13vhaej0KrzzCMphNlT0J7PME8cR0WKOoDg.jpg\",\"cardTitle1\":\"Healthy Food\",\"cardTitleKh1\":\"\\u17a2\\u17b6\\u17a0\\u17b6\\u179a\\u179f\\u17bb\\u1781\\u1797\\u17b6\\u1796\",\"cardTitleCh1\":\"\",\"cardDesc1\":\"Lorem ipsum is simply free text available amet, consectetuer adipiscing elit. There are not many passages of ipsum.\",\"cardDescKh1\":\"\\u17e2\",\"cardDescCh1\":\"\",\"cardLabel1\":\"Donate\",\"cardLabelKh1\":\"\\u1794\\u179a\\u17b7\\u1785\\u17d2\\u1785\\u17b6\\u1782\",\"cardLabelCh1\":\"\",\"cardIcon1\":\"icon-fast-food\",\"cardLinkTo1\":\"\\/projects\",\"cardIsShow1\":true,\"thumbnailTwo\":\"\\/site-setting\\/CamGoTech_Pge1zUSmsf85Yr1ebwsBI1Jq3mlTR5nlsPFLb8yN.png\",\"cardTitle2\":\"Clean Water\",\"cardTitleKh2\":\"\\u1791\\u17b9\\u1780\\u179f\\u17d2\\u17a2\\u17b6\\u178f\",\"cardTitleCh2\":\"\",\"cardDesc2\":\"Lorem ipsum is simply free text available amet, consectetuer adipiscing elit. There are not many passages of ipsum.\",\"cardDescKh2\":\"\\u17e2\",\"cardDescCh2\":\"\",\"cardLabel2\":\"Donate\",\"cardLabelKh2\":\"\\u1794\\u179a\\u17b7\\u1785\\u17d2\\u1785\\u17b6\\u1782\",\"cardLabelCh2\":\"\",\"cardIcon2\":\"icon-water\",\"cardLinkTo2\":\"\\/projects\",\"cardIsShow2\":true,\"thumbnailThree\":\"\\/site-setting\\/CamGoTech_UB5P7kectEDe7LkA6GjfiQvc15bHwaSDyb9roTPS.jpg\",\"cardTitle3\":\"Medical Treatment\",\"cardTitleKh3\":\"\\u1780\\u17b6\\u179a\\u1796\\u17d2\\u1799\\u17b6\\u1794\\u17b6\\u179b\\u179c\\u17c1\\u1787\\u17d2\\u1787\\u179f\\u17b6\\u179f\\u17d2\\u179a\\u17d2\\u178f\",\"cardTitleCh3\":\"\",\"cardDesc3\":\"Lorem ipsum is simply free text available amet, consectetuer adipiscing elit. There are not many passages of ipsum.\",\"cardDescKh3\":\"\\u17e2\",\"cardDescCh3\":\"\",\"cardLabel3\":\"Donate\",\"cardLabelKh3\":\"\\u1794\\u179a\\u17b7\\u1785\\u17d2\\u1785\\u17b6\\u1782\",\"cardLabelCh3\":\"\",\"cardIcon3\":\"icon-health-check\",\"cardLinkTo3\":\"\\/projects\",\"cardIsShow3\":true,\"thumbnailFour\":\"\\/site-setting\\/CamGoTech_UB5P7kectEDe7LkA6GjfiQvc15bHwaSDyb9roTPS.jpg\",\"ourDonors\":\"Help them whenever they are in need\",\"ourDonorsKh\":\"\\u1787\\u17bd\\u1799\\u1796\\u17bd\\u1780\\u1782\\u17c1\\u1793\\u17c5\\u1796\\u17c1\\u179b\\u178e\\u17b6\\u178a\\u17c2\\u179b\\u1796\\u17bd\\u1780\\u1782\\u17c1\\u178f\\u17d2\\u179a\\u17bc\\u179c\\u1780\\u17b6\\u179a\",\"ourDonorsCh\":\"\",\"thumbnailFive\":\"\\/site-setting\\/CamGoTech_kHIb8G44ptDUIvdfFvg54c1mjaxs0Lt239hWfoLN.jpg\",\"thumbnailSix\":\"\",\"thumbnailSeven\":\"\",\"getDailyUpdate\":\"Latest news & articles directly coming from CAA\",\"getDailyUpdateKh\":\"\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793 \\u1793\\u17b7\\u1784\\u17a2\\u178f\\u17d2\\u1790\\u1794\\u1791\\u1790\\u17d2\\u1798\\u17b8\\u17d7 \\u178a\\u17c4\\u1799\\u1795\\u17d2\\u1791\\u17b6\\u179b\\u17cb\\u1796\\u17b8 CDA\",\"getDailyUpdateCh\":\"\",\"footerDesc\":\"Funding to support child care providers with obtaining their Alumni\\u00ae (Alumni) Credential\\u2122 from the Council for Professional Recognition.\",\"footerDescKh\":\"\",\"footerDescCh\":\"\\u4e3a\\u652f\\u6301\\u513f\\u7ae5\\u7167\\u62a4\\u670d\\u52a1\\u63d0\\u4f9b\\u8005\\u4ece\\u201c\\u4e13\\u4e1a\\u8ba4\\u53ef\\u59d4\\u5458\\u4f1a\\u201d\\uff08Council for Professional Recognition\\uff09\\u83b7\\u53d6\\u5176 Alumni\\u00ae\\uff08Alumni\\uff09\\u8d44\\u8d28\\uff08Credential\\u2122\\uff09\\u800c\\u63d0\\u4f9b\\u7684\\u8d44\\u52a9\\u3002\"}', '2024-08-01 15:21:14', '2025-11-01 08:48:43');
INSERT INTO `site_settings` (`id`, `type`, `content`, `created_at`, `updated_at`) VALUES
(3, 'ABOUT_PAGE', '{\"introTitle\":\"Cambodia Alumni Association (CAA)\",\"introTitleKh\":\"\\u179f\\u1798\\u17b6\\u1782\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f-\\u1793\\u17b7\\u179f\\u17d2\\u179f\\u17b7\\u178f\\u1793\\u17c5\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6\",\"introTitleCh\":\"Chinese\",\"introDesc\":\"<p>We are a non-profit organization dedicated to creating positive change and improving the lives of those in need. Guided by compassion, transparency, and accountability, our mission is to empower communities, provide opportunities, and bring hope to the most vulnerable. <br>Through education, healthcare, livelihood support, and community development projects, we strive to break the cycle of poverty and build a brighter future. Every initiative we take is fueled by the generosity of donors, the commitment of volunteers, and the belief that together, we can make a lasting difference. <br>We envision a world where every individual has access to basic needs, dignity, and the opportunity to thrive.<\\/p>\",\"introDescKh\":\"<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: 0in; text-align: justify; text-indent: .5in; line-height: normal;\\\"><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u17a2\\u1793\\u17bb\\u179c\\u17b7\\u1791\\u17d2\\u1799\\u17b6\\u179b\\u17d0\\u1799 \\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u1798\\u17bd\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u1793\\u17c3\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb\\u1794\\u1793\\u17d2\\u178f\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1794\\u17cb\\u1782\\u17d2\\u1793\\u17b6\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u179f\\u17b7\\u1780\\u17d2\\u179f\\u17b6 \\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e1\\u17e9\\u17e9\\u17e1<\\/span><span style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\';\\\">-<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u17e2\\u17e0\\u17e0\\u17e1 \\u1794\\u1785\\u17d2\\u1785\\u17bb\\u1794\\u17d2\\u1794\\u1793\\u17d2\\u1793\\u1787\\u17b6\\u179c\\u17b7\\u1791\\u17d2\\u1799\\u17b6\\u179b\\u17d0\\u1799<strong>\\u179f\\u1798\\u17d2\\u178f\\u17c1\\u1785<\\/strong> <\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Muol Light\'; mso-bidi-language: KHM;\\\">\\u17a0\\u17ca\\u17bb\\u1793 \\u179f\\u17c2\\u1793<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\"> \\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u179f\\u17d2\\u1790\\u17b7\\u178f\\u1793\\u17c5\\u1795\\u17d2\\u179b\\u17bc\\u179c\\u1787\\u17b6\\u178f\\u17b7\\u179b\\u17c1\\u1781\\u17e2 \\u1797\\u17bc\\u1798\\u17b7\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179a\\u1791\\u17b6\\u17c6\\u1784 \\u179f\\u1784\\u17d2\\u1780\\u17b6\\u178f\\u17cb\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u1781\\u178e\\u17d2\\u178c\\u178a\\u1784\\u17d2\\u1780\\u17c4 \\u179a\\u17b6\\u1787\\u1792\\u17b6\\u1793\\u17b8\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789 \\u17d4 <\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: 0in; text-align: justify; text-indent: .5in; line-height: normal;\\\"><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u1798\\u17bb\\u1793\\u1796\\u17c1\\u179b\\u178a\\u17c2\\u179b\\u179f\\u1798\\u17d2\\u179a\\u17c1\\u1785\\u1794\\u1784\\u17d2\\u1780\\u17be\\u178f\\u179f\\u1798\\u17b6\\u1782\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f<\\/span><span style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">-<span lang=\\\"KHM\\\">\\u1793\\u17b7\\u179f\\u17d2\\u179f\\u17b7\\u178f\\u1793\\u17c5\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6\\u1793\\u17c1\\u17c7\\u17a1\\u17be\\u1784 \\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb\\u1781\\u17b6\\u1784\\u179b\\u17be\\u1793\\u17c1\\u17c7 \\u1794\\u17b6\\u1793\\u179a\\u17c0\\u1794\\u1785<\\/span><\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-ansi-language: CA; mso-bidi-language: KHM;\\\">\\u17c6\\u1780\\u1798\\u17d2\\u1798\\u179c\\u17b7\\u1792\\u17b8\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u1782\\u17d2\\u1793\\u17b6\\u1787\\u17b6\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u1792\\u1798\\u17d2\\u1798\\u178f\\u17b6\\u17d7 \\u17d4 \\u178a\\u17c4\\u1799\\u17a1\\u17c2\\u1780\\u1793\\u17c5\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e2\\u17e0\\u17e1\\u17e3 \\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb\\u1781\\u17b6\\u1784\\u179b\\u17be\\u1794\\u17b6\\u1793\\u1780\\u17c0\\u1784\\u1782\\u179a\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb \\u1793\\u17c3\\u179c\\u17b7\\u1791\\u17d2\\u1799\\u17b6\\u179b\\u17d0\\u1799<strong>\\u179f\\u1798\\u17d2\\u178f\\u17c1\\u1785<\\/strong> <\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Muol Light\'; mso-bidi-language: KHM;\\\">\\u17a0\\u17ca\\u17bb\\u1793 \\u179f\\u17c2\\u1793<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\"> \\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-ansi-language: CA; mso-bidi-language: KHM;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp; <\\/span>\\u179a\\u17c0\\u1794\\u1785\\u17c6<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u1796\\u17b7\\u1792\\u17b8\\u1787\\u1794\\u17cb\\u179b\\u17c0\\u1784\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f \\u1793\\u17b7\\u1784\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u17b6\\u1793\\u17bb\\u179f\\u17b7\\u179f\\u17d2\\u179f \\u178a\\u17c4\\u1799\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1785\\u17bc\\u179b\\u179a\\u17bd\\u1798\\u1787\\u17b6\\u1780\\u17b7\\u178f\\u17d2\\u178f\\u17b7\\u1799\\u179f\\u178a\\u17cf\\u1781\\u17d2\\u1796\\u1784\\u17cb\\u1781\\u17d2\\u1796\\u179f\\u17cb\\u1796\\u17b8 <strong>\\u17af\\u1780\\u17a7\\u178f\\u17d2\\u178f\\u1798<\\/strong> <\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Muol Light\'; mso-bidi-language: KHM;\\\">\\u17a0\\u17ca\\u17bb\\u1793 \\u1798\\u17c9\\u17b6\\u178e\\u17c2\\u178f<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\"> (<strong>\\u179f\\u1798\\u17d2\\u178f\\u17c1\\u1785\\u1798\\u17a0\\u17b6\\u1794\\u179c\\u179a\\u1792\\u17b7\\u1794\\u178f\\u17b8<\\/strong> <\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Muol Light\'; mso-bidi-language: KHM;\\\">\\u17a0\\u17ca\\u17bb\\u1793 \\u1798\\u17c9\\u17b6\\u178e\\u17c2\\u178f)<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\"> \\u17d4 <\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: 0in; text-align: justify; text-indent: .5in; line-height: normal;\\\"><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; letter-spacing: -.3pt; mso-bidi-language: KHM;\\\">\\u1785\\u17b6\\u1794\\u17cb\\u1796\\u17b8\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e2\\u17e0\\u17e1\\u17e3 \\u179a\\u17a0\\u17bc\\u178f\\u1798\\u1780\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1794\\u17b6\\u1793\\u179f\\u17a0\\u1780\\u17b6\\u179a\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u179b\\u17c4\\u1780\\u1782\\u17d2\\u179a\\u17bc\\u17a2\\u17d2\\u1793\\u1780\\u1782\\u17d2\\u179a\\u17bc \\u179f\\u17b7\\u179f\\u17d2\\u179f\\u17b6\\u1793\\u17bb\\u179f\\u17b7\\u179f\\u17d2\\u179f<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u200b \\u1798\\u17b6\\u178f\\u17b6\\u1794\\u17b7\\u178f\\u17b6\\u179f\\u17b7\\u179f\\u17d2\\u179f \\u1793\\u17b7\\u1784\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1792\\u179a\\u1798\\u17bc\\u179b\\u178a\\u17d2\\u178b\\u17b6\\u1793 \\u179a\\u17c0\\u1794\\u1785\\u17c6\\u1780\\u1798\\u17d2\\u1798\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u179f\\u17b6\\u1798\\u1789\\u17d2\\u1789\\u17d7\\u1787\\u17b6\\u179a\\u17c0\\u1784\\u179a\\u17b6\\u179b\\u17cb\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u1794\\u1793\\u17d2\\u178f\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1794\\u17cb\\u1798\\u1780 \\u17d4 \\u1780\\u17b6\\u179a\\u179a\\u17c0\\u1794\\u1785\\u17c6\\u1780\\u1798\\u17d2\\u1798\\u179c\\u17b7\\u1792\\u17b8\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u1793\\u17c1\\u17c7\\u1782\\u17d2\\u179a\\u17b6\\u1793\\u17cb\\u178f\\u17c2\\u1792\\u17d2\\u179c\\u17be\\u17a1\\u17be\\u1784\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1782\\u17c4\\u179b\\u1794\\u17c6\\u178e\\u1784\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u1798\\u17b7\\u178f\\u17d2\\u178f\\u1785\\u17b6\\u179f\\u17cb \\u1793\\u17b7\\u1784\\u179a\\u1780\\u17d2\\u179f\\u17b6\\u1791\\u17c6\\u1793\\u17b6\\u1780\\u17cb\\u1791\\u17c6\\u1793\\u1784\\u1794\\u17c9\\u17bb\\u178e\\u17d2\\u178e\\u17c4\\u17c7 \\u17a0\\u17be\\u1799\\u178a\\u17c4\\u1799\\u179f\\u17b6\\u179a\\u178f\\u17c2\\u1798\\u17b7\\u178f\\u17d2\\u178f\\u1797\\u17b6\\u1796 \\u1780\\u17b6\\u179a\\u1791\\u17c6\\u1793\\u17b6\\u1780\\u17cb\\u1791\\u17c6\\u1793\\u1784 \\u1793\\u17b7\\u1784\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\\u1797\\u17b6\\u1796 \\u1780\\u17b6\\u179a\\u1787\\u17bd\\u1794\\u1787\\u17bb\\u17c6\\u1798\\u17bd\\u1799\\u1793\\u17c1\\u17c7 \\u1794\\u17b6\\u1793\\u1794\\u17c6\\u1795\\u17bb\\u179f\\u1782\\u17c6\\u1793\\u17b7\\u178f\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1781\\u17b6\\u1784\\u179b\\u17be\\u1792\\u17d2\\u179c\\u17be\\u179a\\u17bf\\u1784\\u179a\\u17bd\\u1798\\u1782\\u17d2\\u1793\\u17b6\\u1798\\u17bd\\u1799\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u179b\\u17be\\u179f\\u1796\\u17b8\\u1782\\u17c4\\u179b\\u1794\\u17c6\\u178e\\u1784 \\u1793\\u17b7\\u1784\\u1780\\u17b6\\u179a\\u179a\\u17c6\\u1796\\u17b9\\u1784\\u1791\\u17bb\\u1780\\u1793\\u17b6\\u1796\\u17c1\\u179b\\u178a\\u17c6\\u1794\\u17bc\\u1784 \\u178a\\u17bc\\u1785\\u1787\\u17b6\\u1780\\u17b6\\u179a\\u1787\\u17bd\\u1799\\u1787\\u17b6\\u1792\\u1793\\u1792\\u17b6\\u1793\\u1798\\u17bd\\u1799\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u179f\\u1798\\u17d2\\u179a\\u17b6\\u1794\\u17cb\\u1792\\u17d2\\u179c\\u17be\\u1781\\u17d2\\u179b\\u17c4\\u1784\\u1791\\u17d2\\u179c\\u17b6\\u179a\\u179f\\u17b6\\u179b\\u17b6 \\u179f\\u1798\\u17d2\\u1797\\u17b6\\u179a\\u179f\\u17b7\\u1780\\u17d2\\u179f\\u17b6 \\u1787\\u17c6\\u1793\\u17bd\\u1799\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1796\\u17c1\\u179b<span style=\\\"letter-spacing: -.8pt;\\\">\\u1791\\u17b9\\u1780\\u179b\\u17b7\\u1785\\u179f\\u17b6\\u179b\\u17b6 \\u1793\\u17b7\\u1784\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u1781\\u17d2\\u179f\\u17b6\\u1785\\u17cb\\u1785\\u17b6\\u1780\\u17cb\\u1793\\u17c5\\u1791\\u17b8\\u1792\\u17d2\\u179b\\u17b6\\u179f\\u17b6\\u179b\\u17b6\\u1787\\u17b6\\u178a\\u17be\\u1798 \\u17d4 <\\/span><\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: 0in; text-align: justify; text-indent: .5in; line-height: normal;\\\"><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; letter-spacing: -.8pt; mso-bidi-language: KHM;\\\">\\u178a\\u17c4\\u1799\\u1799\\u179b\\u17cb\\u1783\\u17be\\u1789\\u1790\\u17b6 \\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\\u1797\\u17b6\\u1796\\u179a\\u1794\\u179f\\u17cb\\u1780\\u17d2\\u179a\\u17bb\\u1798<\\/span><span lang=\\\"KHM\\\" style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7<span style=\\\"letter-spacing: -.4pt;\\\">\\u179f\\u17d2\\u179f\\u1798\\u17b6\\u1793\\u1797\\u17b6\\u1796\\u1780\\u17d2\\u179b\\u17c0\\u179c\\u1780\\u17d2\\u179b\\u17b6 \\u1793\\u17b7\\u1784\\u1798\\u17c4\\u17c7\\u1798\\u17bb\\u178f\\u1794\\u17b6\\u1793\\u178f\\u17d2\\u179a\\u17b9\\u1798\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1780\\u1798\\u17d2\\u179a\\u17b7\\u178f\\u1787\\u17b6\\u1780\\u17d2\\u179a\\u17bb\\u1798 \\u17d4 \\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1796\\u1784\\u17d2\\u179a\\u17b8\\u1780\\u179c\\u17b7\\u179f\\u17b6\\u179b\\u1797\\u17b6\\u1796\\u1793\\u17c3\\u1780\\u17b6\\u179a\\u1785\\u17c2\\u1780\\u179a\\u17c6\\u179b\\u17c2\\u1780 \\u1793\\u17b7\\u1784\\u1794\\u17c6\\u1795\\u17bb\\u179f\\u1785\\u179b\\u1793\\u17b6\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\\u1797\\u17b6\\u1796 \\u1780\\u178f\\u1789\\u17d2\\u1789\\u17bc \\u1793\\u17b7\\u1784\\u1782\\u17bb\\u178e\\u1792\\u1798\\u17cc \\u178a\\u179b\\u17cb\\u179f\\u1784\\u17d2\\u1782\\u1798\\u1787\\u17b6\\u178f\\u17b7 \\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1799\\u17bb\\u1791\\u17d2\\u1792\\u179f\\u17b6\\u179f\\u17d2\\u178f\\u17d2\\u179a\\u17a2\\u1797\\u17b7\\u179c\\u178c\\u17d2\\u178d\\u1793\\u17cd\\u179a\\u1794\\u179f\\u17cb\\u179a\\u17b6\\u1787\\u179a\\u178a\\u17d2\\u178b\\u17b6\\u1797\\u17b7\\u1794\\u17b6\\u179b \\u1787\\u17b6\\u1796\\u17b7\\u179f\\u17c1\\u179f \\u1782\\u17ba\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780\\u179b\\u17be\\u1780\\u1780\\u1798\\u17d2\\u1796\\u179f\\u17cb\\u179c\\u17b7\\u179f\\u17d0\\u1799\\u17a2\\u1794\\u17cb\\u179a\\u17c6 \\u1793\\u17b7\\u1784\\u1794\\u179a\\u17b7\\u179f\\u17d2\\u1790\\u17b6\\u1793\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1794\\u17d2\\u179a\\u1791\\u17c1\\u179f \\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f\\u1793\\u17c1\\u17c7<\\/span> \\u1780\\u17cf\\u1794\\u17b6\\u1793\\u179a\\u17bd\\u1798\\u1782\\u17d2\\u1793\\u17b6\\u179f\\u1798\\u17d2\\u179a\\u17c1\\u1785\\u1794\\u1784\\u17d2\\u1780\\u17be\\u178f\\u1787\\u17b6 <strong>\\u179f\\u1798\\u17b6\\u1782\\u1798\\u17a2\\u178f\\u17b8\\u178f\\u179f\\u17b7\\u179f\\u17d2\\u179f<\\/strong><\\/span><strong><span style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">-<span lang=\\\"KHM\\\">\\u1793\\u17b7\\u179f\\u17d2\\u179f\\u17b7\\u178f\\u1793\\u17c5\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6 <\\/span><\\/span><\\/strong><span style=\\\"font-size: 12.0pt; font-family: \'Khmer OS Battambang\'; mso-bidi-language: KHM;\\\">(CAMBODIA ALUMNI ASSOCIATION)<strong> <\\/strong><span lang=\\\"KHM\\\">\\u179f\\u17d2\\u179a\\u1794\\u178f\\u17b6\\u1798\\u1785\\u17d2\\u1794\\u17b6\\u1794\\u17cb\\u1793\\u17c3\\u1796\\u17d2\\u179a\\u17c7\\u179a\\u17b6\\u1787\\u17b6\\u178e\\u17b6\\u1785\\u1780\\u17d2\\u179a\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6 \\u1780\\u17d2\\u179a\\u17c4\\u1798\\u1794\\u17d2\\u179a\\u1780\\u17b6\\u179f\\u179b\\u17c1\\u1781 \\u17e0\\u17e9\\u17e2 \\u1794\\u17d2\\u179a\\u1780 \\u1785\\u17bb\\u17c7\\u1790\\u17d2\\u1784\\u17c3\\u1791\\u17b8\\u17e1\\u17e7 \\u1781\\u17c2\\u1798\\u1780\\u179a\\u17b6 \\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e2\\u17e0\\u17e1\\u17e9 \\u179a\\u1794\\u179f\\u17cb\\u1780\\u17d2\\u179a\\u179f\\u17bd\\u1784\\u1798\\u17a0\\u17b6\\u1795\\u17d2\\u1791\\u17c3 \\u1798\\u17b6\\u1793\\u1791\\u17b8\\u178f\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u1793\\u17b6\\u1780\\u17cb\\u1780\\u17b6\\u179a\\u1780\\u178e\\u17d2\\u178f\\u17b6\\u179b\\u179f\\u17d2\\u1790\\u17b7\\u178f\\u1793\\u17c5\\u1797\\u17bc\\u1798\\u17b7\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1790\\u17d2\\u179b\\u17b9\\u1784 \\u179f\\u1784\\u17d2\\u1780\\u17b6\\u178f\\u17cb\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f \\u1781\\u178e\\u17d2\\u178c\\u178a\\u1784\\u17d2\\u1780\\u17c4 \\u179a\\u17b6\\u1787\\u1792\\u17b6\\u1793\\u17b8\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789 \\u17d4 <\\/span><\\/span><\\/p>\",\"introDescCh\":\"<p>Chinese<\\/p>\",\"introHighlight\":\"Halpes is the largest global crowdfunding community in the world\",\"introHighlightKh\":\"Halpes \\u1782\\u17ba\\u1787\\u17b6\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u1798\\u17bc\\u179b\\u1793\\u17b7\\u1792\\u17b7\\u179f\\u1780\\u179b\\u178a\\u17cf\\u1792\\u17c6\\u1798\\u17bd\\u1799\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1794\\u17d2\\u179a\\u1791\\u17c1\\u179f\\u1780\\u1798\\u17d2\\u1796\\u17bb\\u1787\\u17b6\",\"introHighlightCh\":\"Chinese\",\"successfulCampaign\":\"90\",\"amazingDonors\":\"50\",\"donorTrusted\":\"98750\",\"thumbnailTwo\":\"\\/site-setting\\/CamGoTech_9pU0slEZLVoLvgxX8lNkIaXmYTmZioc5Op73GVu4.jpg\",\"cardTitle1\":\"VISION\",\"cardTitleKh1\":\"\\u1785\\u1780\\u17d2\\u1781\\u17bb\\u179c\\u17b7\\u179f\\u17d0\\u1799\",\"cardTitleCh1\":\"\",\"cardDesc1\":\"To build a compassionate and sustainable world where every person has equal opportunity, access to basic needs, and the chance to live with dignity and hope.\",\"cardDescKh1\":\"\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1780\\u179f\\u17b6\\u1784\\u1796\\u17b7\\u1797\\u1796\\u179b\\u17c4\\u1780\\u1794\\u17d2\\u179a\\u1780\\u1794\\u178a\\u17c4\\u1799\\u1798\\u17c1\\u178f\\u17d2\\u178f\\u17b6 \\u1793\\u17b7\\u1784\\u1793\\u17b7\\u179a\\u1793\\u17d2\\u178f\\u179a\\u1797\\u17b6\\u1796 \\u178a\\u17c2\\u179b\\u1798\\u1793\\u17bb\\u179f\\u17d2\\u179f\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u179a\\u17bc\\u1794\\u1798\\u17b6\\u1793\\u17b1\\u1780\\u17b6\\u179f\\u179f\\u17d2\\u1798\\u17be\\u1782\\u17d2\\u1793\\u17b6 \\u179b\\u1791\\u17d2\\u1792\\u1797\\u17b6\\u1796\\u1791\\u1791\\u17bd\\u179b\\u1794\\u17b6\\u1793\\u178f\\u1798\\u17d2\\u179a\\u17bc\\u179c\\u1780\\u17b6\\u179a\\u1787\\u17b6\\u1798\\u17bc\\u179b\\u178a\\u17d2\\u178b\\u17b6\\u1793 \\u1793\\u17b7\\u1784\\u17b1\\u1780\\u17b6\\u179f\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u179a\\u179f\\u17cb\\u1793\\u17c5\\u178a\\u17c4\\u1799\\u179f\\u17c1\\u1785\\u1780\\u17d2\\u178f\\u17b8\\u1790\\u17d2\\u179b\\u17c3\\u1790\\u17d2\\u1793\\u17bc\\u179a \\u1793\\u17b7\\u1784\\u1780\\u17d2\\u178f\\u17b8\\u179f\\u1784\\u17d2\\u1783\\u17b9\\u1798\\u17d4\",\"cardDescCh1\":\"\",\"cardIcon1\":\"fas fa-eye\",\"cardTitle2\":\"MISSION\",\"cardTitleKh2\":\"\\u1794\\u17c1\\u179f\\u1780\\u1780\\u1798\\u17d2\\u1798\",\"cardTitleCh2\":\"\",\"cardDesc2\":\"To serve vulnerable <br> communities  by providing education, healthcare, livelihood support, and humanitarian assistance. <br> We are committed to empowering individuals, fostering self-reliance, and promoting social justice through sustainable and impactful initiatives.\",\"cardDescKh2\":\"\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1794\\u1798\\u17d2\\u179a\\u17be\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd <br> \\u178a\\u17c2\\u179b\\u1784\\u17b6\\u1799\\u179a\\u1784\\u1782\\u17d2\\u179a\\u17c4\\u17c7\\u178a\\u17c4\\u1799\\u1780\\u17b6\\u179a\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u1793\\u17bc\\u179c\\u1780\\u17b6\\u179a\\u17a2\\u1794\\u17cb\\u179a\\u17c6 \\u1780\\u17b6\\u179a\\u1790\\u17c2\\u1791\\u17b6\\u17c6\\u179f\\u17bb\\u1781\\u1797\\u17b6\\u1796 \\u1780\\u17b6\\u179a\\u1782\\u17b6\\u17c6\\u1791\\u17d2\\u179a\\u1780\\u17b6\\u179a\\u1785\\u17b7\\u1789\\u17d2\\u1785\\u17b9\\u1798\\u1787\\u17b8\\u179c\\u17b7\\u178f \\u1793\\u17b7\\u1784\\u1787\\u17c6\\u1793\\u17bd\\u1799\\u1798\\u1793\\u17bb\\u179f\\u17d2\\u179f\\u1792\\u1798\\u17cc\\u17d4 <br> \\u1799\\u17be\\u1784\\u1794\\u17d2\\u178f\\u17c1\\u1787\\u17d2\\u1789\\u17b6\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u179f\\u17b7\\u1791\\u17d2\\u1792\\u17b7\\u17a2\\u17c6\\u178e\\u17b6\\u1785\\u178a\\u179b\\u17cb\\u1794\\u17bb\\u1782\\u17d2\\u1782\\u179b \\u1787\\u17c6\\u179a\\u17bb\\u1789\\u1780\\u17b6\\u179a\\u1796\\u17b9\\u1784\\u1795\\u17d2\\u17a2\\u17c2\\u1780\\u179b\\u17be\\u1781\\u17d2\\u179b\\u17bd\\u1793\\u17af\\u1784 \\u1793\\u17b7\\u1784\\u1780\\u17b6\\u179a\\u179b\\u17be\\u1780\\u1780\\u1798\\u17d2\\u1796\\u179f\\u17cb\\u1799\\u17bb\\u178f\\u17d2\\u178f\\u17b7\\u1792\\u1798\\u17cc\\u179f\\u1784\\u17d2\\u1782\\u1798 \\u178f\\u17b6\\u1798\\u179a\\u1799\\u17c8\\u1782\\u17c6\\u1793\\u17b7\\u178f\\u1795\\u17d2\\u178f\\u17bd\\u1785\\u1795\\u17d2\\u178f\\u17be\\u1798\\u1794\\u17d2\\u179a\\u1780\\u1794\\u178a\\u17c4\\u1799\\u1793\\u17b7\\u179a\\u1793\\u17d2\\u178f\\u179a\\u1797\\u17b6\\u1796 \\u1793\\u17b7\\u1784\\u1794\\u17d2\\u179a\\u1780\\u1794\\u178a\\u17c4\\u1799\\u1794\\u17d2\\u179a\\u179f\\u17b7\\u1791\\u17d2\\u1792\\u1797\\u17b6\\u1796\\u17d4\",\"cardDescCh2\":\"\",\"cardIcon2\":\"fas fa-bullseye\",\"cardTitle3\":\"CORE VALUES\",\"cardTitleKh3\":\"\\u1782\\u17bb\\u178e\\u178f\\u1798\\u17d2\\u179b\\u17c3\\u179f\\u17d2\\u1793\\u17bc\\u179b\",\"cardTitleCh3\":\"\",\"cardDesc3\":\"Compassion \\u2013 We care deeply for people and act with kindness to bring hope and dignity to every life we touch. <br>\\n\\nIntegrity \\u2013 We uphold honesty, transparency, and accountability in all our actions and partnerships. <br>\\n\\nCollaboration \\u2013 We believe in the power of working together with communities, partners, and volunteers to achieve lasting impact.<br>\\n\\nRespect \\u2013 We value every individual, embracing diversity and treating everyone with fairness and dignity. <br>\\n\\nSustainability \\u2013 We are committed to creating long-term solutions that empower communities and protect future generations.\",\"cardDescKh3\":\"\\u1780\\u17b6\\u179a\\u17a2\\u17b6\\u178e\\u17b7\\u178f\\u17a2\\u17b6\\u179f\\u17bc\\u179a - \\u1799\\u17be\\u1784\\u1799\\u1780\\u1785\\u17b7\\u178f\\u17d2\\u178f\\u1791\\u17bb\\u1780\\u178a\\u17b6\\u1780\\u17cb\\u1799\\u17c9\\u17b6\\u1784\\u1781\\u17d2\\u179b\\u17b6\\u17c6\\u1784\\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1798\\u1793\\u17bb\\u179f\\u17d2\\u179f\\u17a0\\u17be\\u1799\\u1794\\u17d2\\u179a\\u1796\\u17d2\\u179a\\u17b9\\u178f\\u17d2\\u178f\\u178a\\u17c4\\u1799\\u179f\\u1794\\u17d2\\u1794\\u17bb\\u179a\\u179f\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1793\\u17b6\\u17c6\\u1798\\u1780\\u1793\\u17bc\\u179c\\u1780\\u17d2\\u178f\\u17b8\\u179f\\u1784\\u17d2\\u1783\\u17b9\\u1798\\u1793\\u17b7\\u1784\\u179f\\u17c1\\u1785\\u1780\\u17d2\\u178f\\u17b8\\u1790\\u17d2\\u179b\\u17c3\\u1790\\u17d2\\u1793\\u17bc\\u179a\\u178a\\u179b\\u17cb\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u1787\\u17b8\\u179c\\u17b7\\u178f\\u178a\\u17c2\\u179b\\u1799\\u17be\\u1784\\u1794\\u17c9\\u17c7\\u17d4\\n\\n\\u179f\\u17bb\\u1785\\u179a\\u17b7\\u178f\\u1797\\u17b6\\u1796 - \\u1799\\u17be\\u1784\\u1794\\u17d2\\u179a\\u1780\\u17b6\\u1793\\u17cb\\u1781\\u17d2\\u1787\\u17b6\\u1794\\u17cb\\u1793\\u17bc\\u179c\\u1797\\u17b6\\u1796\\u179f\\u17d2\\u1798\\u17c4\\u17c7\\u178f\\u17d2\\u179a\\u1784\\u17cb \\u178f\\u1798\\u17d2\\u179b\\u17b6\\u1797\\u17b6\\u1796 \\u1793\\u17b7\\u1784\\u1782\\u178e\\u1793\\u17c1\\u1799\\u17d2\\u1799\\u1797\\u17b6\\u1796\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u179a\\u17b6\\u179b\\u17cb\\u179f\\u1780\\u1798\\u17d2\\u1798\\u1797\\u17b6\\u1796 \\u1793\\u17b7\\u1784\\u1797\\u17b6\\u1796\\u1787\\u17b6\\u178a\\u17c3\\u1782\\u17bc\\u179a\\u1794\\u179f\\u17cb\\u1799\\u17be\\u1784\\u17d4 <br>\\n\\n\\u1780\\u17b7\\u1785\\u17d2\\u1785\\u179f\\u17a0\\u1780\\u17b6\\u179a \\u2013 \\u1799\\u17be\\u1784\\u1787\\u17bf\\u1787\\u17b6\\u1780\\u17cb\\u179b\\u17be\\u1790\\u17b6\\u1798\\u1796\\u179b\\u1793\\u17c3\\u1780\\u17b6\\u179a\\u1792\\u17d2\\u179c\\u17be\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1782\\u17d2\\u1793\\u17b6\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd \\u178a\\u17c3\\u1782\\u17bc \\u1793\\u17b7\\u1784\\u17a2\\u17d2\\u1793\\u1780\\u179f\\u17d2\\u1798\\u17d0\\u1782\\u17d2\\u179a\\u1785\\u17b7\\u178f\\u17d2\\u178f \\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u179f\\u1798\\u17d2\\u179a\\u17c1\\u1785\\u1794\\u17b6\\u1793\\u1793\\u17bc\\u179c\\u1795\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u1799\\u17bc\\u179a\\u17a2\\u1784\\u17d2\\u179c\\u17c2\\u1784\\u17d4<br>\\n\\n\\u1780\\u17b6\\u179a\\u1782\\u17c4\\u179a\\u1796 - \\u1799\\u17be\\u1784\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u178f\\u1798\\u17d2\\u179b\\u17c3\\u178a\\u179b\\u17cb\\u1794\\u17bb\\u1782\\u17d2\\u1782\\u179b\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u179a\\u17bc\\u1794 \\u178a\\u17c4\\u1799\\u17b1\\u1794\\u1780\\u17d2\\u179a\\u179f\\u17c4\\u1794\\u1797\\u17b6\\u1796\\u1785\\u1798\\u17d2\\u179a\\u17bb\\u17c7 \\u1793\\u17b7\\u1784\\u1794\\u17d2\\u179a\\u1796\\u17d2\\u179a\\u17b9\\u178f\\u17d2\\u178f\\u17b7\\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1798\\u1793\\u17bb\\u179f\\u17d2\\u179f\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u179a\\u17bc\\u1794\\u178a\\u17c4\\u1799\\u1799\\u17bb\\u178f\\u17d2\\u178f\\u17b7\\u1792\\u1798\\u17cc \\u1793\\u17b7\\u1784\\u179f\\u17c1\\u1785\\u1780\\u17d2\\u178f\\u17b8\\u1790\\u17d2\\u179b\\u17c3\\u1790\\u17d2\\u1793\\u17bc\\u179a\\u17d4 <br>\\n\\n\\u1793\\u17b7\\u179a\\u1793\\u17d2\\u178f\\u179a\\u1797\\u17b6\\u1796 - \\u1799\\u17be\\u1784\\u1794\\u17d2\\u178f\\u17c1\\u1787\\u17d2\\u1789\\u17b6\\u1794\\u1784\\u17d2\\u1780\\u17be\\u178f\\u178a\\u17c6\\u178e\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17b6\\u1799\\u179a\\u1799\\u17c8\\u1796\\u17c1\\u179b\\u179c\\u17c2\\u1784\\u178a\\u17c2\\u179b\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u17a2\\u17c6\\u178e\\u17b6\\u1785\\u178a\\u179b\\u17cb\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd \\u1793\\u17b7\\u1784\\u1780\\u17b6\\u179a\\u1796\\u17b6\\u179a\\u1798\\u1793\\u17bb\\u179f\\u17d2\\u179f\\u1787\\u17c6\\u1793\\u17b6\\u1793\\u17cb\\u1780\\u17d2\\u179a\\u17c4\\u1799\\u17d4\",\"cardDescCh3\":\"\",\"cardIcon3\":\"far fa-gem \\u2022 Collaboration: Engaging with local and global partners amplifies our impact and fosters unity in purpose.\",\"bannerDesc\":\"Join the community to give education for children\",\"bannerDescKh\":\"\\u1785\\u17bc\\u179b\\u179a\\u17bd\\u1798\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u1780\\u17b6\\u179a\\u17a2\\u1794\\u17cb\\u179a\\u17c6\\u178a\\u179b\\u17cb\\u1780\\u17bb\\u1798\\u17b6\\u179a\",\"bannerDescCh\":\"\",\"bannerLabel\":\"Join Us\",\"bannerLabelKh\":\"\\u179f\\u17d2\\u179c\\u17c2\\u1784\\u1799\\u179b\\u17cb\\u1794\\u1793\\u17d2\\u1790\\u17c2\\u1798\",\"bannerLabelCh\":\"\",\"bannerLinkTo\":\"https:\\/\\/demo.cdafund.org\\/donors\\/\",\"thumbnail\":\"\\/site-setting\\/CamGoTech_DvfPKmKkxpClBB8lVYHIcIDaZUtloFDqNpFPYZ5g.jpg\",\"totalDonation\":\"1000\",\"projectClosed\":\"10\",\"happyPeople\":\"100000\",\"ourVolunteer\":\"200\",\"professionalVolunteer\":\"Meet the best team behind our success story\",\"professionalVolunteerKh\":\"\\u1787\\u17bd\\u1794\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u179b\\u17d2\\u17a2\\u1794\\u17c6\\u1795\\u17bb\\u178f\\u1793\\u17c5\\u1796\\u17b8\\u1780\\u17d2\\u179a\\u17c4\\u1799\\u179a\\u17bf\\u1784\\u1787\\u17c4\\u1782\\u1787\\u17d0\\u1799\\u179a\\u1794\\u179f\\u17cb\\u1799\\u17be\\u1784\",\"professionalVolunteerCh\":\"\",\"ourDonors\":\"We help each other to make our society grow\",\"ourDonorsKh\":\"\\u1799\\u17be\\u1784\\u1787\\u17bd\\u1799\\u1782\\u17d2\\u1793\\u17b6\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u17a2\\u17c4\\u1799\\u179f\\u1784\\u17d2\\u1782\\u1798\\u1799\\u17be\\u1784\\u179a\\u17b8\\u1780\\u1785\\u1798\\u17d2\\u179a\\u17be\\u1793\",\"ourDonorsCh\":\"\",\"thumbnailFive\":\"\\/site-setting\\/CamGoTech_Cl7thXexLZBLZzLAUJ500gDGkaJs5vnPz8RAqARv.jpg\"}', '2024-08-02 15:54:51', '2025-11-01 08:45:01');
INSERT INTO `site_settings` (`id`, `type`, `content`, `created_at`, `updated_at`) VALUES
(4, 'TERM_SERVICE', '{\"description\":\"<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Terms of Service for Donation-Based Crowdfunding<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Introduction<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">The Children Development Association (CDA) recognizes the potential and value of donation-based crowdfunding as a mechanism to support various causes and initiatives. This document defines our organization\'s policies related to the solicitation, management, and use of funds obtained through donation-based crowdfunding platforms. By ensuring that all crowdfunding activities are in line with our association&rsquo;s values, objectives, and legal requirements, we aim to preserve and enhance our integrity and public image.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;<\\/span>Policy Statement<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">CDA is committed to participating in donation-based crowdfunding efforts that:<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">- Benefit the community and further our mission.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">- Promote sustainable environmental, social, and economic development.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">- Align with our core values and ethical standards.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">These activities must be conducted responsibly and transparently to maintain CDA\'s reputation and meet all applicable legal and financial obligations.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;<\\/span>Terms and Conditions<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;<\\/span>1. Use of Funds<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">All funds acquired through crowdfunding platforms must be utilized strictly for the purposes outlined in the specific campaign descriptions. Misuse of funds may result in the following actions:<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">- Return of the funds to the donors.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">- Legal action against involved parties.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">- Revocation of membership or affiliation with CDA.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">CDA holds the right to conduct inquiries or audits concerning the allocation and usage of crowdfunded resources to verify compliance.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;<\\/span>2. Record Keeping<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">It is required that:<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoListParagraphCxSpFirst\\\" style=\\\"mso-add-space: auto; text-align: justify; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1; margin: 0in 0in .0001pt .25in;\\\"><!-- [if !supportLists]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Accurate and detailed records of the expenditure of crowdfunded amounts are maintained.<\\/span><\\/p>\\n<p class=\\\"MsoListParagraphCxSpMiddle\\\" style=\\\"mso-add-space: auto; text-align: justify; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1; margin: 0in 0in .0001pt .25in;\\\"><!-- [if !supportLists]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Records are kept transparent and are readily available for auditing by authorized CDA personnel or external auditors.<\\/span><\\/p>\\n<p class=\\\"MsoListParagraphCxSpLast\\\" style=\\\"mso-add-space: auto; text-align: justify; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1; margin: 0in 0in .0001pt .25in;\\\"><!-- [if !supportLists]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Financial reporting guidelines provided by CDA and pertinent regulatory bodies are adhered to meticulously.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;<\\/span>3. Transparency and Reporting<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">CDA pledges to maintain high levels of transparency about how funds are spent. We will provide regular updates to our donors and the public through our website and official communications.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;<\\/span>4. Amendments to the Policy<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">CDA reserves the right to amend this Donation-Based Crowdfunding Policy at any time to reflect changes in legal, operational, or organizational requirements. Amendments will take effect immediately after they are posted on our official communication channels, including our website.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoListParagraphCxSpFirst\\\" style=\\\"mso-add-space: auto; text-align: justify; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1; margin: 0in 0in .0001pt .25in;\\\"><!-- [if !supportLists]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">All involved members and partners are expected to review policy updates regularly.<\\/span><\\/p>\\n<p class=\\\"MsoListParagraphCxSpLast\\\" style=\\\"mso-add-space: auto; text-align: justify; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1; margin: 0in 0in .0001pt .25in;\\\"><!-- [if !supportLists]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Continued participation in crowdfunding activities following such amendments constitutes acceptance of the new terms.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;<\\/span>5. Compliance and Enforcement<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoListParagraphCxSpFirst\\\" style=\\\"mso-add-space: auto; text-align: justify; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1; margin: 0in 0in .0001pt .25in;\\\"><!-- [if !supportLists]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">CDA will enforce this policy rigorously and take appropriate measures against any member, employee, or partner found to be in violation.<\\/span><\\/p>\\n<p class=\\\"MsoListParagraphCxSpLast\\\" style=\\\"mso-add-space: auto; text-align: justify; text-indent: -.25in; line-height: normal; mso-list: l0 level1 lfo1; margin: 0in 0in .0001pt .25in;\\\"><!-- [if !supportLists]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: Symbol; mso-fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-list: Ignore;\\\">&middot;<span style=\\\"font: 7.0pt \'Times New Roman\';\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><\\/span><!--[endif]--><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Violations of this policy may result in disciplinary actions including, but not limited to, termination of employment, partnership, or membership, as well as legal proceedings if necessary.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;<\\/span>Conclusion<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">By partaking in our donation-based crowdfunding initiatives, you agree to adhere to the terms outlined in this policy. Your support is crucial for achieving our goals and impacting the community positively. We thank you for your trust and collaboration in creating impactful change through crowdfunding.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">For further information or questions regarding this policy, please contact us through the information provided on our website at http:\\/\\/www.cdafund.org<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Policy Version: 1.0<span style=\\\"mso-spacerun: yes;\\\">&nbsp; <\\/span><\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Last Reviewed: 23 August 2024 <\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">&nbsp;<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"text-align: justify;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; line-height: 107%; font-family: \'Book Antiqua\',serif;\\\">&nbsp;<\\/span><\\/p>\",\"descriptionKh\":\"\",\"descriptionCh\":\"<p data-start=\\\"81\\\" data-end=\\\"96\\\"><strong data-start=\\\"81\\\" data-end=\\\"96\\\">\\u57fa\\u4e8e\\u6350\\u8d60\\u7684\\u4f17\\u7b79\\u670d\\u52a1\\u6761\\u6b3e<\\/strong><\\/p>\\n<p data-start=\\\"98\\\" data-end=\\\"106\\\"><strong data-start=\\\"98\\\" data-end=\\\"106\\\">\\u4e00\\u3001\\u7b80\\u4ecb<\\/strong><\\/p>\\n<p data-start=\\\"108\\\" data-end=\\\"230\\\">\\u513f\\u7ae5\\u53d1\\u5c55\\u534f\\u4f1a\\uff08CDA\\uff09\\u8ba4\\u8bc6\\u5230\\u57fa\\u4e8e\\u6350\\u8d60\\u7684\\u4f17\\u7b79\\u4f5c\\u4e3a\\u652f\\u6301\\u5404\\u7c7b\\u516c\\u76ca\\u9879\\u76ee\\u548c\\u5021\\u8bae\\u7684\\u91cd\\u8981\\u6f5c\\u529b\\u4e0e\\u4ef7\\u503c\\u3002\\u672c\\u6587\\u4ef6\\u65e8\\u5728\\u660e\\u786e\\u672c\\u534f\\u4f1a\\u5728\\u901a\\u8fc7\\u4f17\\u7b79\\u5e73\\u53f0\\u52df\\u96c6\\u3001\\u7ba1\\u7406\\u548c\\u4f7f\\u7528\\u8d44\\u91d1\\u65b9\\u9762\\u7684\\u653f\\u7b56\\u3002\\u901a\\u8fc7\\u786e\\u4fdd\\u6240\\u6709\\u4f17\\u7b79\\u6d3b\\u52a8\\u7b26\\u5408\\u534f\\u4f1a\\u7684\\u4ef7\\u503c\\u89c2\\u3001\\u76ee\\u6807\\u548c\\u6cd5\\u5f8b\\u8981\\u6c42\\uff0c\\u6211\\u4eec\\u5c06\\u7ef4\\u62a4\\u5e76\\u63d0\\u5347\\u534f\\u4f1a\\u7684\\u8bda\\u4fe1\\u4e0e\\u516c\\u4f17\\u5f62\\u8c61\\u3002<\\/p>\\n<hr data-start=\\\"232\\\" data-end=\\\"235\\\">\\n<p data-start=\\\"237\\\" data-end=\\\"247\\\"><strong data-start=\\\"237\\\" data-end=\\\"247\\\">\\u4e8c\\u3001\\u653f\\u7b56\\u58f0\\u660e<\\/strong><\\/p>\\n<p data-start=\\\"249\\\" data-end=\\\"274\\\">CDA\\u81f4\\u529b\\u4e8e\\u5f00\\u5c55\\u4ee5\\u4e0b\\u7b26\\u5408\\u8981\\u6c42\\u7684\\u57fa\\u4e8e\\u6350\\u8d60\\u7684\\u4f17\\u7b79\\u6d3b\\u52a8\\uff1a<\\/p>\\n<ul data-start=\\\"276\\\" data-end=\\\"336\\\">\\n<li data-start=\\\"276\\\" data-end=\\\"294\\\">\\n<p data-start=\\\"278\\\" data-end=\\\"294\\\">\\u6709\\u76ca\\u4e8e\\u793e\\u533a\\u5e76\\u63a8\\u52a8\\u6211\\u4eec\\u4f7f\\u547d\\u7684\\u5b9e\\u73b0\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"295\\\" data-end=\\\"314\\\">\\n<p data-start=\\\"297\\\" data-end=\\\"314\\\">\\u4fc3\\u8fdb\\u53ef\\u6301\\u7eed\\u7684\\u73af\\u5883\\u3001\\u793e\\u4f1a\\u548c\\u7ecf\\u6d4e\\u53d1\\u5c55\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"315\\\" data-end=\\\"336\\\">\\n<p data-start=\\\"317\\\" data-end=\\\"336\\\">\\u4e0e\\u6211\\u4eec\\u7684\\u6838\\u5fc3\\u4ef7\\u503c\\u89c2\\u548c\\u9053\\u5fb7\\u6807\\u51c6\\u4fdd\\u6301\\u4e00\\u81f4\\u3002<\\/p>\\n<\\/li>\\n<\\/ul>\\n<p data-start=\\\"338\\\" data-end=\\\"384\\\">\\u6240\\u6709\\u4f17\\u7b79\\u6d3b\\u52a8\\u5fc5\\u987b\\u4ee5\\u8d1f\\u8d23\\u4efb\\u548c\\u900f\\u660e\\u7684\\u65b9\\u5f0f\\u8fdb\\u884c\\uff0c\\u4ee5\\u7ef4\\u62a4CDA\\u7684\\u58f0\\u8a89\\uff0c\\u5e76\\u786e\\u4fdd\\u9075\\u5b88\\u76f8\\u5173\\u6cd5\\u5f8b\\u548c\\u8d22\\u52a1\\u4e49\\u52a1\\u3002<\\/p>\\n<hr data-start=\\\"386\\\" data-end=\\\"389\\\">\\n<p data-start=\\\"391\\\" data-end=\\\"402\\\"><strong data-start=\\\"391\\\" data-end=\\\"402\\\">\\u4e09\\u3001\\u6761\\u6b3e\\u4e0e\\u6761\\u4ef6<\\/strong><\\/p>\\n<p data-start=\\\"404\\\" data-end=\\\"415\\\"><strong data-start=\\\"404\\\" data-end=\\\"415\\\">1. \\u8d44\\u91d1\\u4f7f\\u7528<\\/strong><\\/p>\\n<p data-start=\\\"417\\\" data-end=\\\"469\\\">\\u6240\\u6709\\u901a\\u8fc7\\u4f17\\u7b79\\u5e73\\u53f0\\u83b7\\u5f97\\u7684\\u8d44\\u91d1\\u5fc5\\u987b\\u4e25\\u683c\\u7528\\u4e8e\\u8be5\\u4f17\\u7b79\\u6d3b\\u52a8\\u63cf\\u8ff0\\u4e2d\\u6240\\u5217\\u660e\\u7684\\u7528\\u9014\\u3002\\u82e5\\u8d44\\u91d1\\u88ab\\u4e0d\\u5f53\\u4f7f\\u7528\\uff0c\\u53ef\\u80fd\\u5bfc\\u81f4\\u4ee5\\u4e0b\\u540e\\u679c\\uff1a<\\/p>\\n<ul data-start=\\\"471\\\" data-end=\\\"525\\\">\\n<li data-start=\\\"471\\\" data-end=\\\"482\\\">\\n<p data-start=\\\"473\\\" data-end=\\\"482\\\">\\u5411\\u6350\\u8d60\\u8005\\u9000\\u8fd8\\u8d44\\u91d1\\uff1b<\\/p>\\n<\\/li>\\n<li data-start=\\\"483\\\" data-end=\\\"498\\\">\\n<p data-start=\\\"485\\\" data-end=\\\"498\\\">\\u5bf9\\u76f8\\u5173\\u8d23\\u4efb\\u65b9\\u91c7\\u53d6\\u6cd5\\u5f8b\\u884c\\u52a8\\uff1b<\\/p>\\n<\\/li>\\n<li data-start=\\\"499\\\" data-end=\\\"525\\\">\\n<p data-start=\\\"501\\\" data-end=\\\"525\\\">\\u64a4\\u9500\\u76f8\\u5173\\u6210\\u5458\\u6216\\u5408\\u4f5c\\u65b9\\u7684CDA\\u4f1a\\u5458\\u8d44\\u683c\\u6216\\u5408\\u4f5c\\u5173\\u7cfb\\u3002<\\/p>\\n<\\/li>\\n<\\/ul>\\n<p data-start=\\\"527\\\" data-end=\\\"562\\\">CDA\\u4fdd\\u7559\\u5bf9\\u4f17\\u7b79\\u8d44\\u91d1\\u5206\\u914d\\u4e0e\\u4f7f\\u7528\\u60c5\\u51b5\\u8fdb\\u884c\\u8c03\\u67e5\\u6216\\u5ba1\\u8ba1\\u7684\\u6743\\u5229\\uff0c\\u4ee5\\u786e\\u4fdd\\u5408\\u89c4\\u6027\\u3002<\\/p>\\n<hr data-start=\\\"564\\\" data-end=\\\"567\\\">\\n<p data-start=\\\"569\\\" data-end=\\\"580\\\"><strong data-start=\\\"569\\\" data-end=\\\"580\\\">2. \\u8bb0\\u5f55\\u7ba1\\u7406<\\/strong><\\/p>\\n<p data-start=\\\"582\\\" data-end=\\\"586\\\">\\u987b\\u505a\\u5230\\uff1a<\\/p>\\n<ul data-start=\\\"588\\\" data-end=\\\"665\\\">\\n<li data-start=\\\"588\\\" data-end=\\\"604\\\">\\n<p data-start=\\\"590\\\" data-end=\\\"604\\\">\\u7cbe\\u786e\\u8bb0\\u5f55\\u4f17\\u7b79\\u8d44\\u91d1\\u7684\\u652f\\u51fa\\u60c5\\u51b5\\uff1b<\\/p>\\n<\\/li>\\n<li data-start=\\\"605\\\" data-end=\\\"640\\\">\\n<p data-start=\\\"607\\\" data-end=\\\"640\\\">\\u4fdd\\u6301\\u8d22\\u52a1\\u8bb0\\u5f55\\u900f\\u660e\\uff0c\\u5e76\\u53ef\\u968f\\u65f6\\u63d0\\u4f9b\\u7ed9CDA\\u6388\\u6743\\u4eba\\u5458\\u6216\\u5916\\u90e8\\u5ba1\\u8ba1\\u5355\\u4f4d\\u67e5\\u9605\\uff1b<\\/p>\\n<\\/li>\\n<li data-start=\\\"641\\\" data-end=\\\"665\\\">\\n<p data-start=\\\"643\\\" data-end=\\\"665\\\">\\u4e25\\u683c\\u9075\\u5b88CDA\\u53ca\\u76f8\\u5173\\u76d1\\u7ba1\\u673a\\u6784\\u7684\\u8d22\\u52a1\\u62a5\\u544a\\u8981\\u6c42\\u3002<\\/p>\\n<\\/li>\\n<\\/ul>\\n<hr data-start=\\\"667\\\" data-end=\\\"670\\\">\\n<p data-start=\\\"672\\\" data-end=\\\"685\\\"><strong data-start=\\\"672\\\" data-end=\\\"685\\\">3. \\u900f\\u660e\\u5ea6\\u4e0e\\u62a5\\u544a<\\/strong><\\/p>\\n<p data-start=\\\"687\\\" data-end=\\\"746\\\">CDA\\u627f\\u8bfa\\u4fdd\\u6301\\u8d44\\u91d1\\u4f7f\\u7528\\u7684\\u9ad8\\u5ea6\\u900f\\u660e\\u5ea6\\u3002\\u6211\\u4eec\\u5c06\\u901a\\u8fc7\\u5b98\\u65b9\\u7f51\\u7ad9\\u53ca\\u5176\\u4ed6\\u6b63\\u5f0f\\u6c9f\\u901a\\u6e20\\u9053\\u5b9a\\u671f\\u5411\\u6350\\u8d60\\u8005\\u4e0e\\u516c\\u4f17\\u6c47\\u62a5\\u8d44\\u91d1\\u4f7f\\u7528\\u60c5\\u51b5\\u548c\\u9879\\u76ee\\u8fdb\\u5c55\\u3002<\\/p>\\n<hr data-start=\\\"748\\\" data-end=\\\"751\\\">\\n<p data-start=\\\"753\\\" data-end=\\\"764\\\"><strong data-start=\\\"753\\\" data-end=\\\"764\\\">4. \\u653f\\u7b56\\u4fee\\u8ba2<\\/strong><\\/p>\\n<p data-start=\\\"766\\\" data-end=\\\"837\\\">CDA\\u4fdd\\u7559\\u968f\\u65f6\\u4fee\\u8ba2\\u672c\\u57fa\\u4e8e\\u6350\\u8d60\\u4f17\\u7b79\\u653f\\u7b56\\u7684\\u6743\\u5229\\uff0c\\u4ee5\\u9002\\u5e94\\u6cd5\\u5f8b\\u3001\\u8fd0\\u8425\\u6216\\u7ec4\\u7ec7\\u65b9\\u9762\\u7684\\u53d8\\u5316\\u3002\\u653f\\u7b56\\u66f4\\u65b0\\u4e00\\u7ecf\\u53d1\\u5e03\\uff0c\\u5373\\u523b\\u751f\\u6548\\uff0c\\u5e76\\u5c06\\u901a\\u8fc7\\u5b98\\u65b9\\u7f51\\u7ad9\\u53ca\\u5176\\u4ed6\\u6b63\\u5f0f\\u6e20\\u9053\\u516c\\u5e03\\u3002<\\/p>\\n<ul data-start=\\\"839\\\" data-end=\\\"896\\\">\\n<li data-start=\\\"839\\\" data-end=\\\"867\\\">\\n<p data-start=\\\"841\\\" data-end=\\\"867\\\">\\u6240\\u6709\\u6d89\\u53ca\\u4f17\\u7b79\\u6d3b\\u52a8\\u7684\\u6210\\u5458\\u4e0e\\u5408\\u4f5c\\u4f19\\u4f34\\u5e94\\u5b9a\\u671f\\u67e5\\u9605\\u653f\\u7b56\\u66f4\\u65b0\\uff1b<\\/p>\\n<\\/li>\\n<li data-start=\\\"868\\\" data-end=\\\"896\\\">\\n<p data-start=\\\"870\\\" data-end=\\\"896\\\">\\u5728\\u653f\\u7b56\\u66f4\\u65b0\\u540e\\u7ee7\\u7eed\\u53c2\\u4e0e\\u4f17\\u7b79\\u6d3b\\u52a8\\uff0c\\u89c6\\u4e3a\\u63a5\\u53d7\\u66f4\\u65b0\\u540e\\u7684\\u6761\\u6b3e\\u3002<\\/p>\\n<\\/li>\\n<\\/ul>\\n<hr data-start=\\\"898\\\" data-end=\\\"901\\\">\\n<p data-start=\\\"903\\\" data-end=\\\"915\\\"><strong data-start=\\\"903\\\" data-end=\\\"915\\\">5. \\u5408\\u89c4\\u4e0e\\u6267\\u884c<\\/strong><\\/p>\\n<ul data-start=\\\"917\\\" data-end=\\\"1005\\\">\\n<li data-start=\\\"917\\\" data-end=\\\"957\\\">\\n<p data-start=\\\"919\\\" data-end=\\\"957\\\">CDA\\u5c06\\u4e25\\u683c\\u6267\\u884c\\u672c\\u653f\\u7b56\\uff0c\\u5e76\\u5bf9\\u4efb\\u4f55\\u8fdd\\u53cd\\u653f\\u7b56\\u7684\\u6210\\u5458\\u3001\\u5458\\u5de5\\u6216\\u5408\\u4f5c\\u4f19\\u4f34\\u91c7\\u53d6\\u76f8\\u5e94\\u63aa\\u65bd\\uff1b<\\/p>\\n<\\/li>\\n<li data-start=\\\"958\\\" data-end=\\\"1005\\\">\\n<p data-start=\\\"960\\\" data-end=\\\"1005\\\">\\u8fdd\\u53cd\\u672c\\u653f\\u7b56\\u8005\\u53ef\\u80fd\\u9762\\u4e34\\u7eaa\\u5f8b\\u5904\\u5206\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u89e3\\u9664\\u96c7\\u4f63\\u3001\\u5408\\u4f5c\\u6216\\u4f1a\\u5458\\u8d44\\u683c\\uff0c\\u4ee5\\u53ca\\u5fc5\\u8981\\u65f6\\u7684\\u6cd5\\u5f8b\\u8bc9\\u8bbc\\u3002<\\/p>\\n<\\/li>\\n<\\/ul>\\n<hr data-start=\\\"1007\\\" data-end=\\\"1010\\\">\\n<p data-start=\\\"1012\\\" data-end=\\\"1018\\\"><strong data-start=\\\"1012\\\" data-end=\\\"1018\\\">\\u7ed3\\u8bed<\\/strong><\\/p>\\n<p data-start=\\\"1020\\\" data-end=\\\"1091\\\">\\u901a\\u8fc7\\u53c2\\u4e0eCDA\\u7684\\u6350\\u8d60\\u578b\\u4f17\\u7b79\\u9879\\u76ee\\uff0c\\u60a8\\u5373\\u8868\\u793a\\u540c\\u610f\\u9075\\u5b88\\u672c\\u653f\\u7b56\\u4e2d\\u7684\\u6240\\u6709\\u6761\\u6b3e\\u3002\\u6211\\u4eec\\u611f\\u8c22\\u60a8\\u7684\\u652f\\u6301\\u4e0e\\u4fe1\\u4efb\\uff0c\\u5e76\\u671f\\u5f85\\u4e0e\\u60a8\\u643a\\u624b\\uff0c\\u901a\\u8fc7\\u4f17\\u7b79\\u5b9e\\u73b0\\u79ef\\u6781\\u800c\\u6df1\\u8fdc\\u7684\\u793e\\u4f1a\\u5f71\\u54cd\\u3002<\\/p>\\n<p data-start=\\\"1093\\\" data-end=\\\"1137\\\">\\u5982\\u9700\\u66f4\\u591a\\u4fe1\\u606f\\u6216\\u6709\\u4efb\\u4f55\\u7591\\u95ee\\uff0c\\u8bf7\\u8bbf\\u95ee\\u6211\\u4eec\\u7684\\u7f51\\u7ad9\\uff1a<a class=\\\"decorated-link\\\" href=\\\"http:\\/\\/www.cdafund.org\\\" target=\\\"_new\\\" rel=\\\"noopener\\\" data-start=\\\"1115\\\" data-end=\\\"1137\\\">http:\\/\\/www.cdafund.org<\\/a><\\/p>\\n<p data-start=\\\"1139\\\" data-end=\\\"1167\\\">\\u653f\\u7b56\\u7248\\u672c\\uff1a1.0<br data-start=\\\"1147\\\" data-end=\\\"1150\\\">\\u6700\\u540e\\u5ba1\\u6838\\u65e5\\u671f\\uff1a2024\\u5e748\\u670823\\u65e5<\\/p>\"}', '2024-08-23 15:32:03', '2025-10-30 09:02:26');
INSERT INTO `site_settings` (`id`, `type`, `content`, `created_at`, `updated_at`) VALUES
(5, 'PRIVACY_POLICY', '{\"description\":\"<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Privacy Policy of the Children Development Association (CDA)<\\/span><\\/strong><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Introduction<\\/span><\\/strong><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">The Children Development Association (CDA) recognizes the importance of privacy and is committed to protecting the personal information of our donors, members, and visitors to our crowdfunding platforms. This Privacy Policy outlines how we collect, use, store, and disclose the information gathered through our donation-based crowdfunding activities as part of our efforts to advance our mission in community support, environmental sustainability, and social and economic development.<\\/span><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Collection of Information<\\/span><\\/strong><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">1. Types of Information Collected:<\\/span><\\/strong><\\/p>\\n<ul style=\\\"margin-top: 0in;\\\" type=\\\"disc\\\">\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l2 level1 lfo1; tab-stops: list .5in;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Personal Information:<\\/span><\\/strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"> This may include, but is not limited to, your name, address, email address, telephone number, and payment details that you voluntarily provide when participating in our crowdfunding initiatives.<\\/span><\\/li>\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l2 level1 lfo1; tab-stops: list .5in;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Usage and Technical Data:<\\/span><\\/strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"> When you visit our website, we may collect information about your device and usage of our site, including your IP address, browser type, device type, pages viewed, and other similar information to improve our services and website experience.<\\/span><\\/li>\\n<\\/ul>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Use of Information<\\/span><\\/strong><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">2. How We Use Your Information:<\\/span><\\/strong><\\/p>\\n<ul style=\\\"margin-top: 0in;\\\" type=\\\"disc\\\">\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l1 level1 lfo2; tab-stops: list .5in;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">To Process Donations:<\\/span><\\/strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"> Information collected is primarily used to process and manage donations, acknowledge contributions, and maintain a record of fundraising activities.<\\/span><\\/li>\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l1 level1 lfo2; tab-stops: list .5in;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">To Communicate:<\\/span><\\/strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"> We use your contact information to communicate with you about your donations, our campaigns, and other association-related news that might interest you.<\\/span><\\/li>\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l1 level1 lfo2; tab-stops: list .5in;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">For Reporting:<\\/span><\\/strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"> We aggregate information to generate reports about our fundraising activities which are necessary for both internal analyses and regulatory compliance.<\\/span><\\/li>\\n<\\/ul>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Disclosure of Information<\\/span><\\/strong><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">3. Sharing of Information:<\\/span><\\/strong><\\/p>\\n<ul style=\\\"margin-top: 0in;\\\" type=\\\"disc\\\">\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l3 level1 lfo3; tab-stops: list .5in;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Internal Use:<\\/span><\\/strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"> Information may be shared internally to manage activities and ensure a high standard of operation across CDA.<\\/span><\\/li>\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l3 level1 lfo3; tab-stops: list .5in;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Third Parties:<\\/span><\\/strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"> We may share information with service providers and other third parties who process data on our behalf, such as payment processors and software service providers, under strict confidentiality agreements.<\\/span><\\/li>\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l3 level1 lfo3; tab-stops: list .5in;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Legal Obligations:<\\/span><\\/strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\"> We may disclose information where required by law or to comply with valid legal processes such as a court order, legal process, or regulatory authorities.<\\/span><\\/li>\\n<\\/ul>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Data Security<\\/span><\\/strong><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">4. Protecting Your Information:<\\/span><\\/strong><\\/p>\\n<ul style=\\\"margin-top: 0in;\\\" type=\\\"disc\\\">\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l5 level1 lfo4; tab-stops: list .5in;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">We take robust security measures to protect the information under our control from unauthorized access, alteration, disclosure, or destruction.<\\/span><\\/li>\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l5 level1 lfo4; tab-stops: list .5in;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Our security protocols include secure servers, firewall technology, and encrypted data transmissions.<\\/span><\\/li>\\n<\\/ul>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Your Rights and Choices<\\/span><\\/strong><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">5. Accessing and Updating Your Information:<\\/span><\\/strong><\\/p>\\n<ul style=\\\"margin-top: 0in;\\\" type=\\\"disc\\\">\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l4 level1 lfo5; tab-stops: list .5in;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">You have the right to request access to the personal information we hold about you and to ask for corrections, updates, or deletions of this information.<\\/span><\\/li>\\n<\\/ul>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">6. Opt-Out Options:<\\/span><\\/strong><\\/p>\\n<ul style=\\\"margin-top: 0in;\\\" type=\\\"disc\\\">\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l0 level1 lfo6; tab-stops: list .5in;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">You may choose not to receive marketing communications from us by following the unsubscribe instructions included in these emails or by contacting us directly.<\\/span><\\/li>\\n<\\/ul>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">Amendments to the Privacy Policy<\\/span><\\/strong><\\/p>\\n<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal;\\\"><strong><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">7. Changes to This Policy:<\\/span><\\/strong><\\/p>\\n<ul style=\\\"margin-top: 0in;\\\" type=\\\"disc\\\">\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l6 level1 lfo7; tab-stops: list .5in;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">CDA reserves the right to update this Privacy Policy to reflect changes in our practices or relevant laws. The revised policy will be posted on our website along with an updated effective date.<\\/span><\\/li>\\n<li class=\\\"MsoNormal\\\" style=\\\"margin-bottom: .0001pt; text-align: justify; line-height: normal; mso-list: l6 level1 lfo7; tab-stops: list .5in;\\\"><span style=\\\"mso-bidi-font-size: 11.0pt; font-family: \'Book Antiqua\',serif; mso-fareast-font-family: \'Times New Roman\'; mso-bidi-font-family: \'Times New Roman\'; mso-bidi-language: AR-SA;\\\">We encourage you to review this policy periodically to stay informed about how we are protecting your information<\\/span><\\/li>\\n<\\/ul>\",\"descriptionKh\":\"\",\"descriptionCh\":\"<p data-start=\\\"87\\\" data-end=\\\"106\\\"><strong data-start=\\\"87\\\" data-end=\\\"106\\\">\\u513f\\u7ae5\\u53d1\\u5c55\\u534f\\u4f1a\\uff08CDA\\uff09\\u9690\\u79c1\\u653f\\u7b56<\\/strong><\\/p>\\n<p data-start=\\\"108\\\" data-end=\\\"116\\\"><strong data-start=\\\"108\\\" data-end=\\\"116\\\">\\u4e00\\u3001\\u7b80\\u4ecb<\\/strong><\\/p>\\n<p data-start=\\\"118\\\" data-end=\\\"243\\\">\\u513f\\u7ae5\\u53d1\\u5c55\\u534f\\u4f1a\\uff08CDA\\uff09\\u9ad8\\u5ea6\\u91cd\\u89c6\\u9690\\u79c1\\u6743\\uff0c\\u5e76\\u81f4\\u529b\\u4e8e\\u4fdd\\u62a4\\u6350\\u8d60\\u8005\\u3001\\u4f1a\\u5458\\u53ca\\u8bbf\\u95ee\\u6211\\u4eec\\u4f17\\u7b79\\u5e73\\u53f0\\u7684\\u8bbf\\u5ba2\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u3002\\u672c\\u9690\\u79c1\\u653f\\u7b56\\u65e8\\u5728\\u8bf4\\u660e\\u6211\\u4eec\\u5728\\u5f00\\u5c55\\u57fa\\u4e8e\\u6350\\u8d60\\u7684\\u4f17\\u7b79\\u6d3b\\u52a8\\u4e2d\\uff0c\\u5982\\u4f55\\u6536\\u96c6\\u3001\\u4f7f\\u7528\\u3001\\u5b58\\u50a8\\u53ca\\u62ab\\u9732\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u4ee5\\u652f\\u6301\\u6211\\u4eec\\u5728\\u793e\\u533a\\u63f4\\u52a9\\u3001\\u73af\\u5883\\u53ef\\u6301\\u7eed\\u53d1\\u5c55\\u4ee5\\u53ca\\u793e\\u4f1a\\u548c\\u7ecf\\u6d4e\\u53d1\\u5c55\\u65b9\\u9762\\u7684\\u4f7f\\u547d\\u3002<\\/p>\\n<hr data-start=\\\"245\\\" data-end=\\\"248\\\">\\n<p data-start=\\\"250\\\" data-end=\\\"260\\\"><strong data-start=\\\"250\\\" data-end=\\\"260\\\">\\u4e8c\\u3001\\u4fe1\\u606f\\u6536\\u96c6<\\/strong><\\/p>\\n<p data-start=\\\"262\\\" data-end=\\\"277\\\"><strong data-start=\\\"262\\\" data-end=\\\"277\\\">1. \\u6536\\u96c6\\u7684\\u4fe1\\u606f\\u7c7b\\u578b\\uff1a<\\/strong><\\/p>\\n<ul data-start=\\\"279\\\" data-end=\\\"422\\\">\\n<li data-start=\\\"279\\\" data-end=\\\"332\\\">\\n<p data-start=\\\"281\\\" data-end=\\\"332\\\">**\\u4e2a\\u4eba\\u4fe1\\u606f\\uff1a**\\u5f53\\u60a8\\u53c2\\u4e0e\\u6211\\u4eec\\u7684\\u4f17\\u7b79\\u6d3b\\u52a8\\u65f6\\uff0c\\u53ef\\u80fd\\u4f1a\\u81ea\\u613f\\u63d0\\u4f9b\\u59d3\\u540d\\u3001\\u5730\\u5740\\u3001\\u7535\\u5b50\\u90ae\\u4ef6\\u3001\\u7535\\u8bdd\\u53f7\\u7801\\u53ca\\u652f\\u4ed8\\u4fe1\\u606f\\u7b49\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"333\\\" data-end=\\\"422\\\">\\n<p data-start=\\\"335\\\" data-end=\\\"422\\\">**\\u4f7f\\u7528\\u53ca\\u6280\\u672f\\u6570\\u636e\\uff1a**\\u5f53\\u60a8\\u8bbf\\u95ee\\u6211\\u4eec\\u7f51\\u7ad9\\u65f6\\uff0c\\u6211\\u4eec\\u53ef\\u80fd\\u4f1a\\u6536\\u96c6\\u6709\\u5173\\u60a8\\u8bbe\\u5907\\u53ca\\u7f51\\u7ad9\\u4f7f\\u7528\\u60c5\\u51b5\\u7684\\u4fe1\\u606f\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8eIP\\u5730\\u5740\\u3001\\u6d4f\\u89c8\\u5668\\u7c7b\\u578b\\u3001\\u8bbe\\u5907\\u578b\\u53f7\\u3001\\u8bbf\\u95ee\\u9875\\u9762\\u7b49\\uff0c\\u4ee5\\u6539\\u8fdb\\u6211\\u4eec\\u7684\\u670d\\u52a1\\u548c\\u7f51\\u7ad9\\u4f53\\u9a8c\\u3002<\\/p>\\n<\\/li>\\n<\\/ul>\\n<hr data-start=\\\"424\\\" data-end=\\\"427\\\">\\n<p data-start=\\\"429\\\" data-end=\\\"439\\\"><strong data-start=\\\"429\\\" data-end=\\\"439\\\">\\u4e09\\u3001\\u4fe1\\u606f\\u4f7f\\u7528<\\/strong><\\/p>\\n<p data-start=\\\"441\\\" data-end=\\\"459\\\"><strong data-start=\\\"441\\\" data-end=\\\"459\\\">2. \\u6211\\u4eec\\u5982\\u4f55\\u4f7f\\u7528\\u60a8\\u7684\\u4fe1\\u606f\\uff1a<\\/strong><\\/p>\\n<ul data-start=\\\"461\\\" data-end=\\\"592\\\">\\n<li data-start=\\\"461\\\" data-end=\\\"503\\\">\\n<p data-start=\\\"463\\\" data-end=\\\"503\\\">**\\u5904\\u7406\\u6350\\u8d60\\uff1a**\\u6240\\u6536\\u96c6\\u7684\\u4fe1\\u606f\\u4e3b\\u8981\\u7528\\u4e8e\\u5904\\u7406\\u548c\\u7ba1\\u7406\\u6350\\u6b3e\\uff0c\\u786e\\u8ba4\\u6350\\u8d60\\uff0c\\u5e76\\u8bb0\\u5f55\\u52df\\u6b3e\\u6d3b\\u52a8\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"504\\\" data-end=\\\"550\\\">\\n<p data-start=\\\"506\\\" data-end=\\\"550\\\">**\\u6c9f\\u901a\\u8054\\u7cfb\\uff1a**\\u6211\\u4eec\\u53ef\\u80fd\\u4f7f\\u7528\\u60a8\\u7684\\u8054\\u7cfb\\u65b9\\u5f0f\\u4e0e\\u60a8\\u6c9f\\u901a\\u6350\\u8d60\\u4e8b\\u5b9c\\u3001\\u6d3b\\u52a8\\u8fdb\\u5c55\\u53ca\\u4e0e\\u534f\\u4f1a\\u76f8\\u5173\\u7684\\u4fe1\\u606f\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"551\\\" data-end=\\\"592\\\">\\n<p data-start=\\\"553\\\" data-end=\\\"592\\\">**\\u7edf\\u8ba1\\u4e0e\\u62a5\\u544a\\uff1a**\\u6211\\u4eec\\u4f1a\\u5bf9\\u4fe1\\u606f\\u8fdb\\u884c\\u6c47\\u603b\\uff0c\\u4ee5\\u751f\\u6210\\u5185\\u90e8\\u5206\\u6790\\u53ca\\u7b26\\u5408\\u76d1\\u7ba1\\u8981\\u6c42\\u7684\\u62a5\\u544a\\u3002<\\/p>\\n<\\/li>\\n<\\/ul>\\n<hr data-start=\\\"594\\\" data-end=\\\"597\\\">\\n<p data-start=\\\"599\\\" data-end=\\\"609\\\"><strong data-start=\\\"599\\\" data-end=\\\"609\\\">\\u56db\\u3001\\u4fe1\\u606f\\u62ab\\u9732<\\/strong><\\/p>\\n<p data-start=\\\"611\\\" data-end=\\\"623\\\"><strong data-start=\\\"611\\\" data-end=\\\"623\\\">3. \\u4fe1\\u606f\\u5171\\u4eab\\uff1a<\\/strong><\\/p>\\n<ul data-start=\\\"625\\\" data-end=\\\"779\\\">\\n<li data-start=\\\"625\\\" data-end=\\\"665\\\">\\n<p data-start=\\\"627\\\" data-end=\\\"665\\\">**\\u5185\\u90e8\\u4f7f\\u7528\\uff1a**\\u4fe1\\u606f\\u53ef\\u80fd\\u5728CDA\\u5185\\u90e8\\u5171\\u4eab\\uff0c\\u7528\\u4e8e\\u7ba1\\u7406\\u8fd0\\u8425\\u5e76\\u4fdd\\u6301\\u9ad8\\u8d28\\u91cf\\u7684\\u670d\\u52a1\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"666\\\" data-end=\\\"732\\\">\\n<p data-start=\\\"668\\\" data-end=\\\"732\\\">**\\u7b2c\\u4e09\\u65b9\\u670d\\u52a1\\u5546\\uff1a**\\u6211\\u4eec\\u53ef\\u80fd\\u4f1a\\u4e0e\\u4e3a\\u6211\\u4eec\\u63d0\\u4f9b\\u6570\\u636e\\u5904\\u7406\\u670d\\u52a1\\u7684\\u7b2c\\u4e09\\u65b9\\u5408\\u4f5c\\uff0c\\u4f8b\\u5982\\u652f\\u4ed8\\u5904\\u7406\\u673a\\u6784\\u548c\\u8f6f\\u4ef6\\u670d\\u52a1\\u4f9b\\u5e94\\u5546\\uff0c\\u5e76\\u4f1a\\u7b7e\\u8ba2\\u4e25\\u683c\\u7684\\u4fdd\\u5bc6\\u534f\\u8bae\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"733\\\" data-end=\\\"779\\\">\\n<p data-start=\\\"735\\\" data-end=\\\"779\\\">**\\u6cd5\\u5f8b\\u8981\\u6c42\\uff1a**\\u5728\\u6cd5\\u5f8b\\u8981\\u6c42\\u6216\\u5408\\u6cd5\\u7a0b\\u5e8f\\uff08\\u5982\\u6cd5\\u9662\\u547d\\u4ee4\\u6216\\u76d1\\u7ba1\\u8981\\u6c42\\uff09\\u4e0b\\uff0c\\u6211\\u4eec\\u53ef\\u80fd\\u62ab\\u9732\\u5fc5\\u8981\\u4fe1\\u606f\\u3002<\\/p>\\n<\\/li>\\n<\\/ul>\\n<hr data-start=\\\"781\\\" data-end=\\\"784\\\">\\n<p data-start=\\\"786\\\" data-end=\\\"796\\\"><strong data-start=\\\"786\\\" data-end=\\\"796\\\">\\u4e94\\u3001\\u6570\\u636e\\u5b89\\u5168<\\/strong><\\/p>\\n<p data-start=\\\"798\\\" data-end=\\\"812\\\"><strong data-start=\\\"798\\\" data-end=\\\"812\\\">4. \\u4fe1\\u606f\\u4fdd\\u62a4\\u63aa\\u65bd\\uff1a<\\/strong><\\/p>\\n<p data-start=\\\"814\\\" data-end=\\\"874\\\">\\u6211\\u4eec\\u91c7\\u53d6\\u4e25\\u683c\\u7684\\u5b89\\u5168\\u63aa\\u65bd\\u9632\\u6b62\\u4fe1\\u606f\\u88ab\\u672a\\u7ecf\\u6388\\u6743\\u7684\\u8bbf\\u95ee\\u3001\\u4fee\\u6539\\u3001\\u62ab\\u9732\\u6216\\u9500\\u6bc1\\u3002\\u8fd9\\u4e9b\\u5b89\\u5168\\u63aa\\u65bd\\u5305\\u62ec\\u5b89\\u5168\\u670d\\u52a1\\u5668\\u3001\\u9632\\u706b\\u5899\\u6280\\u672f\\u53ca\\u6570\\u636e\\u52a0\\u5bc6\\u4f20\\u8f93\\u3002<\\/p>\\n<hr data-start=\\\"876\\\" data-end=\\\"879\\\">\\n<p data-start=\\\"881\\\" data-end=\\\"894\\\"><strong data-start=\\\"881\\\" data-end=\\\"894\\\">\\u516d\\u3001\\u60a8\\u7684\\u6743\\u5229\\u4e0e\\u9009\\u62e9<\\/strong><\\/p>\\n<p data-start=\\\"896\\\" data-end=\\\"911\\\"><strong data-start=\\\"896\\\" data-end=\\\"911\\\">5. \\u8bbf\\u95ee\\u4e0e\\u66f4\\u65b0\\u4fe1\\u606f\\uff1a<\\/strong><\\/p>\\n<p data-start=\\\"913\\\" data-end=\\\"949\\\">\\u60a8\\u6709\\u6743\\u8981\\u6c42\\u8bbf\\u95ee\\u6211\\u4eec\\u6240\\u6301\\u6709\\u7684\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u5e76\\u8bf7\\u6c42\\u66f4\\u6b63\\u3001\\u66f4\\u65b0\\u6216\\u5220\\u9664\\u76f8\\u5173\\u4fe1\\u606f\\u3002<\\/p>\\n<p data-start=\\\"951\\\" data-end=\\\"965\\\"><strong data-start=\\\"951\\\" data-end=\\\"965\\\">6. \\u53d6\\u6d88\\u8ba2\\u9605\\u9009\\u9879\\uff1a<\\/strong><\\/p>\\n<p data-start=\\\"967\\\" data-end=\\\"1004\\\">\\u60a8\\u53ef\\u6839\\u636e\\u7535\\u5b50\\u90ae\\u4ef6\\u4e2d\\u7684\\u9000\\u8ba2\\u6307\\u5f15\\u6216\\u76f4\\u63a5\\u8054\\u7cfb\\u6211\\u4eec\\uff0c\\u9009\\u62e9\\u4e0d\\u63a5\\u6536\\u6211\\u4eec\\u7684\\u5e02\\u573a\\u63a8\\u5e7f\\u901a\\u8baf\\u3002<\\/p>\\n<hr data-start=\\\"1006\\\" data-end=\\\"1009\\\">\\n<p data-start=\\\"1011\\\" data-end=\\\"1024\\\"><strong data-start=\\\"1011\\\" data-end=\\\"1024\\\">\\u4e03\\u3001\\u9690\\u79c1\\u653f\\u7b56\\u7684\\u4fee\\u6539<\\/strong><\\/p>\\n<p data-start=\\\"1026\\\" data-end=\\\"1038\\\"><strong data-start=\\\"1026\\\" data-end=\\\"1038\\\">7. \\u653f\\u7b56\\u53d8\\u66f4\\uff1a<\\/strong><\\/p>\\n<p data-start=\\\"1040\\\" data-end=\\\"1093\\\">CDA\\u4fdd\\u7559\\u6839\\u636e\\u5b9e\\u9645\\u60c5\\u51b5\\u6216\\u6cd5\\u5f8b\\u8981\\u6c42\\u66f4\\u65b0\\u672c\\u9690\\u79c1\\u653f\\u7b56\\u7684\\u6743\\u5229\\u3002\\u66f4\\u65b0\\u540e\\u7684\\u653f\\u7b56\\u5c06\\u4f1a\\u5728\\u6211\\u4eec\\u7684\\u7f51\\u7ad9\\u4e0a\\u516c\\u5e03\\uff0c\\u5e76\\u6ce8\\u660e\\u751f\\u6548\\u65e5\\u671f\\u3002<\\/p>\\n<p data-start=\\\"1095\\\" data-end=\\\"1124\\\">\\u6211\\u4eec\\u5efa\\u8bae\\u60a8\\u5b9a\\u671f\\u6d4f\\u89c8\\u672c\\u653f\\u7b56\\uff0c\\u4ee5\\u4e86\\u89e3\\u6211\\u4eec\\u5982\\u4f55\\u6301\\u7eed\\u4fdd\\u62a4\\u60a8\\u7684\\u4fe1\\u606f\\u3002<\\/p>\"}', '2024-08-23 15:39:06', '2025-10-30 09:07:34'),
(6, 'DONATION_TERM', '{\"description\":\"<p data-start=\\\"102\\\" data-end=\\\"139\\\"><strong data-start=\\\"102\\\" data-end=\\\"137\\\">Donation Terms &amp; Privacy Policy<\\/strong><\\/p>\\n<p data-start=\\\"141\\\" data-end=\\\"204\\\">By continuing with this donation, you agree to the following:<\\/p>\\n<ol data-start=\\\"206\\\" data-end=\\\"1253\\\">\\n<li data-start=\\\"206\\\" data-end=\\\"367\\\">\\n<p data-start=\\\"209\\\" data-end=\\\"367\\\"><strong data-start=\\\"209\\\" data-end=\\\"231\\\">Voluntary Donation<\\/strong><br data-start=\\\"231\\\" data-end=\\\"234\\\">All donations are completely voluntary and non-refundable. Donations help support our projects, initiatives, and operational costs.<\\/p>\\n<\\/li>\\n<li data-start=\\\"369\\\" data-end=\\\"527\\\">\\n<p data-start=\\\"372\\\" data-end=\\\"527\\\"><strong data-start=\\\"372\\\" data-end=\\\"391\\\">Secure Payments<\\/strong><br data-start=\\\"391\\\" data-end=\\\"394\\\">Your payment is processed through secure payment gateways. We <strong data-start=\\\"456\\\" data-end=\\\"509\\\">do not store your credit card or bank information<\\/strong> on our servers.<\\/p>\\n<\\/li>\\n<li data-start=\\\"529\\\" data-end=\\\"715\\\">\\n<p data-start=\\\"532\\\" data-end=\\\"715\\\"><strong data-start=\\\"532\\\" data-end=\\\"554\\\">Use of Information<\\/strong><br data-start=\\\"554\\\" data-end=\\\"557\\\">We collect basic information such as your name, email address, and donation amount <strong data-start=\\\"640\\\" data-end=\\\"673\\\">only to process your donation<\\/strong> and send you transaction confirmations.<\\/p>\\n<\\/li>\\n<li data-start=\\\"717\\\" data-end=\\\"927\\\">\\n<p data-start=\\\"720\\\" data-end=\\\"927\\\"><strong data-start=\\\"720\\\" data-end=\\\"742\\\">Privacy Protection<\\/strong><br data-start=\\\"742\\\" data-end=\\\"745\\\">Your personal information will <strong data-start=\\\"776\\\" data-end=\\\"833\\\">never be sold, shared, or used for marketing purposes<\\/strong>. We may use cookies or analytics to improve our website, but your data will remain private.<\\/p>\\n<\\/li>\\n<li data-start=\\\"929\\\" data-end=\\\"1137\\\">\\n<p data-start=\\\"932\\\" data-end=\\\"1137\\\"><strong data-start=\\\"932\\\" data-end=\\\"943\\\">Consent<\\/strong><br data-start=\\\"943\\\" data-end=\\\"946\\\">By making a donation, you consent to the collection and use of your personal information as described above. You may contact us at [your email\\/contact] to review or delete your information.<\\/p>\\n<\\/li>\\n<li data-start=\\\"1139\\\" data-end=\\\"1253\\\">\\n<p data-start=\\\"1142\\\" data-end=\\\"1253\\\"><strong data-start=\\\"1142\\\" data-end=\\\"1153\\\">Updates<\\/strong><br data-start=\\\"1153\\\" data-end=\\\"1156\\\">These terms may be updated occasionally. The latest version will always be posted on this page.<\\/p>\\n<\\/li>\\n<\\/ol>\\n<p data-start=\\\"1255\\\" data-end=\\\"1370\\\"><strong data-start=\\\"1255\\\" data-end=\\\"1368\\\">By donating, you acknowledge that you have read, understood, and agreed to these terms and privacy practices.<\\/strong><\\/p>\",\"descriptionKh\":\"<p data-start=\\\"97\\\" data-end=\\\"149\\\"><strong data-start=\\\"97\\\" data-end=\\\"147\\\">\\u179b\\u17d0\\u1780\\u17d2\\u1781\\u1781\\u17d0\\u178e\\u17d2\\u178c\\u1793\\u17b7\\u1784\\u1793\\u17b8\\u178f\\u17b7\\u179c\\u17b7\\u1792\\u17b8\\u1797\\u17b6\\u1796\\u17af\\u1780\\u1787\\u1793\\u179f\\u1798\\u17d2\\u179a\\u17b6\\u1794\\u17cb\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780<\\/strong><\\/p>\\n<p data-start=\\\"151\\\" data-end=\\\"207\\\">\\u178a\\u17c4\\u1799\\u1794\\u1793\\u17d2\\u178f\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780\\u1793\\u17c1\\u17c7 \\u17a2\\u17d2\\u1793\\u1780\\u1799\\u179b\\u17cb\\u1796\\u17d2\\u179a\\u1798\\u1793\\u17b9\\u1784\\u17a2\\u178f\\u17d2\\u1790\\u1794\\u1791\\u178a\\u17bc\\u1785\\u1781\\u17b6\\u1784\\u1780\\u17d2\\u179a\\u17c4\\u1798\\u17d6<\\/p>\\n<ol data-start=\\\"209\\\" data-end=\\\"1341\\\">\\n<li data-start=\\\"209\\\" data-end=\\\"406\\\">\\n<p data-start=\\\"212\\\" data-end=\\\"406\\\"><strong data-start=\\\"212\\\" data-end=\\\"242\\\">\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780\\u178a\\u17c4\\u1799\\u179f\\u17d2\\u1798\\u17d0\\u1782\\u17d2\\u179a\\u1785\\u17b7\\u178f\\u17d2\\u178f<\\/strong><br data-start=\\\"242\\\" data-end=\\\"245\\\">\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780\\u1791\\u17b6\\u17c6\\u1784\\u17a2\\u179f\\u17cb\\u1782\\u17ba <strong data-start=\\\"266\\\" data-end=\\\"313\\\">\\u178a\\u17c4\\u1799\\u179f\\u17d2\\u1798\\u17d0\\u1782\\u17d2\\u179a\\u1785\\u17b7\\u178f\\u17d2\\u178f \\u1793\\u17b7\\u1784\\u1798\\u17b7\\u1793\\u17a2\\u17b6\\u1785\\u178f\\u17d2\\u179a\\u17a1\\u1794\\u17cb\\u1794\\u17d2\\u179a\\u17b6\\u1780\\u17cb\\u179c\\u17b7\\u1789\\u1794\\u17b6\\u1793<\\/strong>\\u17d4 \\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780\\u1793\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u17bc\\u179c\\u1794\\u17d2\\u179a\\u17be\\u179f\\u1798\\u17d2\\u179a\\u17b6\\u1794\\u17cb\\u1782\\u17b6\\u17c6\\u1791\\u17d2\\u179a\\u1782\\u1798\\u17d2\\u179a\\u17c4\\u1784 \\u1780\\u1798\\u17d2\\u1798\\u179c\\u17b7\\u1792\\u17b8 \\u1793\\u17b7\\u1784\\u1785\\u17c6\\u178e\\u17b6\\u1799\\u1794\\u17d2\\u179a\\u178f\\u17b7\\u1794\\u178f\\u17d2\\u178f\\u17b7\\u1780\\u17b6\\u179a\\u179a\\u1794\\u179f\\u17cb\\u1799\\u17be\\u1784\\u17d4<\\/p>\\n<\\/li>\\n<li data-start=\\\"408\\\" data-end=\\\"579\\\">\\n<p data-start=\\\"411\\\" data-end=\\\"579\\\"><strong data-start=\\\"411\\\" data-end=\\\"438\\\">\\u1780\\u17b6\\u179a\\u1791\\u17bc\\u1791\\u17b6\\u178f\\u17cb\\u1799\\u17c9\\u17b6\\u1784\\u179f\\u17bb\\u179c\\u178f\\u17d2\\u1790\\u17b7\\u1797\\u17b6\\u1796<\\/strong><br data-start=\\\"438\\\" data-end=\\\"441\\\">\\u1780\\u17b6\\u179a\\u1791\\u17bc\\u1791\\u17b6\\u178f\\u17cb\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780\\u178f\\u17d2\\u179a\\u17bc\\u179c\\u1794\\u17b6\\u1793\\u178a\\u17c6\\u178e\\u17be\\u179a\\u1780\\u17b6\\u179a\\u178f\\u17b6\\u1798\\u179a\\u1799\\u17c8\\u1794\\u17d2\\u179a\\u1796\\u17d0\\u1793\\u17d2\\u1792\\u1791\\u17bc\\u1791\\u17b6\\u178f\\u17cb\\u179f\\u17bb\\u179c\\u178f\\u17d2\\u1790\\u17b7\\u1797\\u17b6\\u1796\\u17d4 \\u1799\\u17be\\u1784 <strong data-start=\\\"510\\\" data-end=\\\"574\\\">\\u1798\\u17b7\\u1793\\u1795\\u17d2\\u1791\\u17bb\\u1780\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u178f\\u17a5\\u178e\\u1796\\u1793\\u17d2\\u1792 \\u17ac\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793\\u1792\\u1793\\u17b6\\u1782\\u17b6\\u179a\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780\\u1793\\u17c5\\u179b\\u17be\\u1798\\u17c9\\u17b6\\u179f\\u17ca\\u17b8\\u1793\\u1798\\u17c1<\\/strong>\\u1791\\u17c1\\u17d4<\\/p>\\n<\\/li>\\n<li data-start=\\\"581\\\" data-end=\\\"767\\\">\\n<p data-start=\\\"584\\\" data-end=\\\"767\\\"><strong data-start=\\\"584\\\" data-end=\\\"608\\\">\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17be\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17cb\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793<\\/strong><br data-start=\\\"608\\\" data-end=\\\"611\\\">\\u1799\\u17be\\u1784\\u1794\\u17d2\\u179a\\u1798\\u17bc\\u179b\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793\\u1798\\u17bc\\u179b\\u178a\\u17d2\\u178b\\u17b6\\u1793\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780 \\u178a\\u17bc\\u1785\\u1787\\u17b6 \\u1788\\u17d2\\u1798\\u17c4\\u17c7 \\u17a2\\u17ca\\u17b8\\u1798\\u17c2\\u179b \\u1793\\u17b7\\u1784\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1794\\u17d2\\u179a\\u17b6\\u1780\\u17cb\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780 <strong data-start=\\\"686\\\" data-end=\\\"764\\\">\\u1782\\u17d2\\u179a\\u17b6\\u1793\\u17cb\\u178f\\u17c2\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u178a\\u17c6\\u178e\\u17be\\u179a\\u1780\\u17b6\\u179a\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780 \\u1793\\u17b7\\u1784\\u1795\\u17d2\\u1789\\u17be\\u1780\\u17b6\\u179a\\u1794\\u1789\\u17d2\\u1787\\u17b6\\u1780\\u17cb\\u1794\\u17d2\\u179a\\u178f\\u17b7\\u1794\\u178f\\u17d2\\u178f\\u17b7\\u1780\\u17b6\\u179a\\u178f\\u17c2\\u1794\\u17c9\\u17bb\\u178e\\u17d2\\u178e\\u17c4\\u17c7<\\/strong>\\u17d4<\\/p>\\n<\\/li>\\n<li data-start=\\\"769\\\" data-end=\\\"989\\\">\\n<p data-start=\\\"772\\\" data-end=\\\"989\\\"><strong data-start=\\\"772\\\" data-end=\\\"789\\\">\\u1780\\u17b6\\u179a\\u1796\\u17b6\\u179a\\u1797\\u17b6\\u1796\\u17af\\u1780\\u1787\\u1793<\\/strong><br data-start=\\\"789\\\" data-end=\\\"792\\\">\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793\\u1795\\u17d2\\u1791\\u17b6\\u179b\\u17cb\\u1781\\u17d2\\u179b\\u17bd\\u1793\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780 <strong data-start=\\\"819\\\" data-end=\\\"872\\\">\\u1798\\u17b7\\u1793\\u178f\\u17d2\\u179a\\u17bc\\u179c\\u1794\\u17b6\\u1793\\u179b\\u1780\\u17cb \\u17ac\\u1785\\u17c2\\u1780\\u179a\\u17c6\\u179b\\u17c2\\u1780\\u179f\\u1798\\u17d2\\u179a\\u17b6\\u1794\\u17cb\\u1782\\u17c4\\u179b\\u1794\\u17c6\\u178e\\u1784\\u1795\\u17d2\\u179f\\u1796\\u17d2\\u179c\\u1795\\u17d2\\u179f\\u17b6\\u1799<\\/strong>\\u17d4 \\u1799\\u17be\\u1784\\u17a2\\u17b6\\u1785\\u1794\\u17d2\\u179a\\u17be Cookies \\u17ac\\u17a7\\u1794\\u1780\\u179a\\u178e\\u17cd\\u179c\\u17b7\\u1797\\u17b6\\u1782 \\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1792\\u17d2\\u179c\\u17be\\u17b1\\u17d2\\u1799\\u1794\\u17d2\\u179a\\u179f\\u17be\\u179a\\u17a1\\u17be\\u1784\\u1794\\u1791\\u1796\\u17b7\\u179f\\u17c4\\u1792\\u1793\\u17cd\\u179c\\u17c1\\u1794\\u179f\\u17b6\\u1799 \\u1794\\u17c9\\u17bb\\u1793\\u17d2\\u178f\\u17c2\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780\\u1793\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u17bc\\u179c\\u179a\\u1780\\u17d2\\u179f\\u17b6\\u17af\\u1780\\u1787\\u1793\\u1797\\u17b6\\u1796\\u17d4<\\/p>\\n<\\/li>\\n<li data-start=\\\"991\\\" data-end=\\\"1204\\\">\\n<p data-start=\\\"994\\\" data-end=\\\"1204\\\"><strong data-start=\\\"994\\\" data-end=\\\"1008\\\">\\u1780\\u17b6\\u179a\\u1799\\u179b\\u17cb\\u1796\\u17d2\\u179a\\u1798<\\/strong><br data-start=\\\"1008\\\" data-end=\\\"1011\\\">\\u178a\\u17c4\\u1799\\u1792\\u17d2\\u179c\\u17be\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780 \\u17a2\\u17d2\\u1793\\u1780\\u1799\\u179b\\u17cb\\u1796\\u17d2\\u179a\\u1798\\u17b2\\u17d2\\u1799\\u1799\\u17be\\u1784\\u1794\\u17d2\\u179a\\u1798\\u17bc\\u179b \\u1793\\u17b7\\u1784\\u1794\\u17d2\\u179a\\u17be\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17cb\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793\\u1795\\u17d2\\u1791\\u17b6\\u179b\\u17cb\\u1781\\u17d2\\u179b\\u17bd\\u1793\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780 \\u178a\\u17bc\\u1785\\u1794\\u17b6\\u1793\\u179a\\u17c0\\u1794\\u179a\\u17b6\\u1794\\u17cb\\u1781\\u17b6\\u1784\\u179b\\u17be\\u17d4 \\u17a2\\u17d2\\u1793\\u1780\\u17a2\\u17b6\\u1785\\u1791\\u17c6\\u1793\\u17b6\\u1780\\u17cb\\u1791\\u17c6\\u1793\\u1784\\u1798\\u1780\\u1799\\u17be\\u1784\\u178f\\u17b6\\u1798 [\\u17a2\\u17ca\\u17b8\\u1798\\u17c2\\u179b\\/\\u1791\\u17c6\\u1793\\u17b6\\u1780\\u17cb\\u1791\\u17c6\\u1793\\u1784\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780] \\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1796\\u17b7\\u1793\\u17b7\\u178f\\u17d2\\u1799 \\u17ac\\u179b\\u17bb\\u1794\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780\\u17d4<\\/p>\\n<\\/li>\\n<li data-start=\\\"1206\\\" data-end=\\\"1341\\\">\\n<p data-start=\\\"1209\\\" data-end=\\\"1341\\\"><strong data-start=\\\"1209\\\" data-end=\\\"1237\\\">\\u1780\\u17b6\\u179a\\u1795\\u17d2\\u179b\\u17b6\\u179f\\u17cb\\u1794\\u17d2\\u178f\\u17bc\\u179a\\u179b\\u17d0\\u1780\\u17d2\\u1781\\u1781\\u17d0\\u178e\\u17d2\\u178c<\\/strong><br data-start=\\\"1237\\\" data-end=\\\"1240\\\">\\u179b\\u17d0\\u1780\\u17d2\\u1781\\u1781\\u17d0\\u178e\\u17d2\\u178c\\u1793\\u17c1\\u17c7\\u17a2\\u17b6\\u1785\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1795\\u17d2\\u179b\\u17b6\\u179f\\u17cb\\u1794\\u17d2\\u178f\\u17bc\\u179a\\u1796\\u17b8\\u1796\\u17c1\\u179b\\u1791\\u17c5\\u1796\\u17c1\\u179b\\u17d4 \\u17a2\\u17d2\\u1793\\u1780\\u17a2\\u17b6\\u1785\\u1798\\u17be\\u179b <strong data-start=\\\"1296\\\" data-end=\\\"1313\\\">\\u1780\\u17c6\\u178e\\u17c2\\u1790\\u17d2\\u1798\\u17b8\\u1794\\u17c6\\u1795\\u17bb\\u178f<\\/strong> \\u1793\\u17c5\\u179b\\u17be\\u1791\\u17c6\\u1796\\u17d0\\u179a\\u1793\\u17c1\\u17c7\\u1793\\u17c5\\u1796\\u17c1\\u179b\\u178e\\u17b6\\u1780\\u17cf\\u1794\\u17b6\\u1793\\u17d4<\\/p>\\n<\\/li>\\n<\\/ol>\\n<p data-start=\\\"1343\\\" data-end=\\\"1439\\\"><strong data-start=\\\"1343\\\" data-end=\\\"1437\\\">\\u1780\\u17b6\\u179a\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780\\u179a\\u1794\\u179f\\u17cb\\u17a2\\u17d2\\u1793\\u1780\\u1782\\u17ba\\u1798\\u17b6\\u1793\\u1793\\u17d0\\u1799\\u1790\\u17b6\\u17a2\\u17d2\\u1793\\u1780\\u1794\\u17b6\\u1793\\u17a2\\u17b6\\u1793 \\u1799\\u179b\\u17cb\\u1796\\u17d2\\u179a\\u1798 \\u1793\\u17b7\\u1784\\u1799\\u179b\\u17cb\\u178a\\u17b9\\u1784\\u179b\\u17d0\\u1780\\u17d2\\u1781\\u1781\\u17d0\\u178e\\u17d2\\u178c \\u1793\\u17b7\\u1784\\u1793\\u17b8\\u178f\\u17b7\\u179c\\u17b7\\u1792\\u17b8\\u1797\\u17b6\\u1796\\u17af\\u1780\\u1787\\u1793\\u1793\\u17c1\\u17c7\\u17d4<\\/strong><\\/p>\",\"descriptionCh\":\"<p data-start=\\\"109\\\" data-end=\\\"124\\\"><strong data-start=\\\"109\\\" data-end=\\\"122\\\">\\u6350\\u8d60\\u6761\\u6b3e\\u4e0e\\u9690\\u79c1\\u653f\\u7b56<\\/strong><\\/p>\\n<p data-start=\\\"126\\\" data-end=\\\"143\\\">\\u7ee7\\u7eed\\u6350\\u8d60\\u5373\\u8868\\u793a\\u60a8\\u540c\\u610f\\u4ee5\\u4e0b\\u5185\\u5bb9\\uff1a<\\/p>\\n<ol data-start=\\\"145\\\" data-end=\\\"521\\\">\\n<li data-start=\\\"145\\\" data-end=\\\"196\\\">\\n<p data-start=\\\"148\\\" data-end=\\\"196\\\"><strong data-start=\\\"148\\\" data-end=\\\"156\\\">\\u81ea\\u613f\\u6350\\u8d60<\\/strong><br data-start=\\\"156\\\" data-end=\\\"159\\\">\\u6240\\u6709\\u6350\\u8d60\\u5747\\u4e3a\\u81ea\\u613f\\u4e14\\u4e0d\\u53ef\\u9000\\u6b3e\\u3002\\u6350\\u8d60\\u5c06\\u7528\\u4e8e\\u652f\\u6301\\u6211\\u4eec\\u7684\\u9879\\u76ee\\u3001\\u8ba1\\u5212\\u53ca\\u8fd0\\u8425\\u6210\\u672c\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"198\\\" data-end=\\\"255\\\">\\n<p data-start=\\\"201\\\" data-end=\\\"255\\\"><strong data-start=\\\"201\\\" data-end=\\\"209\\\">\\u5b89\\u5168\\u652f\\u4ed8<\\/strong><br data-start=\\\"209\\\" data-end=\\\"212\\\">\\u60a8\\u7684\\u652f\\u4ed8\\u901a\\u8fc7\\u5b89\\u5168\\u652f\\u4ed8\\u7f51\\u5173\\u5904\\u7406\\u3002\\u6211\\u4eec<strong data-start=\\\"229\\\" data-end=\\\"252\\\">\\u4e0d\\u4f1a\\u5728\\u670d\\u52a1\\u5668\\u4e0a\\u5b58\\u50a8\\u60a8\\u7684\\u4fe1\\u7528\\u5361\\u6216\\u94f6\\u884c\\u4fe1\\u606f<\\/strong>\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"257\\\" data-end=\\\"320\\\">\\n<p data-start=\\\"260\\\" data-end=\\\"320\\\"><strong data-start=\\\"260\\\" data-end=\\\"268\\\">\\u4fe1\\u606f\\u4f7f\\u7528<\\/strong><br data-start=\\\"268\\\" data-end=\\\"271\\\">\\u6211\\u4eec\\u4ec5\\u6536\\u96c6\\u60a8\\u7684\\u57fa\\u672c\\u4fe1\\u606f\\uff0c\\u5982\\u59d3\\u540d\\u3001\\u7535\\u5b50\\u90ae\\u4ef6\\u5730\\u5740\\u548c\\u6350\\u8d60\\u91d1\\u989d\\uff0c<strong data-start=\\\"299\\\" data-end=\\\"317\\\">\\u4ec5\\u7528\\u4e8e\\u5904\\u7406\\u6350\\u8d60\\u548c\\u53d1\\u9001\\u4ea4\\u6613\\u786e\\u8ba4<\\/strong>\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"322\\\" data-end=\\\"401\\\">\\n<p data-start=\\\"325\\\" data-end=\\\"401\\\"><strong data-start=\\\"325\\\" data-end=\\\"333\\\">\\u9690\\u79c1\\u4fdd\\u62a4<\\/strong><br data-start=\\\"333\\\" data-end=\\\"336\\\">\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f<strong data-start=\\\"342\\\" data-end=\\\"361\\\">\\u7edd\\u4e0d\\u4f1a\\u51fa\\u552e\\u3001\\u5171\\u4eab\\u6216\\u7528\\u4e8e\\u8425\\u9500\\u76ee\\u7684<\\/strong>\\u3002\\u6211\\u4eec\\u53ef\\u80fd\\u4f7f\\u7528 Cookies \\u6216\\u5206\\u6790\\u5de5\\u5177\\u6765\\u4f18\\u5316\\u7f51\\u7ad9\\uff0c\\u4f46\\u60a8\\u7684\\u6570\\u636e\\u5c06\\u4fdd\\u6301\\u79c1\\u5bc6\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"403\\\" data-end=\\\"476\\\">\\n<p data-start=\\\"406\\\" data-end=\\\"476\\\"><strong data-start=\\\"406\\\" data-end=\\\"412\\\">\\u540c\\u610f<\\/strong><br data-start=\\\"412\\\" data-end=\\\"415\\\">\\u901a\\u8fc7\\u6350\\u8d60\\uff0c\\u60a8\\u540c\\u610f\\u6309\\u7167\\u4e0a\\u8ff0\\u5185\\u5bb9\\u6536\\u96c6\\u548c\\u4f7f\\u7528\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u3002\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7 [\\u60a8\\u7684\\u90ae\\u7bb1\\/\\u8054\\u7cfb\\u65b9\\u5f0f] \\u8054\\u7cfb\\u6211\\u4eec\\uff0c\\u67e5\\u9605\\u6216\\u5220\\u9664\\u60a8\\u7684\\u4fe1\\u606f\\u3002<\\/p>\\n<\\/li>\\n<li data-start=\\\"478\\\" data-end=\\\"521\\\">\\n<p data-start=\\\"481\\\" data-end=\\\"521\\\"><strong data-start=\\\"481\\\" data-end=\\\"489\\\">\\u6761\\u6b3e\\u66f4\\u65b0<\\/strong><br data-start=\\\"489\\\" data-end=\\\"492\\\">\\u672c\\u6761\\u6b3e\\u53ef\\u80fd\\u4f1a\\u4e0d\\u5b9a\\u671f\\u66f4\\u65b0\\u3002\\u6700\\u65b0\\u7248\\u672c\\u5c06\\u59cb\\u7ec8\\u53d1\\u5e03\\u5728\\u6b64\\u9875\\u9762\\u4e0a\\u3002<\\/p>\\n<\\/li>\\n<\\/ol>\\n<p data-start=\\\"523\\\" data-end=\\\"554\\\"><strong data-start=\\\"523\\\" data-end=\\\"552\\\">\\u6350\\u8d60\\u5373\\u8868\\u793a\\u60a8\\u5df2\\u9605\\u8bfb\\u3001\\u7406\\u89e3\\u5e76\\u540c\\u610f\\u8fd9\\u4e9b\\u6761\\u6b3e\\u53ca\\u9690\\u79c1\\u653f\\u7b56\\u3002<\\/strong><\\/p>\"}', '2025-10-28 01:51:19', '2025-10-28 01:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nameKh` varchar(255) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `descKh` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `facebookLink` varchar(255) DEFAULT NULL,
  `instagramLink` varchar(255) DEFAULT NULL,
  `linkedinLink` varchar(255) DEFAULT NULL,
  `telegramLink` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `positionKh` varchar(255) DEFAULT NULL,
  `nameCh` varchar(255) DEFAULT NULL,
  `positionCh` varchar(255) DEFAULT NULL,
  `descCh` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `nameKh`, `desc`, `descKh`, `image`, `facebookLink`, `instagramLink`, `linkedinLink`, `telegramLink`, `ordering`, `isActive`, `created_at`, `updated_at`, `position`, `positionKh`, `nameCh`, `positionCh`, `descCh`) VALUES
(4, 'Member 05', 'MR. ចាន់ ដារ៉ា', 'Assistant', 'អ្នកគ្រប់គ្រងទូទៅ', '/teams/CamGoTech_734UxDi7zUlSfdKWk5v4soajkvJJnov2wvK1pSZ2.jpg', 'https://www.facebook.com/profile.php?id=100069908061589', '', '', '', 5, 1, '2024-08-31 21:34:56', '2025-09-25 03:22:54', 'Assistant', '', NULL, NULL, NULL),
(5, 'Member 04', '', 'Events Management', '', '/teams/CamGoTech_6AUqxYPtKa1Ch0m4jXe2cwWJIqypdyJFYfbbciza.jpg', 'https://www.facebook.com/profile.php?id=100069908061589', '', '', '', 3, 1, '2024-09-02 20:41:06', '2025-09-25 03:21:23', 'Events Management', '', NULL, NULL, NULL),
(6, 'Member 03', '', '', '', '/teams/CamGoTech_JZJk22aZDVnzg7WtIsGVzNYxvXGmkZl10VlpJUeA.jpg', '', '', '', '', 4, 1, '2024-09-02 20:43:24', '2025-09-25 03:20:49', 'HR Management', '', NULL, NULL, NULL),
(7, 'Member 02', '', 'General Manager', '', '/teams/CamGoTech_H7nf5OeTZYNmhbeZbIKcDQrR3Q3wbOxNfVr97Mdg.jpg', 'https://www.facebook.com/profile.php?id=100069908061589', '', '', '', 1, 1, '2024-09-14 02:51:52', '2025-09-25 03:23:54', 'General Manager', '', NULL, NULL, NULL),
(8, 'Member 01', '', '<p>Our Founder and CEO is a visionary leader driven by compassion and a deep commitment to social change. With a strong belief that every individual deserves dignity, opportunity, and hope, they established this organization to address the challenges faced by vulnerable communities. <br>Guided by values of integrity, service, and inclusivity, the</p>\n<p>Founder &amp; CEO leads with dedication&mdash;building partnerships, empowering teams, and inspiring others to join the mission of making a lasting difference. Their leadership continues to shape the organization&rsquo;s vision, ensuring that every project creates meaningful impact and sustainable growth for society.</p>', '', '/teams/CamGoTech_Pwn8Flgz12RF0Lll5z5sVrYjbFDXfe8OGWQzETUC.jpg', 'https://www.facebook.com/profile.php?id=100069908061589', 'https://www.instagram.com/', 'https://www.linkedin.com/', 'https://telegram.org/', 0, 1, '2025-09-16 13:10:12', '2025-09-28 06:48:12', 'Founder, CEO', '', NULL, NULL, NULL),
(9, 'Member 06', '', 'Accountant', '', '/teams/CamGoTech_ocWLVEtpINEumPRk0RBF69wa2LVZj9bbejI7XD1a.jpg', 'https://www.facebook.com/profile.php?id=100069908061589', '', '', '', 6, 1, '2025-09-25 03:23:23', '2025-10-30 09:15:57', 'Accountant', '', '第六位会员', '会计', '');

-- --------------------------------------------------------

--
-- Table structure for table `technologies`
--

CREATE TABLE `technologies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reviewerName` varchar(255) DEFAULT NULL,
  `reviewerPosition` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `reviewerProfile` varchar(255) DEFAULT NULL,
  `isDisplayHomepage` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `isSuperAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `joinAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `totalDonation` double NOT NULL DEFAULT 0,
  `loginWith` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `memberType` varchar(45) DEFAULT NULL,
  `idType` varchar(45) DEFAULT NULL,
  `idCardBack` varchar(255) DEFAULT NULL,
  `idCardFront` varchar(255) DEFAULT NULL,
  `passport` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `accountNumber` varchar(255) DEFAULT NULL,
  `idNumber` varchar(45) DEFAULT NULL,
  `isMember` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `firstName`, `lastName`, `email`, `phoneNumber`, `image`, `password`, `isSuperAdmin`, `isAdmin`, `isActive`, `joinAt`, `totalDonation`, `loginWith`, `created_at`, `updated_at`, `memberType`, `idType`, `idCardBack`, `idCardFront`, `passport`, `accountName`, `accountNumber`, `idNumber`, `isMember`) VALUES
(1, 'Admin User', NULL, NULL, 'admin@gmail.com', NULL, NULL, '$2y$10$.xpP7YSR/p.uZ3hHwjjZVuZnK1Vbv.svy.EJx3roWMLrnK9OHFbP6', 1, 1, 1, '2024-08-06 05:17:53', 0, 1, '2024-07-01 05:06:50', '2024-07-01 05:06:50', 'Member', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'Camgotech Cambodia', 'Camgotech', 'Web', 'camgotech@gmail.com', '069565956', NULL, '$2y$10$EsWj57xQrrBINbJnHSEOcuUB0ugDrrCiPjgbWkx4z5jQr1m0S139W', 0, 0, 1, '2025-10-31 07:59:29', 150, 2, '2024-07-16 06:42:18', '2025-10-31 06:59:29', 'Organization', 'ID_CARD', '/users/CamGoTech_AxL0HhwPIKsHeC9fRaDWMgmEVdBjUB252bxU04ML.jpg', NULL, NULL, '', '', '00012345', 1),
(27, 'Phanna Phoem', 'Phannas', 'Phoem', NULL, '+85517843304', '/users/CamGoTech_vbe7vPF5SShvUvvdpnW2Savs0UlI3z8OrFijuUAE.jpg', '$2y$10$saePPXoy6LYdehtbzsz/fuIbyLeNhr/A.aVIc.c3y6I7x.eBwQuMS', 0, 0, 1, '2025-10-18 03:21:11', 0, 1, '2025-10-05 07:22:24', '2025-10-18 02:21:11', 'MEMBER', 'PASSPORT', '', '', '/users/CamGoTech_uQlZA3UOWBUe8iruBR9S1m2CN2q43zzcDZUb2UOr.png', NULL, NULL, '12345678', 1),
(31, 'Phoem sophanna', 'Phoems', 'sophanna', 'phannaphoem@gmail.com', '+855 17843304', 'https://res.cloudinary.com/dufghzvge/image/upload/v1719182746/default-profile-picture-avatar-photo-placeholder-vector-illustration-default-profile-picture-avatar-photo-placeholder-vector-189495158_hyq2qt.webp', '$2y$10$7GOVbDE0nHClwnnobzykJuY2z56RaUhIz/njRrWM9t4x3xu35AdFe', 0, 0, 1, '2025-10-31 08:28:47', 0, 2, '2025-10-17 01:28:54', '2025-10-30 07:01:40', 'MEMBER', 'ID_CARD', '', '/users/CamGoTech_IqWTonMBUErxPBNW3z9OSPS5hnLT6XPXnpPzoM9v.jpg', '', NULL, NULL, '12345678', 1),
(32, 'Vutha TEP', 'Vutha', 'TEP', NULL, '+85512358333', '/user-profile/CamGoTech_T8og4X5DS63ky07vlhIdd04hQSkCR7pL2dAuAZbN.jpg', '$2y$10$xT9jvVq854Gh0lYikO33QOFTGvEnSBuGSAA1R2R4IMM4A0bdxdusy', 0, 0, 1, '2025-10-17 03:02:56', 1001, 1, '2025-10-17 01:29:40', '2025-10-17 02:02:56', 'MEMBER', 'PASSPORT', '', '', '', '', '', '', 0),
(33, 'Dara Samnang', 'Dara', 'Samnang', 'samnang.dara855@gmail.com', NULL, NULL, '$2y$10$CgksAb8hHWk.ud5ZEriJleCawwX54sipLczao22IwORY/6WPW0Gom', 0, 0, 1, '2025-10-17 10:00:58', 40, 2, '2025-10-17 08:58:22', '2025-10-17 09:00:58', 'MEMBER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(34, 'CAA Admin', NULL, NULL, 'admin@cambodiaalumni.org', '012 963 111', NULL, '$2y$10$HD/NdalU1sI0iN7FBlQRqebMSvsngF8gkeZo66oFfjNg/iKMps18y', 0, 1, 1, '2025-10-18 03:55:33', 0, 1, '2025-10-18 02:55:33', '2025-10-18 02:55:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(35, 'Vutha Tep', 'Vutha', 'Tep', NULL, '+85512358333', NULL, '$2y$10$QIbe/L9G95S5owouAthBweIYhd7n8QOfMCzOGvzYTp5cY89oVPTRK', 0, 0, 1, '2025-10-25 06:26:00', 0, 1, '2025-10-25 06:26:00', '2025-10-25 06:26:00', 'MEMBER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(36, 'HAN CHANSEREY', 'HAN', 'CHANSEREY', NULL, '+855070260260', NULL, '$2y$10$d8pzCZPmsrFFZgMTWnz/AeX9EELXC7QTy4FyNJuNJIdXKyCHRCvd2', 0, 0, 1, '2025-10-25 06:47:39', 0, 1, '2025-10-25 06:47:39', '2025-10-25 06:47:39', 'MEMBER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(37, 'DARA TY', 'DARA', 'TY', NULL, '+85570260260', NULL, '$2y$10$cppJfqooCxhsGLl64kSj8O1IqjCENiWBGupgRjfB6U5vvX9G1eYGK', 0, 0, 1, '2025-10-25 06:51:39', 0, 1, '2025-10-25 06:51:39', '2025-10-25 06:51:39', 'MEMBER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(38, 'Vutha TEP', 'Vutha', 'TEP', 'dev.camgotech@gmail.com', NULL, NULL, '$2y$10$a5Kj4PSCJG8Z4s9b6oH3j.xy7RVYjAUwlo8mtX2EZcuEk5YWJWoBe', 0, 0, 1, '2025-10-31 08:15:10', 0, 2, '2025-10-31 07:09:14', '2025-10-31 07:15:10', 'MEMBER', 'ID_CARD', NULL, '/users/CamGoTech_wUyKqzsnBkW2mlnKlyH9E7zjFyKVCQE97gXgTwzF.jpg', NULL, NULL, NULL, '00012345', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_informations`
--

CREATE TABLE `user_informations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `documentType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idCardBack` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idCardFront` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identityNumber` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `politicalUse` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `againstHumanity` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latinName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `marital` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identityDate` date DEFAULT NULL,
  `job` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeBirth` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dayDo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_informations`
--

INSERT INTO `user_informations` (`id`, `user_id`, `phone`, `fullname`, `gender`, `age`, `documentType`, `idCardBack`, `idCardFront`, `identityNumber`, `location`, `passport`, `profile`, `city`, `politicalUse`, `againstHumanity`, `date`, `created_at`, `updated_at`, `latinName`, `education`, `facebook`, `birth`, `marital`, `identityDate`, `job`, `languages`, `mother`, `father`, `placeBirth`, `dayDo`) VALUES
(3, 27, '+85517843304', 'Phanna Phoem', 'male', 17, 'PASSPORT', NULL, NULL, NULL, 'Kampong Chhnang', '/users/CamGoTech_uQlZA3UOWBUe8iruBR9S1m2CN2q43zzcDZUb2UOr.png', '/users/CamGoTech_vbe7vPF5SShvUvvdpnW2Savs0UlI3z8OrFijuUAE.jpg', '{}', NULL, NULL, '2025-10-08', '2025-10-14 02:43:07', '2025-10-18 02:50:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(4, 3, '069565956', 'Camgotech', 'male', 35, 'ID_CARD', '/users/CamGoTech_AxL0HhwPIKsHeC9fRaDWMgmEVdBjUB252bxU04ML.jpg', NULL, '00012345', 'Phnom Penh', NULL, NULL, '{\"houseNumber\":\"123B\",\"streetNumber\":\"St. 46\",\"teamNumber\":\"\\u17e8\",\"phum\":\"\\u17e6\",\"sangkat\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17be\\u1798\\u1782\\u179a\",\"khan\":\"\\u1791\\u17bd\\u179b\\u1782\\u17c4\\u1780\"}', 'accept', 'agree', '2025-10-10', '2025-10-16 07:12:47', '2025-10-31 06:59:29', NULL, 'បរិញ្ញាបត្រ', 'Camgotech', '2000-11-11', 'single', NULL, 'អ្នកគ្រប់គ្រង', 'Book', '{\"motherAge\":\"\\u17e5\\u17e5\",\"motherJob\":\"\\u17a2\\u17b6\\u1787\\u17b8\\u179c\\u1780\\u179a\",\"motherName\":\"\\u179a\\u179f\\u17d2\\u1798\\u17b8\"}', '{\"fatherAge\":\"\\u17e6\\u17e0\",\"fatherJob\":\"\\u1798\\u1793\\u17d2\\u178f\\u17d2\\u179a\\u17b8\\u179a\\u17b6\\u1787\\u1780\\u17b6\\u179a\",\"fatherName\":\"\\u178f\\u17b6\\u179a\\u17b6\"}', '{\"birthCity\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789\",\"birthHouseNumber\":\"168\",\"birthKhan\":\"\\u1791\\u17bd\\u179b\\u1782\\u17c4\\u1780\",\"birthPhum\":\"2\",\"birthSangkat\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17c1\\u1794\\u17c9\\u17bc\\u17e3\",\"birthStreetNumber\":\"199\",\"birthTeamNumber\":\"1\"}', '{\"khmerDay\":\"\\u17e3\\u17e1\",\"khmerMonth\":\"\\u178f\\u17bb\\u179b\\u17b6\",\"khmerYear\":\"\\u17e2\\u17e0\\u17e2\\u17e5\",\"khmerYears\":\"\\u17e2\\u17e5\\u17e4\\u17e8\",\"latinDay\":\"\\u17e0\\u17e1\",\"latinMonth\":\"\\u179c\\u17b7\\u1785\\u17d2\\u1786\\u1780\\u17b6\\u179a\",\"latinYear\":\"\\u17e2\\u17e0\\u17e2\\u17e5\",\"placeDo\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789\"}'),
(5, 31, '+855 17843304', 'ភឹម​ ផាន់ណា', 'male', 19, 'ID_CARD', NULL, '/users/CamGoTech_IqWTonMBUErxPBNW3z9OSPS5hnLT6XPXnpPzoM9v.jpg', '12345678', 'Battambang', NULL, 'https://res.cloudinary.com/dufghzvge/image/upload/v1719182746/default-profile-picture-avatar-photo-placeholder-vector-illustration-default-profile-picture-avatar-photo-placeholder-vector-189495158_hyq2qt.webp', '{\"houseNumber\":\"33\",\"streetNumber\":\"225\",\"teamNumber\":\"\\u17e1\\u17e0\",\"phum\":\"\\u1791\\u17bd\\u179b\",\"sangkat\":\"\\u179f\\u1780\\u17b6\\u179a\",\"khan\":\"\\u1781\\u17b6\\u1784\"}', 'accept', 'disagree', '2025-10-22', '2025-10-28 07:57:46', '2025-10-30 07:24:49', 'PHOEM SOPHANNA', 'បាក់ឌុប', 'TEST', '2025-10-22', 'single', '2025-10-16', 'Developer', 'កម្រិតខ្សោយ', '{\"motherAge\":\"13\",\"motherJob\":\"\\u1780\\u17b6\\u179a\\u1784\\u17b6\\u179a\",\"motherName\":\"\\u1788\\u17d2\\u1798\\u17c4\\u17c7 \\u1781\"}', '{\"fatherAge\":\"12\",\"fatherJob\":\"\\u1780\\u17b6\\u179a\\u1784\\u17b6\\u179a\",\"fatherName\":\"\\u1788\\u17d2\\u1798\\u17c4\\u17c7 \\u1780\"}', '{\"birthCity\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789\",\"birthHouseNumber\":\"213\",\"birthKhan\":\"\\u1794\\u17b6\\u1780\\u17cb\\u1791\\u17bc\\u1780\",\"birthPhum\":\"\\u1791\\u17bd\\u179b\",\"birthSangkat\":\"\\u179f\\u1784\\u17d2\\u1780\\u17c1\\u179a\",\"birthStreetNumber\":\"100\",\"birthTeamNumber\":\"10\"}', '{\"khmerDay\":\"\\u1796\\u17bb\\u1792\",\"khmerMonth\":\"\\u17a2\\u1784\\u17d2\\u1780\\u17b6\\u179a\",\"khmerYear\":\"\\u179c\\u1780\",\"khmerYears\":\"\\u17e2\\u17e4\\u17e5\\u17e6\",\"latinDay\":\"10\",\"latinMonth\":\"11\",\"latinYear\":\"2025\",\"placeDo\":\"\\u179a\\u17b6\\u1787\\u1792\\u17b6\\u1793\\u17b8\\u200b \\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789\"}'),
(6, 38, '០១២៣៤៥៦៧៨', 'សុវណ្ណដារា', 'male', 35, 'ID_CARD', NULL, '/users/CamGoTech_wUyKqzsnBkW2mlnKlyH9E7zjFyKVCQE97gXgTwzF.jpg', '00012345', 'Phnom Penh', NULL, NULL, '{\"houseNumber\":\"123B\",\"streetNumber\":\"St. 46\",\"teamNumber\":\"\\u17e8\",\"phum\":\"\\u17e6\",\"sangkat\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17be\\u1798\\u1782\\u179a\",\"khan\":\"\\u1791\\u17bd\\u179b\\u1782\\u17c4\\u1780\"}', 'accept', 'disagree', '2025-11-11', '2025-10-31 07:13:08', '2025-10-31 07:15:10', 'Sovanndara', NULL, NULL, NULL, 'marry', NULL, NULL, NULL, '{\"motherAge\":null,\"motherJob\":null,\"motherName\":null}', '{\"fatherAge\":null,\"fatherJob\":null,\"fatherName\":null}', '{\"birthCity\":null,\"birthHouseNumber\":null,\"birthKhan\":null,\"birthPhum\":null,\"birthSangkat\":null,\"birthStreetNumber\":null,\"birthTeamNumber\":null}', '{\"khmerDay\":null,\"khmerMonth\":null,\"khmerYear\":null,\"khmerYears\":null,\"latinDay\":null,\"latinMonth\":null,\"latinYear\":null,\"placeDo\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `user_likes`
--

CREATE TABLE `user_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_likes`
--

INSERT INTO `user_likes` (`id`, `userId`, `campaignId`, `created_at`, `updated_at`) VALUES
(1, 3, 12, '2024-09-02 21:06:23', '2024-09-02 21:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_shares`
--

CREATE TABLE `user_shares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `shareWith` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_shares`
--

INSERT INTO `user_shares` (`id`, `userId`, `campaignId`, `shareWith`, `created_at`, `updated_at`) VALUES
(7, 5, 11, 'FACEBOOK', '2024-08-27 15:34:03', '2024-08-27 15:34:03'),
(8, 3, 12, 'FACEBOOK', '2024-09-02 21:06:29', '2024-09-02 21:06:29'),
(9, 3, 12, 'TWITTER', '2024-09-02 21:06:33', '2024-09-02 21:06:33'),
(10, 3, 12, 'TELEGRAM', '2024-09-02 21:06:35', '2024-09-02 21:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `verification_codes`
--

CREATE TABLE `verification_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `verifiable` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verification_codes`
--

INSERT INTO `verification_codes` (`id`, `code`, `verifiable`, `expires_at`, `created_at`, `updated_at`) VALUES
(5, '$2y$10$rak5IvqO6KRi/seAtidw..mo0BgYinRYPe9MQQ828wUDfS974X4N6', 'cda.cheeboreth@gmail.com', '2024-07-21 11:37:28', '2024-07-21 10:37:28', '2024-07-21 10:37:28'),
(6, '$2y$10$CqRRfPWDVIS3Hpq8Nlawye.K7TOFTqZXLTn6qe2Fs3rO0qrj2nEHu', 'sokseri168@gmail.com', '2024-07-22 07:42:25', '2024-07-22 06:42:25', '2024-07-22 06:42:25'),
(9, '$2y$10$OytFwhsV6vEJSP3pxt0wI.KRdO4sZxoGjbJxk9OAziCnCp/gL7rFC', 'tvutha007@gmail.com', '2025-09-25 02:55:31', '2025-09-25 01:55:31', '2025-09-25 01:55:31'),
(10, '$2y$10$5aeIdU5f.kSbpLagsUfez.mjJOGHsklgLgTtiqy5WDVvsqEFgV7NW', 'jonh.star@gmail.com', '2025-10-03 04:37:46', '2025-10-03 03:37:46', '2025-10-03 03:37:46'),
(11, '$2y$10$RAe4eDIT8BSsfqyBEaIvxu4zu6Iq1mW1fcqNFpa2asiJCCqPqAQU6', 'tv.vutha@gmail.com', '2025-10-03 04:37:54', '2025-10-03 03:37:54', '2025-10-03 03:37:54'),
(15, '$2y$10$fs8E7JYSoKiXfnye1vMEgeQY4pkgWDqaNHmO5qGVJ8.n0TxQ/1.AG', 'test@gmail.com', '2025-10-16 01:35:33', '2025-10-16 00:35:33', '2025-10-16 00:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `link` varchar(191) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `link`, `isActive`, `ordering`, `created_at`, `updated_at`) VALUES
(1, 'https://web.facebook.com/103090007737902/videos/315427957004907', 1, 1, '2025-10-26 15:19:19', '2025-10-26 15:22:04'),
(3, 'https://www.facebook.com/100069908061589/videos/640012702105160', 1, 1, '2025-11-01 09:06:32', '2025-11-01 09:06:32');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaignId` bigint(20) NOT NULL,
  `requestBy` bigint(20) NOT NULL,
  `approveBy` bigint(20) DEFAULT NULL,
  `requestAmount` double NOT NULL,
  `accountName` varchar(255) NOT NULL,
  `accountNumber` varchar(255) NOT NULL,
  `withdrawStatus` varchar(255) NOT NULL,
  `requestDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approveDate` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `campaignId`, `requestBy`, `approveBy`, `requestAmount`, `accountName`, `accountNumber`, `withdrawStatus`, `requestDate`, `approveDate`, `created_at`, `updated_at`) VALUES
(1, 12, 5, 1, 200, 'Tep Vutha', '000678188', 'APPROVE', '2024-09-08 13:33:09', '2024-09-09 00:33:09', '2024-09-08 18:45:41', '2024-09-09 00:33:09'),
(2, 12, 5, 26, 1000, 'Tep Vutha', '000678188', 'REJECT', '2024-09-08 13:54:11', '2024-09-09 00:54:11', '2024-09-09 00:45:08', '2024-09-09 00:54:11'),
(3, 12, 5, 1, 1096, 'Tep Vutha', '000678188', 'APPROVE', '2024-09-08 14:12:42', '2024-09-09 01:12:42', '2024-09-09 01:05:09', '2024-09-09 01:12:42'),
(4, 12, 5, 1, 600, 'Vutha Tep', '000689188', 'REJECT', '2024-09-08 14:32:07', '2024-09-09 01:32:07', '2024-09-09 01:07:36', '2024-09-09 01:32:07'),
(5, 12, 5, 1, 1000, 'Tep Vutha', '000678188', 'APPROVE', '2024-09-08 14:27:36', '2024-09-09 01:27:36', '2024-09-09 01:13:56', '2024-09-09 01:27:36'),
(6, 17, 5, 26, 50, 'Tep Vutha', '000678188', 'REJECT', '2024-09-08 14:30:17', '2024-09-09 01:30:17', '2024-09-09 01:29:30', '2024-09-09 01:30:17'),
(7, 17, 5, 26, 150, 'Tep Vutha', '000678188', 'APPROVE', '2024-09-08 14:32:50', '2024-09-09 01:32:50', '2024-09-09 01:31:50', '2024-09-09 01:32:50'),
(8, 22, 26, 26, 20, 'Chee Boreth', '123456789', 'APPROVE', '2024-09-13 10:47:40', '2024-09-13 21:47:40', '2024-09-13 21:45:54', '2024-09-13 21:47:40'),
(9, 17, 5, NULL, 457, 'TEP VUTHA', '000678188', 'PENDING', '2024-10-13 19:38:41', NULL, '2024-10-13 19:38:41', '2024-10-13 19:38:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_categories`
--
ALTER TABLE `campaign_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feeds`
--
ALTER TABLE `feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_banners`
--
ALTER TABLE `page_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_categories`
--
ALTER TABLE `project_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technologies`
--
ALTER TABLE `technologies`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_informations`
--
ALTER TABLE `user_informations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_likes`
--
ALTER TABLE `user_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_shares`
--
ALTER TABLE `user_shares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `campaign_categories`
--
ALTER TABLE `campaign_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feeds`
--
ALTER TABLE `feeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `page_banners`
--
ALTER TABLE `page_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `performances`
--
ALTER TABLE `performances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_categories`
--
ALTER TABLE `project_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `technologies`
--
ALTER TABLE `technologies`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user_informations`
--
ALTER TABLE `user_informations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_likes`
--
ALTER TABLE `user_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_shares`
--
ALTER TABLE `user_shares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `verification_codes`
--
ALTER TABLE `verification_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
