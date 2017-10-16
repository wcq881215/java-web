/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50636
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 50636
 File Encoding         : 65001

 Date: 17/10/2017 07:54:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_advice
-- ----------------------------
DROP TABLE IF EXISTS `app_advice`;
CREATE TABLE `app_advice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '建议内容',
  `time` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_advice
-- ----------------------------
INSERT INTO `app_advice` VALUES (1, 6, '111', '2017-10-12', 1);
INSERT INTO `app_advice` VALUES (2, 6, '11111', '2017-10-13', 1);

-- ----------------------------
-- Table structure for app_case
-- ----------------------------
DROP TABLE IF EXISTS `app_case`;
CREATE TABLE `app_case`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `state` tinyint(4) DEFAULT 1 COMMENT '状态 0不可用 1可用',
  `uid` int(11) DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_case
-- ----------------------------
INSERT INTO `app_case` VALUES (17, '111', '2222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (18, '111??', '11121', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (19, '111', '2222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (20, '111', '2222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (21, '111', '222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (22, '111', '222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (23, '111', 'xxx', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (24, '111', 'xxx', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (25, '11', '222', '2017-10-10 22:00:47', 1, 2);

-- ----------------------------
-- Table structure for app_case_img
-- ----------------------------
DROP TABLE IF EXISTS `app_case_img`;
CREATE TABLE `app_case_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(30) NOT NULL COMMENT 'case id',
  `src` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `alt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'alt',
  `upload` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_case_img
-- ----------------------------
INSERT INTO `app_case_img` VALUES (1, 17, 'http://localhost:8080/ /upload/20171008/20171008023540938.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008023540938.jpeg', NULL, '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (2, 17, 'http://localhost:8080/ /upload/20171008/20171008023541121.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008023541121.jpeg', NULL, '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (3, 18, 'http://localhost:8080/ /upload/20171008/20171008023834349.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008023834349.jpeg', NULL, '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (4, 18, 'http://localhost:8080/ /upload/20171008/20171008023834380.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008023834380.jpeg', NULL, '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (5, 19, 'http://localhost:8080/ /upload/20171008/20171008120413144.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008120413144.jpeg', '1.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (6, 20, 'http://localhost:8080/ /upload/20171008/20171008121445548.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008121445548.jpeg', '2.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (7, 21, 'http://localhost:8080/ /upload/20171008/20171008121557792.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008121557792.jpeg', '3.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (8, 22, 'http://localhost:8080/ /upload/20171008/20171008121923370.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008121923370.jpeg', '4.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (9, 23, 'http://localhost:8080/ /upload/20171008/20171008123238227.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008123238227.jpeg', '5.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (10, 23, 'http://localhost:8080/ /upload/20171008/20171008123238328.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008123238328.jpeg', '5.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (11, 24, 'http://localhost:8080/ /upload/20171008/20171008124658894.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008124658894.jpeg', '5.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (12, 24, 'http://localhost:8080/ /upload/20171008/20171008124704609.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008124704609.jpeg', '5.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (13, 25, 'http://localhost:8080/ /upload/20171008/20171008124846061.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008124846061.jpeg', '5.jpg', '2017-10-08', 1);
INSERT INTO `app_case_img` VALUES (14, 1, 'http://localhost:8080//upload/20171014/20171014091113433.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171014/20171014091113433.jpeg', '199.jpeg', '2017-10-14', 1);

-- ----------------------------
-- Table structure for app_device
-- ----------------------------
DROP TABLE IF EXISTS `app_device`;
CREATE TABLE `app_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sn',
  `_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称',
  `_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类别',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `price` double(12, 2) DEFAULT NULL COMMENT '单价',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_device
