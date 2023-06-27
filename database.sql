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
