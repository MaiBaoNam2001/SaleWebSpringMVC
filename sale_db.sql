/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3360
 Source Schema         : sale_db

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/09/2022 21:21:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Điện thoại thông minh', NULL);
INSERT INTO `category` VALUES (2, 'Máy tính bảng', NULL);
INSERT INTO `category` VALUES (3, 'Máy tính xách tay', NULL);
INSERT INTO `category` VALUES (4, 'MOBILE', 'DIEN THOAI DI DONG');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment_product`(`product_id`) USING BTREE,
  INDEX `fk_comment_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_comment_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'Good', 1, 6, '2022-03-14 00:00:00');
INSERT INTO `comment` VALUES (2, 'Nice', 1, 7, '2022-08-12 00:00:00');
INSERT INTO `comment` VALUES (3, 'Tốt', 1, 8, '2022-08-11 20:00:05');
INSERT INTO `comment` VALUES (4, 'Sản phẩm tốt trong tầm giá !!!', 1, 6, '2022-08-15 14:19:22');
INSERT INTO `comment` VALUES (5, 'Sản phẩm OK lắm.', 1, 6, '2022-08-15 14:31:38');
INSERT INTO `comment` VALUES (6, 'Tôi rất thích sản phẩm này.', 1, 6, '2022-08-15 14:33:09');
INSERT INTO `comment` VALUES (7, 'Good', 1, 8, '2022-08-22 12:57:29');
INSERT INTO `comment` VALUES (8, 'Ổn', 1, 8, '2022-08-22 12:58:04');
INSERT INTO `comment` VALUES (9, 'Good', 23, 8, '2022-08-22 13:10:29');
INSERT INTO `comment` VALUES (10, 'Good', 23, 8, '2022-08-22 13:10:34');
INSERT INTO `comment` VALUES (11, 'Good', 23, 8, '2022-08-22 13:10:36');
INSERT INTO `comment` VALUES (12, 'Good', 23, 8, '2022-08-22 13:10:39');
INSERT INTO `comment` VALUES (13, 'Good', 23, 8, '2022-08-22 13:10:40');
INSERT INTO `comment` VALUES (14, 'Good', 23, 8, '2022-08-22 13:10:40');
INSERT INTO `comment` VALUES (15, 'Nice', 23, 8, '2022-08-22 13:10:49');
INSERT INTO `comment` VALUES (16, 'Tốt', 23, 8, '2022-08-22 13:11:00');
INSERT INTO `comment` VALUES (17, 'Ok', 23, 8, '2022-08-22 13:11:30');
INSERT INTO `comment` VALUES (18, 'Ổn', 23, 9, '2022-09-22 21:13:31');
INSERT INTO `comment` VALUES (19, 'Nice', 32, 6, '2022-09-22 21:15:34');
INSERT INTO `comment` VALUES (20, 'Nice', 32, 6, '2022-09-22 21:15:37');
INSERT INTO `comment` VALUES (21, 'Nice', 32, 6, '2022-09-22 21:16:03');
INSERT INTO `comment` VALUES (22, 'Nice', 32, 6, '2022-09-22 21:16:03');
INSERT INTO `comment` VALUES (23, 'Nice', 32, 6, '2022-09-22 21:16:03');
INSERT INTO `comment` VALUES (24, 'Nice', 32, 6, '2022-09-22 21:16:04');
INSERT INTO `comment` VALUES (25, 'Nice', 32, 6, '2022-09-22 21:16:04');
INSERT INTO `comment` VALUES (26, 'Nice', 32, 6, '2022-09-22 21:16:04');
INSERT INTO `comment` VALUES (27, 'Nice', 32, 6, '2022-09-22 21:16:04');
INSERT INTO `comment` VALUES (28, 'Good', 32, 6, '2022-09-22 21:16:14');
INSERT INTO `comment` VALUES (29, 'Ok', 32, 7, '2022-09-22 21:16:49');
INSERT INTO `comment` VALUES (30, 'Ok', 32, 7, '2022-09-22 21:16:53');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(10, 0) NULL DEFAULT 0,
  `num` int(45) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ORDERDETAIL_ORDER_idx`(`order_id`) USING BTREE,
  INDEX `FK_ORDERDETAIL_PRODUCT_idx`(`product_id`) USING BTREE,
  CONSTRAINT `FK_ORDERDETAIL_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ORDERDETAIL_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (5, 4, 1, 12500000, 1);