-- ----------------------------
INSERT INTO `app_device` VALUES (1, '1111222333', '机床螺丝', 'xxxxxx NB', '螺丝', 1000, 0.10, 1, '2017-10-02 18:12:26');
INSERT INTO `app_device` VALUES (2, '1111222334', '全自动切割机 ZDH-500', '全自动切割机 ZD', '切割机', 300, 250.00, 1, '2017-10-02 22:52:12');
INSERT INTO `app_device` VALUES (3, '1254122544', '十四圆头抛光机 ZD-1200', '十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200', '抛光机', 1, 1.00, 1, '2017-10-02 22:58:08');
INSERT INTO `app_device` VALUES (4, '1211221', '瓷砖机 ZDC-1200 ', '瓷砖机 ZDC-1200 ', '瓷砖机', 352, 22222.00, 1, '2017-10-02 22:58:02');
INSERT INTO `app_device` VALUES (5, '121212', '全自动切割机 ZDH-500', '全自动切割机 ZDH-500', '切割机', 111, 1111.00, 1, '2017-10-02 22:58:33');

-- ----------------------------
-- Table structure for app_device_img
-- ----------------------------
DROP TABLE IF EXISTS `app_device_img`;
CREATE TABLE `app_device_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(30) NOT NULL COMMENT 'device id',
  `src` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `alt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'alt',
  `upload` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_device_img
-- ----------------------------
INSERT INTO `app_device_img` VALUES (1, 1, '/images/p.png', '全自动切割机 ZDH-500', '2017-09-02', 1);
INSERT INTO `app_device_img` VALUES (2, 2, '/images/p1.png', '十四圆头抛光机 ZD-1200', '2017-10-02', 1);
INSERT INTO `app_device_img` VALUES (3, 3, '/images/p2.png', '瓷砖机 ZDC-1200 ', '2017-10-02', 1);
INSERT INTO `app_device_img` VALUES (4, 4, '/images/p3.png', '全自动切割机 ZDH-500', '2017-10-02', 1);
INSERT INTO `app_device_img` VALUES (5, 5, '/images/p3.png', '全自动切割机 ZDH-500', '2017-10-03', 1);

-- ----------------------------
-- Table structure for app_location
-- ----------------------------
DROP TABLE IF EXISTS `app_location`;
CREATE TABLE `app_location`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mobile device id',
  `longitude` double(11, 8) DEFAULT NULL COMMENT '经度',
  `latitude` double(11, 8) DEFAULT NULL COMMENT '纬度',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '定位时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_location
-- ----------------------------
INSERT INTO `app_location` VALUES (1, 'adfdf-fdfe-fdf-erer-efd', 121.62871962, 31.19637950, '2017-09-28 22:24:25');
INSERT INTO `app_location` VALUES (2, 'adfdf-fdfe-fdf-erer-efd', 122.35214440, 152.25412200, '2017-09-28 22:25:07');
INSERT INTO `app_location` VALUES (3, 'xxxxx', 102.22121110, 86.25124112, '2017-10-07 15:21:58');
INSERT INTO `app_location` VALUES (4, 'xxxxx', 102.22121110, 86.25124112, '2017-10-07 15:22:30');
INSERT INTO `app_location` VALUES (5, 'xxxxx', 102.22121110, 86.25124112, '2017-10-07 15:24:12');

