SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `owl_admin_demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `owl_admin_demo`;

DROP TABLE IF EXISTS `admin_apis`;
CREATE TABLE IF NOT EXISTS `admin_apis` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口路径',
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接口模板',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '是否启用',
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '接口参数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `admin_code_generators`;
CREATE TABLE IF NOT EXISTS `admin_code_generators` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `save_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '保存位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `admin_extensions`;
CREATE TABLE IF NOT EXISTS `admin_extensions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_enabled` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_extensions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE IF NOT EXISTS `admin_menus` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单路由',
  `url_type` tinyint NOT NULL DEFAULT '1' COMMENT '路由类型(1:路由,2:外链)',
  `visible` tinyint NOT NULL DEFAULT '1' COMMENT '是否可见',
  `is_home` tinyint(1) DEFAULT '0' COMMENT '是否为首页',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单组件',
  `is_full` tinyint NOT NULL DEFAULT '0' COMMENT '是否是完整页面',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keep_alive` tinyint DEFAULT NULL COMMENT '页面缓存',
  `iframe_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'iframe_url',
  `custom_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_menus` (`id`, `parent_id`, `order`, `title`, `icon`, `url`, `url_type`, `visible`, `is_home`, `component`, `is_full`, `extension`, `created_at`, `updated_at`, `keep_alive`, `iframe_url`, `custom_order`) VALUES