INSERT INTO `order_detail` VALUES (6, 4, 2, 21000000, 1);
INSERT INTO `order_detail` VALUES (7, 4, 3, 17000000, 1);
INSERT INTO `order_detail` VALUES (8, 5, 1, 12500000, 1);
INSERT INTO `order_detail` VALUES (9, 5, 3, 17000000, 1);
INSERT INTO `order_detail` VALUES (10, 5, 7, 10540000, 1);
INSERT INTO `order_detail` VALUES (11, 6, 2, 21000000, 1);
INSERT INTO `order_detail` VALUES (12, 7, 5, 18600000, 1);
INSERT INTO `order_detail` VALUES (13, 7, 6, 12990000, 3);
INSERT INTO `order_detail` VALUES (14, 8, 1, 12500000, 1);
INSERT INTO `order_detail` VALUES (15, 8, 2, 21000000, 2);
INSERT INTO `order_detail` VALUES (16, 8, 3, 17000000, 1);
INSERT INTO `order_detail` VALUES (17, 9, 1, 12500000, 1);
INSERT INTO `order_detail` VALUES (18, 9, 2, 21000000, 2);
INSERT INTO `order_detail` VALUES (19, 10, 4, 28000000, 1);
INSERT INTO `order_detail` VALUES (20, 10, 5, 18600000, 5);
INSERT INTO `order_detail` VALUES (21, 11, 1, 12500000, 2);
INSERT INTO `order_detail` VALUES (22, 11, 2, 21000000, 2);
INSERT INTO `order_detail` VALUES (23, 11, 3, 17000000, 1);
INSERT INTO `order_detail` VALUES (24, 13, 2, 0, 0);
INSERT INTO `order_detail` VALUES (25, 13, 1, 0, 0);
INSERT INTO `order_detail` VALUES (26, 14, 6, 12990000, 2);
INSERT INTO `order_detail` VALUES (27, 14, 7, 10540000, 4);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT 0,
  `manufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `active` bit(1) NULL DEFAULT b'1',
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_PRODUCE_CATEGORY_idx`(`category_id`) USING BTREE,
  CONSTRAINT `FK_PRODUCE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'iPhone 7 Plus', '32GB', 11000000, 'Apple', 'https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg', '2020-01-20 00:00:00', b'1', 1);
INSERT INTO `product` VALUES (2, 'Galaxy Note 10', '64GB', 21000000, 'Samsung', '/images/uploads/samsung-galaxy-note-10.png', '2020-01-08 00:00:00', b'1', 1);
INSERT INTO `product` VALUES (3, 'iPhone 11', '64GB', 17000000, 'Apple', '/images/uploads/iphone-11.png', '2020-01-12 00:00:00', b'1', 1);
INSERT INTO `product` VALUES (4, 'iPhone 11 Pro Max', '64GB', 28000000, 'Apple', '/images/uploads/iphone-11-pro-max.png', '2020-01-15 00:00:00', b'1', 1);
INSERT INTO `product` VALUES (5, 'Galaxy Tab S6', '128GB', 18600000, 'Samsung', '/images/uploads/samsung-galaxy-tab-s6.png', '2020-01-12 00:00:00', b'1', 2);
INSERT INTO `product` VALUES (6, 'iPad Mini 7.9', '64GB, Wifi', 12990000, 'Apple', '/images/uploads/ipad-mini.png', '2020-01-18 00:00:00', b'1', 2);
INSERT INTO `product` VALUES (7, 'iPad 10.2 inch', '32GB, Wifi Cellular', 10540000, 'Apple', '/images/uploads/ipad-10-2-inch-wifi-cellular-32gb.png', '2020-01-26 00:00:00', b'1', 2);
INSERT INTO `product` VALUES (16, 'iPhone 12 Pro', 'Apple', 30000000, NULL, NULL, NULL, b'1', 3);
INSERT INTO `product` VALUES (17, 'iPhone 12 Pro', 'Apple', 30000000, NULL, NULL, NULL, b'1', 3);
INSERT INTO `product` VALUES (18, 'iPhone 12 Pro', 'Apple', 30000000, NULL, 'https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg', NULL, b'1', 3);
INSERT INTO `product` VALUES (23, 'Xiaomi 12 Series', '256GB', 20000000, NULL, 'https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg', '2020-11-12 00:00:00', b'1', 1);
INSERT INTO `product` VALUES (32, 'Samsung Galaxy S20 Plus', NULL, 8000000, NULL, 'https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg', NULL, b'0', 1);

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10, 0) NULL DEFAULT NULL,
  `created_date` datetime(0) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ORDER_USER_idx`(`user_id`) USING BTREE,
  CONSTRAINT `FK_ORDER_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES (4, 50500000, '2020-02-03 00:00:00', 7);
INSERT INTO `sale_order` VALUES (5, 40040000, '2020-02-03 00:00:00', 7);
INSERT INTO `sale_order` VALUES (6, 21000000, '2020-02-03 00:00:00', 7);
INSERT INTO `sale_order` VALUES (7, 57570000, '2020-02-04 00:00:00', 7);
INSERT INTO `sale_order` VALUES (8, 71500000, '2020-02-05 00:00:00', 6);
INSERT INTO `sale_order` VALUES (9, 54500000, '2020-02-05 00:00:00', 7);
INSERT INTO `sale_order` VALUES (10, 121000000, '2020-02-07 00:00:00', 6);
INSERT INTO `sale_order` VALUES (11, 84000000, '2020-10-07 00:00:00', 8);
INSERT INTO `sale_order` VALUES (12, 100, '2020-11-17 18:43:31', NULL);
INSERT INTO `sale_order` VALUES (13, 100, '2020-11-17 18:48:11', NULL);
INSERT INTO `sale_order` VALUES (14, NULL, '2022-12-06 21:47:54', 8);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` bit(1) NULL DEFAULT b'1',
  `user_role` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (6, 'Peter', 'Walker', 'peterwalker@gmail.com', '0984461467', 'peterwalker', '$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO', b'1', 'ROLE_ADMIN');
INSERT INTO `user` VALUES (7, 'Jimmy', 'Wang', 'jimmywang@gmail.com', '0984461461', 'jimmywang', '$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua', b'1', 'ROLE_USER');
INSERT INTO `user` VALUES (8, 'Doremon', 'Mr', 'mon@gmail.com', '1111111111', 'doremon', '$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG', b'1', 'ROLE_USER');
INSERT INTO `user` VALUES (9, 'Mai', 'Nam', 'maibaonam260219@gmail.com', '0355915872', 'maibaonam', '$2a$10$hGkSSvwg1tSqumzn6Cmk4uqvfQfDjBLP1ofwnlrvxmwdvbwnTCXHm', b'1', 'ROLE_USER');

SET FOREIGN_KEY_CHECKS = 1;