-- ----------------------------
-- Table structure for app_maintain
-- ----------------------------
DROP TABLE IF EXISTS `app_maintain`;
CREATE TABLE `app_maintain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) DEFAULT NULL COMMENT 'submit user id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `state` tinyint(4) DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_maintain
-- ----------------------------
INSERT INTO `app_maintain` VALUES (1, 1, '专业石材的清养方洁与保法', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '2017-10-14 09:56:57', 1);
INSERT INTO `app_maintain` VALUES (2, 1, '专业石材的清养方洁与保法', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '2017-10-14 09:56:57', 1);
INSERT INTO `app_maintain` VALUES (3, 1, '专业石材的清养方洁与保法', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '2017-10-14 09:56:57', 1);
INSERT INTO `app_maintain` VALUES (4, 1, '专业石材的清养方洁与保法', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '2017-10-14 09:56:58', 1);
INSERT INTO `app_maintain` VALUES (5, 1, '11', '12121', '12121', '2017-10-14 16:36:58', 1);

-- ----------------------------
-- Table structure for app_message
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '发布人',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `dept` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门',
  `team` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科室',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_message
-- ----------------------------
INSERT INTO `app_message` VALUES (1, 1, '关于国庆放假通知', '本公司严格按照国务院规定，今年（2017年）从10月1日起到10月8号，共八天假期！请相关部门负责人做好工作安排', NULL, NULL, NULL, '2017-10-05 01:12:51', 1);

-- ----------------------------
-- Table structure for app_news
-- ----------------------------
DROP TABLE IF EXISTS `app_news`;
CREATE TABLE `app_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `state` tinyint(4) DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_news
-- ----------------------------
INSERT INTO `app_news` VALUES (1, 1, '111', NULL, '2222', '2017-10-14 09:11:13', 1);
INSERT INTO `app_news` VALUES (2, 1, '111', NULL, '2222', '2017-10-14 16:34:49', 1);
INSERT INTO `app_news` VALUES (3, 1, '11212', NULL, '121212', '2017-10-14 16:36:16', 1);

-- ----------------------------
-- Table structure for app_news_img
-- ----------------------------
DROP TABLE IF EXISTS `app_news_img`;
CREATE TABLE `app_news_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(30) NOT NULL COMMENT 'case id',
  `src` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片url',
  `path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `alt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'alt 原始文件名称',
  `upload` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_news_img
-- ----------------------------
INSERT INTO `app_news_img` VALUES (1, 3, 'http://localhost:8080//upload/20171014/20171014163616233.jpeg', '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171014/20171014163616233.jpeg', '199.jpeg', '2017-10-14', 1);

-- ----------------------------
-- Table structure for app_order
-- ----------------------------
DROP TABLE IF EXISTS `app_order`;
CREATE TABLE `app_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '发布人',
  `proxy` int(11) DEFAULT NULL COMMENT '办事处',
  `buser` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '业务员',
  `bphone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '业务员联系方式',
  `sn` int(11) NOT NULL COMMENT '设备编号',
  `did` int(11) DEFAULT NULL COMMENT '设备Id',
  `device` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备名称',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '型号',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `price` double(12, 2) DEFAULT NULL COMMENT '单价',
  `total` double(12, 2) DEFAULT NULL COMMENT '总价',
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '定制信息',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '补充说明',
  `cust` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客户',
  `stime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下单时间',
  `dtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '送货时间',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '送货地址',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `logistics` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物流公司',
  `driver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物流司机',
  `logphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '司机联系电话',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `state` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '状态 0 无效 1 - 2 -3 -4 -5 ... -> over',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_order
-- ----------------------------
INSERT INTO `app_order` VALUES (1, 3, 1, '11', '22', 1111222334, 2, '全自动切割机 ZDH-500', '切割机', 122, NULL, NULL, '122', '122', '33', '2017-10-12', '2017-12-03', NULL, NULL, NULL, NULL, NULL, '2017-10-17 07:19:36', '1');
INSERT INTO `app_order` VALUES (2, 3, 1, '11', '12', 1111222334, 2, '全自动切割机 ZDH-500', '切割机', 12, NULL, NULL, '111', '11', '13', '2017-10-01', '2017-12-30', '112', '15', NULL, NULL, NULL, '2017-10-17 07:25:35', '1');
INSERT INTO `app_order` VALUES (3, 3, 1, '11', '12', 1111222334, 2, '全自动切割机 ZDH-500', '切割机', 12, 250.00, 3000.00, '111', '11', '13', '2017-10-01', '2017-12-30', '112', '15', NULL, NULL, NULL, '2017-10-17 07:27:23', '1');
INSERT INTO `app_order` VALUES (4, 3, 1, '11', '12', 1111222334, 2, '全自动切割机 ZDH-500', '切割机', 12, 250.00, 3000.00, '111', '11', '13', '2017-10-01', '2017-12-30', '112', '15', NULL, NULL, NULL, '2017-10-17 07:28:24', '1');

-- ----------------------------
-- Table structure for app_order_notify
-- ----------------------------
DROP TABLE IF EXISTS `app_order_notify`;
CREATE TABLE `app_order_notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `dept` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门',
  `team` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科室',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态 0等待处理 1处理中 2处理完毕',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for app_proxy
