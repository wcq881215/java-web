/*
Navicat MySQL Data Transfer

Source Server         : 香港2腾讯
Source Server Version : 50173
Source Host           : 119.28.12.118:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-12-18 07:49:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_advice
-- ----------------------------
DROP TABLE IF EXISTS `app_advice`;
CREATE TABLE `app_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `content` text COMMENT '建议内容',
  `time` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_advice
-- ----------------------------
INSERT INTO `app_advice` VALUES ('3', '6', 'qqqq', '2017-10-25', '1');
INSERT INTO `app_advice` VALUES ('4', '6', 'aaaaaaaaa', '2017-10-25', '1');
INSERT INTO `app_advice` VALUES ('5', '6', '可怜可怜', '2017-10-25', '1');

-- ----------------------------
-- Table structure for app_case
-- ----------------------------
DROP TABLE IF EXISTS `app_case`;
CREATE TABLE `app_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态 0不可用 1可用',
  `uid` int(11) DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_case
-- ----------------------------
INSERT INTO `app_case` VALUES ('26', '设备', '问题', '2017-10-24 13:43:13', '1', '2');
INSERT INTO `app_case` VALUES ('27', 'jishu01', 'shangchuanwenti1234', '2017-10-25 20:48:00', '1', '19');
INSERT INTO `app_case` VALUES ('29', '磨机问题', '技术(安装人员)', '2017-10-26 18:31:11', '1', '19');
INSERT INTO `app_case` VALUES ('30', '问题', '技术上传问题', '2017-10-26 18:52:42', '1', '19');
INSERT INTO `app_case` VALUES ('32', '技术发布01', '好的好的好的好的', '2017-10-28 09:28:33', '1', '19');
INSERT INTO `app_case` VALUES ('33', '技术发布01', '好的好的好的好的', '2017-10-28 09:28:38', '1', '19');
INSERT INTO `app_case` VALUES ('34', '技术发布01', '好的好的好的好的', '2017-10-28 09:28:41', '1', '19');

-- ----------------------------
-- Table structure for app_case_img
-- ----------------------------
DROP TABLE IF EXISTS `app_case_img`;
CREATE TABLE `app_case_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(30) NOT NULL COMMENT 'case id',
  `src` varchar(200) NOT NULL COMMENT '图片路径',
  `path` varchar(255) DEFAULT NULL,
  `alt` varchar(50) DEFAULT NULL COMMENT 'alt',
  `upload` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_case_img
-- ----------------------------
INSERT INTO `app_case_img` VALUES ('16', '27', 'http://zd.meyapp.com:8089//upload/20171025/20171025204801257.png', '/usr/java/server/apache-tomcat-8.0.30/webapps/ROOT/upload/20171025/20171025204801257.png', 'EJB4Y0@9M@UB$~7(2YD_B0M.png', '2017-10-25', '1');

-- ----------------------------
-- Table structure for app_device
-- ----------------------------
DROP TABLE IF EXISTS `app_device`;
CREATE TABLE `app_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(30) NOT NULL COMMENT 'sn',
  `pid` int(11) DEFAULT NULL,
  `_name` varchar(32) NOT NULL COMMENT '设备名称',
  `_desc` text COMMENT '简介',
  `type` varchar(15) DEFAULT NULL COMMENT '类别',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `price` double(12,2) DEFAULT NULL COMMENT '单价',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_device
-- ----------------------------
INSERT INTO `app_device` VALUES ('1', '1111222333', null, '机床螺丝', 'xxxxxx NB', '螺丝', '1000', '0.10', '1', '2017-10-02 18:12:26');
INSERT INTO `app_device` VALUES ('2', '1111222334', null, '全自动切割机 ZDH-500', '全自动切割机 ZD', '切割机', '300', '250.00', '1', '2017-10-02 22:52:12');
INSERT INTO `app_device` VALUES ('3', '1254122544', null, '十四圆头抛光机 ZD-1200', '十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200', '抛光机', '1', '1.00', '1', '2017-10-02 22:58:08');
INSERT INTO `app_device` VALUES ('4', '1211221', null, '瓷砖机 ZDC-1200 ', '瓷砖机 ZDC-1200 ', '瓷砖机', '352', '22222.00', '1', '2017-10-02 22:58:02');
INSERT INTO `app_device` VALUES ('5', '121212', null, '全自动切割机 ZDH-500', '全自动切割机 ZDH-500', '切割机', '111', '1111.00', '1', '2017-10-02 22:58:33');
INSERT INTO `app_device` VALUES ('12', 'HG123456', '1', '手摇切割机', '手摇切边机切边机', '切边机', '1', '18500.00', '1', '2017-10-26 18:36:51');
INSERT INTO `app_device` VALUES ('13', 'HG123456', '1', '手摇切割机', '手摇切边机切边机', '切边机', '1', '18500.00', '1', '2017-10-26 18:36:52');
INSERT INTO `app_device` VALUES ('14', 'HG123456', '1', '手摇切割机', '手摇切边机切边机', '切边机', '1', '18500.00', '1', '2017-10-26 18:36:53');
INSERT INTO `app_device` VALUES ('15', '123456', '1', '磨边机', '好的', '11', '1111', '100000.00', '1', '2017-10-27 07:51:43');

-- ----------------------------
-- Table structure for app_device_detail
-- ----------------------------
DROP TABLE IF EXISTS `app_device_detail`;
CREATE TABLE `app_device_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) NOT NULL COMMENT 'sn',
  `_name` varchar(200) NOT NULL COMMENT '设备名称',
  `_desc` text NOT NULL COMMENT '简介',
  `type` varchar(100) NOT NULL COMMENT '类别',
  `pid` int(30) NOT NULL COMMENT 'proxy id',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `price` double(12,2) DEFAULT NULL COMMENT '单价',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_device_detail
-- ----------------------------
INSERT INTO `app_device_detail` VALUES ('1', 'NH11222333', '机床螺丝', 'xxxxxx NB', '螺丝', '1', '1000', '0.10', '1', '2017-10-18 23:42:43');

-- ----------------------------
-- Table structure for app_device_img
-- ----------------------------
DROP TABLE IF EXISTS `app_device_img`;
CREATE TABLE `app_device_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(30) NOT NULL COMMENT 'device id',
  `src` varchar(50) DEFAULT NULL COMMENT '图片url',
  `path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `alt` varchar(50) DEFAULT NULL COMMENT 'alt',
  `upload` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_device_img
-- ----------------------------
INSERT INTO `app_device_img` VALUES ('1', '1', '/images/p1.png', null, '全自动切割机 ZDH-500', '2017-09-02', '1');
INSERT INTO `app_device_img` VALUES ('2', '2', '/images/p1.png', null, '十四圆头抛光机 ZD-1200', '2017-10-02', '1');
INSERT INTO `app_device_img` VALUES ('3', '3', '/images/p2.png', null, '瓷砖机 ZDC-1200 ', '2017-10-02', '1');
INSERT INTO `app_device_img` VALUES ('4', '4', '/images/p3.png', null, '全自动切割机 ZDH-500', '2017-10-02', '1');
INSERT INTO `app_device_img` VALUES ('5', '5', '/images/p3.png', null, '全自动切割机 ZDH-500', '2017-10-03', '1');
INSERT INTO `app_device_img` VALUES ('6', '6', '/images/p3.png', null, '全自动切割机 ZDH-500', '2017-10-03', '1');

-- ----------------------------
-- Table structure for app_location
-- ----------------------------
DROP TABLE IF EXISTS `app_location`;
CREATE TABLE `app_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(50) NOT NULL COMMENT 'mobile device id',
  `longitude` double(11,8) DEFAULT NULL COMMENT '经度',
  `latitude` double(11,8) DEFAULT NULL COMMENT '纬度',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '定位时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_location
-- ----------------------------
INSERT INTO `app_location` VALUES ('1', 'adfdf-fdfe-fdf-erer-efd', '121.62871962', '31.19637950', '2017-09-28 22:24:25');
INSERT INTO `app_location` VALUES ('2', 'adfdf-fdfe-fdf-erer-efd', '122.35214440', '152.25412200', '2017-09-28 22:25:07');
INSERT INTO `app_location` VALUES ('3', 'xxxxx', '102.22121110', '86.25124112', '2017-10-07 15:21:58');
INSERT INTO `app_location` VALUES ('4', 'xxxxx', '102.22121110', '86.25124112', '2017-10-07 15:22:30');
INSERT INTO `app_location` VALUES ('5', 'xxxxx', '102.22121110', '86.25124112', '2017-10-07 15:24:12');

-- ----------------------------
-- Table structure for app_maintain
-- ----------------------------
DROP TABLE IF EXISTS `app_maintain`;
CREATE TABLE `app_maintain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) DEFAULT NULL COMMENT 'submit user id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `_desc` varchar(100) DEFAULT NULL COMMENT '简介',
  `content` text COMMENT '内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_maintain
-- ----------------------------
INSERT INTO `app_maintain` VALUES ('1', '1', '专业石材的清养方洁与保法', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '2017-10-14 09:56:57', '1');
INSERT INTO `app_maintain` VALUES ('2', '1', '专业石材的清养方洁与保法', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '2017-10-14 09:56:57', '1');
INSERT INTO `app_maintain` VALUES ('3', '1', '专业石材的清养方洁与保法', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '2017-10-14 09:56:57', '1');
INSERT INTO `app_maintain` VALUES ('4', '1', '专业石材的清养方洁与保法', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）', '2017-10-14 09:56:58', '1');
INSERT INTO `app_maintain` VALUES ('7', '1', '切边机', '安装安装', '安装安装', '2017-10-26 18:06:28', '1');
INSERT INTO `app_maintain` VALUES ('8', '1', '磨机', '安装安装', '安装安装', '2017-10-26 18:14:29', '1');

-- ----------------------------
-- Table structure for app_message
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '发布人',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `dept` varchar(50) DEFAULT NULL COMMENT '部门',
  `team` varchar(50) DEFAULT NULL COMMENT '科室',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_message
-- ----------------------------
INSERT INTO `app_message` VALUES ('1', '1', '关于国庆放假通知', '本公司严格按照国务院规定，今年（2017年）从10月1日起到10月8号，共八天假期！请相关部门负责人做好工作安排', null, null, null, '2017-10-05 01:12:51', '1');
INSERT INTO `app_message` VALUES ('2', '3', '订单编号13422101114客户李先生订购的设备已经发货', '订单编号13422101114客户李先生订购的设备已经发货', '生产部', '生产一部', null, '2017-10-18 21:09:03', '1');
INSERT INTO `app_message` VALUES ('3', '3', '订单编号13422101114客户李先生订购的设备已经发货', '订单编号13422101114客户李先生订购的设备已经发货', '后勤部', null, null, '2017-10-18 21:09:03', '1');
INSERT INTO `app_message` VALUES ('4', '1', '111', '222', '总经理', '总经理一部', '1', '2017-10-22 00:00:07', '1');
INSERT INTO `app_message` VALUES ('5', '1', '111', '222', '后勤部', '后勤一部', '2', '2017-10-22 00:00:07', '1');
INSERT INTO `app_message` VALUES ('6', '1', '111', '222', '销售部', '销售一部', '3', '2017-10-22 00:00:07', '1');
INSERT INTO `app_message` VALUES ('7', '1', '111', '222', '市场部', '市场一部', '4', '2017-10-22 00:00:07', '1');
INSERT INTO `app_message` VALUES ('8', '1', 'abcdef', 'xxx', '总经理', '总经理一部', '1', '2017-10-22 10:01:06', '1');
INSERT INTO `app_message` VALUES ('9', '1', 'abcdef', 'xxx', '后勤部', '后勤一部', '2', '2017-10-22 10:01:06', '1');
INSERT INTO `app_message` VALUES ('10', '1', 'abcdef', 'xxx', '销售部', '销售一部', '3', '2017-10-22 10:01:06', '1');
INSERT INTO `app_message` VALUES ('11', '1', 'abcdef', 'xxx', '市场部', '市场一部', '4', '2017-10-22 10:01:06', '1');
INSERT INTO `app_message` VALUES ('12', '1', '结构', '这种族', '总经理', '总经理一部', '1', '2017-10-22 18:37:33', '1');
INSERT INTO `app_message` VALUES ('13', '1', '结构', '这种族', '后勤部', '后勤一部', '2', '2017-10-22 18:37:34', '1');
INSERT INTO `app_message` VALUES ('14', '1', '结构', '这种族', '销售部', '销售一部', '3', '2017-10-22 18:37:34', '1');
INSERT INTO `app_message` VALUES ('15', '1', '结构', '这种族', '市场部', '市场一部', '4', '2017-10-22 18:37:34', '1');
INSERT INTO `app_message` VALUES ('16', '1', '结构', '这种族', '生产部', '生产一部', '5', '2017-10-22 18:37:34', '1');
INSERT INTO `app_message` VALUES ('17', '1', '结构', '这种族', '', null, '6', '2017-10-22 18:37:34', '1');
INSERT INTO `app_message` VALUES ('18', '1', '结构', '这种族', '售后服务', null, '7', '2017-10-22 18:37:34', '1');
INSERT INTO `app_message` VALUES ('19', '1', '结构', '这种族', '售后服务', null, '8', '2017-10-22 18:37:34', '1');
INSERT INTO `app_message` VALUES ('20', '1', '结构', '这种族', '售后服务', null, '9', '2017-10-22 18:37:34', '1');
INSERT INTO `app_message` VALUES ('21', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '总经理', '总经理一部', '1', '2017-10-24 08:21:36', '1');
INSERT INTO `app_message` VALUES ('22', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '后勤部', '后勤一部', '2', '2017-10-24 08:21:36', '1');
INSERT INTO `app_message` VALUES ('23', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '销售部', '销售一部', '3', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('24', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '市场部', '市场一部', '4', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('25', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '生产部', '生产一部', '5', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('26', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '7', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('27', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '8', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('28', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '9', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('29', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '生产部', '生产一部', '5', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('30', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '7', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('31', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '8', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('32', '1', '海工机械有限公司', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '9', '2017-10-24 08:21:37', '1');
INSERT INTO `app_message` VALUES ('33', '1', '海工机械', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '总经理', '总经理一部', '1', '2017-10-24 08:22:56', '1');
INSERT INTO `app_message` VALUES ('34', '1', '海工机械', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '后勤部', '后勤一部', '2', '2017-10-24 08:22:56', '1');
INSERT INTO `app_message` VALUES ('35', '1', '海工机械', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '销售部', '销售一部', '3', '2017-10-24 08:22:56', '1');
INSERT INTO `app_message` VALUES ('36', '1', '海工机械', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '市场部', '市场一部', '4', '2017-10-24 08:22:56', '1');
INSERT INTO `app_message` VALUES ('37', '1', '海工机械', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '生产部', '生产一部', '5', '2017-10-24 08:22:56', '1');
INSERT INTO `app_message` VALUES ('38', '1', '海工机械', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '7', '2017-10-24 08:22:56', '1');
INSERT INTO `app_message` VALUES ('39', '1', '海工机械', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '8', '2017-10-24 08:22:56', '1');
INSERT INTO `app_message` VALUES ('40', '1', '海工机械', '下载安装好后，才用上面那些用户角色帐户密码进行测试。', '售后服务', null, '9', '2017-10-24 08:22:56', '1');
INSERT INTO `app_message` VALUES ('41', '1', '海工售后', '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '总经理', '总经理一部', '1', '2017-10-24 09:36:51', '1');
INSERT INTO `app_message` VALUES ('42', '1', '海工售后', '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '后勤部', '后勤一部', '2', '2017-10-24 09:36:51', '1');
INSERT INTO `app_message` VALUES ('43', '1', '海工售后', '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '销售部', '销售一部', '3', '2017-10-24 09:36:51', '1');
INSERT INTO `app_message` VALUES ('44', '1', '海工售后', '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '市场部', '市场一部', '4', '2017-10-24 09:36:51', '1');
INSERT INTO `app_message` VALUES ('45', '1', '海工售后', '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '生产部', '生产一部', '5', '2017-10-24 09:36:51', '1');
INSERT INTO `app_message` VALUES ('46', '1', '海工售后', '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '售后服务', null, '7', '2017-10-24 09:36:51', '1');
INSERT INTO `app_message` VALUES ('47', '1', '海工售后', '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '售后服务', null, '8', '2017-10-24 09:36:51', '1');
INSERT INTO `app_message` VALUES ('48', '1', '海工售后', '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '售后服务', null, '9', '2017-10-24 09:36:51', '1');
INSERT INTO `app_message` VALUES ('49', '1', '软件测试', '123', '总经理', '总经理一部', '1', '2017-10-24 09:49:58', '1');
INSERT INTO `app_message` VALUES ('50', '1', '软件测试', '123', '后勤部', '后勤一部', '2', '2017-10-24 09:49:58', '1');
INSERT INTO `app_message` VALUES ('51', '1', '软件测试', '123', '销售部', '销售一部', '3', '2017-10-24 09:49:58', '1');
INSERT INTO `app_message` VALUES ('52', '1', '软件测试', '123', '市场部', '市场一部', '4', '2017-10-24 09:49:58', '1');
INSERT INTO `app_message` VALUES ('53', '1', '海工售后', '接到的请回复', '总经理', '总经理一部', '1', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('54', '1', '海工售后', '接到的请回复', '后勤部', '后勤一部', '2', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('55', '1', '海工售后', '接到的请回复', '销售部', '销售一部', '3', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('56', '1', '海工售后', '接到的请回复', '市场部', '市场一部', '4', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('57', '1', '海工售后', '接到的请回复', '生产部', '生产一部', '5', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('58', '1', '海工售后', '接到的请回复', '售后服务', null, '7', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('59', '1', '海工售后', '接到的请回复', '售后服务', null, '8', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('60', '1', '海工售后', '接到的请回复', '售后服务', null, '9', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('61', '1', '海工售后', '接到的请回复', '生产部', '生产一部', '5', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('62', '1', '海工售后', '接到的请回复', '售后服务', null, '7', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('63', '1', '海工售后', '接到的请回复', '售后服务', null, '8', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('64', '1', '海工售后', '接到的请回复', '售后服务', null, '9', '2017-10-25 10:04:59', '1');
INSERT INTO `app_message` VALUES ('65', '1', '海工售后', '接到的请回复', '总经理', '总经理一部', '1', '2017-10-25 10:05:15', '1');
INSERT INTO `app_message` VALUES ('66', '1', '海工售后', '接到的请回复', '后勤部', '后勤一部', '2', '2017-10-25 10:05:15', '1');
INSERT INTO `app_message` VALUES ('67', '1', '海工售后', '接到的请回复', '销售部', '销售一部', '3', '2017-10-25 10:05:15', '1');
INSERT INTO `app_message` VALUES ('68', '1', '海工售后', '接到的请回复', '市场部', '市场一部', '4', '2017-10-25 10:05:15', '1');
INSERT INTO `app_message` VALUES ('69', '1', '海工售后', '接到的请回复', '生产部', '生产一部', '5', '2017-10-25 10:05:15', '1');
INSERT INTO `app_message` VALUES ('70', '1', '海工售后', '接到的请回复', '售后服务', null, '7', '2017-10-25 10:05:15', '1');
INSERT INTO `app_message` VALUES ('71', '1', '海工售后', '接到的请回复', '售后服务', null, '8', '2017-10-25 10:05:15', '1');
INSERT INTO `app_message` VALUES ('72', '1', '海工售后', '接到的请回复', '售后服务', null, '9', '2017-10-25 10:05:15', '1');
INSERT INTO `app_message` VALUES ('73', '1', '10.26', '海工机械有限公司', '总经理', '总经理一部', '1', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('74', '1', '10.26', '海工机械有限公司', '后勤部', '后勤一部', '2', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('75', '1', '10.26', '海工机械有限公司', '销售部', '销售一部', '3', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('76', '1', '10.26', '海工机械有限公司', '市场部', '市场一部', '4', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('77', '1', '10.26', '海工机械有限公司', '生产部', '生产一部', '5', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('78', '1', '10.26', '海工机械有限公司', '售后服务', null, '7', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('79', '1', '10.26', '海工机械有限公司', '售后服务', null, '8', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('80', '1', '10.26', '海工机械有限公司', '售后服务', null, '9', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('81', '1', '10.26', '海工机械有限公司', '售后服务', null, '10', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('82', '1', '10.26', '海工机械有限公司', '售后服务', null, '11', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('83', '1', '10.26', '海工机械有限公司', '内勤', null, '12', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('84', '1', '10.26', '海工机械有限公司', '售后服务', null, '13', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('85', '1', '10.26', '海工机械有限公司', '内勤', null, '14', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('86', '1', '10.26', '海工机械有限公司', '生产部', null, '15', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('87', '1', '10.26', '海工机械有限公司', '售后服务', null, '16', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('88', '1', '10.26', '海工机械有限公司', '售后服务', null, '17', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('89', '1', '10.26', '海工机械有限公司', '售后服务', null, '18', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('90', '1', '10.26', '海工机械有限公司', '技术员', null, '19', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('91', '1', '10.26', '海工机械有限公司', '技术员', null, '20', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('92', '1', '10.26', '海工机械有限公司', '生产部', null, '22', '2017-10-26 08:06:39', '1');
INSERT INTO `app_message` VALUES ('93', '1', '1026', '海工机械有限公司', '总经理', '总经理一部', '1', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('94', '1', '1026', '海工机械有限公司', '后勤部', '后勤一部', '2', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('95', '1', '1026', '海工机械有限公司', '销售部', '销售一部', '3', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('96', '1', '1026', '海工机械有限公司', '市场部', '市场一部', '4', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('97', '1', '1026', '海工机械有限公司', '生产部', '生产一部', '5', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('98', '1', '1026', '海工机械有限公司', '售后服务', null, '7', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('99', '1', '1026', '海工机械有限公司', '售后服务', null, '8', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('100', '1', '1026', '海工机械有限公司', '售后服务', null, '9', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('101', '1', '1026', '海工机械有限公司', '售后服务', null, '10', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('102', '1', '1026', '海工机械有限公司', '售后服务', null, '11', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('103', '1', '1026', '海工机械有限公司', '内勤', null, '12', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('104', '1', '1026', '海工机械有限公司', '售后服务', null, '13', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('105', '1', '1026', '海工机械有限公司', '内勤', null, '14', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('106', '1', '1026', '海工机械有限公司', '生产部', null, '15', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('107', '1', '1026', '海工机械有限公司', '售后服务', null, '16', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('108', '1', '1026', '海工机械有限公司', '售后服务', null, '17', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('109', '1', '1026', '海工机械有限公司', '售后服务', null, '18', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('110', '1', '1026', '海工机械有限公司', '技术员', null, '19', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('111', '1', '1026', '海工机械有限公司', '技术员', null, '20', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('112', '1', '1026', '海工机械有限公司', '生产部', null, '22', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('113', '1', '1026', '海工机械有限公司', '售后服务', null, '18', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('114', '1', '1026', '海工机械有限公司', '技术员', null, '19', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('115', '1', '1026', '海工机械有限公司', '技术员', null, '20', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('116', '1', '1026', '海工机械有限公司', '生产部', null, '22', '2017-10-26 08:08:48', '1');
INSERT INTO `app_message` VALUES ('117', '1', '10', '海工机械有限公司', '总经理', '总经理一部', '1', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('118', '1', '10', '海工机械有限公司', '后勤部', '后勤一部', '2', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('119', '1', '10', '海工机械有限公司', '销售部', '销售一部', '3', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('120', '1', '10', '海工机械有限公司', '市场部', '市场一部', '4', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('121', '1', '10', '海工机械有限公司', '生产部', '生产一部', '5', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('122', '1', '10', '海工机械有限公司', '售后服务', null, '7', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('123', '1', '10', '海工机械有限公司', '售后服务', null, '8', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('124', '1', '10', '海工机械有限公司', '售后服务', null, '9', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('125', '1', '10', '海工机械有限公司', '售后服务', null, '10', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('126', '1', '10', '海工机械有限公司', '售后服务', null, '11', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('127', '1', '10', '海工机械有限公司', '内勤', null, '12', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('128', '1', '10', '海工机械有限公司', '售后服务', null, '13', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('129', '1', '10', '海工机械有限公司', '内勤', null, '14', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('130', '1', '10', '海工机械有限公司', '生产部', null, '15', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('131', '1', '10', '海工机械有限公司', '售后服务', null, '16', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('132', '1', '10', '海工机械有限公司', '售后服务', null, '17', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('133', '1', '10', '海工机械有限公司', '售后服务', null, '18', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('134', '1', '10', '海工机械有限公司', '技术员', null, '19', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('135', '1', '10', '海工机械有限公司', '技术员', null, '20', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('136', '1', '10', '海工机械有限公司', '生产部', null, '22', '2017-10-26 08:11:25', '1');
INSERT INTO `app_message` VALUES ('137', '1', '好的好的', '123456789', '总经理', '总经理一部', '1', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('138', '1', '好的好的', '123456789', '后勤部', '后勤一部', '2', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('139', '1', '好的好的', '123456789', '销售部', '销售一部', '3', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('140', '1', '好的好的', '123456789', '市场部', '市场一部', '4', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('141', '1', '好的好的', '123456789', '生产部', '生产一部', '5', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('142', '1', '好的好的', '123456789', '售后服务', null, '7', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('143', '1', '好的好的', '123456789', '售后服务', null, '8', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('144', '1', '好的好的', '123456789', '售后服务', null, '9', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('145', '1', '好的好的', '123456789', '售后服务', null, '10', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('146', '1', '好的好的', '123456789', '售后服务', null, '11', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('147', '1', '好的好的', '123456789', '内勤', null, '12', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('148', '1', '好的好的', '123456789', '售后服务', null, '13', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('149', '1', '好的好的', '123456789', '内勤', null, '14', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('150', '1', '好的好的', '123456789', '生产部', null, '15', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('151', '1', '好的好的', '123456789', '售后服务', null, '16', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('152', '1', '好的好的', '123456789', '售后服务', null, '17', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('153', '1', '好的好的', '123456789', '售后服务', null, '18', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('154', '1', '好的好的', '123456789', '技术员', null, '19', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('155', '1', '好的好的', '123456789', '技术员', null, '20', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('156', '1', '好的好的', '123456789', '生产部', null, '22', '2017-10-26 18:48:11', '1');
INSERT INTO `app_message` VALUES ('157', '1', '好的好的', '123456789', '总经理', '总经理一部', '1', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('158', '1', '好的好的', '123456789', '后勤部', '后勤一部', '2', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('159', '1', '好的好的', '123456789', '销售部', '销售一部', '3', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('160', '1', '好的好的', '123456789', '市场部', '市场一部', '4', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('161', '1', '好的好的', '123456789', '生产部', '生产一部', '5', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('162', '1', '好的好的', '123456789', '售后服务', null, '7', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('163', '1', '好的好的', '123456789', '售后服务', null, '8', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('164', '1', '好的好的', '123456789', '售后服务', null, '9', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('165', '1', '好的好的', '123456789', '售后服务', null, '10', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('166', '1', '好的好的', '123456789', '售后服务', null, '11', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('167', '1', '好的好的', '123456789', '内勤', null, '12', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('168', '1', '好的好的', '123456789', '售后服务', null, '13', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('169', '1', '好的好的', '123456789', '内勤', null, '14', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('170', '1', '好的好的', '123456789', '生产部', null, '15', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('171', '1', '好的好的', '123456789', '售后服务', null, '16', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('172', '1', '好的好的', '123456789', '售后服务', null, '17', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('173', '1', '好的好的', '123456789', '售后服务', null, '18', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('174', '1', '好的好的', '123456789', '技术员', null, '19', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('175', '1', '好的好的', '123456789', '技术员', null, '20', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('176', '1', '好的好的', '123456789', '生产部', null, '22', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('177', '1', '好的好的', '123456789', '售后服务', null, '18', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('178', '1', '好的好的', '123456789', '技术员', null, '19', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('179', '1', '好的好的', '123456789', '技术员', null, '20', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('180', '1', '好的好的', '123456789', '生产部', null, '22', '2017-10-26 19:04:18', '1');
INSERT INTO `app_message` VALUES ('181', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '总经理', '总经理一部', '1', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('182', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '后勤部', '后勤一部', '2', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('183', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '销售部', '销售一部', '3', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('184', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '市场部', '市场一部', '4', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('185', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '生产部', '生产一部', '5', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('186', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '7', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('187', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '8', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('188', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '9', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('189', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '生产部', '生产一部', '5', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('190', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '7', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('191', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '8', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('192', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '9', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('193', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '生产部', '生产一部', '5', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('194', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '7', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('195', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '8', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('196', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '9', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('197', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '生产部', '生产一部', '5', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('198', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '7', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('199', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '8', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('200', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '9', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('201', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '内勤', null, '14', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('202', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '生产部', null, '15', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('203', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '16', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('204', '1', '内勤', '环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。', '售后服务', null, '17', '2017-10-27 07:33:52', '1');
INSERT INTO `app_message` VALUES ('205', '1', '管理', '呵呵', '总经理', '总经理一部', '1', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('206', '1', '管理', '呵呵', '后勤部', '后勤一部', '2', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('207', '1', '管理', '呵呵', '销售部', '销售一部', '3', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('208', '1', '管理', '呵呵', '市场部', '市场一部', '4', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('209', '1', '管理', '呵呵', '生产部', '生产一部', '5', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('210', '1', '管理', '呵呵', '售后服务', null, '7', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('211', '1', '管理', '呵呵', '售后服务', null, '8', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('212', '1', '管理', '呵呵', '售后服务', null, '9', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('213', '1', '管理', '呵呵', '售后服务', null, '10', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('214', '1', '管理', '呵呵', '售后服务', null, '11', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('215', '1', '管理', '呵呵', '内勤', null, '12', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('216', '1', '管理', '呵呵', '售后服务', null, '13', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('217', '1', '管理', '呵呵', '内勤', null, '14', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('218', '1', '管理', '呵呵', '生产部', null, '15', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('219', '1', '管理', '呵呵', '售后服务', null, '16', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('220', '1', '管理', '呵呵', '售后服务', null, '17', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('221', '1', '管理', '呵呵', '售后服务', null, '18', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('222', '1', '管理', '呵呵', '技术员', null, '19', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('223', '1', '管理', '呵呵', '技术员', null, '20', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('224', '1', '管理', '呵呵', '生产部', null, '22', '2017-10-27 16:48:51', '1');
INSERT INTO `app_message` VALUES ('225', '1', '一样一样', '一样一样', '总经理', '总经理一部', '1', '2017-12-02 15:44:23', '1');
INSERT INTO `app_message` VALUES ('226', '1', '一样一样', '一样一样', '后勤部', '后勤一部', '2', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('227', '1', '一样一样', '一样一样', '销售部', '销售一部', '3', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('228', '1', '一样一样', '一样一样', '市场部', '市场一部', '4', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('229', '1', '一样一样', '一样一样', '生产部', '生产一部', '5', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('230', '1', '一样一样', '一样一样', '售后服务', null, '7', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('231', '1', '一样一样', '一样一样', '售后服务', null, '8', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('232', '1', '一样一样', '一样一样', '售后服务', null, '9', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('233', '1', '一样一样', '一样一样', '售后服务', null, '10', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('234', '1', '一样一样', '一样一样', '售后服务', null, '11', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('235', '1', '一样一样', '一样一样', '内勤', null, '12', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('236', '1', '一样一样', '一样一样', '售后服务', null, '13', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('237', '1', '一样一样', '一样一样', '内勤', null, '14', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('238', '1', '一样一样', '一样一样', '生产部', null, '15', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('239', '1', '一样一样', '一样一样', '售后服务', null, '16', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('240', '1', '一样一样', '一样一样', '售后服务', null, '17', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('241', '1', '一样一样', '一样一样', '售后服务', null, '18', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('242', '1', '一样一样', '一样一样', '技术员', null, '19', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('243', '1', '一样一样', '一样一样', '技术员', null, '20', '2017-12-02 15:44:24', '1');
INSERT INTO `app_message` VALUES ('244', '1', '一样一样', '一样一样', '生产部', null, '22', '2017-12-02 15:44:24', '1');

-- ----------------------------
-- Table structure for app_news
-- ----------------------------
DROP TABLE IF EXISTS `app_news`;
CREATE TABLE `app_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `_desc` varchar(255) DEFAULT NULL,
  `content` text COMMENT '内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_news
-- ----------------------------
INSERT INTO `app_news` VALUES ('9', '1', '正大海工', null, '@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。', '2017-10-24 09:09:10', '1');
INSERT INTO `app_news` VALUES ('10', '1', '研讨会', null, '细节决定未来', '2017-10-24 12:47:53', '1');
INSERT INTO `app_news` VALUES ('11', '1', '研讨会', null, '细节决定未来', '2017-10-24 12:47:54', '1');
INSERT INTO `app_news` VALUES ('12', '1', '研讨会', null, '细节决定未来', '2017-10-24 12:47:58', '1');

-- ----------------------------
-- Table structure for app_news_img
-- ----------------------------
DROP TABLE IF EXISTS `app_news_img`;
CREATE TABLE `app_news_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(30) NOT NULL COMMENT 'case id',
  `src` varchar(500) NOT NULL COMMENT '图片url',
  `path` varchar(500) NOT NULL COMMENT '图片路径',
  `alt` varchar(200) DEFAULT NULL COMMENT 'alt 原始文件名称',
  `upload` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_news_img
-- ----------------------------
INSERT INTO `app_news_img` VALUES ('6', '9', 'http://zd.meyapp.com:8089//upload/20171024/20171024090911242.png', '/usr/java/server/apache-tomcat-8.0.30/webapps/ROOT/upload/20171024/20171024090911242.png', 'compress.png', '2017-10-24', '1');

-- ----------------------------
-- Table structure for app_order
-- ----------------------------
DROP TABLE IF EXISTS `app_order`;
CREATE TABLE `app_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) DEFAULT NULL,
  `pid` int(11) NOT NULL COMMENT '发布人',
  `proxy` int(11) DEFAULT NULL COMMENT '办事处',
  `buser` varchar(200) DEFAULT NULL COMMENT '业务员',
  `bphone` varchar(200) DEFAULT NULL COMMENT '业务员联系方式',
  `sn` int(11) NOT NULL COMMENT '设备编号',
  `did` int(11) DEFAULT NULL COMMENT '设备Id',
  `device` varchar(100) DEFAULT NULL COMMENT '设备名称',
  `type` varchar(100) DEFAULT NULL COMMENT '型号',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `price` double(12,2) DEFAULT NULL COMMENT '单价',
  `total` double(12,2) DEFAULT NULL COMMENT '总价',
  `ext` varchar(100) NOT NULL COMMENT '定制信息',
  `remark` varchar(100) DEFAULT NULL COMMENT '补充说明',
  `cust` varchar(300) DEFAULT NULL COMMENT '客户',
  `stime` varchar(20) DEFAULT NULL COMMENT '下单时间',
  `dtime` varchar(20) DEFAULT NULL COMMENT '送货时间',
  `address` varchar(500) DEFAULT NULL COMMENT '送货地址',
  `phone` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `logistics` varchar(20) DEFAULT NULL COMMENT '物流公司',
  `iphone` varchar(255) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL COMMENT '物流司机',
  `logphone` varchar(20) DEFAULT NULL COMMENT '司机联系电话',
  `fqid` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` char(2) DEFAULT '1' COMMENT '状态 0 无效 1 - 2 -3 -4 -5 ... -> over',
  `prod` int(255) DEFAULT NULL,
  `pack` int(255) DEFAULT NULL COMMENT '安装人',
  `srv` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_order
-- ----------------------------
INSERT INTO `app_order` VALUES ('5', null, '3', '1', '李伟珍', '13616670248', '1211221', '4', '瓷砖机 ZDC-1200 ', '瓷砖机', '1', '22222.00', '22222.00', '加长靠山', '哈哈\n', '李伟珍', '2017-10-24', '2017-10-30', '浙江省临海市江南街道', '13616670248', null, null, null, null, null, '2017-10-24 09:24:00', '1', '5', null, null);
INSERT INTO `app_order` VALUES ('6', null, '3', '5', '李伟珍', '13777675442', '1211221', '5', '瓷砖机 ZDC-1200 ', '瓷砖机', '1', '22222.00', '22222.00', 'ZDC800瓷砖机', '1台\n', '李伟珍', '2017-10-25', '2017-10-29', '浙江省临海市江南街道', '13777675442', null, null, null, null, null, '2017-10-25 14:29:25', '3', '5', null, '4');
INSERT INTO `app_order` VALUES ('7', null, '14', '1', 'yy', 'yyyp', '1111222334', '2', '全自动切割机 ZDH-500', '切割机', '1', '250.00', '250.00', 'hhhh', 'hhhhh', 'yy', '2017-10-25', '2017-11-28', '临海/临海', '12345678912', null, null, null, null, null, '2017-10-25 20:21:16', '2', '15', null, '4');
INSERT INTO `app_order` VALUES ('8', null, '14', '1', 'yyy', 'yyy', '1254122544', '1', '十四圆头抛光机 ZD-1200', '抛光机', '1', '1.00', '1.00', '', '', 'yyy', '2017-10-25', '2017-11-26', '', 'yyyy', null, null, null, null, null, '2017-10-25 20:37:17', '2', '22', null, '4');
INSERT INTO `app_order` VALUES ('9', null, '14', '1', '李伟珍', '12345678900', '1254122544', '3', '十四圆头抛光机 ZD-1200', '抛光机', '1', '1.00', '1.00', '好好好……', '好好好……', '李四', '2017-10-21', '2017-11-30', '临海大道', '123456789', null, null, null, null, null, '2017-10-25 21:22:54', '3', '22', null, '4');
INSERT INTO `app_order` VALUES ('10', null, '14', '1', '小总', '12345678900', '1211221', '3', '瓷砖机 ZDC-1200 ', '瓷砖机', '1', '22222.00', '22222.00', '', '', '吴', '2017-10-27', '2017-11-27', '哈哈哈', '12345678900', null, null, null, null, null, '2017-10-27 07:59:04', '2', '15', null, '4');
INSERT INTO `app_order` VALUES ('11', null, '14', '1', '乖乖', '00123456789', '123456', '15', '磨边机', '11', '50', '100000.00', '5000000.00', '乖乖', '', '乖乖', '2017-10-27', '2018-10-27', '', '00123456789', null, null, null, null, null, '2017-10-27 19:02:32', '2', '15', null, '4');
INSERT INTO `app_order` VALUES ('12', null, '14', '1', '十月', '12312312311', '1111222333', '1', '机床螺丝', '螺丝', '1', '0.10', '0.10', '定制', '', '十月', '2018-10-28', '2018-11-28', '杭州', '12312312311', null, null, null, null, null, '2017-10-28 09:47:59', '3', '15', null, '4');

-- ----------------------------
-- Table structure for app_order_notify
-- ----------------------------
DROP TABLE IF EXISTS `app_order_notify`;
CREATE TABLE `app_order_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `dept` varchar(50) DEFAULT NULL COMMENT '部门',
  `team` varchar(50) DEFAULT NULL COMMENT '科室',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` varchar(10) DEFAULT '0' COMMENT '状态 0等待处理 1处理中 2处理完毕',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_order_notify
-- ----------------------------

-- ----------------------------
-- Table structure for app_order_tech
-- ----------------------------
DROP TABLE IF EXISTS `app_order_tech`;
CREATE TABLE `app_order_tech` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '工单ID',
  `uid` int(11) DEFAULT NULL COMMENT '派遣人员',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `pid` int(11) DEFAULT NULL COMMENT '服务派公人员',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` varchar(10) DEFAULT '0' COMMENT '状态 0等待处理 1处理中 2处理完毕',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_order_tech
-- ----------------------------
INSERT INTO `app_order_tech` VALUES ('1', '6', '2', null, '4', '2017-10-25 16:27:04', '0');
INSERT INTO `app_order_tech` VALUES ('2', '6', '2', null, '4', '2017-10-25 16:33:35', '0');
INSERT INTO `app_order_tech` VALUES ('3', '6', '2', null, '4', '2017-10-25 20:44:51', '0');
INSERT INTO `app_order_tech` VALUES ('4', '6', '19', null, '4', '2017-10-25 20:44:51', '2');
INSERT INTO `app_order_tech` VALUES ('5', '6', '20', null, '4', '2017-10-25 20:44:51', '2');
INSERT INTO `app_order_tech` VALUES ('6', '7', '2', null, '4', '2017-10-25 20:48:49', '0');
INSERT INTO `app_order_tech` VALUES ('7', '7', '19', null, '4', '2017-10-25 20:48:49', '0');
INSERT INTO `app_order_tech` VALUES ('8', '7', '20', null, '4', '2017-10-25 20:48:49', '0');
INSERT INTO `app_order_tech` VALUES ('9', '7', '2', null, '4', '2017-10-25 20:49:37', '0');
INSERT INTO `app_order_tech` VALUES ('10', '7', '19', null, '4', '2017-10-25 20:49:37', '0');
INSERT INTO `app_order_tech` VALUES ('11', '7', '20', null, '4', '2017-10-25 20:49:37', '0');
INSERT INTO `app_order_tech` VALUES ('12', '7', '2', null, '4', '2017-10-25 20:51:59', '0');
INSERT INTO `app_order_tech` VALUES ('13', '7', '19', null, '4', '2017-10-25 20:51:59', '0');
INSERT INTO `app_order_tech` VALUES ('14', '7', '20', null, '4', '2017-10-25 20:51:59', '0');
INSERT INTO `app_order_tech` VALUES ('15', '7', '2', null, '4', '2017-10-25 20:58:56', '0');
INSERT INTO `app_order_tech` VALUES ('16', '7', '19', null, '4', '2017-10-25 20:58:56', '0');
INSERT INTO `app_order_tech` VALUES ('17', '7', '20', null, '4', '2017-10-25 20:58:56', '0');
INSERT INTO `app_order_tech` VALUES ('18', '7', '2', null, '4', '2017-10-25 20:59:07', '0');
INSERT INTO `app_order_tech` VALUES ('19', '7', '19', null, '4', '2017-10-25 20:59:07', '0');
INSERT INTO `app_order_tech` VALUES ('20', '7', '20', null, '4', '2017-10-25 20:59:07', '0');
INSERT INTO `app_order_tech` VALUES ('21', '7', '2', null, '4', '2017-10-25 20:59:21', '0');
INSERT INTO `app_order_tech` VALUES ('22', '7', '19', null, '4', '2017-10-25 20:59:21', '0');
INSERT INTO `app_order_tech` VALUES ('23', '7', '20', null, '4', '2017-10-25 20:59:22', '0');
INSERT INTO `app_order_tech` VALUES ('24', '7', '2', null, '4', '2017-10-25 21:08:42', '0');
INSERT INTO `app_order_tech` VALUES ('25', '7', '19', null, '4', '2017-10-25 21:08:42', '0');
INSERT INTO `app_order_tech` VALUES ('26', '7', '20', null, '4', '2017-10-25 21:08:42', '0');
INSERT INTO `app_order_tech` VALUES ('27', '9', '2', null, '4', '2017-10-25 21:28:32', '0');
INSERT INTO `app_order_tech` VALUES ('28', '9', '19', null, '4', '2017-10-25 21:28:32', '0');
INSERT INTO `app_order_tech` VALUES ('29', '9', '20', null, '4', '2017-10-25 21:28:32', '2');
INSERT INTO `app_order_tech` VALUES ('30', '7', '2', null, '4', '2017-10-26 08:02:01', '0');
INSERT INTO `app_order_tech` VALUES ('31', '7', '19', null, '4', '2017-10-26 08:02:01', '0');
INSERT INTO `app_order_tech` VALUES ('32', '7', '20', null, '4', '2017-10-26 08:02:01', '0');
INSERT INTO `app_order_tech` VALUES ('33', '10', '2', null, '4', '2017-10-27 08:05:02', '0');
INSERT INTO `app_order_tech` VALUES ('34', '10', '19', null, '4', '2017-10-27 08:05:02', '0');
INSERT INTO `app_order_tech` VALUES ('35', '10', '20', null, '4', '2017-10-27 08:05:02', '0');
INSERT INTO `app_order_tech` VALUES ('36', '10', '2', null, '4', '2017-10-27 08:05:16', '0');
INSERT INTO `app_order_tech` VALUES ('37', '10', '19', null, '4', '2017-10-27 08:05:16', '0');
INSERT INTO `app_order_tech` VALUES ('38', '10', '20', null, '4', '2017-10-27 08:05:16', '0');
INSERT INTO `app_order_tech` VALUES ('39', '7', '2', null, '4', '2017-10-27 18:39:38', '0');
INSERT INTO `app_order_tech` VALUES ('40', '7', '19', null, '4', '2017-10-27 18:39:38', '0');
INSERT INTO `app_order_tech` VALUES ('41', '7', '20', null, '4', '2017-10-27 18:39:38', '0');
INSERT INTO `app_order_tech` VALUES ('42', '7', '2', null, '4', '2017-10-27 18:43:31', '0');
INSERT INTO `app_order_tech` VALUES ('43', '7', '19', null, '4', '2017-10-27 18:43:31', '0');
INSERT INTO `app_order_tech` VALUES ('44', '7', '20', null, '4', '2017-10-27 18:43:31', '0');
INSERT INTO `app_order_tech` VALUES ('45', '11', '2', null, '4', '2017-10-27 19:09:13', '0');
INSERT INTO `app_order_tech` VALUES ('46', '11', '19', null, '4', '2017-10-27 19:09:13', '1');
INSERT INTO `app_order_tech` VALUES ('47', '11', '20', null, '4', '2017-10-27 19:09:13', '0');
INSERT INTO `app_order_tech` VALUES ('48', '12', '2', null, '4', '2017-10-28 09:57:09', '0');
INSERT INTO `app_order_tech` VALUES ('49', '12', '19', null, '4', '2017-10-28 09:57:09', '2');
INSERT INTO `app_order_tech` VALUES ('50', '12', '20', null, '4', '2017-10-28 09:57:09', '0');

-- ----------------------------
-- Table structure for app_proxy
-- ----------------------------
DROP TABLE IF EXISTS `app_proxy`;
CREATE TABLE `app_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(300) NOT NULL COMMENT '办事处',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `leader` varchar(50) DEFAULT NULL COMMENT '负责人',
  `lmobile` varchar(50) DEFAULT NULL COMMENT '负责人电话',
  `groups` varchar(200) DEFAULT '浙江正大集团有限公司' COMMENT '所属公司',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_proxy
-- ----------------------------
INSERT INTO `app_proxy` VALUES ('1', '临海办事处', '浙江省临海市小芝镇虎山南路261号', '0576-85771016', '办事员', '13524652541', '浙江正大集团有限公司', '2017-10-17 05:05:07', '1');
INSERT INTO `app_proxy` VALUES ('2', '台州办事处', '浙江省台州办事处', '0576-85771017', '办事员2', '135246525xxx', '浙江正大集团有限公司', '2017-10-17 05:06:19', '1');
INSERT INTO `app_proxy` VALUES ('4', '黑龙江代理商', '哈尔滨市先锋路', '15804503812', '贾东', '13703626522', '正大科技', '2017-10-24 11:25:00', '1');
INSERT INTO `app_proxy` VALUES ('5', '林耀', '浙江', '15988909851', '林耀', '15988909851', '正大', '2017-10-25 16:07:12', '1');

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(15) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `mobno` varchar(50) DEFAULT NULL COMMENT '手机设备号',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机',
  `role` varchar(15) DEFAULT NULL COMMENT '角色',
  `dept` varchar(255) DEFAULT NULL COMMENT '部门',
  `team` varchar(255) DEFAULT NULL COMMENT '科室',
  `device` varchar(100) DEFAULT NULL COMMENT '购买设备号',
  `s_time` datetime DEFAULT NULL COMMENT '购买设备时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '用户状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES ('1', 'admin', '111111', '吴真业', '\"\"', '18857653238', '管理员', '总经理', '总经理一部', null, null, '1');
INSERT INTO `app_user` VALUES ('2', 'tech', '111111', '吴小东', 'adfdf-fdfe-fdf-erer-1111', '13524625212', '技术员', '后勤部', '后勤一部', null, null, '1');
INSERT INTO `app_user` VALUES ('3', 'office', '111111', '李伟珍', '\"\"', '13616670248', '内勤', '销售部', '销售一部', null, null, '1');
INSERT INTO `app_user` VALUES ('4', 'service', '111111', '洪小辉', '\"\"', '15988990721', '售后服务', '市场部', '市场一部', null, null, '1');
INSERT INTO `app_user` VALUES ('5', 'produce', '111111', '郭伟坚', 'adfdf-fdfe-fdf-erer-444', '15988990719', '生产部', '生产部', '生产一部', null, null, '1');
INSERT INTO `app_user` VALUES ('6', 'customer', '111111', '林耀', 'adfdf-fdfe-fdf-erer-555', '15988909851', '购机客户', '', null, '1111222333', '2017-09-03 00:00:00', '1');
INSERT INTO `app_user` VALUES ('7', 'test', '111111', 'test', null, '13524309647', '售后服务', '售后服务', null, null, '2017-10-22 17:54:18', '1');
INSERT INTO `app_user` VALUES ('8', 'x', '111111', 'x', null, '11222', '售后服务', '售后服务', null, null, '2017-10-22 17:56:16', '1');
INSERT INTO `app_user` VALUES ('9', '111', '111111', '222', null, '333', '售后服务', '售后服务', null, null, '2017-10-22 18:20:09', '1');
INSERT INTO `app_user` VALUES ('10', 'HGJX001', '123456', '振业', null, '13666868811', '售后服务', '售后服务', null, null, '2017-10-25 20:10:29', '1');
INSERT INTO `app_user` VALUES ('11', 'hg001', '111111', 'zhenye', null, '13666868811', '售后服务', '售后服务', null, null, '2017-10-25 20:12:18', '1');
INSERT INTO `app_user` VALUES ('12', 'zhenye', '111111', 'zhenye8811', null, '13777670889', '内勤', '内勤', null, null, '2017-10-25 20:17:28', '1');
INSERT INTO `app_user` VALUES ('13', 'zhenye8811', '111111', 'zhenye8811', null, '13777670889', '售后服务', '售后服务', null, null, '2017-10-25 20:17:46', '1');
INSERT INTO `app_user` VALUES ('14', 'wuzhenye', '111111', 'wuzhenye', null, '13777670889', '内勤', '内勤', null, null, '2017-10-25 20:18:43', '1');
INSERT INTO `app_user` VALUES ('15', 'wuzhenyesc', '111111', 'wuzhenyesc', null, '13777670889', '生产部', '生产部', null, null, '2017-10-25 20:23:01', '1');
INSERT INTO `app_user` VALUES ('16', 'wuzhenyekh', '111111', 'wuzhenyekh', null, '13777670889', '售后服务', '售后服务', null, null, '2017-10-25 20:27:19', '1');
INSERT INTO `app_user` VALUES ('17', 'shouhe01', '111111', 'shouhe', null, '13777670889', '售后服务', '售后服务', null, null, '2017-10-25 20:41:28', '1');
INSERT INTO `app_user` VALUES ('18', 'shouhe02', '111111', 'shouhe02', null, '13777670889', '售后服务', '售后服务', null, null, '2017-10-25 20:42:02', '1');
INSERT INTO `app_user` VALUES ('19', 'jishu01', '111111', 'jishu01', null, '123456789000', '技术员', '技术员', null, null, '2017-10-25 20:43:40', '1');
INSERT INTO `app_user` VALUES ('20', 'jishu02', '111111', 'jishu02', null, '123456789', '技术员', '技术员', null, null, '2017-10-25 20:44:11', '1');
INSERT INTO `app_user` VALUES ('21', '海工客户01', '111111', '海工客户01', '864821032380747', '12345678900', '购机客户', null, null, 'hg1234', '2017-10-25 21:05:55', '1');
INSERT INTO `app_user` VALUES ('22', 'scb', '111111', 'scb01', null, 'scb01', '生产部', '生产部', null, null, '2017-10-25 21:12:07', '1');
INSERT INTO `app_user` VALUES ('23', '购机客户', '111111', '购机客户', null, '12345678900', '购机客户', '购机客户', null, null, '2017-10-28 13:10:38', '1');

-- ----------------------------
-- Table structure for app_video
-- ----------------------------
DROP TABLE IF EXISTS `app_video`;
CREATE TABLE `app_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '简介',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_video
-- ----------------------------
INSERT INTO `app_video` VALUES ('2', '1', '雕刻机', '雕刻过程', '2017-10-24 09:21:57', '1');
INSERT INTO `app_video` VALUES ('3', '1', '挡水条磨头夹的装卸', '有客户反应说磨头夹装卸困难，在不熟悉结构原理的情况下是不好拆，', '2017-10-24 12:55:12', '1');

-- ----------------------------
-- Table structure for app_video_src
-- ----------------------------
DROP TABLE IF EXISTS `app_video_src`;
CREATE TABLE `app_video_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(30) NOT NULL COMMENT 'video id',
  `src` varchar(500) NOT NULL COMMENT '视频url',
  `path` varchar(500) NOT NULL COMMENT '图片路径',
  `alt` varchar(200) DEFAULT NULL COMMENT 'alt 原始文件名称',
  `upload` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of app_video_src
-- ----------------------------
INSERT INTO `app_video_src` VALUES ('2', '2', '/usr/java/server/apache-tomcat-8.0.30/webapps/ROOT/upload/20171024/20171024092157726.mp4', 'http://zd.meyapp.com:8089//upload/20171024/20171024092157726.mp4', 'QQ空间视频_20170510220212.mp4', '2017-10-24', '1');
INSERT INTO `app_video_src` VALUES ('3', '3', '/usr/java/server/apache-tomcat-8.0.30/webapps/ROOT/upload/20171024/20171024125512159.mp4', 'http://zd.meyapp.com:8089//upload/20171024/20171024125512159.mp4', 'wx_camera_1508736482458.mp4', '2017-10-24', '1');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_key` varchar(20) NOT NULL COMMENT '数据字典key',
  `name` varchar(100) NOT NULL COMMENT '数据字典名称',
  `value` varchar(100) DEFAULT NULL COMMENT '数据字典值',
  `state` tinyint(1) DEFAULT NULL COMMENT '数据字典状态 0 不可用 1可用',
  `commit` varchar(100) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'cfg_app_name', '系统名称', '移动OA', '1', '系统名称');