(1, 0, 0, '首页', 'ph:chart-line-up-fill', '/dashboard', 1, 1, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(2, 0, 20, '系统管理', 'material-symbols:settings-outline', '/system', 1, 1, 0, NULL, 0, NULL, NULL, '2023-01-31 06:54:21', NULL, NULL, 20),
(3, 2, 0, '管理员', 'ph:user-gear', '/system/admin_users', 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
(4, 2, 10, '角色', 'carbon:user-role', '/system/admin_roles', 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 10),
(5, 2, 20, '权限', 'fluent-mdl2:permissions', '/system/admin_permissions', 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 20),
(6, 2, 30, '菜单', 'ant-design:menu-unfold-outlined', '/system/admin_menus', 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 30),
(8, 0, 10, 'Json示例', 'material-symbols:border-all-rounded', '/example', 1, 1, 0, NULL, 0, NULL, '2022-09-06 10:32:40', '2023-01-31 06:54:21', NULL, NULL, 10),
(9, 8, 10, '所有Form示例', 'ph:circle', '/example/form_all', 1, 1, 0, NULL, 0, NULL, '2022-09-06 10:34:10', '2022-09-06 11:05:12', NULL, NULL, 0),
(10, 8, 60, '表单展示模式', 'ph:circle', '/example/form', 1, 1, 0, NULL, 0, NULL, '2022-09-06 11:05:57', '2022-09-06 11:05:57', NULL, NULL, 10),
(11, 8, 0, '显隐切换示例', 'ph:circle', '/example/reaction', 1, 1, 0, NULL, 0, NULL, '2022-09-06 11:16:26', '2022-09-06 11:16:34', NULL, NULL, 20),
(12, 8, 20, '条件生成器', 'ph:circle', '/example/condition_builder', 1, 1, 0, NULL, 0, NULL, '2022-09-06 11:20:12', '2022-09-06 11:20:12', NULL, NULL, 30),
(13, 8, 30, '弹框', 'ph:circle', '/example/dialog', 1, 1, 0, NULL, 0, NULL, '2022-09-06 11:23:46', '2022-09-06 11:23:46', NULL, NULL, 40),
(14, 8, 40, '选项卡', 'ph:circle', '/example/tabs', 1, 1, 0, NULL, 0, NULL, '2022-09-06 11:23:46', '2022-09-06 11:23:46', NULL, NULL, 50),
(15, 8, 50, '步骤表单', 'ph:circle', '/example/wizard', 1, 1, 0, NULL, 0, NULL, '2022-09-06 11:23:46', '2022-09-06 11:23:46', NULL, NULL, 60);

DROP TABLE IF EXISTS `admin_pages`;
CREATE TABLE IF NOT EXISTS `admin_pages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面名称',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面标识',
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面结构',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE IF NOT EXISTS `admin_permissions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `order`, `parent_id`, `created_at`, `updated_at`, `custom_order`) VALUES
(1, '首页', 'dashboard', NULL, '[\"\\/dashboard*\"]', 0, 0, NULL, NULL, 0),
(2, '系统管理', 'system', NULL, '[\"\\/system*\"]', 10, 0, NULL, '2023-01-31 06:54:21', 0),
(3, '管理员', 'system.admin_users', NULL, '[\"\\/system\\/admin_users*\"]', 0, 2, NULL, NULL, 0),
(4, '角色', 'system.admin_roles', NULL, '[\"\\/system\\/admin_roles*\"]', 10, 2, NULL, NULL, 0),
(5, '权限', 'system.admin_permissions', NULL, '[\"\\/system\\/admin_permissions*\"]', 20, 2, NULL, NULL, 0),
(6, '菜单', 'system.admin_menus', NULL, '[\"\\/system\\/admin_menus*\"]', 30, 2, NULL, NULL, 0),
(8, 'Json示例', 'example', NULL, '[\"\\/example*\"]', 20, 0, '2022-09-06 10:32:40', '2023-01-31 06:54:21', 0),
(9, '所有Form示例', 'example.form_all', NULL, '[\"\\/example\\/form_all*\"]', 10, 8, '2022-09-06 10:34:10', '2022-09-06 11:05:12', 0),
(10, '表单展示模式', 'example.form', NULL, '[\"\\/example\\/form*\"]', 60, 8, '2022-09-06 11:05:57', '2022-09-06 11:05:57', 0),
(11, '显隐切换示例', 'example.reaction', NULL, '[\"\\/example\\/reaction*\"]', 0, 8, '2022-09-06 11:16:26', '2022-09-06 11:16:34', 0),
(12, '条件生成器', 'example.condition_builder', NULL, '[\"\\/example\\/condition_builder*\"]', 20, 8, '2022-09-06 11:20:12', '2022-09-06 11:20:12', 0),
(13, '弹框', 'example.dialog', NULL, '[\"\\/example\\/dialog*\"]', 30, 8, '2022-09-06 11:23:46', '2022-09-06 11:23:46', 0),
(14, '选项卡', 'example.tabs', NULL, '[\"\\/example\\/tabs*\"]', 40, 8, '2022-09-06 11:23:46', '2022-09-06 11:23:46', 0),
(15, '步骤表单', 'example.wizard', NULL, '[\"\\/example\\/wizard*\"]', 50, 8, '2022-09-06 11:23:46', '2022-09-06 11:23:46', 0);

DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE IF NOT EXISTS `admin_permission_menu` (
  `permission_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_permission_menu_permission_id_menu_id_index` (`permission_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

DROP TABLE IF EXISTS `admin_relationships`;
CREATE TABLE IF NOT EXISTS `admin_relationships` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联名称',
  `args` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '关联参数',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '额外参数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, '超级管理员', 'administrator', '2022-09-06 18:21:39', '2022-09-06 18:21:39');

DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE IF NOT EXISTS `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12-28 06:09:27', '2023-12-28 06:09:27'),
(1, 2, '2024-01-12 05:20:03', '2024-01-12 05:20:03'),
(1, 3, '2024-01-12 05:20:03', '2024-01-12 05:20:03'),
(1, 4, '2024-01-12 05:20:03', '2024-01-12 05:20:03'),
(1, 5, '2024-01-12 05:20:03', '2024-01-12 05:20:03'),
(1, 15, '2024-03-19 12:53:29', '2024-03-19 12:53:29'),
(1, 14, '2024-03-19 12:53:29', '2024-03-19 12:53:29');

DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE IF NOT EXISTS `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-09-06 18:21:39', '2022-09-06 18:21:39');

DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE IF NOT EXISTS `admin_settings` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `admin_settings` (`key`, `values`, `created_at`, `updated_at`) VALUES
('admin_locale', '\"zh_CN\"', '2024-05-24 23:39:48', '2024-06-02 21:19:35'),
('system_theme_setting', '{\"darkTheme\":false,\"footer\":true,\"breadcrumb\":true,\"themeColor\":\"#1677ff\",\"layoutMode\":\"double\",\"siderTheme\":\"light\",\"topTheme\":\"light\",\"animateInType\":\"alpha\",\"animateInDuration\":600,\"animateOutType\":\"alpha\",\"animateOutDuration\":600,\"loginTemplate\":\"default\",\"keepAlive\":false,\"enableTab\":true,\"tabIcon\":true,\"accordionMenu\":false}', NULL, '2024-06-02 21:26:01');

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'admin', '$2y$10$0fX8bsGcG03Vg.PO32hW0enGbpaD6tHlQ/CWTAH5hzNztkijRbf1u', '超级管理员', NULL, NULL, '2022-09-06 18:21:39', '2022-09-06 18:21:39', 1);

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `view` int NOT NULL COMMENT '阅读量',
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `articles_title_index` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_08_22_203040_install_slow_admin', 1);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2889 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