-- ----------------------------
DROP TABLE IF EXISTS `app_proxy`;
CREATE TABLE `app_proxy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '办事处',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `leader` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人',
  `lmobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人电话',
  `groups` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '浙江正大集团有限公司' COMMENT '所属公司',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `state` tinyint(4) DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_proxy
-- ----------------------------
INSERT INTO `app_proxy` VALUES (1, '临海办事处', '浙江省临海市小芝镇虎山南路261号', '0576-85771016', '办事员', '13524652541', '浙江正大集团有限公司', '2017-10-17 05:05:07', 1);
INSERT INTO `app_proxy` VALUES (2, '台州办事处', '浙江省台州办事处', '0576-85771017', '办事员2', '135246525xxx', '浙江正大集团有限公司', '2017-10-17 05:06:19', 1);
INSERT INTO `app_proxy` VALUES (3, '12', '12', '12', '12', '12', '121', '2017-10-17 07:50:18', 1);

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `mobno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机设备号',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `role` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色',
  `dept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门',
  `team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科室',
  `device` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '购买设备号',
  `s_time` date DEFAULT NULL COMMENT '购买设备时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '用户状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (1, 'admin', '111111', '吴小西', 'xxxxx', '135246252122', '管理员', NULL, NULL, NULL, NULL, 1);
INSERT INTO `app_user` VALUES (2, 'tech', '111111', '吴小东', 'adfdf-fdfe-fdf-erer-1111', '13524625212', '技术员', NULL, NULL, NULL, NULL, 1);
INSERT INTO `app_user` VALUES (3, 'office', '111111', '吴小北', 'adfdf-fdfe-fdf-2222', '13524625212', '内勤', NULL, NULL, NULL, NULL, 1);
INSERT INTO `app_user` VALUES (4, 'service', '111111', '吴小南', 'adfdf-fdfe-fdf-erer-333', '13524625212', '售后服务', NULL, NULL, NULL, NULL, 1);
INSERT INTO `app_user` VALUES (5, 'produce', '111111', '吴居中', 'adfdf-fdfe-fdf-erer-444', '13524625212', '生产部', NULL, NULL, NULL, NULL, 1);
INSERT INTO `app_user` VALUES (6, 'customer', '111111', '吴外来', 'adfdf-fdfe-fdf-erer-555', '13524625212', '购机客户', NULL, NULL, '1111222333', '2017-09-03', 1);

-- ----------------------------
-- Table structure for app_video
-- ----------------------------
DROP TABLE IF EXISTS `app_video`;
CREATE TABLE `app_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `state` tinyint(4) DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_video
-- ----------------------------
INSERT INTO `app_video` VALUES (1, 1, '111', '11122333', '2017-10-15 16:58:58', 1);

-- ----------------------------
-- Table structure for app_video_src
-- ----------------------------
DROP TABLE IF EXISTS `app_video_src`;
CREATE TABLE `app_video_src`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(30) NOT NULL COMMENT 'video id',
  `src` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频url',
  `path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `alt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'alt 原始文件名称',
  `upload` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of app_video_src
-- ----------------------------
INSERT INTO `app_video_src` VALUES (1, 1, '/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171015/20171015165851022.mp4', 'http://localhost:8080//upload/20171015/20171015165851022.mp4', 'cat.mp4', NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典key',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据字典值',
  `state` tinyint(1) DEFAULT NULL COMMENT '数据字典状态 0 不可用 1可用',
  `commit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'cfg_app_name', '系统名称', '移动OA', 1, '系统名称');

SET FOREIGN_KEY_CHECKS = 1;
