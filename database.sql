-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-06-27 14:55:49
-- 服务器版本： 8.0.24
-- PHP 版本： 8.0.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- 表的结构 `admin_code_generators`
--

DROP TABLE IF EXISTS `admin_code_generators`;
CREATE TABLE `admin_code_generators` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名',
  `primary_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'id' COMMENT '主键名',
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模型名',
  `controller_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '服务名',
  `columns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段信息',
  `need_timestamps` tinyint NOT NULL DEFAULT '0' COMMENT '是否需要时间戳',
  `soft_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否需要软删除',
  `needs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '需要生成的代码',
  `menu_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '菜单信息',
  `page_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '页面信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `admin_extensions`
--

DROP TABLE IF EXISTS `admin_extensions`;
CREATE TABLE `admin_extensions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_enabled` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_extensions`
--

INSERT INTO `admin_extensions` (`id`, `name`, `is_enabled`, `created_at`, `updated_at`) VALUES
(2, 'slowlyo.owl-amis-json-parse', 1, '2023-04-20 09:33:23', '2023-04-20 09:33:23');

-- --------------------------------------------------------

--
-- 表的结构 `admin_menus`
--

DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE `admin_menus` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单路由',
  `url_type` tinyint NOT NULL DEFAULT '1' COMMENT '路由类型(1:路由,2:外链)',
  `visible` tinyint NOT NULL DEFAULT '1' COMMENT '是否可见',
  `is_home` tinyint(1) DEFAULT '0' COMMENT '是否为首页',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `parent_id`, `order`, `title`, `icon`, `url`, `url_type`, `visible`, `is_home`, `extension`, `created_at`, `updated_at`) VALUES
(1, 0, 0, '首页', 'ph:chart-line-up-fill', '/dashboard', 1, 1, 1, NULL, NULL, NULL),
(2, 0, 3, '系统管理', 'material-symbols:settings-outline', '/system', 1, 1, 0, NULL, NULL, '2023-01-31 14:54:21'),
(3, 2, 0, '管理员', 'ph:user-gear', '/system/admin_users', 1, 1, 0, NULL, NULL, NULL),
(4, 2, 0, '角色', 'carbon:user-role', '/system/admin_roles', 1, 1, 0, NULL, NULL, NULL),
(5, 2, 0, '权限', 'fluent-mdl2:permissions', '/system/admin_permissions', 1, 1, 0, NULL, NULL, NULL),
(6, 2, 0, '菜单', 'ant-design:menu-unfold-outlined', '/system/admin_menus', 1, 1, 0, NULL, NULL, NULL),
(8, 0, 1, '组件示例', 'material-symbols:border-all-rounded', '/example', 1, 1, 0, NULL, '2022-09-06 18:32:40', '2023-01-31 14:54:21'),
(10, 8, 90, '表单展示模式', 'ph:circle', '/example/form', 1, 1, 0, NULL, '2022-09-06 19:05:57', '2022-09-06 19:05:57'),
(11, 8, 0, '显隐切换示例', 'ph:circle', '/example/reaction', 1, 1, 0, NULL, '2022-09-06 19:16:26', '2022-09-06 19:16:34'),
(12, 8, 0, '条件生成器', 'ph:circle', '/example/condition_builder', 1, 1, 0, NULL, '2022-09-06 19:20:12', '2022-09-06 19:20:12'),
(13, 8, 0, '弹框', 'ph:circle', '/example/dialog', 1, 1, 0, NULL, '2022-09-06 19:23:46', '2022-09-06 19:23:46'),
(14, 8, 0, '选项卡', 'ph:circle', '/example/tabs', 1, 1, 0, NULL, '2022-09-06 19:23:46', '2022-09-06 19:23:46'),
(15, 8, 0, '步骤表单', 'ph:circle', '/example/wizard', 1, 1, 0, NULL, '2022-09-06 19:23:46', '2022-09-06 19:23:46'),
(17, 0, 91, 'amis json 解析', 'mdi:code-json', '/slow-amis-json-parse', 1, 1, 0, 'slowlyo.owl-amis-json-parse', '2023-04-20 09:33:23', '2023-04-20 09:33:23');

-- --------------------------------------------------------

