/*
 Navicat Premium Data Transfer

 Source Server         : Max
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : db_school_market

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 16/02/2021 15:17:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for market_comment
-- ----------------------------
DROP TABLE IF EXISTS `market_comment`;
CREATE TABLE `market_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `reply_to` varchar(64) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd01gnchhuj06oumqxrikccc3r` (`goods_id`),
  KEY `FKswirics8hhydki5ff0emtmbii` (`student_id`),
  CONSTRAINT `FKd01gnchhuj06oumqxrikccc3r` FOREIGN KEY (`goods_id`) REFERENCES `market_goods` (`id`),
  CONSTRAINT `FKswirics8hhydki5ff0emtmbii` FOREIGN KEY (`student_id`) REFERENCES `market_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for market_database_bak
-- ----------------------------
DROP TABLE IF EXISTS `market_database_bak`;
CREATE TABLE `market_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_database_bak
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for market_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `market_friend_link`;
CREATE TABLE `market_friend_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort` int(11) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_friend_link
-- ----------------------------
BEGIN;
INSERT INTO `market_friend_link` VALUES (18, '2021-02-16 12:56:48', '2021-02-16 13:07:58', 'MaxYang\'s Blog', 0, 'https://maxyang.love');
COMMIT;

-- ----------------------------
-- Table structure for market_goods
-- ----------------------------
DROP TABLE IF EXISTS `market_goods`;
CREATE TABLE `market_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `buy_price` float NOT NULL,
  `content` varchar(1024) NOT NULL,
  `flag` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `photo` varchar(128) NOT NULL,
  `recommend` int(11) NOT NULL,
  `sell_price` float NOT NULL,
  `status` int(11) NOT NULL,
  `goods_category_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `view_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjtyl6pmb9j4aj64sm54xi1hbi` (`goods_category_id`),
  KEY `FKf68a0a9u8u8hqckg0ycnjarv6` (`student_id`),
  CONSTRAINT `FKf68a0a9u8u8hqckg0ycnjarv6` FOREIGN KEY (`student_id`) REFERENCES `market_studnet` (`id`),
  CONSTRAINT `FKjtyl6pmb9j4aj64sm54xi1hbi` FOREIGN KEY (`goods_category_id`) REFERENCES `market_goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_goods
-- ----------------------------
BEGIN;
INSERT INTO `market_goods` VALUES (33, '2021-02-16 14:49:12', '2021-02-16 15:14:00', 6999, '盈通( yeston) AMD RADEON RX\r\n6800XT樱瞳花嫁纪念版7 nm RDNA2架\r\n构16 GB GDDR6游戏显卡', 1, 'AMD RADEON RX 6800', '20210216/1613458333400.png', 0, 6999, 1, 10, 6, 30);
COMMIT;

-- ----------------------------
-- Table structure for market_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_category`;
CREATE TABLE `market_goods_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `name` varchar(18) NOT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKos35mkmw4k5dvi4fi2govg2pa` (`parent_id`),
  CONSTRAINT `FKos35mkmw4k5dvi4fi2govg2pa` FOREIGN KEY (`parent_id`) REFERENCES `market_goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_goods_category
-- ----------------------------
BEGIN;
INSERT INTO `market_goods_category` VALUES (1, '2020-04-02 20:20:05', '2020-04-02 21:35:15', '20200402/1585834512163.png', '手机', 0, NULL);
INSERT INTO `market_goods_category` VALUES (4, '2020-04-02 20:26:45', '2020-04-02 21:35:54', '20200402/1585834542235.png', '智能机', 1, 1);
INSERT INTO `market_goods_category` VALUES (5, '2020-04-02 21:13:04', '2020-04-02 21:36:24', '20200402/1585834572308.png', '手机配件', 2, 1);
INSERT INTO `market_goods_category` VALUES (6, '2020-04-02 21:37:05', '2020-04-02 21:37:05', '20200402/1585834607924.png', '滑盖机', 3, 1);
INSERT INTO `market_goods_category` VALUES (7, '2020-04-02 21:37:23', '2020-04-02 21:37:23', '20200402/1585834633735.png', '翻盖机', 4, 1);
INSERT INTO `market_goods_category` VALUES (8, '2020-04-02 21:37:50', '2020-04-02 21:37:50', '20200402/1585834662625.png', '电脑', 5, NULL);
INSERT INTO `market_goods_category` VALUES (9, '2020-04-02 21:38:08', '2020-04-02 21:38:08', '20200402/1585834679788.png', '笔记本', 6, 8);
INSERT INTO `market_goods_category` VALUES (10, '2020-04-02 21:38:26', '2020-04-02 21:38:26', '20200402/1585834694895.png', '台式机', 7, 8);
INSERT INTO `market_goods_category` VALUES (11, '2020-04-02 21:38:45', '2020-04-02 21:38:45', '20200402/1585834717184.png', '平板', 8, 8);
INSERT INTO `market_goods_category` VALUES (15, '2020-04-05 18:46:54', '2020-04-05 19:07:07', '20200405/1586084764264.png', '影音娱乐', 9, NULL);
INSERT INTO `market_goods_category` VALUES (16, '2020-04-05 19:06:56', '2020-04-05 19:07:20', '20200405/1586084805468.png', '耳机', 10, 15);
INSERT INTO `market_goods_category` VALUES (17, '2020-04-05 19:07:45', '2020-04-05 19:07:45', '20200405/1586084854001.png', 'MP3/MP4', 11, 15);
INSERT INTO `market_goods_category` VALUES (18, '2020-04-05 19:08:15', '2020-04-05 19:08:15', '20200405/1586084878657.png', '游戏机', 12, 15);
INSERT INTO `market_goods_category` VALUES (19, '2020-04-05 19:08:44', '2020-04-05 19:08:44', '20200405/1586084911580.png', '键盘', 13, 15);
INSERT INTO `market_goods_category` VALUES (20, '2020-04-05 19:09:04', '2020-04-05 19:09:04', '20200405/1586084936056.png', '鼠标', 14, 15);
INSERT INTO `market_goods_category` VALUES (21, '2020-04-05 19:10:14', '2020-04-05 19:10:14', '20200405/1586085005899.png', '数码配件', 15, NULL);
INSERT INTO `market_goods_category` VALUES (22, '2020-04-05 19:10:45', '2020-04-05 19:10:45', '20200405/1586085024716.png', '移动硬盘', 16, 21);
INSERT INTO `market_goods_category` VALUES (23, '2020-04-05 19:11:08', '2020-04-05 19:11:08', '20200405/1586085052292.png', '相机', 17, 21);
INSERT INTO `market_goods_category` VALUES (24, '2020-04-05 19:11:25', '2020-04-05 19:11:25', '20200405/1586085077518.png', '显示器', 18, 21);
INSERT INTO `market_goods_category` VALUES (25, '2020-04-05 19:11:50', '2020-04-05 19:11:50', '20200405/1586085102042.png', '运动健身', 19, NULL);
INSERT INTO `market_goods_category` VALUES (26, '2020-04-05 19:12:13', '2020-04-05 19:12:13', '20200405/1586085124703.png', '篮球', 20, 25);
INSERT INTO `market_goods_category` VALUES (27, '2020-04-05 19:12:34', '2020-04-05 19:12:34', '20200405/1586085152812.png', '足球', 21, 25);
INSERT INTO `market_goods_category` VALUES (28, '2020-04-05 19:12:53', '2020-04-05 19:12:53', '20200405/1586085164372.png', '羽毛球', 22, 25);
INSERT INTO `market_goods_category` VALUES (29, '2020-04-05 19:13:11', '2020-04-05 19:13:11', '20200405/1586085182130.png', '球拍', 23, 25);
INSERT INTO `market_goods_category` VALUES (30, '2020-04-05 19:13:50', '2020-04-05 19:13:50', '20200405/1586085217886.png', '衣物鞋帽', 24, NULL);
INSERT INTO `market_goods_category` VALUES (31, '2020-04-05 19:14:15', '2020-04-05 19:14:15', '20200405/1586085239138.png', '上衣', 25, 30);
INSERT INTO `market_goods_category` VALUES (32, '2020-04-05 19:14:30', '2020-04-05 19:14:30', '20200405/1586085262037.png', '裤子', 26, 30);
INSERT INTO `market_goods_category` VALUES (33, '2020-04-05 19:14:48', '2020-04-05 19:14:48', '20200405/1586085278533.png', '背包', 27, 30);
INSERT INTO `market_goods_category` VALUES (34, '2020-04-05 19:15:12', '2020-04-05 19:15:12', '20200405/1586085302412.png', '雨伞', 28, 30);
INSERT INTO `market_goods_category` VALUES (35, '2020-04-05 19:15:29', '2020-04-05 19:15:29', '20200405/1586085319791.png', '鞋子', 29, 30);
INSERT INTO `market_goods_category` VALUES (36, '2020-04-05 19:15:55', '2020-04-05 19:15:55', '20200405/1586085349204.png', '配饰', 30, 30);
INSERT INTO `market_goods_category` VALUES (37, '2020-04-05 19:16:38', '2020-04-05 19:16:38', '20200405/1586085388834.png', '生活娱乐', 31, NULL);
INSERT INTO `market_goods_category` VALUES (38, '2020-04-05 19:17:05', '2020-04-05 19:17:05', '20200405/1586085407122.png', '乐器', 32, 37);
INSERT INTO `market_goods_category` VALUES (39, '2020-04-05 19:17:22', '2020-04-05 19:17:22', '20200405/1586085433434.png', '虚拟账号', 33, 37);
INSERT INTO `market_goods_category` VALUES (40, '2020-04-05 19:17:39', '2020-04-05 19:17:39', '20200405/1586085449303.png', '会员卡', 34, 37);
INSERT INTO `market_goods_category` VALUES (41, '2020-04-05 19:18:00', '2020-04-05 19:18:00', '20200405/1586085471766.png', '化妆品', 35, 37);
INSERT INTO `market_goods_category` VALUES (42, '2020-04-05 19:18:31', '2020-04-05 19:18:31', '20200405/1586085499095.png', '图书教材', 36, NULL);
INSERT INTO `market_goods_category` VALUES (43, '2020-04-05 19:18:49', '2020-04-05 19:18:49', '20200405/1586085520436.png', '教材', 37, 42);
INSERT INTO `market_goods_category` VALUES (44, '2020-04-05 19:19:05', '2020-04-05 19:19:05', '20200405/1586085534371.png', '考研材料', 38, 42);
INSERT INTO `market_goods_category` VALUES (45, '2020-04-05 19:19:24', '2020-04-05 19:19:24', '20200405/1586085556673.png', '课外书', 39, 42);
INSERT INTO `market_goods_category` VALUES (46, '2020-04-05 19:19:54', '2020-04-05 19:19:54', '20200405/1586085585909.png', '交通出行', 40, NULL);
INSERT INTO `market_goods_category` VALUES (47, '2020-04-05 19:20:18', '2020-04-05 19:20:18', '20200405/1586085604095.png', '自行车', 41, 46);
INSERT INTO `market_goods_category` VALUES (48, '2020-04-05 19:20:35', '2020-04-05 19:20:35', '20200405/1586085624951.png', '电动车', 42, 46);
INSERT INTO `market_goods_category` VALUES (49, '2020-04-05 19:21:01', '2020-04-05 19:21:01', '20200405/1586085652162.png', '交通卡', 43, 46);
INSERT INTO `market_goods_category` VALUES (50, '2020-04-05 19:21:29', '2020-04-05 19:21:29', '20200405/1586085681117.png', '个人技能', 44, NULL);
INSERT INTO `market_goods_category` VALUES (51, '2020-04-05 19:21:47', '2020-04-05 19:21:47', '20200405/1586085696883.png', '摄影', 45, 50);
INSERT INTO `market_goods_category` VALUES (52, '2020-04-05 19:22:05', '2020-04-05 19:22:05', '20200405/1586085714915.png', '绘画', 46, 50);
INSERT INTO `market_goods_category` VALUES (53, '2020-04-05 19:22:29', '2020-04-05 19:22:29', '20200405/1586085739125.png', '其他', 46, NULL);
INSERT INTO `market_goods_category` VALUES (54, '2020-04-11 21:19:25', '2020-04-11 21:19:40', '20200411/1586611155253.png', '手表', 47, 21);
INSERT INTO `market_goods_category` VALUES (55, '2020-04-12 22:31:58', '2020-04-12 22:32:08', '20200412/1586701902327.png', '其他小类', 48, 53);
COMMIT;

-- ----------------------------
-- Table structure for market_menu
-- ----------------------------
DROP TABLE IF EXISTS `market_menu`;
CREATE TABLE `market_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`),
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `market_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_menu
-- ----------------------------
BEGIN;
INSERT INTO `market_menu` VALUES (2, '2020-03-14 14:26:03', '2020-03-14 18:24:53', '系统设置', '', 'mdi-settings', 0, NULL, b'0', b'1');
INSERT INTO `market_menu` VALUES (3, '2020-03-14 16:58:55', '2020-03-14 18:26:02', '菜单管理', '/admin/menu/list', 'mdi-view-list', 1, 2, b'0', b'1');
INSERT INTO `market_menu` VALUES (5, '2020-03-14 17:04:44', '2020-03-14 18:27:53', '新增', '/admin/menu/add', 'mdi-plus', 2, 3, b'0', b'1');
INSERT INTO `market_menu` VALUES (7, '2020-03-14 17:07:43', '2020-03-15 12:11:25', '角色管理', '/admin/role/list', 'mdi-account-settings-variant', 5, 2, b'0', b'1');
INSERT INTO `market_menu` VALUES (8, '2020-03-14 18:28:48', '2020-03-21 22:04:45', '编辑', 'edit(\'/admin/menu/edit\')', 'mdi-grease-pencil', 3, 3, b'1', b'1');
INSERT INTO `market_menu` VALUES (9, '2020-03-14 18:30:00', '2020-03-21 22:08:20', '删除', 'del(\'/admin/menu/delete\')', 'mdi-close', 4, 3, b'1', b'1');
INSERT INTO `market_menu` VALUES (10, '2020-03-15 12:12:00', '2020-03-15 12:12:00', '添加', '/admin/role/add', 'mdi-account-plus', 6, 7, b'0', b'1');
INSERT INTO `market_menu` VALUES (11, '2020-03-15 12:12:36', '2020-03-21 22:10:45', '编辑', 'edit(\'/admin/role/edit\')', 'mdi-account-edit', 7, 7, b'1', b'1');
INSERT INTO `market_menu` VALUES (12, '2020-03-15 12:13:19', '2020-03-21 22:15:27', '删除', 'del(\'/admin/role/delete\')', 'mdi-account-remove', 8, 7, b'1', b'1');
INSERT INTO `market_menu` VALUES (13, '2020-03-15 12:14:52', '2020-03-15 12:17:00', '用户管理', '/admin/user/list', 'mdi-account-multiple', 9, 2, b'0', b'1');
INSERT INTO `market_menu` VALUES (14, '2020-03-15 12:15:22', '2020-03-15 12:17:27', '添加', '/admin/user/add', 'mdi-account-plus', 10, 13, b'0', b'1');
INSERT INTO `market_menu` VALUES (15, '2020-03-16 17:18:14', '2020-03-21 22:11:19', '编辑', 'edit(\'/admin/user/edit\')', 'mdi-account-edit', 11, 13, b'1', b'1');
INSERT INTO `market_menu` VALUES (16, '2020-03-16 17:19:01', '2020-03-21 22:15:36', '删除', 'del(\'/admin/user/delete\')', 'mdi-account-remove', 12, 13, b'1', b'1');
INSERT INTO `market_menu` VALUES (19, '2020-03-22 11:24:36', '2020-03-22 11:26:00', '上传图片', '/admin/upload/upload_photo', 'mdi-arrow-up-bold-circle', 0, 13, b'0', b'0');
INSERT INTO `market_menu` VALUES (20, '2020-03-22 14:09:35', '2020-03-22 14:09:47', '日志管理', '/system/operator_log_list', 'mdi-tag-multiple', 13, 2, b'0', b'1');
INSERT INTO `market_menu` VALUES (21, '2020-03-22 14:11:39', '2020-03-22 14:11:39', '删除', 'del(\'/system/delete_operator_log\')', 'mdi-tag-remove', 14, 20, b'1', b'1');
INSERT INTO `market_menu` VALUES (22, '2020-03-22 14:12:57', '2020-03-22 14:46:55', '清空日志', 'delAll(\'/system/delete_all_operator_log\')', 'mdi-delete-circle', 15, 20, b'1', b'1');
INSERT INTO `market_menu` VALUES (23, '2020-03-22 14:46:40', '2020-03-22 14:47:09', '数据备份', '/admin/database_bak/list', 'mdi-database', 16, 2, b'0', b'1');
INSERT INTO `market_menu` VALUES (24, '2020-03-22 14:48:07', '2020-03-22 15:13:41', '备份', 'add(\'/admin/database_bak/add\')', 'mdi-database-plus', 17, 23, b'1', b'1');
INSERT INTO `market_menu` VALUES (25, '2020-03-22 14:49:03', '2020-03-22 14:49:03', '删除', 'del(\'/admin/database_bak/delete\')', 'mdi-database-minus', 18, 23, b'1', b'1');
INSERT INTO `market_menu` VALUES (26, '2020-03-22 19:36:20', '2020-03-22 19:36:20', '还原', 'restore(\'/admin/database_bak/restore\')', 'mdi-database-minus', 19, 23, b'1', b'1');
INSERT INTO `market_menu` VALUES (27, '2020-04-01 20:35:09', '2020-04-01 20:35:09', '物品管理', '/admin/goods_category/list', 'mdi-dialpad', 0, NULL, b'0', b'1');
INSERT INTO `market_menu` VALUES (28, '2020-04-01 20:35:46', '2020-04-12 22:28:09', '分类管理', '/admin/goods_category/list', 'mdi-apps', 0, 27, b'0', b'1');
INSERT INTO `market_menu` VALUES (29, '2020-04-01 20:36:27', '2020-04-12 22:30:39', '物品管理', '/admin/goods/list', 'mdi-cart', 0, 27, b'0', b'1');
INSERT INTO `market_menu` VALUES (30, '2020-04-01 20:40:48', '2020-04-12 22:28:34', '添加', '/admin/goods_category/add', 'mdi-battery-positive', 0, 28, b'0', b'1');
INSERT INTO `market_menu` VALUES (31, '2020-04-01 20:41:33', '2020-04-12 22:30:02', '编辑', 'edit(\'/admin/goods_category/edit\')', 'mdi-border-color', 0, 28, b'1', b'1');
INSERT INTO `market_menu` VALUES (32, '2020-04-01 20:42:15', '2020-04-12 22:30:21', '删除', 'del(\'/admin/goods_category/delete\')', 'mdi-close', 0, 28, b'1', b'1');
INSERT INTO `market_menu` VALUES (33, '2020-04-13 18:52:12', '2020-04-13 18:52:12', '上架', 'up(\'/admin/goods/up_down\')', 'mdi-arrow-up-bold-box', 0, 29, b'1', b'1');
INSERT INTO `market_menu` VALUES (34, '2020-04-13 18:52:55', '2020-04-13 18:52:55', '下架', 'down(\'/admin/goods/up_down\')', 'mdi-arrow-down-bold-box', 0, 29, b'1', b'1');
INSERT INTO `market_menu` VALUES (35, '2020-04-13 18:54:10', '2020-04-15 19:17:48', '删除', 'del(\'/admin/goods/delete\')', 'mdi-close-box', 0, 29, b'1', b'1');
INSERT INTO `market_menu` VALUES (36, '2020-04-15 19:06:49', '2020-04-15 19:06:49', '推荐', 'recommend(\'/admin/goods/recommend\')', 'mdi-thumb-up', 0, 29, b'1', b'1');
INSERT INTO `market_menu` VALUES (37, '2020-04-15 19:07:45', '2020-04-15 19:07:45', '取消推荐', 'unrecommend(\'/admin/goods/recommend\')', 'mdi-thumb-down', 0, 29, b'1', b'1');
INSERT INTO `market_menu` VALUES (38, '2020-04-15 19:32:16', '2020-04-15 19:32:16', '求购物品', '/admin/wanted_goods/list', 'mdi-ticket', 0, 27, b'0', b'1');
INSERT INTO `market_menu` VALUES (39, '2020-04-15 19:32:55', '2020-04-15 19:59:53', '删除', 'del(\'/admin/wanted_goods/delete\')', 'mdi-close-box', 0, 38, b'1', b'1');
INSERT INTO `market_menu` VALUES (40, '2020-04-15 20:02:04', '2020-04-15 20:02:04', '学生管理', '/admin/student/list', 'mdi-account-multiple', 0, NULL, b'0', b'1');
INSERT INTO `market_menu` VALUES (41, '2020-04-15 20:02:38', '2020-04-15 20:02:38', '学生列表', '/admin/student/list', 'mdi-account-multiple', 0, 40, b'0', b'1');
INSERT INTO `market_menu` VALUES (42, '2020-04-15 20:06:28', '2020-04-15 20:06:28', '冻结', 'freeze(\'/admin/student/update_status\')', 'mdi-account-settings-variant', 0, 41, b'1', b'1');
INSERT INTO `market_menu` VALUES (43, '2020-04-15 20:06:59', '2020-04-15 21:45:31', '激活', 'openStudent(\'/admin/student/update_status\')', 'mdi-account-key', 0, 41, b'1', b'1');
INSERT INTO `market_menu` VALUES (44, '2020-04-15 20:07:33', '2020-04-15 20:07:33', '删除', 'del(\'/admin/student/delete\')', 'mdi-account-remove', 0, 41, b'1', b'1');
INSERT INTO `market_menu` VALUES (45, '2020-04-15 21:52:57', '2020-04-15 21:52:57', '评论管理', '/admin/comment/list', 'mdi-comment-account', 0, NULL, b'0', b'1');
INSERT INTO `market_menu` VALUES (46, '2020-04-15 21:53:39', '2020-04-15 21:53:39', '评论列表', '/admin/comment/list', 'mdi-comment-multiple-outline', 0, 45, b'0', b'1');
INSERT INTO `market_menu` VALUES (47, '2020-04-15 21:54:35', '2020-04-15 21:54:35', '删除', 'del(\'/admin/comment/delete\')', 'mdi-message-bulleted-off', 0, 46, b'1', b'1');
INSERT INTO `market_menu` VALUES (48, '2020-04-16 19:28:48', '2020-04-16 19:28:48', '举报管理', '/admin/report/list', 'mdi-alert', 0, NULL, b'0', b'1');
INSERT INTO `market_menu` VALUES (49, '2020-04-16 19:30:31', '2020-04-16 19:30:31', '举报列表', '/admin/report/list', 'mdi-view-headline', 0, 48, b'0', b'1');
INSERT INTO `market_menu` VALUES (50, '2020-04-16 19:31:09', '2020-04-16 19:31:09', '删除', 'del(\'/admin/report/delete\')', 'mdi-close-box', 0, 49, b'1', b'1');
INSERT INTO `market_menu` VALUES (51, '2020-04-16 19:46:08', '2020-04-16 19:46:08', '新闻公告', '/admin/news/list', 'mdi-onenote', 0, NULL, b'0', b'1');
INSERT INTO `market_menu` VALUES (52, '2020-04-16 19:46:39', '2020-04-16 19:46:39', '公告列表', '/admin/news/list', 'mdi-book-open', 0, 51, b'0', b'1');
INSERT INTO `market_menu` VALUES (53, '2020-04-16 19:48:01', '2020-04-16 19:48:01', '添加', '/admin/news/add', 'mdi-plus', 0, 52, b'0', b'1');
INSERT INTO `market_menu` VALUES (54, '2020-04-16 19:48:46', '2020-04-16 19:48:46', '编辑', 'edit(\'/admin/news/edit\')', 'mdi-border-color', 0, 52, b'1', b'1');
INSERT INTO `market_menu` VALUES (55, '2020-04-16 19:49:37', '2020-04-16 19:49:37', '删除', 'del(\'/admin/news/delete\')', 'mdi-close', 0, 52, b'1', b'1');
INSERT INTO `market_menu` VALUES (56, '2020-04-18 14:25:58', '2020-04-18 14:25:58', '网站设置', '', 'mdi-settings', 0, NULL, b'0', b'1');
INSERT INTO `market_menu` VALUES (57, '2020-04-18 14:27:31', '2020-04-18 14:27:31', '友情链接', '/admin/friend_link/list', 'mdi-vector-line', 0, 56, b'0', b'1');
INSERT INTO `market_menu` VALUES (58, '2020-04-18 14:28:36', '2020-04-18 14:28:36', '添加', '/admin/friend_link/add', 'mdi-plus', 0, 57, b'0', b'1');
INSERT INTO `market_menu` VALUES (59, '2020-04-18 14:29:17', '2020-04-18 15:38:53', '编辑', 'edit(\'/admin/friend_link/edit\')', 'mdi-border-color', 0, 57, b'1', b'1');
INSERT INTO `market_menu` VALUES (60, '2020-04-18 14:29:45', '2020-04-18 14:29:45', '删除', 'del(\'/admin/friend_link/delete\')', 'mdi-close-box', 0, 57, b'1', b'1');
INSERT INTO `market_menu` VALUES (61, '2020-04-18 16:26:45', '2020-04-18 16:26:45', '站点设置', '/admin/site_setting/setting', 'mdi-wrench', 0, 56, b'0', b'1');
INSERT INTO `market_menu` VALUES (62, '2020-04-18 16:28:25', '2020-04-18 16:28:25', '提交修改', '/admin/site_setting/save_setting', 'mdi-marker-check', 0, 61, b'1', b'0');
COMMIT;

-- ----------------------------
-- Table structure for market_news
-- ----------------------------
DROP TABLE IF EXISTS `market_news`;
CREATE TABLE `market_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(10024) NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `view_number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_news
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for market_operater_log
-- ----------------------------
DROP TABLE IF EXISTS `market_operater_log`;
CREATE TABLE `market_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_operater_log
-- ----------------------------
BEGIN;
INSERT INTO `market_operater_log` VALUES (417, '2021-02-16 14:07:44', '2021-02-16 14:07:44', '用户【MaxYang】于【2021-02-16 14:07:43】登录系统！', 'MaxYang');
INSERT INTO `market_operater_log` VALUES (418, '2021-02-16 14:25:43', '2021-02-16 14:25:43', '用户【MaxYang】于【2021-02-16 14:25:43】登录系统！', 'MaxYang');
INSERT INTO `market_operater_log` VALUES (419, '2021-02-16 14:35:43', '2021-02-16 14:35:43', '用户【MaxYang】于【2021-02-16 14:35:42】登录系统！', 'MaxYang');
INSERT INTO `market_operater_log` VALUES (420, '2021-02-16 14:36:32', '2021-02-16 14:36:32', '修改网站设置:SiteSetting [siteName=校园二手市场, siteUrl=www.maxyang.love, logo1=20210216/1613457389010.jpeg, logo2=20210216/1613449791139.png, qrcode=20210216/1613451341511.png, allRights=2021【MaxYang】 版权所有]', 'MaxYang');
INSERT INTO `market_operater_log` VALUES (421, '2021-02-16 15:13:52', '2021-02-16 15:13:52', '用户【MaxYang】于【2021-02-16 15:13:52】登录系统！', 'MaxYang');
COMMIT;

-- ----------------------------
-- Table structure for market_report_goods
-- ----------------------------
DROP TABLE IF EXISTS `market_report_goods`;
CREATE TABLE `market_report_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6g0s4688rq2bnty1u1ev1rgly` (`goods_id`),
  KEY `FKmr7s3q3jpq824h69f5ip9gleq` (`student_id`),
  CONSTRAINT `FK6g0s4688rq2bnty1u1ev1rgly` FOREIGN KEY (`goods_id`) REFERENCES `market_goods` (`id`),
  CONSTRAINT `FKmr7s3q3jpq824h69f5ip9gleq` FOREIGN KEY (`student_id`) REFERENCES `market_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_report_goods
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for market_role
-- ----------------------------
DROP TABLE IF EXISTS `market_role`;
CREATE TABLE `market_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_role
-- ----------------------------
BEGIN;
INSERT INTO `market_role` VALUES (1, '2020-03-15 13:16:38', '2020-04-18 16:28:37', '超级管理员', '超级管理员拥有最高权限。', 1);
INSERT INTO `market_role` VALUES (2, '2020-03-15 13:18:57', '2020-03-21 22:18:43', '普通管理员', '普通管理员只有部分权限', 1);
INSERT INTO `market_role` VALUES (4, '2020-03-21 20:11:00', '2020-03-23 17:49:00', '测试角色', 'sadsa', 0);
COMMIT;

-- ----------------------------
-- Table structure for market_role_authorities
-- ----------------------------
DROP TABLE IF EXISTS `market_role_authorities`;
CREATE TABLE `market_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`),
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`),
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `market_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `market_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_role_authorities
-- ----------------------------
BEGIN;
INSERT INTO `market_role_authorities` VALUES (2, 2);
INSERT INTO `market_role_authorities` VALUES (2, 3);
INSERT INTO `market_role_authorities` VALUES (2, 5);
INSERT INTO `market_role_authorities` VALUES (2, 7);
INSERT INTO `market_role_authorities` VALUES (2, 11);
INSERT INTO `market_role_authorities` VALUES (2, 13);
INSERT INTO `market_role_authorities` VALUES (2, 16);
INSERT INTO `market_role_authorities` VALUES (4, 2);
INSERT INTO `market_role_authorities` VALUES (4, 13);
INSERT INTO `market_role_authorities` VALUES (4, 15);
INSERT INTO `market_role_authorities` VALUES (1, 2);
INSERT INTO `market_role_authorities` VALUES (1, 3);
INSERT INTO `market_role_authorities` VALUES (1, 5);
INSERT INTO `market_role_authorities` VALUES (1, 8);
INSERT INTO `market_role_authorities` VALUES (1, 9);
INSERT INTO `market_role_authorities` VALUES (1, 7);
INSERT INTO `market_role_authorities` VALUES (1, 10);
INSERT INTO `market_role_authorities` VALUES (1, 11);
INSERT INTO `market_role_authorities` VALUES (1, 12);
INSERT INTO `market_role_authorities` VALUES (1, 13);
INSERT INTO `market_role_authorities` VALUES (1, 14);
INSERT INTO `market_role_authorities` VALUES (1, 15);
INSERT INTO `market_role_authorities` VALUES (1, 16);
INSERT INTO `market_role_authorities` VALUES (1, 19);
INSERT INTO `market_role_authorities` VALUES (1, 20);
INSERT INTO `market_role_authorities` VALUES (1, 21);
INSERT INTO `market_role_authorities` VALUES (1, 22);
INSERT INTO `market_role_authorities` VALUES (1, 23);
INSERT INTO `market_role_authorities` VALUES (1, 24);
INSERT INTO `market_role_authorities` VALUES (1, 25);
INSERT INTO `market_role_authorities` VALUES (1, 26);
INSERT INTO `market_role_authorities` VALUES (1, 27);
INSERT INTO `market_role_authorities` VALUES (1, 28);
INSERT INTO `market_role_authorities` VALUES (1, 30);
INSERT INTO `market_role_authorities` VALUES (1, 31);
INSERT INTO `market_role_authorities` VALUES (1, 32);
INSERT INTO `market_role_authorities` VALUES (1, 29);
INSERT INTO `market_role_authorities` VALUES (1, 33);
INSERT INTO `market_role_authorities` VALUES (1, 34);
INSERT INTO `market_role_authorities` VALUES (1, 35);
INSERT INTO `market_role_authorities` VALUES (1, 36);
INSERT INTO `market_role_authorities` VALUES (1, 37);
INSERT INTO `market_role_authorities` VALUES (1, 38);
INSERT INTO `market_role_authorities` VALUES (1, 39);
INSERT INTO `market_role_authorities` VALUES (1, 40);
INSERT INTO `market_role_authorities` VALUES (1, 41);
INSERT INTO `market_role_authorities` VALUES (1, 42);
INSERT INTO `market_role_authorities` VALUES (1, 43);
INSERT INTO `market_role_authorities` VALUES (1, 44);
INSERT INTO `market_role_authorities` VALUES (1, 45);
INSERT INTO `market_role_authorities` VALUES (1, 46);
INSERT INTO `market_role_authorities` VALUES (1, 47);
INSERT INTO `market_role_authorities` VALUES (1, 48);
INSERT INTO `market_role_authorities` VALUES (1, 49);
INSERT INTO `market_role_authorities` VALUES (1, 50);
INSERT INTO `market_role_authorities` VALUES (1, 51);
INSERT INTO `market_role_authorities` VALUES (1, 52);
INSERT INTO `market_role_authorities` VALUES (1, 53);
INSERT INTO `market_role_authorities` VALUES (1, 54);
INSERT INTO `market_role_authorities` VALUES (1, 55);
INSERT INTO `market_role_authorities` VALUES (1, 56);
INSERT INTO `market_role_authorities` VALUES (1, 57);
INSERT INTO `market_role_authorities` VALUES (1, 58);
INSERT INTO `market_role_authorities` VALUES (1, 59);
INSERT INTO `market_role_authorities` VALUES (1, 60);
INSERT INTO `market_role_authorities` VALUES (1, 61);
INSERT INTO `market_role_authorities` VALUES (1, 62);
COMMIT;

-- ----------------------------
-- Table structure for market_site_setting
-- ----------------------------
DROP TABLE IF EXISTS `market_site_setting`;
CREATE TABLE `market_site_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `all_rights` varchar(256) NOT NULL,
  `logo_1` varchar(256) NOT NULL,
  `logo_2` varchar(256) NOT NULL,
  `qrcode` varchar(256) NOT NULL,
  `site_name` varchar(128) NOT NULL,
  `site_url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_site_setting
-- ----------------------------
BEGIN;
INSERT INTO `market_site_setting` VALUES (1, '2020-04-18 17:02:17', '2021-02-16 14:36:32', '2021【MaxYang】 版权所有', '20210216/1613457389010.jpeg', '20210216/1613449791139.png', '20210216/1613451341511.png', '校园二手市场', 'www.maxyang.love');
COMMIT;

-- ----------------------------
-- Table structure for market_studnet
-- ----------------------------
DROP TABLE IF EXISTS `market_studnet`;
CREATE TABLE `market_studnet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `academy` varchar(18) DEFAULT NULL,
  `grade` varchar(18) DEFAULT NULL,
  `mobile` varchar(18) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `qq` varchar(18) DEFAULT NULL,
  `school` varchar(18) DEFAULT NULL,
  `sn` varchar(18) NOT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `password` varchar(18) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5se32pxcytmbwgepjrjrdmvjr` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_studnet
-- ----------------------------
BEGIN;
INSERT INTO `market_studnet` VALUES (6, '2021-02-15 23:13:56', '2021-02-16 14:28:01', '计算机科学与工程学院', '2017', '18973971142', 'MaxYang', '871286017', '北方民族大学', '20172118', NULL, 1, '111111');
COMMIT;

-- ----------------------------
-- Table structure for market_user
-- ----------------------------
DROP TABLE IF EXISTS `market_user`;
CREATE TABLE `market_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`),
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`),
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `market_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_user
-- ----------------------------
BEGIN;
INSERT INTO `market_user` VALUES (1, '2020-03-18 19:18:53', '2021-02-16 13:28:25', 'maxyang1121@icloud.com', '20210216/1613453303070.jpeg', '18973971142', '111111', 1, 1, 'MaxYang', 1);
COMMIT;

-- ----------------------------
-- Table structure for market_wanted_goods
-- ----------------------------
DROP TABLE IF EXISTS `market_wanted_goods`;
CREATE TABLE `market_wanted_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sell_price` float NOT NULL,
  `trade_place` varchar(128) NOT NULL,
  `view_number` int(11) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqvrfd43yhp11er38hkfcxi103` (`student_id`),
  CONSTRAINT `FKqvrfd43yhp11er38hkfcxi103` FOREIGN KEY (`student_id`) REFERENCES `market_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_wanted_goods
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
