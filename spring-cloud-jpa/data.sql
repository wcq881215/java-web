DROP TABLE IF EXISTS `app_advice`;
CREATE TABLE `app_advice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '建议内容',
  `time` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci
;


INSERT INTO `app_advice` VALUES (1, 6, '111', '2017-10-12', 1);
INSERT INTO `app_advice` VALUES (2, 6, '11111', '2017-10-13', 1);

DROP TABLE IF EXISTS `app_case`;
CREATE TABLE `app_case`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `time` timestamp  COMMENT '发布时间',
  `state` tinyint(4) DEFAULT 1 COMMENT '状态 0不可用 1可用',
  `uid` int(11) DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

INSERT INTO `app_case` VALUES (17, '111', '2222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (18, '111??', '11121', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (19, '111', '2222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (20, '111', '2222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (21, '111', '222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (22, '111', '222', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (23, '111', 'xxx', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (24, '111', 'xxx', '2017-10-10 22:00:47', 1, 2);
INSERT INTO `app_case` VALUES (25, '11', '222', '2017-10-10 22:00:47', 1, 2);

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
  `time` timestamp ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