--
-- 表的结构 `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `order`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, '首页', '76db1057-aab8-4fd3-bd19-48a87502ec40', NULL, '[\"/dashboard*\"]', 0, 0, NULL, NULL),
(2, '系统管理', 'c9450b0a-2301-44ec-a572-04be23fa7e4e', NULL, '[\"/system*\"]', 3, 0, NULL, '2023-01-31 14:54:21'),
(3, '管理员', 'ef66d833-7245-437e-b14b-9f0bc6009181', NULL, '[\"/system/admin_users*\"]', 0, 2, NULL, NULL),
(4, '角色', '015070ca-85e5-4c8f-89c9-a8fc2e9d029d', NULL, '[\"/system/admin_roles*\"]', 0, 2, NULL, NULL),
(5, '权限', 'c4a37072-ddce-4b68-a151-6375241c6633', NULL, '[\"/system/admin_permissions*\"]', 0, 2, NULL, NULL),
(6, '菜单', '98c1348b-e456-430f-9435-9f761c7aba69', NULL, '[\"/system/admin_menus*\"]', 0, 2, NULL, NULL),
(7, '所有组件', 'db311d60-011a-4777-8f1d-67573723b50a', NULL, '[\"/https://aisuda.bce.baidu.com/amis/examples/index*\"]', 2, 0, '2022-08-28 05:53:46', '2023-01-31 14:54:21'),
(8, '组件示例', '75cadeb7-9590-4c7b-bd5c-5ed1a90d578d', NULL, '[\"/example*\"]', 1, 0, '2022-09-06 18:32:40', '2023-01-31 14:54:21'),
(9, '所有Form示例', '7573f77c-358b-400a-9293-20922d9d756f', NULL, '[\"/example/form_all*\"]', 0, 8, '2022-09-06 18:34:10', '2022-09-06 19:05:12'),
(10, '表单展示模式', '4a8496ad-db93-4388-a5f9-2771f01896e7', NULL, '[\"/example/form*\"]', 90, 8, '2022-09-06 19:05:57', '2022-09-06 19:05:57'),
(11, '显隐切换示例', '5d654300-fafd-4408-9ead-1ff7aedcd017', NULL, '[\"/example/reaction*\"]', 0, 8, '2022-09-06 19:16:26', '2022-09-06 19:16:34'),
(12, '条件生成器', '412aaabc-0297-4929-9beb-e0f94feffb7d', NULL, '[\"/example/condition_builder*\"]', 0, 8, '2022-09-06 19:20:12', '2022-09-06 19:20:12'),
(13, '弹框', 'eb0bd254-971f-4eb0-ab0f-847f47297bba', NULL, '[\"/example/dialog*\"]', 0, 8, '2022-09-06 19:23:46', '2022-09-06 19:23:46'),
(14, '选项卡', '58343f2b-8658-4d90-a136-ab117e67e5a3', NULL, '[\"/example/tabs*\"]', 0, 8, '2022-09-06 19:23:46', '2022-09-06 19:23:46'),
(15, '步骤表单', '14133c68-e8df-451f-b2ac-53fbc8a93e30', NULL, '[\"/example/wizard*\"]', 0, 8, '2022-09-06 19:23:46', '2022-09-06 19:23:46');

-- --------------------------------------------------------

--
-- 表的结构 `admin_permission_menu`
--

DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu` (
  `permission_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_permission_menu`
--

INSERT INTO `admin_permission_menu` (`permission_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 3, NULL, NULL),
(3, 2, NULL, NULL),
(4, 4, NULL, NULL),
(4, 2, NULL, NULL),
(5, 5, NULL, NULL),
(5, 2, NULL, NULL),
(6, 6, NULL, NULL),
(6, 2, NULL, NULL),
(7, 7, NULL, NULL),
(8, 8, NULL, NULL),
(9, 9, NULL, NULL),
(9, 8, NULL, NULL),
(10, 10, NULL, NULL),
(10, 8, NULL, NULL),
(11, 11, NULL, NULL),
(11, 8, NULL, NULL),
(12, 12, NULL, NULL),
(12, 8, NULL, NULL),
(13, 13, NULL, NULL),
(13, 8, NULL, NULL),
(14, 14, NULL, NULL),
(14, 8, NULL, NULL),
(15, 15, NULL, NULL),
(15, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, '超级管理员', 'administrator', '2022-09-06 18:21:39', '2022-09-06 18:21:39');

-- --------------------------------------------------------

--
-- 表的结构 `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-09-06 18:21:39', '2022-09-06 18:21:39'),
(1, 9, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 11, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 12, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 13, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 14, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 15, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 10, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 7, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 3, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 4, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 5, '2023-06-16 08:51:21', '2023-06-16 08:51:21'),
(1, 6, '2023-06-16 08:51:21', '2023-06-16 08:51:21');

-- --------------------------------------------------------

--
-- 表的结构 `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-09-06 18:21:39', '2022-09-06 18:21:39');

-- --------------------------------------------------------

--
-- 表的结构 `admin_settings`
--

DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE `admin_settings` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `admin_settings`
--

INSERT INTO `admin_settings` (`key`, `values`, `created_at`, `updated_at`) VALUES
('system_theme_setting', '{\"footer\":false,\"breadcrumb\":true,\"breadcrumbIcon\":false,\"themeColor\":\"#4080FF\",\"menuWidth\":220,\"layoutMode\":\"default\",\"siderTheme\":\"light\",\"topTheme\":\"light\",\"animateInType\":\"alpha\",\"animateInDuration\":550,\"animateOutType\":\"alpha\",\"animateOutDuration\":450,\"loginTemplate\":\"default\",\"keepAlive\":false,\"enableTab\":true,\"tabIcon\":true}', NULL, '2023-06-26 20:01:15');

-- --------------------------------------------------------

--
-- 表的结构 `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$0fX8bsGcG03Vg.PO32hW0enGbpaD6tHlQ/CWTAH5hzNztkijRbf1u', '超级管理员', NULL, NULL, '2022-09-06 18:21:39', '2022-09-06 18:21:39');

-- --------------------------------------------------------

--
-- 表的结构 `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `view` int NOT NULL COMMENT '阅读量',
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `view`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '123', '123', 123, '123', '2022-08-24 18:18:24', '2022-08-24 18:18:32', '2022-08-24 18:18:32');

-- --------------------------------------------------------

--
-- 表的结构 `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `user_id` int NOT NULL COMMENT '用户',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `messages`
--

INSERT INTO `messages` (`id`, `title`, `body`, `image`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '2', '3', 4, '2022-08-24 06:09:01', '2022-08-24 06:09:47', '2022-08-24 06:09:47'),
(2, '1', '2', '3', 4, '2022-08-24 06:09:39', '2022-08-24 06:09:42', '2022-08-24 06:09:42');

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_08_22_203040_install_slow_admin', 1);

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`, `expires_at`) VALUES
(29, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '99f8382ebc33796e1eb688c3bb2b67286600d9ef268d4a0a87e75271c870cb2e', '[\"*\"]', '2023-03-04 13:53:16', '2023-03-04 13:12:29', '2023-03-04 13:53:16', NULL),
(30, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '10bc282e5e0aff6158c0675c7d53badf1ebe859e023a8a09f2b4def9c4a99c0c', '[\"*\"]', '2023-03-10 13:50:36', '2023-03-10 12:17:23', '2023-03-10 13:50:36', NULL),
(31, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '204fa48224ad3ea9d3798c2926432c50dd2c82ddb51b4eb5332146bfb73050ba', '[\"*\"]', '2023-03-29 12:39:32', '2023-03-29 12:36:55', '2023-03-29 12:39:32', NULL),
(32, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9b2d881a74a207aa7fd94ad8a124b52fc2766d093e2b2ec674c1a9486eb3acf4', '[\"*\"]', '2023-04-04 14:13:20', '2023-03-29 12:38:05', '2023-04-04 14:13:20', NULL),
(33, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2256f00d92c1167a96f0cf1e78e197873e8ab291b32912cfd8806c1da63583bf', '[\"*\"]', '2023-03-29 12:48:05', '2023-03-29 12:46:27', '2023-03-29 12:48:05', NULL),
(34, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e3a4be0086629359524598e2a594fc4154af1378149cb25cc93d2b997480b827', '[\"*\"]', '2023-03-29 13:39:03', '2023-03-29 13:17:40', '2023-03-29 13:39:03', NULL),
(35, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '60ef42cb1e2a7ba202398cfb02217c79fef5a6ea9e4fd354e484f51d4648b189', '[\"*\"]', '2023-03-30 14:42:53', '2023-03-29 14:36:44', '2023-03-30 14:42:53', NULL),
(36, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e8e1db5340ae16ea69204a858d77adae1b4dbf78fa0ba506dee17861f702c11f', '[\"*\"]', '2023-03-30 13:25:46', '2023-03-30 13:25:00', '2023-03-30 13:25:46', NULL),
(37, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'bc808abc89f7eeb6cd88b49cdc928667bb0d85570204e7a0f4247ff4c983356f', '[\"*\"]', '2023-03-30 13:30:49', '2023-03-30 13:30:27', '2023-03-30 13:30:49', NULL),
(38, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4514dc3c4b25cd3f6d46071279dd62057f74063a330045df74bd9e511a299877', '[\"*\"]', '2023-04-02 07:52:35', '2023-04-02 07:45:09', '2023-04-02 07:52:35', NULL),
(39, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '61ff821d471aee0db40d1e19770353e80869bd4c5b4da998d4bac688be72d26e', '[\"*\"]', '2023-04-02 08:21:24', '2023-04-02 08:20:40', '2023-04-02 08:21:24', NULL),
(40, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'fd9c12b5ea0bce71aea7233d45e24517c11a441c6cb883c814ec30e3bdf2d71e', '[\"*\"]', '2023-04-02 08:32:21', '2023-04-02 08:31:28', '2023-04-02 08:32:21', NULL),
(41, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7ec8c9504e599da5cd919420635a92f3a57d5eb9b078a7706a418d04496ee0fa', '[\"*\"]', '2023-04-12 01:42:38', '2023-04-08 14:54:05', '2023-04-12 01:42:38', NULL),
(42, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'b840cb40fef9e9e8b5b83e85de67e0c8e7f69e72c34bf96357d76ac655de17bd', '[\"*\"]', '2023-06-09 07:49:35', '2023-04-12 01:56:44', '2023-06-09 07:49:35', NULL),
(43, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f638ff60cb2d86251b6d4b39eda0afd70361df63e64b3c9ce456caba26b04248', '[\"*\"]', '2023-04-12 03:22:27', '2023-04-12 02:33:03', '2023-04-12 03:22:27', NULL),
(44, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '23a4dcb9425c2df0a0c5fddef83ccf35cd66cdb78a4609e51db644ce09a80a39', '[\"*\"]', '2023-05-30 14:59:38', '2023-04-20 09:26:28', '2023-05-30 14:59:38', NULL),
(45, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '884d7b5767c39c0dc053f94c29d0c0ac2bfc03a5af85ca99153a2dbeae64caac', '[\"*\"]', '2023-04-21 01:36:10', '2023-04-21 01:34:26', '2023-04-21 01:36:10', NULL),
(46, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '992c460b6cc5f7bfa9ed23ed91da450c99c50e0ecb84d628545b2846df96e5c1', '[\"*\"]', '2023-04-27 07:42:00', '2023-04-27 07:41:57', '2023-04-27 07:42:00', NULL),
(49, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2c57e71102dec294498b95d31dcb3310298b449079c0cca3215483f248a25c50', '[\"*\"]', '2023-06-20 12:07:03', '2023-06-09 08:18:42', '2023-06-20 12:07:03', NULL),
(50, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3949e431da38711ff4c52306e2e69a1d98e59f9f85504fbedcdd4e10925b3477', '[\"*\"]', '2023-06-09 09:22:39', '2023-06-09 09:21:36', '2023-06-09 09:22:39', NULL),
(51, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '1790d270ab5f43dec8318180a1f9d1be44536d9252fd95ccb7f7f9df06fe6cf4', '[\"*\"]', '2023-06-09 09:34:32', '2023-06-09 09:31:57', '2023-06-09 09:34:32', NULL),
(52, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '093c46197097a3af8e57540b6fae7d8bbbafbeebc7cb46ee0a67f3862a99c442', '[\"*\"]', '2023-06-09 12:22:38', '2023-06-09 12:15:58', '2023-06-09 12:22:38', NULL),
(53, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2e2a120060277588c5bc4442e59341ee8edfa88222ba2b620100fae1d04cceb8', '[\"*\"]', '2023-06-09 13:13:25', '2023-06-09 13:12:56', '2023-06-09 13:13:25', NULL),
(54, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '22518b4c4cba26537085fc6a289feade75004d1c3b6c771a57978899a43e6296', '[\"*\"]', '2023-06-09 13:27:32', '2023-06-09 13:27:05', '2023-06-09 13:27:32', NULL),
(55, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '47ad0d5ba25df4e274a221c74addb416ac8e79a709b3b316e68169cfa0fcf3aa', '[\"*\"]', '2023-06-26 07:05:18', '2023-06-09 14:53:33', '2023-06-26 07:05:18', NULL),
(56, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3c16ecf565b5970f2b14fff8e59cdbe7ad7b2d9eeacf4e0a3380a7210fea6189', '[\"*\"]', '2023-06-10 02:17:36', '2023-06-10 02:17:16', '2023-06-10 02:17:36', NULL),
(57, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7250b17663fe61c4d8527f209ad1e28abb594298277985c3d8eae0e5175a09d8', '[\"*\"]', '2023-06-10 08:01:44', '2023-06-10 08:01:32', '2023-06-10 08:01:44', NULL),
(58, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2de99077be706e3a2ddd579842a577fae88526c6655481a129cef0a4c623c7cb', '[\"*\"]', '2023-06-25 01:00:54', '2023-06-10 08:59:46', '2023-06-25 01:00:54', NULL),
(59, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '6fa51143c99aca469ba71f42b561ac3070c9846cd676bae08227edc00600e527', '[\"*\"]', '2023-06-10 09:38:32', '2023-06-10 09:38:29', '2023-06-10 09:38:32', NULL),
(60, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '07148d30d171336ff5dcf544009e42a041b76e18d926c4f545e220f739cb13a7', '[\"*\"]', '2023-06-10 14:11:46', '2023-06-10 14:10:03', '2023-06-10 14:11:46', NULL),
(61, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'b44a6c299de4d265e2d36ad392c3ba177642d6ff1a6acf21e953e2c091508390', '[\"*\"]', '2023-06-10 16:37:29', '2023-06-10 16:31:37', '2023-06-10 16:37:29', NULL),
(62, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7acebe06430bd3a09a845ef6b2b4d931f67c075d7fd69f4dd1364f67c21b25cc', '[\"*\"]', '2023-06-10 16:52:57', '2023-06-10 16:51:03', '2023-06-10 16:52:57', NULL),
(63, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3c4d5d4a9ac642e8d1348763e10108f27c5f22d29d567af99555642f0ca45b78', '[\"*\"]', '2023-06-11 00:29:03', '2023-06-11 00:28:50', '2023-06-11 00:29:03', NULL),
(64, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'ad52cd2ca163ae7835b400400492d5d16306f26a33eb9c5d07990f428302bab5', '[\"*\"]', '2023-06-11 06:55:51', '2023-06-11 06:55:45', '2023-06-11 06:55:51', NULL),
(65, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '46277405834813121eddf6cdde87b0107c57a1740adde41a841e932a6a390625', '[\"*\"]', '2023-06-11 07:38:52', '2023-06-11 07:38:34', '2023-06-11 07:38:52', NULL),
(66, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'd5f612c50c21d67d2b9a662a5cba7d99d5b951b9946a744e71bebc474036ffe1', '[\"*\"]', '2023-06-11 08:01:52', '2023-06-11 07:59:00', '2023-06-11 08:01:52', NULL),
(67, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '872a5c95a687933ecfa7988a09980c184af4ef421a7b772fb4fed5960b497f1d', '[\"*\"]', '2023-06-11 16:28:58', '2023-06-11 12:24:42', '2023-06-11 16:28:58', NULL),
(68, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'c098aba7177c7c472d59eb6c2c11a3be02de0c6d10f0c88865c972552569aaae', '[\"*\"]', '2023-06-12 00:52:49', '2023-06-12 00:43:02', '2023-06-12 00:52:49', NULL),
(69, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '0719a2e3ccbe4eac9a6bc849e6be79a4987cc9d2549bcfadfc0ce1abad492440', '[\"*\"]', '2023-06-12 02:40:31', '2023-06-12 02:34:12', '2023-06-12 02:40:31', NULL),
(70, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e74d9a2ade1daee8257520e176a509c1abc6bb605fa16b4c97b77746705ab228', '[\"*\"]', '2023-06-12 04:12:10', '2023-06-12 04:11:13', '2023-06-12 04:12:10', NULL),
(71, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'aa7d6a300894f338c5b0f0107ff72a6319ade4e7cb4b7a7e4d02651749cb085d', '[\"*\"]', '2023-06-12 05:16:17', '2023-06-12 05:06:43', '2023-06-12 05:16:17', NULL),
(72, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '398daa891a5162bf739b6f29848375a62ea483a2f2547f536396363fad58dbe1', '[\"*\"]', '2023-06-14 08:08:06', '2023-06-12 08:00:17', '2023-06-14 08:08:06', NULL),
(73, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '1c839976d0d6efc664f92c4e47f9edb58e6a062dc4c626bcdc3210d0c0e1c801', '[\"*\"]', '2023-06-12 09:23:46', '2023-06-12 09:18:44', '2023-06-12 09:23:46', NULL),
(74, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '642c5d3f5bb774699a0788aa0f37fb32977d8b1c96c2d565153f262805d82888', '[\"*\"]', '2023-06-12 10:04:15', '2023-06-12 10:03:57', '2023-06-12 10:04:15', NULL),
(75, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4cf5b57797f2698304034b3498a78fc54b7d3258d9ffc0b68ce76e0c2b6f10ed', '[\"*\"]', '2023-06-12 11:21:50', '2023-06-12 11:19:18', '2023-06-12 11:21:50', NULL),
(76, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f8b57eda80a835e8ee6ab8734cbde0981fef1bfd46c4b9938e6f63a5ac0f2a1d', '[\"*\"]', '2023-06-12 15:34:51', '2023-06-12 11:42:12', '2023-06-12 15:34:51', NULL),
(77, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '8efaf64733eb93ee7b4d6c46a1fa7897c847dbbbd6fffa31b33fc8b0919b2b92', '[\"*\"]', '2023-06-16 01:44:18', '2023-06-13 02:54:32', '2023-06-16 01:44:18', NULL),
(78, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'dba7677123193fbeccaa1da87e54955cf8abb74d46d4260df30ff09aaf048fb1', '[\"*\"]', '2023-06-19 06:20:50', '2023-06-13 03:07:50', '2023-06-19 06:20:50', NULL),
(79, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9b9d27ce41fc595fa12a564d165ce10ee55d2557e277a0a036b2b188a7ac04e3', '[\"*\"]', '2023-06-13 07:49:40', '2023-06-13 03:36:34', '2023-06-13 07:49:40', NULL),
(80, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '8de66602f1859444fc5f3d5186b1e01e5dc4ea51a40bfe2b16adf016627b68ba', '[\"*\"]', '2023-06-13 04:36:42', '2023-06-13 04:36:03', '2023-06-13 04:36:42', NULL),
(81, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '6fd35703e73630d093b2cf477b9fc3989ef0f85df6ce510bfae65e5248756a29', '[\"*\"]', '2023-06-25 08:33:13', '2023-06-13 07:45:14', '2023-06-25 08:33:13', NULL),
(82, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2d2a0d56a8b208e87e88749655566a8151212dff659b39a75febcbca5d13d18e', '[\"*\"]', '2023-06-13 07:53:52', '2023-06-13 07:52:53', '2023-06-13 07:53:52', NULL),
(83, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e82c9b7009ee32766c2c54f5b330865f8f8c9ab7a505b9adf7be1a9e34d0f5e7', '[\"*\"]', '2023-06-25 23:40:34', '2023-06-13 08:36:57', '2023-06-25 23:40:34', NULL),
(84, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'bde13adb5d7b456e0b1d8a120a2324c02db7ec6165976d26a5edfb48bce509ab', '[\"*\"]', '2023-06-13 09:20:38', '2023-06-13 09:18:19', '2023-06-13 09:20:38', NULL),
(85, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2ef918361163d0ef245e3dce9d0bd99717cefcbfed775da32802a14bbc282287', '[\"*\"]', '2023-06-16 07:31:37', '2023-06-13 10:14:41', '2023-06-16 07:31:37', NULL),
(86, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a4ffd2c6fdced9025f8c57f2ec613e5d82d9c03e6c8d325f0a30d14ea26097b8', '[\"*\"]', '2023-06-26 11:09:21', '2023-06-13 11:46:13', '2023-06-26 11:09:21', NULL),
(87, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '0fdba429c9f8a8d38c62946c9d36f6e04ac502cf8fbfc6d85c46b2a1b4a65258', '[\"*\"]', '2023-06-13 13:19:05', '2023-06-13 13:18:16', '2023-06-13 13:19:05', NULL),
(88, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '1b16f73c9a77544f74726f092bb9675dcf952115455b149489089e6c81dbd8d4', '[\"*\"]', '2023-06-13 13:59:32', '2023-06-13 13:58:51', '2023-06-13 13:59:32', NULL),
(89, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '6565a6088c4f8305d42474a38b49cfc4b4af4dcdfe3a36e6c83f728440d3e12c', '[\"*\"]', '2023-06-25 16:04:33', '2023-06-13 14:05:53', '2023-06-25 16:04:33', NULL),
(90, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '404850e184795ae126b28e5d8f6c5d7cad95f8471df72b0386037aa5c43c4167', '[\"*\"]', '2023-06-14 00:52:38', '2023-06-14 00:52:09', '2023-06-14 00:52:38', NULL),
(91, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'c46b1a41942a6e6cea24c1313750c115c14f33b7c2fb0f19deb776c875d91faa', '[\"*\"]', '2023-06-14 01:50:05', '2023-06-14 01:26:41', '2023-06-14 01:50:05', NULL),
(92, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '50ed43a235f07ef1182019ab8763a58e8072c88421f4456ad60adb9ef91352d0', '[\"*\"]', '2023-06-14 02:19:27', '2023-06-14 02:19:17', '2023-06-14 02:19:27', NULL),
(93, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '58917a132680e91b868eb6ff9011df5e3b53db2c2792c521d90e588a163b96f4', '[\"*\"]', '2023-06-14 03:37:00', '2023-06-14 03:12:15', '2023-06-14 03:37:00', NULL),
(94, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4aa2fd5724a8616a476f43b91ff41a5477fb3cc2dfc40c435a6a527117f047f8', '[\"*\"]', '2023-06-14 05:50:56', '2023-06-14 05:31:00', '2023-06-14 05:50:56', NULL),
(95, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '88f779ec4d53239ef352c85195a2ff9e8e9700f021bbfd6bc57c74b6da6d6bec', '[\"*\"]', '2023-06-27 05:50:34', '2023-06-14 06:23:41', '2023-06-27 05:50:34', NULL),
(96, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7a055a0e524bfc620319b459a32bc72c35aa8a73510df581cfa01598f00568d3', '[\"*\"]', '2023-06-14 06:29:01', '2023-06-14 06:25:41', '2023-06-14 06:29:01', NULL),
(97, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '027f2970440a4f3d1dbf3df28dd35523d404bbdbfb2bdd2ed5cb021e1c42b14f', '[\"*\"]', '2023-06-14 07:30:58', '2023-06-14 07:15:28', '2023-06-14 07:30:58', NULL),
(98, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4422541f48dc2b1370a5aa305dd442de460e1ef55c5a1942efdb9135e4bd3ceb', '[\"*\"]', '2023-06-14 07:24:10', '2023-06-14 07:24:00', '2023-06-14 07:24:10', NULL),
(100, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '92c1bfd7537516a5062f8842715697370f28a27fb4586c77bc7378720f9dd046', '[\"*\"]', '2023-06-14 08:43:34', '2023-06-14 08:41:35', '2023-06-14 08:43:34', NULL),
(101, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'cd3fe3262633f4d50e3955f0ec245428ab8184090ecd9bf02fb8e9398fd03074', '[\"*\"]', '2023-06-14 08:59:44', '2023-06-14 08:51:32', '2023-06-14 08:59:44', NULL),
(102, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '5d2aeb4415c791cc5ea1fd52b8f0bb9bbce3192e3e5291670640b4f3ddfd20b6', '[\"*\"]', '2023-06-14 09:12:32', '2023-06-14 09:11:05', '2023-06-14 09:12:32', NULL),
(103, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '91a582079b4727b64b04585fee5249222a8b2bfe054821c3e03d3903eb58890b', '[\"*\"]', '2023-06-14 13:14:41', '2023-06-14 13:11:21', '2023-06-14 13:14:41', NULL),
(104, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a03733c37d9f7e8b008c3739d74f194d0da4d2b80ddb9703e7d0d4093bafa0cf', '[\"*\"]', '2023-06-14 13:12:37', '2023-06-14 13:12:15', '2023-06-14 13:12:37', NULL),
(105, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'ff22123d9e1591dfc2c5a294061d86b2892dce7bfccd6beefc898b018ed4cd09', '[\"*\"]', '2023-06-14 14:06:07', '2023-06-14 14:05:05', '2023-06-14 14:06:07', NULL),
(106, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7360a9c64c1f85a763928937dafd705ddff7809acdf2565f44cc35dd7fa4fe86', '[\"*\"]', '2023-06-15 13:25:41', '2023-06-14 15:01:53', '2023-06-15 13:25:41', NULL),
(107, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'd78216a026213c5ac7862414f207e5ccec18d0ebcd6e706ae6a6c28d364a3712', '[\"*\"]', '2023-06-14 15:22:30', '2023-06-14 15:21:48', '2023-06-14 15:22:30', NULL),
(108, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'bce6c4fd25bceb5c1163406f489d68845ec9b5e5d9f8e8ff885f92307e3ca7cc', '[\"*\"]', '2023-06-14 15:37:49', '2023-06-14 15:22:45', '2023-06-14 15:37:49', NULL),
(109, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a5217eaa31eed7f6d8162da0607ff9ea4bd81ecac8b28da881d2613b51869598', '[\"*\"]', '2023-06-14 15:27:01', '2023-06-14 15:25:06', '2023-06-14 15:27:01', NULL),
(110, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '245aff594cb89a4e3d89ed06595a1a7a6e0f2f42fd6ee1507c5d5ce82648b361', '[\"*\"]', '2023-06-15 01:41:42', '2023-06-15 01:05:51', '2023-06-15 01:41:42', NULL),
(111, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'dc4060cad2f2c7aa0b2e651c50c996a8d8aa3736bae4125b3811f5cda49896ed', '[\"*\"]', '2023-06-16 02:37:24', '2023-06-15 01:09:04', '2023-06-16 02:37:24', NULL),
(112, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9fd8cc4ccac412330f4802ca633743a2ae115f3f42bc738aad4b136ffe7faf1c', '[\"*\"]', '2023-06-26 03:25:16', '2023-06-15 01:23:48', '2023-06-26 03:25:16', NULL),
(113, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'd55f7cd347b8a3331439cf5a3d392d770c8bbb54a0f9f6d324ce89b6ac96d724', '[\"*\"]', '2023-06-15 01:28:31', '2023-06-15 01:25:01', '2023-06-15 01:28:31', NULL),
(114, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'c8cceb5659b21fa8b02f93d611d42cc66fcf938f0855c49095a79789b23b3abc', '[\"*\"]', '2023-06-26 03:47:31', '2023-06-15 01:41:38', '2023-06-26 03:47:31', NULL),
(115, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '25d6d012c9b0552fe194e81d79f0075d92a4fa6f053ba292e8507f96c5abf56a', '[\"*\"]', '2023-06-15 01:55:34', '2023-06-15 01:55:18', '2023-06-15 01:55:34', NULL),
(116, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'c53c34596f2e0496e979d8bb2fbbf3d185864e834b8af709d04c4ad5d1a3a24a', '[\"*\"]', '2023-06-15 02:35:51', '2023-06-15 02:35:37', '2023-06-15 02:35:51', NULL),
(117, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3882e2c3b4c67969f859cb95aeaf96bbda31f49416df92e2071cb04688177b79', '[\"*\"]', '2023-06-15 03:03:45', '2023-06-15 03:00:32', '2023-06-15 03:03:45', NULL),
(118, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '13059e34c85297d4d192149c4ea1a27ba44ecacc13be3c40e8bcec16e3b7427b', '[\"*\"]', '2023-06-15 03:15:19', '2023-06-15 03:14:31', '2023-06-15 03:15:19', NULL),
(119, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '44c1a3b425d39cc42c57a7275506810b227ead2f5cf3df4cb1153b6ecda36441', '[\"*\"]', '2023-06-15 05:39:55', '2023-06-15 03:28:33', '2023-06-15 05:39:55', NULL),
(120, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '534e80388a4bf5bf4c215253ac20e7d9286bd2a20b55df57949fe7bc5226591b', '[\"*\"]', '2023-06-15 03:58:33', '2023-06-15 03:56:12', '2023-06-15 03:58:33', NULL),
(121, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2767b1461fd1c895f5da7fd3f52cbd0f488102ce8e9d7a982d1c4c463a6186b9', '[\"*\"]', '2023-06-15 04:40:01', '2023-06-15 04:39:40', '2023-06-15 04:40:01', NULL),
(122, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '56a5f9acf2fe50bb4919825ee86c57c854cf3b80258f5986d70a9009b4ef45ce', '[\"*\"]', '2023-06-15 06:18:01', '2023-06-15 06:11:52', '2023-06-15 06:18:01', NULL),
(123, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7697c6c613f38594aadbef3ef1da455694fe829ae62049bd0668fe84ffb164e6', '[\"*\"]', '2023-06-15 06:56:17', '2023-06-15 06:55:37', '2023-06-15 06:56:17', NULL),
(124, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '991ebfb98c5d3b0eb667c6afc4d0308d40707b7b7b1415e5f3c63f87fbcfb587', '[\"*\"]', '2023-06-15 08:29:36', '2023-06-15 08:28:39', '2023-06-15 08:29:36', NULL),
(126, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '46ffd4d6b570f9081738e022fead7337d9d87fd51b70f34880a1d81a2f7ff3f8', '[\"*\"]', '2023-06-15 09:09:08', '2023-06-15 09:07:51', '2023-06-15 09:09:08', NULL),
(127, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4e46a5b483c363d7f32949a9467f95cb337549ad6d096d5f5b8bb232aa150008', '[\"*\"]', '2023-06-26 06:39:38', '2023-06-15 09:48:59', '2023-06-26 06:39:38', NULL),
(128, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4045242ec0f8f0a681ae559f0cd043e9f5423078d9a8ae885dcb4652e62e51fb', '[\"*\"]', '2023-06-15 10:19:29', '2023-06-15 10:18:56', '2023-06-15 10:19:29', NULL),
(129, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9ff4b093da6a8ec6f66ec8a5b5eaa3dce8170f30aa55ee3f472cdd6881e3fe3d', '[\"*\"]', '2023-06-16 01:55:09', '2023-06-15 10:31:53', '2023-06-16 01:55:09', NULL),
(130, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7bb2fbd4a5cdabb2f8d6572047283e3f3a6bc22881d094a38fcacad3d33c10f3', '[\"*\"]', '2023-06-15 12:11:22', '2023-06-15 12:10:33', '2023-06-15 12:11:22', NULL),
(131, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '076e2e4c3109149faed665eac7a4b02011915a0248f378533f127be7190ddb9e', '[\"*\"]', '2023-06-15 13:32:37', '2023-06-15 13:32:32', '2023-06-15 13:32:37', NULL),
(132, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'efc90f3040370f683da86303b6db3442238806ae678f8e8053dbeb3ac4b0bce7', '[\"*\"]', '2023-06-16 01:12:25', '2023-06-16 01:12:07', '2023-06-16 01:12:25', NULL),
(133, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9d7b408555d96e5be019428c133631beea1fafc808186988d1fbfc456e1f4372', '[\"*\"]', '2023-06-16 01:26:59', '2023-06-16 01:22:12', '2023-06-16 01:26:59', NULL),
(134, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f19c00eb22b4bfa7c21052c9e569df9541bd4ee68e649f540c3e6bd2e1524424', '[\"*\"]', '2023-06-16 01:58:57', '2023-06-16 01:37:40', '2023-06-16 01:58:57', NULL),
(135, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f95a0e4a277f6b3921d0457ecb0cae7b13dff89a2aa4cb1797213feade821e06', '[\"*\"]', '2023-06-16 01:48:44', '2023-06-16 01:48:40', '2023-06-16 01:48:44', NULL),
(136, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '069d3a6c1a3b8761316fad171fdb05f99f2fcc9000528d4b8f96e2a9786af00d', '[\"*\"]', '2023-06-16 02:42:59', '2023-06-16 02:42:28', '2023-06-16 02:42:59', NULL),
(137, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '49a2f4eb63e014fccc046853f0ccf8054ca11d363c587dcfcb51004729ccfedc', '[\"*\"]', '2023-06-16 03:15:22', '2023-06-16 03:14:43', '2023-06-16 03:15:22', NULL),
(138, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '138055d3dcff609f3025d873e17ded8d105ac03a8ee215d3662e2cfa9da6ca8e', '[\"*\"]', '2023-06-16 04:26:13', '2023-06-16 04:25:15', '2023-06-16 04:26:13', NULL),
(139, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '282c4d49b8076cb9c42226fcab23484ce72167c931c1c438a0d6721af8f4b3e0', '[\"*\"]', '2023-06-16 06:04:30', '2023-06-16 05:24:43', '2023-06-16 06:04:30', NULL),
(140, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9db63785b566bd16f3d13809e9ea603578eadf27718756ad14def70ce43802fc', '[\"*\"]', '2023-06-17 09:03:55', '2023-06-16 05:43:37', '2023-06-17 09:03:55', NULL),
(141, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '33740377d9c9d291a093d30f32e1682f3b0e2c5501d7424d3c7890d459f606be', '[\"*\"]', '2023-06-16 05:58:05', '2023-06-16 05:57:33', '2023-06-16 05:58:05', NULL),
(142, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'cec6bee444de2496a6b128ec5d27804d1332f550ff2c7607f44ec01af12ebf1d', '[\"*\"]', '2023-06-16 07:47:49', '2023-06-16 07:09:43', '2023-06-16 07:47:49', NULL),
(143, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e552bc1aaab1f9f6d0b8568f094c419de4d2e289c4e57227038ab4381780b146', '[\"*\"]', '2023-06-16 07:19:27', '2023-06-16 07:17:58', '2023-06-16 07:19:27', NULL),
(144, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '963743bdf0ba375f049c13aa070395b59472a82dbe6a60cfc1f8958a00d18431', '[\"*\"]', '2023-06-16 08:28:08', '2023-06-16 08:27:01', '2023-06-16 08:28:08', NULL),
(145, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '121831d23ca8a11cf97c0e2c741f1572a149eb78a7b77ff1ab7f7b7751b78a41', '[\"*\"]', '2023-06-16 08:51:21', '2023-06-16 08:44:09', '2023-06-16 08:51:21', NULL),
(146, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e38a33b9167068742ba93e3bead3a46e04f113e0c5e197bca17111ac071855ec', '[\"*\"]', '2023-06-16 09:17:39', '2023-06-16 09:17:36', '2023-06-16 09:17:39', NULL),
(147, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'c09bd1bf6f5a78f2619f3fea1da03a56b5343b1a135730b71f15d0e6d48cf41a', '[\"*\"]', '2023-06-16 09:35:09', '2023-06-16 09:35:01', '2023-06-16 09:35:09', NULL),
(148, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4c143f5b9f22c42e05becb41a8f9e54e12c308c1d731262c8b988c3219d4c20e', '[\"*\"]', '2023-06-16 10:12:02', '2023-06-16 09:59:10', '2023-06-16 10:12:02', NULL),
(149, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '1b29e67ab484a24888fda76a902535cd9ba488b1e41b425c7dc394e0adfc9a70', '[\"*\"]', '2023-06-16 11:44:02', '2023-06-16 11:43:30', '2023-06-16 11:44:02', NULL),
(150, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '8a46b4a7dc667a92c950f44d7bb255bcca17819c6217f9c786f268ec476cc716', '[\"*\"]', '2023-06-17 03:11:13', '2023-06-17 01:59:08', '2023-06-17 03:11:13', NULL),
(151, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9a36a7db18d4ca139e65934fa638ae37e48367682bbc7eee5aa66e670f1d3703', '[\"*\"]', '2023-06-20 03:19:08', '2023-06-17 05:44:14', '2023-06-20 03:19:08', NULL),
(152, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '5f901f47f2d305bce926fecd56402cba4f95f023a44e3c643c0a355a71535d9c', '[\"*\"]', '2023-06-17 06:49:37', '2023-06-17 06:29:21', '2023-06-17 06:49:37', NULL),
(153, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a344b0ff288f97d3db59303e12eb7c1cdade06808277c6d5d797a1dad9d4265b', '[\"*\"]', '2023-06-17 06:49:29', '2023-06-17 06:48:13', '2023-06-17 06:49:29', NULL),
(154, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '91e93f2209a47d22e8579d2a47a8457291bf1a56dc1174dfefdb6126a3bc90eb', '[\"*\"]', '2023-06-17 06:55:53', '2023-06-17 06:53:23', '2023-06-17 06:55:53', NULL),
(155, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '55fb59fbd812baa33e3de58cdccd9a6f60df4455763cd565893675c331ca8184', '[\"*\"]', '2023-06-17 08:41:32', '2023-06-17 08:37:06', '2023-06-17 08:41:32', NULL),
(156, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '104f582aa0335cf542b505b29c6db2ce4da6b11838d5f49dbd2d201773232b65', '[\"*\"]', '2023-06-17 09:43:20', '2023-06-17 09:13:17', '2023-06-17 09:43:20', NULL),
(157, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '8054e9f7a4489ce8cdd594e9332950660ed4769c964c89e48491aa89bfd22c29', '[\"*\"]', '2023-06-17 09:14:12', '2023-06-17 09:13:42', '2023-06-17 09:14:12', NULL),
(159, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3e047c1340f91871703c0f208cf4de9905379a0b32c1e4d02f81bf252783e8e9', '[\"*\"]', '2023-06-17 11:51:36', '2023-06-17 11:51:06', '2023-06-17 11:51:36', NULL),
(160, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '18d285db61e74de12a45a82cbc38fa243cff7aa4755530a93f4ec6d88ed7979e', '[\"*\"]', '2023-06-17 12:51:12', '2023-06-17 12:49:56', '2023-06-17 12:51:12', NULL),
(161, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a8f9bd73a40ff950d674e93e8ebb5f281ce2bb8744462a4934233b2731f01c24', '[\"*\"]', '2023-06-17 16:46:43', '2023-06-17 16:45:10', '2023-06-17 16:46:43', NULL),
(162, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7b553e3e67176c46578b43758a8a0f38a214f12c09657a4c47c6cdae1d387b18', '[\"*\"]', '2023-06-18 06:57:51', '2023-06-18 06:57:19', '2023-06-18 06:57:51', NULL),
(163, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'fa8cb45268c87312ffb326ed7866d4d92ae22d753a3ed26756a0cf8c0a2441f5', '[\"*\"]', '2023-06-18 08:42:31', '2023-06-18 08:31:05', '2023-06-18 08:42:31', NULL),
(164, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3bfbb2ac8bfadfb3c7c1db571ecdbd2720c12ce8ffe175a445cf2b5fecadd75d', '[\"*\"]', '2023-06-21 08:30:51', '2023-06-18 13:03:01', '2023-06-21 08:30:51', NULL),
(165, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '59f0490cd60eb2497804fbd2f7fc1badbfd0090c1c3391f32c6dd0fb2903a180', '[\"*\"]', '2023-06-18 13:24:31', '2023-06-18 13:23:50', '2023-06-18 13:24:31', NULL),
(166, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'ef75dcc2e0ecbef5e65aef118232c67010d7b1a62867b9c5b38547e1fa31b360', '[\"*\"]', '2023-06-18 14:30:31', '2023-06-18 14:30:06', '2023-06-18 14:30:31', NULL),
(167, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '434eef5fd2b2243fb3988596d20871739096f8aa8a63da125cfa5b8a4443f4b0', '[\"*\"]', '2023-06-18 15:08:13', '2023-06-18 15:07:11', '2023-06-18 15:08:13', NULL),
(168, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '1e098da2083048844fe805506c19fd174995e1379a2794a3856fac9a1a57dc50', '[\"*\"]', '2023-06-18 17:21:37', '2023-06-18 17:21:26', '2023-06-18 17:21:37', NULL),
(170, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '17c4cffe162adb80f58affddd3ead07696124a344202a765d062c1cbb702296c', '[\"*\"]', '2023-06-19 01:39:29', '2023-06-19 01:36:09', '2023-06-19 01:39:29', NULL),
(171, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '47c17eb740fbebea6f402ba22f5222febf6b48256a4bbf4550765f40bca0f581', '[\"*\"]', '2023-06-19 03:36:06', '2023-06-19 03:34:28', '2023-06-19 03:36:06', NULL),
(172, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'ebfc835e18775d4eeea6941e65084724bcf75233f7174a5987115a18ae246af5', '[\"*\"]', '2023-06-19 06:10:52', '2023-06-19 06:06:53', '2023-06-19 06:10:52', NULL),
(173, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4f2e5286e3a1a80f191b75602a152bd21e97b72a02a53658d077efbfa19704fe', '[\"*\"]', '2023-06-19 06:38:12', '2023-06-19 06:37:46', '2023-06-19 06:38:12', NULL),
(174, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '26b93446c1cced6fa19e1767fee5b4d631268793502db3caa8b809614e500526', '[\"*\"]', '2023-06-27 02:21:11', '2023-06-19 06:53:13', '2023-06-27 02:21:11', NULL),
(175, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'eeca311d8f52260324696024a9b5c49c30542fb8069889e7b307a17fcaf6bab5', '[\"*\"]', '2023-06-23 09:19:30', '2023-06-19 19:37:30', '2023-06-23 09:19:30', NULL),
(176, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'ba4a31bd7d5b7e159dac19174ef3994d20fb3c8fbff4c76ab07285468db05e84', '[\"*\"]', '2023-06-20 01:22:43', '2023-06-20 01:15:35', '2023-06-20 01:22:43', NULL),
(178, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4e4c774a792f20b26622ae92c4d9e5f5aaa970aa904c6c5e44ae5bb7b939ae01', '[\"*\"]', '2023-06-20 03:31:58', '2023-06-20 03:28:36', '2023-06-20 03:31:58', NULL),
(179, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '353b33f8d939211a91ca35434890a95a2893fe5ed83e643c4edf8d76aa8a659b', '[\"*\"]', '2023-06-20 03:51:42', '2023-06-20 03:50:12', '2023-06-20 03:51:42', NULL),
(180, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '6578f575206b22227c5bd6d209e352c24e232f3c70a87d02a3e1f65ae99385ac', '[\"*\"]', '2023-06-20 05:33:10', '2023-06-20 05:28:14', '2023-06-20 05:33:10', NULL),
(181, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '493b1e8d995b066c405a93d6b57995e543caeddb2b3716a33f98bff19938f81c', '[\"*\"]', '2023-06-20 07:58:26', '2023-06-20 07:56:30', '2023-06-20 07:58:26', NULL),
(182, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f2d784f941dca59170907e2a0175495a4d49aa1cc293da73fcbdbc87d9f1fd8d', '[\"*\"]', '2023-06-20 08:08:05', '2023-06-20 08:07:51', '2023-06-20 08:08:05', NULL),
(183, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '515ba87f94516ddf190b7dd170ae85aa0c5ac06e8ae1a3ffadc19bd1a457f9d5', '[\"*\"]', '2023-06-20 10:10:46', '2023-06-20 10:10:34', '2023-06-20 10:10:46', NULL),
(184, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2972a1590313cd741ac8cda93f5debdca3540bf0694a7f526b41e28b465c743d', '[\"*\"]', '2023-06-26 02:21:06', '2023-06-20 10:11:07', '2023-06-26 02:21:06', NULL),
(185, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'd3d1bf8ffc329de4846a62fda89ddacde9d1a8899f39b264ed88389aedd24509', '[\"*\"]', '2023-06-20 12:26:28', '2023-06-20 12:26:00', '2023-06-20 12:26:28', NULL),
(186, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9d2debe41f82924a0480b527637d446152f3fa2f82b4f2146d64554b63aa4318', '[\"*\"]', '2023-06-20 14:35:36', '2023-06-20 14:22:41', '2023-06-20 14:35:36', NULL),
(187, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '44a273b9eb3a34a4d1f5fcd0ed274db995aab1ce3f85abe3936fb163c4974e0e', '[\"*\"]', '2023-06-20 15:16:36', '2023-06-20 15:16:20', '2023-06-20 15:16:36', NULL),
(188, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'fd68940e3448b3231cb1317bcd6dd892d284345788536e27460d3a904d65a003', '[\"*\"]', '2023-06-24 03:13:49', '2023-06-20 15:55:25', '2023-06-24 03:13:49', NULL),
(189, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '87e61cf960eda357d9d0bb4b102bd3925ab1f94c05ad1a5e7cb2d5e835bf4934', '[\"*\"]', '2023-06-21 04:18:23', '2023-06-21 01:08:29', '2023-06-21 04:18:23', NULL),
(190, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '0ad8c18e4b9ca5fe27dc46b482ccd9256e684eb3bd6c484995259f91ecd4e904', '[\"*\"]', '2023-06-21 03:56:07', '2023-06-21 02:53:05', '2023-06-21 03:56:07', NULL),
(191, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e7a04d5949739c4deb72997368c84a28615febce707b3ede504054e0f9d735bc', '[\"*\"]', '2023-06-21 04:32:04', '2023-06-21 04:28:59', '2023-06-21 04:32:04', NULL),
(192, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9935f87230c45cacb2c2348eb813e2f2bd5b1fe9eb024766fbd9f47af530d1e5', '[\"*\"]', '2023-06-21 07:52:45', '2023-06-21 07:50:59', '2023-06-21 07:52:45', NULL),
(193, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f8a4a1467e144844c33b3f5bc013fb11a5de8e3e09045db265606b11473ef90f', '[\"*\"]', '2023-06-21 08:29:21', '2023-06-21 08:29:20', '2023-06-21 08:29:21', NULL),
(194, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a45fc2970cda12749896ee53eda43a26d4c80a056154e8106faa9bd1d0ed9d52', '[\"*\"]', '2023-06-21 08:32:06', '2023-06-21 08:30:51', '2023-06-21 08:32:06', NULL),
(195, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3703cebc5942afce6c1c903bdfc0a97141a7415adb60b432beefdb2437fd6828', '[\"*\"]', '2023-06-21 08:57:52', '2023-06-21 08:52:29', '2023-06-21 08:57:52', NULL),
(196, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3f2271ae6136648898b4c5305e5cf90a5cbb8efee1f1c53d738b3da519dffdb2', '[\"*\"]', '2023-06-21 10:59:35', '2023-06-21 10:03:32', '2023-06-21 10:59:35', NULL),
(197, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '77855fe33b2085ed49db0d67456fe8be58825467c3efea5dfe51b492adfa21ef', '[\"*\"]', '2023-06-25 04:28:46', '2023-06-21 10:23:17', '2023-06-25 04:28:46', NULL),
(198, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'd340b3a4308efecc38d90fd7f1bcdb111331843a1fa0fc977ffa2af4b99d106d', '[\"*\"]', '2023-06-21 16:30:46', '2023-06-21 16:29:09', '2023-06-21 16:30:46', NULL),
(199, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a5ac3a032cce9d013042fcc68d60abfdeb4cd9d1ae141c3296f46580ae5adb48', '[\"*\"]', '2023-06-21 21:34:53', '2023-06-21 21:34:47', '2023-06-21 21:34:53', NULL),
(200, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'ba3a2fae5da774b2b54520ba91972d2a3906a06e24c80cc32c055999156d1301', '[\"*\"]', '2023-06-23 14:15:55', '2023-06-22 06:21:09', '2023-06-23 14:15:55', NULL),
(201, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '66292f20182722d0b2068a363656800a2f14254c530ac42eafb4b06fc5d5a06f', '[\"*\"]', '2023-06-26 11:26:38', '2023-06-22 07:24:41', '2023-06-26 11:26:38', NULL),
(202, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'c56d89a08a0c6ac87571bae9b61e0b5cb2d6bf5b8e20d2943a517bbb712f5305', '[\"*\"]', '2023-06-22 07:36:50', '2023-06-22 07:35:59', '2023-06-22 07:36:50', NULL),
(203, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '67ca52c373f0f5a5cd0ecaf2ee7a20cb0319de8b9e1246d2aef75512cee506d1', '[\"*\"]', '2023-06-22 13:29:29', '2023-06-22 13:29:28', '2023-06-22 13:29:29', NULL),
(204, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '6ada28a46613ca0af8f7e665f2171793ff82687a25b5dce13d3a170105747c53', '[\"*\"]', '2023-06-22 14:52:04', '2023-06-22 14:27:25', '2023-06-22 14:52:04', NULL),
(205, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '5ae8642208320cde50d7bc2e456b4cf024fecb6f51120b32c7552f5d5ba8a492', '[\"*\"]', '2023-06-22 15:10:44', '2023-06-22 15:10:32', '2023-06-22 15:10:44', NULL),
(206, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3a53b6f264123c8ed3cfd1bdfb1f3d4292031ea38675d1fcb789ca54477f13dd', '[\"*\"]', '2023-06-23 12:51:58', '2023-06-23 04:14:04', '2023-06-23 12:51:58', NULL),
(207, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4f3283ff0a0f8d2e1b9f49523db7b8eaa278db74025f58478bc74d2311407773', '[\"*\"]', '2023-06-23 08:07:55', '2023-06-23 08:07:29', '2023-06-23 08:07:55', NULL),
(208, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '619cf45aa326b7f412c986c2efbd9c867814b3184355e8183890ac1c4165ead7', '[\"*\"]', '2023-06-23 19:56:50', '2023-06-23 19:50:04', '2023-06-23 19:56:50', NULL),
(209, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '1314354252e5890822bf06f5987966faf16b06028d60d519d388bd00ba69ec26', '[\"*\"]', '2023-06-24 06:27:08', '2023-06-24 06:27:04', '2023-06-24 06:27:08', NULL),
(210, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'db1676e570035c47e30d2dd59c439118b6461397dbc700cf88b5ce103ca42677', '[\"*\"]', '2023-06-24 06:29:06', '2023-06-24 06:27:47', '2023-06-24 06:29:06', NULL),
(211, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e9015cb2d5f8e5ad70493bd8f167c8a486e48843dbf7964bd8363a82b1697303', '[\"*\"]', '2023-06-24 07:06:36', '2023-06-24 07:03:31', '2023-06-24 07:06:36', NULL),
(212, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'cbc518edf56f61920b07a065e580f1c0027ce0dced12cc64fe214dddec63af97', '[\"*\"]', '2023-06-24 15:49:10', '2023-06-24 09:42:56', '2023-06-24 15:49:10', NULL),
(213, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '0100592653096a476c7f1586d0c927dc8c647584f32bc0c06248adfd02f4a4ee', '[\"*\"]', '2023-06-24 10:30:08', '2023-06-24 10:30:07', '2023-06-24 10:30:08', NULL),
(214, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2227a1400e416dc4cdfaf97921ce50a43d896ddfa2f0e1afe76d4656368a3031', '[\"*\"]', '2023-06-24 15:50:17', '2023-06-24 15:49:26', '2023-06-24 15:50:17', NULL),
(215, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '14e71ec666b48ee36efca305ecbd9afebfd1efa507cb852992fcc8ac77ddbc13', '[\"*\"]', '2023-06-24 16:12:42', '2023-06-24 16:08:57', '2023-06-24 16:12:42', NULL),
(216, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f73593c8d8866d9fb2eb2a33bb33b5fe5a7b1257c12104ce06787d57979e188a', '[\"*\"]', '2023-06-26 05:32:17', '2023-06-25 01:18:24', '2023-06-26 05:32:17', NULL),
(217, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e9dbd6371908d840e55710c9648b6ced12b42a4649ab8d4267c6364b2f8b9e0e', '[\"*\"]', '2023-06-25 11:36:04', '2023-06-25 11:24:55', '2023-06-25 11:36:04', NULL),
(218, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'ab74aa4db41e126c06cf4fd79423da633e27e1a5a87bcc43faa9b000dcd61dd0', '[\"*\"]', '2023-06-25 15:49:53', '2023-06-25 15:49:40', '2023-06-25 15:49:53', NULL),
(219, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a1c36d1497b91f4e3474232692f070a574b335f5401660a5a4353c7b528080fa', '[\"*\"]', '2023-06-25 16:31:42', '2023-06-25 16:31:36', '2023-06-25 16:31:42', NULL),
(220, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'b6cea5b6ff692131fea5b0b817b929661848232e9ac97cb6a212f2dbe47136d9', '[\"*\"]', '2023-06-27 06:25:53', '2023-06-26 00:49:50', '2023-06-27 06:25:53', NULL),
(221, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '05225311eecfd2e55a2262011a1a291e16d9a459dc8fd859049b6b0f6b682fae', '[\"*\"]', '2023-06-26 01:16:42', '2023-06-26 01:16:20', '2023-06-26 01:16:42', NULL),
(222, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'dd9e53143c41f6a85f050a0ec151bc5b1c0e8ab9d8bd9eac4d40201c10d3ca7c', '[\"*\"]', '2023-06-26 03:12:03', '2023-06-26 02:57:50', '2023-06-26 03:12:03', NULL),
(224, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'fe00c3b7fbdf098acc6b897da022b1d187d94e2e5ee6a28adf50315bd63e4edd', '[\"*\"]', '2023-06-26 03:12:36', '2023-06-26 03:11:40', '2023-06-26 03:12:36', NULL),
(225, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4ecf8349e9be72157012c375aaa8ce23dccda1d0a151b059086c4849a3214d59', '[\"*\"]', '2023-06-26 03:13:48', '2023-06-26 03:12:27', '2023-06-26 03:13:48', NULL),
(226, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '8ce2a2cd13b5fe137b5489d27551e1204711f2b5a48d1ec6d5023901921196d3', '[\"*\"]', '2023-06-26 03:29:42', '2023-06-26 03:28:12', '2023-06-26 03:29:42', NULL),
(227, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e142c109795672ee2daabc04d6fb8e0dafa8facd49810f83ad0c27447145cd23', '[\"*\"]', '2023-06-26 04:20:48', '2023-06-26 03:32:02', '2023-06-26 04:20:48', NULL),
(228, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e41ae485e2cf9aacf78bb0ff8d294ccf412ce0606bb2e695d223e8e03b1b93b0', '[\"*\"]', '2023-06-26 03:35:50', '2023-06-26 03:34:03', '2023-06-26 03:35:50', NULL),
(229, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '18c0a6aac7eb479e61c89a709de42c4cd6b0f94c30a7da2677426212b3cef29c', '[\"*\"]', '2023-06-26 03:44:16', '2023-06-26 03:40:40', '2023-06-26 03:44:16', NULL),
(230, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'fc2ba0e8571908af45f24720f75968f7d6548f625d54b658eac252d02b1d1254', '[\"*\"]', '2023-06-26 04:02:04', '2023-06-26 04:00:48', '2023-06-26 04:02:04', NULL),
(231, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'aad9366ca21d934170becf5efeb437cca975b8ded9df35c8ff8db8866981429b', '[\"*\"]', '2023-06-26 06:53:23', '2023-06-26 05:22:19', '2023-06-26 06:53:23', NULL),
(232, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e6c7bda89722a8dd8300d427b07e9ac98e3df3801f623b483ca237027fc416d0', '[\"*\"]', '2023-06-26 05:35:28', '2023-06-26 05:34:14', '2023-06-26 05:35:28', NULL),
(233, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'abf2f0e6992acb96739c907c0987e6741db5f32b25f5812877f7376a57146203', '[\"*\"]', '2023-06-26 07:59:16', '2023-06-26 05:39:49', '2023-06-26 07:59:16', NULL),
(234, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a05736fea197990d5d8d97b997b460acc2ce09f647acec2c8c9d2a85bb8c4871', '[\"*\"]', '2023-06-27 01:03:07', '2023-06-26 05:42:29', '2023-06-27 01:03:07', NULL),
(235, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '0c515ab437b2fa574c5cdd78cba710fa515065f0c271e8b383caca42fa85ac33', '[\"*\"]', '2023-06-26 06:01:33', '2023-06-26 06:00:23', '2023-06-26 06:01:33', NULL),
(236, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9e7b5905cf4beec56851c446cc8eb5cf529848e4d497697556b6eaf537b23866', '[\"*\"]', '2023-06-27 02:49:04', '2023-06-26 06:07:22', '2023-06-27 02:49:04', NULL),
(237, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '218636d45659d45a46d9185b82d2c11db78bf931c7e54efd72cc30d2fd377d3f', '[\"*\"]', '2023-06-26 06:18:55', '2023-06-26 06:18:14', '2023-06-26 06:18:55', NULL),
(238, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'd8a0315f0ecf5f6bb6887df57303e391a5061a97dc73a4d2c58e7136e07bc30e', '[\"*\"]', '2023-06-26 06:22:26', '2023-06-26 06:20:39', '2023-06-26 06:22:26', NULL),
(239, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '5e35c3b24dde21c097ca166be892972d465368c7301dc82da3a89f070658359f', '[\"*\"]', '2023-06-26 06:49:03', '2023-06-26 06:48:40', '2023-06-26 06:49:03', NULL),
(240, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7adf5e12b1d86c3327ec967eaca9f6313f571ce32fd18bff6523023b6bb5fa37', '[\"*\"]', '2023-06-26 07:05:14', '2023-06-26 06:49:28', '2023-06-26 07:05:14', NULL),
(241, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '43aed37ff0d15b2cb6f6ce74642dc670d6fe7a324f7039dadebfbb4b9b3309ad', '[\"*\"]', '2023-06-26 06:53:11', '2023-06-26 06:51:40', '2023-06-26 06:53:11', NULL),
(242, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '3735337fc8d837466e3a14286ff3716e1234f03a3243ccf7e0bdd1731f214e94', '[\"*\"]', '2023-06-26 07:32:27', '2023-06-26 07:32:13', '2023-06-26 07:32:27', NULL),
(243, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '8e80adc30d148319a8554671a9d6a4368975ea95bcd4900e929be940eb1964f9', '[\"*\"]', '2023-06-26 07:53:37', '2023-06-26 07:48:04', '2023-06-26 07:53:37', NULL),
(244, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '7baf66e3ebba922d13b0f17261c3ffec3ef269d1ed9a6daed02d332c559a6991', '[\"*\"]', '2023-06-26 07:52:58', '2023-06-26 07:50:47', '2023-06-26 07:52:58', NULL),
(245, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '72e492d1c74afbdd291ffb2107ec190b5155242b014be3d3e85dbb497615fb74', '[\"*\"]', '2023-06-26 08:06:16', '2023-06-26 08:01:03', '2023-06-26 08:06:16', NULL),
(246, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '1cc5af169ba4727a75ed7a1198d491606e67130888e4e237f67a1c79944100d5', '[\"*\"]', '2023-06-26 08:05:03', '2023-06-26 08:02:04', '2023-06-26 08:05:03', NULL),
(247, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '18d66dcbc1bc25b742a1ccc453b03ebe5f22195877086db1d50dbb76c39dd7c0', '[\"*\"]', '2023-06-27 00:39:09', '2023-06-26 08:05:04', '2023-06-27 00:39:09', NULL),
(248, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a8c2d4a6037e82e2d968eba4166f209fd0c6bd30b9316c2653319126a39bae14', '[\"*\"]', '2023-06-26 08:14:33', '2023-06-26 08:14:03', '2023-06-26 08:14:33', NULL),
(249, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '09d709bf5fcac0c20d72673ed0dd571beebc8981639c6c4118560d73f65640a4', '[\"*\"]', '2023-06-26 08:48:48', '2023-06-26 08:47:38', '2023-06-26 08:48:48', NULL),
(250, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '8ec6debf39809603799bcee1d229347e70f38c78d8f06fdcb4e003ee607bc745', '[\"*\"]', '2023-06-26 09:49:56', '2023-06-26 08:58:40', '2023-06-26 09:49:56', NULL),
(251, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '0e9e46084b3029f78a5d2ef0f2b1a30d9155ee19c79ca8d25a88c21a6abaecd2', '[\"*\"]', '2023-06-26 09:06:04', '2023-06-26 09:01:27', '2023-06-26 09:06:04', NULL),
(252, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '347373a45a352748df49d30e98c1c9efe587cbbf4346d953ceb59ca3f515f566', '[\"*\"]', '2023-06-26 09:04:40', '2023-06-26 09:04:16', '2023-06-26 09:04:40', NULL),
(253, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e212a9112841f850eea07e18ce937920f4cc46ec1e0a5e7e4c84da50935021e6', '[\"*\"]', '2023-06-26 10:02:55', '2023-06-26 09:55:09', '2023-06-26 10:02:55', NULL),
(254, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4006c216cd5ef8d5d628a91647e0c1097250413babe17b77f106817ecfb161a5', '[\"*\"]', '2023-06-26 10:15:42', '2023-06-26 10:15:41', '2023-06-26 10:15:42', NULL),
(255, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f9a1d77edf833413ebc0c3c76ea3d0116847f3ac96ec2bf894854b8626a07f8a', '[\"*\"]', '2023-06-26 12:59:57', '2023-06-26 10:20:15', '2023-06-26 12:59:57', NULL),
(256, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '958e2516776f50858042dd131725293885083a94352967f4a95aefff8799c253', '[\"*\"]', '2023-06-26 11:01:05', '2023-06-26 11:01:04', '2023-06-26 11:01:05', NULL),
(257, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '1eb21a4193745a99c01461926cba1235dc28ec37e3e956558e00e456319eb995', '[\"*\"]', '2023-06-26 11:04:32', '2023-06-26 11:04:18', '2023-06-26 11:04:32', NULL),
(258, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '2c0e44f6123d0602b654bb2de60be7059fa2158be994faaaee14e4c14a50b719', '[\"*\"]', '2023-06-26 12:01:27', '2023-06-26 11:06:08', '2023-06-26 12:01:27', NULL),
(259, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '6113a9425a711067a6423213d4b545c5aa3030b1d9ed8cabbea8523c1d0cab81', '[\"*\"]', '2023-06-26 11:12:19', '2023-06-26 11:11:54', '2023-06-26 11:12:19', NULL),
(260, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '94179440966865a47f1bb512a322988178be46cd422e6f065f86022a056351bf', '[\"*\"]', '2023-06-26 11:24:12', '2023-06-26 11:20:33', '2023-06-26 11:24:12', NULL),
(261, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '5f0086ad4946982afaaa4efd160d4b2d067a91a5797fde22b46f32f53b73bb96', '[\"*\"]', '2023-06-26 14:05:34', '2023-06-26 13:48:20', '2023-06-26 14:05:34', NULL),
(262, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '6cf23e277149a9814270bb15c409f279f08c74871935a664346be38b72b03b3c', '[\"*\"]', '2023-06-26 15:05:31', '2023-06-26 15:03:52', '2023-06-26 15:05:31', NULL),
(263, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '46bd0997fc855fa2701bf793422d8e83af953b235f63373550dbfc35fc12b14d', '[\"*\"]', '2023-06-26 17:00:24', '2023-06-26 16:54:16', '2023-06-26 17:00:24', NULL),
(264, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'a598ec6e5cf37a2201554de43e9eec94af5ef82c6c1c40f20e97fd72d661a592', '[\"*\"]', '2023-06-26 16:57:20', '2023-06-26 16:55:26', '2023-06-26 16:57:20', NULL),
(265, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'f69f1ca97824889a326c3a0c6ccb035887d802f525c8a7948b5ea343a0ef69bb', '[\"*\"]', '2023-06-27 00:15:12', '2023-06-27 00:14:41', '2023-06-27 00:15:12', NULL),
(266, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '17c877865767dac20f2c07842c88d70782b1b2c6717b4227db41150273968c5d', '[\"*\"]', '2023-06-27 01:33:14', '2023-06-27 00:56:18', '2023-06-27 01:33:14', NULL),
(267, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '0f266254c016fad71fc54649124dd0de57470d5f3e7250ab95b0ad58cc49fd57', '[\"*\"]', '2023-06-27 01:29:24', '2023-06-27 01:29:00', '2023-06-27 01:29:24', NULL),
(268, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '811de2aefedb15e918b32c96dd88686ece52e8f81bf4dd55d622c4ec3cb94339', '[\"*\"]', '2023-06-27 01:38:43', '2023-06-27 01:32:09', '2023-06-27 01:38:43', NULL),
(269, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'b9633ec8c121d62581e69fee6240481144210d07eb24701ade1db2f6ea5ba0f3', '[\"*\"]', '2023-06-27 01:48:16', '2023-06-27 01:39:47', '2023-06-27 01:48:16', NULL),
(270, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '4ac29a38acc6714ed1bfef390ebaa5f6175dd207b0b55c23be73ec057d2f6b4d', '[\"*\"]', '2023-06-27 02:08:12', '2023-06-27 02:07:58', '2023-06-27 02:08:12', NULL),
(271, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '0364caa1f017568573dc12a72ffe9f50026253a5b5960577e7f1f883b71e41ce', '[\"*\"]', '2023-06-27 02:40:51', '2023-06-27 02:36:01', '2023-06-27 02:40:51', NULL),
(272, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '39c371ebd47533f5f9e3f8b5d0f52dd40477514405c125bac5d3d19b57ce2341', '[\"*\"]', '2023-06-27 03:50:13', '2023-06-27 03:44:00', '2023-06-27 03:50:13', NULL);
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`, `expires_at`) VALUES
(273, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '9778b3e1bcb47e255e9017e385dcd1d3dc7aceb5cf2490b17106bd6587ff4069', '[\"*\"]', '2023-06-27 04:31:29', '2023-06-27 04:29:19', '2023-06-27 04:31:29', NULL),
(274, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', 'e153672e4102a5b025bc4fe065f0709c6c1bcaa810ad48f933386cbb0df24680', '[\"*\"]', '2023-06-27 05:21:07', '2023-06-27 05:21:06', '2023-06-27 05:21:07', NULL),
(275, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '02ee2b0a4065ceafdbdfb808794709a21aeed51aad7475e806c5f6d5bb91381e', '[\"*\"]', '2023-06-27 05:29:45', '2023-06-27 05:28:01', '2023-06-27 05:29:45', NULL),
(276, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '965fdd1b6c17979bd0e6a3a35e0a637246cfc160caeb0e6ad4226b36e7f74b3e', '[\"*\"]', '2023-06-27 06:02:22', '2023-06-27 06:01:31', '2023-06-27 06:02:22', NULL),
(277, 'Slowlyo\\OwlAdmin\\Models\\AdminUser', 1, 'admin', '834a7332461db1f37fa3cce1d29b11e418bb0e9bde6896af67e573db64ecd70e', '[\"*\"]', '2023-06-27 06:48:23', '2023-06-27 06:46:23', '2023-06-27 06:48:23', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `admin_code_generators`
--
ALTER TABLE `admin_code_generators`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `admin_extensions`
--
ALTER TABLE `admin_extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_extensions_name_unique` (`name`);

--
-- 表的索引 `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- 表的索引 `admin_permission_menu`
--
ALTER TABLE `admin_permission_menu`
  ADD KEY `admin_permission_menu_permission_id_menu_id_index` (`permission_id`,`menu_id`);

--
-- 表的索引 `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- 表的索引 `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- 表的索引 `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- 表的索引 `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- 表的索引 `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `articles_title_index` (`title`) USING BTREE;

--
-- 表的索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- 表的索引 `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `messages_user_id_index` (`user_id`) USING BTREE;

--
-- 表的索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 表的索引 `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin_code_generators`
--
ALTER TABLE `admin_code_generators`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `admin_extensions`
--
ALTER TABLE `admin_extensions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
