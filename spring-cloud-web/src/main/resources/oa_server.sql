-- MySQL dump 10.13  Distrib 5.1.73, for unknown-linux-gnu (x86_64)
--
-- Host: localhost    Database: oa
-- ------------------------------------------------------
-- Server version	5.1.73-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_advice`
--

DROP TABLE IF EXISTS `app_advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `content` text COMMENT '建议内容',
  `time` date DEFAULT NULL COMMENT '上传时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_advice`
--

LOCK TABLES `app_advice` WRITE;
/*!40000 ALTER TABLE `app_advice` DISABLE KEYS */;
INSERT INTO `app_advice` VALUES (3,6,'qqqq','2017-10-25',1),(4,6,'aaaaaaaaa','2017-10-25',1),(5,6,'可怜可怜','2017-10-25',1);
/*!40000 ALTER TABLE `app_advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_case`
--

DROP TABLE IF EXISTS `app_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态 0不可用 1可用',
  `uid` int(11) DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_case`
--

LOCK TABLES `app_case` WRITE;
/*!40000 ALTER TABLE `app_case` DISABLE KEYS */;
INSERT INTO `app_case` VALUES (26,'设备','问题','2017-10-24 05:43:13',1,2),(27,'jishu01','shangchuanwenti1234','2017-10-25 12:48:00',1,19),(29,'磨机问题','技术(安装人员)','2017-10-26 10:31:11',1,19),(30,'问题','技术上传问题','2017-10-26 10:52:42',1,19),(32,'技术发布01','好的好的好的好的','2017-10-28 01:28:33',1,19),(33,'技术发布01','好的好的好的好的','2017-10-28 01:28:38',1,19),(34,'技术发布01','好的好的好的好的','2017-10-28 01:28:41',1,19);
/*!40000 ALTER TABLE `app_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_case_img`
--

DROP TABLE IF EXISTS `app_case_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_case_img`
--

LOCK TABLES `app_case_img` WRITE;
/*!40000 ALTER TABLE `app_case_img` DISABLE KEYS */;
INSERT INTO `app_case_img` VALUES (16,27,'http://zd.meyapp.com:8089//upload/20171025/20171025204801257.png','/usr/java/server/apache-tomcat-8.0.30/webapps/ROOT/upload/20171025/20171025204801257.png','EJB4Y0@9M@UB$~7(2YD_B0M.png','2017-10-25',1);
/*!40000 ALTER TABLE `app_case_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_device`
--

DROP TABLE IF EXISTS `app_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_device`
--

LOCK TABLES `app_device` WRITE;
/*!40000 ALTER TABLE `app_device` DISABLE KEYS */;
INSERT INTO `app_device` VALUES (1,'1111222333',NULL,'机床螺丝','xxxxxx NB','螺丝',1000,0.10,1,'2017-10-02 10:12:26'),(2,'1111222334',NULL,'全自动切割机 ZDH-500','全自动切割机 ZD','切割机',300,250.00,1,'2017-10-02 14:52:12'),(3,'1254122544',NULL,'十四圆头抛光机 ZD-1200','十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200','抛光机',1,1.00,1,'2017-10-02 14:58:08'),(4,'1211221',NULL,'瓷砖机 ZDC-1200 ','瓷砖机 ZDC-1200 ','瓷砖机',352,22222.00,1,'2017-10-02 14:58:02'),(5,'121212',NULL,'全自动切割机 ZDH-500','全自动切割机 ZDH-500','切割机',111,1111.00,1,'2017-10-02 14:58:33'),(12,'HG123456',1,'手摇切割机','手摇切边机切边机','切边机',1,18500.00,1,'2017-10-26 10:36:51'),(13,'HG123456',1,'手摇切割机','手摇切边机切边机','切边机',1,18500.00,1,'2017-10-26 10:36:52'),(14,'HG123456',1,'手摇切割机','手摇切边机切边机','切边机',1,18500.00,1,'2017-10-26 10:36:53'),(15,'123456',1,'磨边机','好的','11',1111,100000.00,1,'2017-10-26 23:51:43');
/*!40000 ALTER TABLE `app_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_device_detail`
--

DROP TABLE IF EXISTS `app_device_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_device_detail`
--

LOCK TABLES `app_device_detail` WRITE;
/*!40000 ALTER TABLE `app_device_detail` DISABLE KEYS */;
INSERT INTO `app_device_detail` VALUES (1,'NH11222333','机床螺丝','xxxxxx NB','螺丝',1,1000,0.10,1,'2017-10-18 15:42:43');
/*!40000 ALTER TABLE `app_device_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_device_img`
--

DROP TABLE IF EXISTS `app_device_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_device_img`
--

LOCK TABLES `app_device_img` WRITE;
/*!40000 ALTER TABLE `app_device_img` DISABLE KEYS */;
INSERT INTO `app_device_img` VALUES (1,1,'/images/p1.png',NULL,'全自动切割机 ZDH-500','2017-09-02',1),(2,2,'/images/p1.png',NULL,'十四圆头抛光机 ZD-1200','2017-10-02',1),(3,3,'/images/p2.png',NULL,'瓷砖机 ZDC-1200 ','2017-10-02',1),(4,4,'/images/p3.png',NULL,'全自动切割机 ZDH-500','2017-10-02',1),(5,5,'/images/p3.png',NULL,'全自动切割机 ZDH-500','2017-10-03',1),(6,6,'/images/p3.png',NULL,'全自动切割机 ZDH-500','2017-10-03',1);
/*!40000 ALTER TABLE `app_device_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_location`
--

DROP TABLE IF EXISTS `app_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(50) NOT NULL COMMENT 'mobile device id',
  `longitude` double(11,8) DEFAULT NULL COMMENT '经度',
  `latitude` double(11,8) DEFAULT NULL COMMENT '纬度',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '定位时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_location`
--

LOCK TABLES `app_location` WRITE;
/*!40000 ALTER TABLE `app_location` DISABLE KEYS */;
INSERT INTO `app_location` VALUES (1,'adfdf-fdfe-fdf-erer-efd',121.62871962,31.19637950,'2017-09-28 14:24:25'),(2,'adfdf-fdfe-fdf-erer-efd',122.35214440,152.25412200,'2017-09-28 14:25:07'),(3,'xxxxx',102.22121110,86.25124112,'2017-10-07 07:21:58'),(4,'xxxxx',102.22121110,86.25124112,'2017-10-07 07:22:30'),(5,'xxxxx',102.22121110,86.25124112,'2017-10-07 07:24:12');
/*!40000 ALTER TABLE `app_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_maintain`
--

DROP TABLE IF EXISTS `app_maintain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_maintain`
--

LOCK TABLES `app_maintain` WRITE;
/*!40000 ALTER TABLE `app_maintain` DISABLE KEYS */;
INSERT INTO `app_maintain` VALUES (1,1,'专业石材的清养方洁与保法','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','2017-10-14 01:56:57',1),(2,1,'专业石材的清养方洁与保法','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','2017-10-14 01:56:57',1),(3,1,'专业石材的清养方洁与保法','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','2017-10-14 01:56:57',1),(4,1,'专业石材的清养方洁与保法','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','2017-10-14 01:56:58',1),(7,1,'切边机','安装安装','安装安装','2017-10-26 10:06:28',1),(8,1,'磨机','安装安装','安装安装','2017-10-26 10:14:29',1);
/*!40000 ALTER TABLE `app_maintain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_message`
--

DROP TABLE IF EXISTS `app_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_message`
--

LOCK TABLES `app_message` WRITE;
/*!40000 ALTER TABLE `app_message` DISABLE KEYS */;
INSERT INTO `app_message` VALUES (1,1,'关于国庆放假通知','本公司严格按照国务院规定，今年（2017年）从10月1日起到10月8号，共八天假期！请相关部门负责人做好工作安排',NULL,NULL,NULL,'2017-10-04 17:12:51',1),(2,3,'订单编号13422101114客户李先生订购的设备已经发货','订单编号13422101114客户李先生订购的设备已经发货','生产部','生产一部',NULL,'2017-10-18 13:09:03',1),(3,3,'订单编号13422101114客户李先生订购的设备已经发货','订单编号13422101114客户李先生订购的设备已经发货','后勤部',NULL,NULL,'2017-10-18 13:09:03',1),(4,1,'111','222','总经理','总经理一部',1,'2017-10-21 16:00:07',1),(5,1,'111','222','后勤部','后勤一部',2,'2017-10-21 16:00:07',1),(6,1,'111','222','销售部','销售一部',3,'2017-10-21 16:00:07',1),(7,1,'111','222','市场部','市场一部',4,'2017-10-21 16:00:07',1),(8,1,'abcdef','xxx','总经理','总经理一部',1,'2017-10-22 02:01:06',1),(9,1,'abcdef','xxx','后勤部','后勤一部',2,'2017-10-22 02:01:06',1),(10,1,'abcdef','xxx','销售部','销售一部',3,'2017-10-22 02:01:06',1),(11,1,'abcdef','xxx','市场部','市场一部',4,'2017-10-22 02:01:06',1),(12,1,'结构','这种族','总经理','总经理一部',1,'2017-10-22 10:37:33',1),(13,1,'结构','这种族','后勤部','后勤一部',2,'2017-10-22 10:37:34',1),(14,1,'结构','这种族','销售部','销售一部',3,'2017-10-22 10:37:34',1),(15,1,'结构','这种族','市场部','市场一部',4,'2017-10-22 10:37:34',1),(16,1,'结构','这种族','生产部','生产一部',5,'2017-10-22 10:37:34',1),(17,1,'结构','这种族','',NULL,6,'2017-10-22 10:37:34',1),(18,1,'结构','这种族','售后服务',NULL,7,'2017-10-22 10:37:34',1),(19,1,'结构','这种族','售后服务',NULL,8,'2017-10-22 10:37:34',1),(20,1,'结构','这种族','售后服务',NULL,9,'2017-10-22 10:37:34',1),(21,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','总经理','总经理一部',1,'2017-10-24 00:21:36',1),(22,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','后勤部','后勤一部',2,'2017-10-24 00:21:36',1),(23,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','销售部','销售一部',3,'2017-10-24 00:21:37',1),(24,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','市场部','市场一部',4,'2017-10-24 00:21:37',1),(25,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','生产部','生产一部',5,'2017-10-24 00:21:37',1),(26,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,7,'2017-10-24 00:21:37',1),(27,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,8,'2017-10-24 00:21:37',1),(28,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,9,'2017-10-24 00:21:37',1),(29,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','生产部','生产一部',5,'2017-10-24 00:21:37',1),(30,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,7,'2017-10-24 00:21:37',1),(31,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,8,'2017-10-24 00:21:37',1),(32,1,'海工机械有限公司','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,9,'2017-10-24 00:21:37',1),(33,1,'海工机械','下载安装好后，才用上面那些用户角色帐户密码进行测试。','总经理','总经理一部',1,'2017-10-24 00:22:56',1),(34,1,'海工机械','下载安装好后，才用上面那些用户角色帐户密码进行测试。','后勤部','后勤一部',2,'2017-10-24 00:22:56',1),(35,1,'海工机械','下载安装好后，才用上面那些用户角色帐户密码进行测试。','销售部','销售一部',3,'2017-10-24 00:22:56',1),(36,1,'海工机械','下载安装好后，才用上面那些用户角色帐户密码进行测试。','市场部','市场一部',4,'2017-10-24 00:22:56',1),(37,1,'海工机械','下载安装好后，才用上面那些用户角色帐户密码进行测试。','生产部','生产一部',5,'2017-10-24 00:22:56',1),(38,1,'海工机械','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,7,'2017-10-24 00:22:56',1),(39,1,'海工机械','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,8,'2017-10-24 00:22:56',1),(40,1,'海工机械','下载安装好后，才用上面那些用户角色帐户密码进行测试。','售后服务',NULL,9,'2017-10-24 00:22:56',1),(41,1,'海工售后','@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','总经理','总经理一部',1,'2017-10-24 01:36:51',1),(42,1,'海工售后','@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','后勤部','后勤一部',2,'2017-10-24 01:36:51',1),(43,1,'海工售后','@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','销售部','销售一部',3,'2017-10-24 01:36:51',1),(44,1,'海工售后','@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','市场部','市场一部',4,'2017-10-24 01:36:51',1),(45,1,'海工售后','@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','生产部','生产一部',5,'2017-10-24 01:36:51',1),(46,1,'海工售后','@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','售后服务',NULL,7,'2017-10-24 01:36:51',1),(47,1,'海工售后','@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','售后服务',NULL,8,'2017-10-24 01:36:51',1),(48,1,'海工售后','@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','售后服务',NULL,9,'2017-10-24 01:36:51',1),(49,1,'软件测试','123','总经理','总经理一部',1,'2017-10-24 01:49:58',1),(50,1,'软件测试','123','后勤部','后勤一部',2,'2017-10-24 01:49:58',1),(51,1,'软件测试','123','销售部','销售一部',3,'2017-10-24 01:49:58',1),(52,1,'软件测试','123','市场部','市场一部',4,'2017-10-24 01:49:58',1),(53,1,'海工售后','接到的请回复','总经理','总经理一部',1,'2017-10-25 02:04:59',1),(54,1,'海工售后','接到的请回复','后勤部','后勤一部',2,'2017-10-25 02:04:59',1),(55,1,'海工售后','接到的请回复','销售部','销售一部',3,'2017-10-25 02:04:59',1),(56,1,'海工售后','接到的请回复','市场部','市场一部',4,'2017-10-25 02:04:59',1),(57,1,'海工售后','接到的请回复','生产部','生产一部',5,'2017-10-25 02:04:59',1),(58,1,'海工售后','接到的请回复','售后服务',NULL,7,'2017-10-25 02:04:59',1),(59,1,'海工售后','接到的请回复','售后服务',NULL,8,'2017-10-25 02:04:59',1),(60,1,'海工售后','接到的请回复','售后服务',NULL,9,'2017-10-25 02:04:59',1),(61,1,'海工售后','接到的请回复','生产部','生产一部',5,'2017-10-25 02:04:59',1),(62,1,'海工售后','接到的请回复','售后服务',NULL,7,'2017-10-25 02:04:59',1),(63,1,'海工售后','接到的请回复','售后服务',NULL,8,'2017-10-25 02:04:59',1),(64,1,'海工售后','接到的请回复','售后服务',NULL,9,'2017-10-25 02:04:59',1),(65,1,'海工售后','接到的请回复','总经理','总经理一部',1,'2017-10-25 02:05:15',1),(66,1,'海工售后','接到的请回复','后勤部','后勤一部',2,'2017-10-25 02:05:15',1),(67,1,'海工售后','接到的请回复','销售部','销售一部',3,'2017-10-25 02:05:15',1),(68,1,'海工售后','接到的请回复','市场部','市场一部',4,'2017-10-25 02:05:15',1),(69,1,'海工售后','接到的请回复','生产部','生产一部',5,'2017-10-25 02:05:15',1),(70,1,'海工售后','接到的请回复','售后服务',NULL,7,'2017-10-25 02:05:15',1),(71,1,'海工售后','接到的请回复','售后服务',NULL,8,'2017-10-25 02:05:15',1),(72,1,'海工售后','接到的请回复','售后服务',NULL,9,'2017-10-25 02:05:15',1),(73,1,'10.26','海工机械有限公司','总经理','总经理一部',1,'2017-10-26 00:06:39',1),(74,1,'10.26','海工机械有限公司','后勤部','后勤一部',2,'2017-10-26 00:06:39',1),(75,1,'10.26','海工机械有限公司','销售部','销售一部',3,'2017-10-26 00:06:39',1),(76,1,'10.26','海工机械有限公司','市场部','市场一部',4,'2017-10-26 00:06:39',1),(77,1,'10.26','海工机械有限公司','生产部','生产一部',5,'2017-10-26 00:06:39',1),(78,1,'10.26','海工机械有限公司','售后服务',NULL,7,'2017-10-26 00:06:39',1),(79,1,'10.26','海工机械有限公司','售后服务',NULL,8,'2017-10-26 00:06:39',1),(80,1,'10.26','海工机械有限公司','售后服务',NULL,9,'2017-10-26 00:06:39',1),(81,1,'10.26','海工机械有限公司','售后服务',NULL,10,'2017-10-26 00:06:39',1),(82,1,'10.26','海工机械有限公司','售后服务',NULL,11,'2017-10-26 00:06:39',1),(83,1,'10.26','海工机械有限公司','内勤',NULL,12,'2017-10-26 00:06:39',1),(84,1,'10.26','海工机械有限公司','售后服务',NULL,13,'2017-10-26 00:06:39',1),(85,1,'10.26','海工机械有限公司','内勤',NULL,14,'2017-10-26 00:06:39',1),(86,1,'10.26','海工机械有限公司','生产部',NULL,15,'2017-10-26 00:06:39',1),(87,1,'10.26','海工机械有限公司','售后服务',NULL,16,'2017-10-26 00:06:39',1),(88,1,'10.26','海工机械有限公司','售后服务',NULL,17,'2017-10-26 00:06:39',1),(89,1,'10.26','海工机械有限公司','售后服务',NULL,18,'2017-10-26 00:06:39',1),(90,1,'10.26','海工机械有限公司','技术员',NULL,19,'2017-10-26 00:06:39',1),(91,1,'10.26','海工机械有限公司','技术员',NULL,20,'2017-10-26 00:06:39',1),(92,1,'10.26','海工机械有限公司','生产部',NULL,22,'2017-10-26 00:06:39',1),(93,1,'1026','海工机械有限公司','总经理','总经理一部',1,'2017-10-26 00:08:48',1),(94,1,'1026','海工机械有限公司','后勤部','后勤一部',2,'2017-10-26 00:08:48',1),(95,1,'1026','海工机械有限公司','销售部','销售一部',3,'2017-10-26 00:08:48',1),(96,1,'1026','海工机械有限公司','市场部','市场一部',4,'2017-10-26 00:08:48',1),(97,1,'1026','海工机械有限公司','生产部','生产一部',5,'2017-10-26 00:08:48',1),(98,1,'1026','海工机械有限公司','售后服务',NULL,7,'2017-10-26 00:08:48',1),(99,1,'1026','海工机械有限公司','售后服务',NULL,8,'2017-10-26 00:08:48',1),(100,1,'1026','海工机械有限公司','售后服务',NULL,9,'2017-10-26 00:08:48',1),(101,1,'1026','海工机械有限公司','售后服务',NULL,10,'2017-10-26 00:08:48',1),(102,1,'1026','海工机械有限公司','售后服务',NULL,11,'2017-10-26 00:08:48',1),(103,1,'1026','海工机械有限公司','内勤',NULL,12,'2017-10-26 00:08:48',1),(104,1,'1026','海工机械有限公司','售后服务',NULL,13,'2017-10-26 00:08:48',1),(105,1,'1026','海工机械有限公司','内勤',NULL,14,'2017-10-26 00:08:48',1),(106,1,'1026','海工机械有限公司','生产部',NULL,15,'2017-10-26 00:08:48',1),(107,1,'1026','海工机械有限公司','售后服务',NULL,16,'2017-10-26 00:08:48',1),(108,1,'1026','海工机械有限公司','售后服务',NULL,17,'2017-10-26 00:08:48',1),(109,1,'1026','海工机械有限公司','售后服务',NULL,18,'2017-10-26 00:08:48',1),(110,1,'1026','海工机械有限公司','技术员',NULL,19,'2017-10-26 00:08:48',1),(111,1,'1026','海工机械有限公司','技术员',NULL,20,'2017-10-26 00:08:48',1),(112,1,'1026','海工机械有限公司','生产部',NULL,22,'2017-10-26 00:08:48',1),(113,1,'1026','海工机械有限公司','售后服务',NULL,18,'2017-10-26 00:08:48',1),(114,1,'1026','海工机械有限公司','技术员',NULL,19,'2017-10-26 00:08:48',1),(115,1,'1026','海工机械有限公司','技术员',NULL,20,'2017-10-26 00:08:48',1),(116,1,'1026','海工机械有限公司','生产部',NULL,22,'2017-10-26 00:08:48',1),(117,1,'10','海工机械有限公司','总经理','总经理一部',1,'2017-10-26 00:11:25',1),(118,1,'10','海工机械有限公司','后勤部','后勤一部',2,'2017-10-26 00:11:25',1),(119,1,'10','海工机械有限公司','销售部','销售一部',3,'2017-10-26 00:11:25',1),(120,1,'10','海工机械有限公司','市场部','市场一部',4,'2017-10-26 00:11:25',1),(121,1,'10','海工机械有限公司','生产部','生产一部',5,'2017-10-26 00:11:25',1),(122,1,'10','海工机械有限公司','售后服务',NULL,7,'2017-10-26 00:11:25',1),(123,1,'10','海工机械有限公司','售后服务',NULL,8,'2017-10-26 00:11:25',1),(124,1,'10','海工机械有限公司','售后服务',NULL,9,'2017-10-26 00:11:25',1),(125,1,'10','海工机械有限公司','售后服务',NULL,10,'2017-10-26 00:11:25',1),(126,1,'10','海工机械有限公司','售后服务',NULL,11,'2017-10-26 00:11:25',1),(127,1,'10','海工机械有限公司','内勤',NULL,12,'2017-10-26 00:11:25',1),(128,1,'10','海工机械有限公司','售后服务',NULL,13,'2017-10-26 00:11:25',1),(129,1,'10','海工机械有限公司','内勤',NULL,14,'2017-10-26 00:11:25',1),(130,1,'10','海工机械有限公司','生产部',NULL,15,'2017-10-26 00:11:25',1),(131,1,'10','海工机械有限公司','售后服务',NULL,16,'2017-10-26 00:11:25',1),(132,1,'10','海工机械有限公司','售后服务',NULL,17,'2017-10-26 00:11:25',1),(133,1,'10','海工机械有限公司','售后服务',NULL,18,'2017-10-26 00:11:25',1),(134,1,'10','海工机械有限公司','技术员',NULL,19,'2017-10-26 00:11:25',1),(135,1,'10','海工机械有限公司','技术员',NULL,20,'2017-10-26 00:11:25',1),(136,1,'10','海工机械有限公司','生产部',NULL,22,'2017-10-26 00:11:25',1),(137,1,'好的好的','123456789','总经理','总经理一部',1,'2017-10-26 10:48:11',1),(138,1,'好的好的','123456789','后勤部','后勤一部',2,'2017-10-26 10:48:11',1),(139,1,'好的好的','123456789','销售部','销售一部',3,'2017-10-26 10:48:11',1),(140,1,'好的好的','123456789','市场部','市场一部',4,'2017-10-26 10:48:11',1),(141,1,'好的好的','123456789','生产部','生产一部',5,'2017-10-26 10:48:11',1),(142,1,'好的好的','123456789','售后服务',NULL,7,'2017-10-26 10:48:11',1),(143,1,'好的好的','123456789','售后服务',NULL,8,'2017-10-26 10:48:11',1),(144,1,'好的好的','123456789','售后服务',NULL,9,'2017-10-26 10:48:11',1),(145,1,'好的好的','123456789','售后服务',NULL,10,'2017-10-26 10:48:11',1),(146,1,'好的好的','123456789','售后服务',NULL,11,'2017-10-26 10:48:11',1),(147,1,'好的好的','123456789','内勤',NULL,12,'2017-10-26 10:48:11',1),(148,1,'好的好的','123456789','售后服务',NULL,13,'2017-10-26 10:48:11',1),(149,1,'好的好的','123456789','内勤',NULL,14,'2017-10-26 10:48:11',1),(150,1,'好的好的','123456789','生产部',NULL,15,'2017-10-26 10:48:11',1),(151,1,'好的好的','123456789','售后服务',NULL,16,'2017-10-26 10:48:11',1),(152,1,'好的好的','123456789','售后服务',NULL,17,'2017-10-26 10:48:11',1),(153,1,'好的好的','123456789','售后服务',NULL,18,'2017-10-26 10:48:11',1),(154,1,'好的好的','123456789','技术员',NULL,19,'2017-10-26 10:48:11',1),(155,1,'好的好的','123456789','技术员',NULL,20,'2017-10-26 10:48:11',1),(156,1,'好的好的','123456789','生产部',NULL,22,'2017-10-26 10:48:11',1),(157,1,'好的好的','123456789','总经理','总经理一部',1,'2017-10-26 11:04:18',1),(158,1,'好的好的','123456789','后勤部','后勤一部',2,'2017-10-26 11:04:18',1),(159,1,'好的好的','123456789','销售部','销售一部',3,'2017-10-26 11:04:18',1),(160,1,'好的好的','123456789','市场部','市场一部',4,'2017-10-26 11:04:18',1),(161,1,'好的好的','123456789','生产部','生产一部',5,'2017-10-26 11:04:18',1),(162,1,'好的好的','123456789','售后服务',NULL,7,'2017-10-26 11:04:18',1),(163,1,'好的好的','123456789','售后服务',NULL,8,'2017-10-26 11:04:18',1),(164,1,'好的好的','123456789','售后服务',NULL,9,'2017-10-26 11:04:18',1),(165,1,'好的好的','123456789','售后服务',NULL,10,'2017-10-26 11:04:18',1),(166,1,'好的好的','123456789','售后服务',NULL,11,'2017-10-26 11:04:18',1),(167,1,'好的好的','123456789','内勤',NULL,12,'2017-10-26 11:04:18',1),(168,1,'好的好的','123456789','售后服务',NULL,13,'2017-10-26 11:04:18',1),(169,1,'好的好的','123456789','内勤',NULL,14,'2017-10-26 11:04:18',1),(170,1,'好的好的','123456789','生产部',NULL,15,'2017-10-26 11:04:18',1),(171,1,'好的好的','123456789','售后服务',NULL,16,'2017-10-26 11:04:18',1),(172,1,'好的好的','123456789','售后服务',NULL,17,'2017-10-26 11:04:18',1),(173,1,'好的好的','123456789','售后服务',NULL,18,'2017-10-26 11:04:18',1),(174,1,'好的好的','123456789','技术员',NULL,19,'2017-10-26 11:04:18',1),(175,1,'好的好的','123456789','技术员',NULL,20,'2017-10-26 11:04:18',1),(176,1,'好的好的','123456789','生产部',NULL,22,'2017-10-26 11:04:18',1),(177,1,'好的好的','123456789','售后服务',NULL,18,'2017-10-26 11:04:18',1),(178,1,'好的好的','123456789','技术员',NULL,19,'2017-10-26 11:04:18',1),(179,1,'好的好的','123456789','技术员',NULL,20,'2017-10-26 11:04:18',1),(180,1,'好的好的','123456789','生产部',NULL,22,'2017-10-26 11:04:18',1),(181,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','总经理','总经理一部',1,'2017-10-26 23:33:52',1),(182,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','后勤部','后勤一部',2,'2017-10-26 23:33:52',1),(183,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','销售部','销售一部',3,'2017-10-26 23:33:52',1),(184,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','市场部','市场一部',4,'2017-10-26 23:33:52',1),(185,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','生产部','生产一部',5,'2017-10-26 23:33:52',1),(186,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,7,'2017-10-26 23:33:52',1),(187,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,8,'2017-10-26 23:33:52',1),(188,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,9,'2017-10-26 23:33:52',1),(189,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','生产部','生产一部',5,'2017-10-26 23:33:52',1),(190,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,7,'2017-10-26 23:33:52',1),(191,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,8,'2017-10-26 23:33:52',1),(192,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,9,'2017-10-26 23:33:52',1),(193,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','生产部','生产一部',5,'2017-10-26 23:33:52',1),(194,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,7,'2017-10-26 23:33:52',1),(195,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,8,'2017-10-26 23:33:52',1),(196,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,9,'2017-10-26 23:33:52',1),(197,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','生产部','生产一部',5,'2017-10-26 23:33:52',1),(198,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,7,'2017-10-26 23:33:52',1),(199,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,8,'2017-10-26 23:33:52',1),(200,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,9,'2017-10-26 23:33:52',1),(201,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','内勤',NULL,14,'2017-10-26 23:33:52',1),(202,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','生产部',NULL,15,'2017-10-26 23:33:52',1),(203,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,16,'2017-10-26 23:33:52',1),(204,1,'内勤','环氧树脂板又叫绝缘板、环氧板、3240环氧板。由环氧树脂与玻璃纤维布压合组成。由于分子结构中含有活泼的环氧基团，使它们可与多种类型的固化剂发生交联反应而形成不溶、不熔的具有三向网状结构的高聚物。','售后服务',NULL,17,'2017-10-26 23:33:52',1),(205,1,'管理','呵呵','总经理','总经理一部',1,'2017-10-27 08:48:51',1),(206,1,'管理','呵呵','后勤部','后勤一部',2,'2017-10-27 08:48:51',1),(207,1,'管理','呵呵','销售部','销售一部',3,'2017-10-27 08:48:51',1),(208,1,'管理','呵呵','市场部','市场一部',4,'2017-10-27 08:48:51',1),(209,1,'管理','呵呵','生产部','生产一部',5,'2017-10-27 08:48:51',1),(210,1,'管理','呵呵','售后服务',NULL,7,'2017-10-27 08:48:51',1),(211,1,'管理','呵呵','售后服务',NULL,8,'2017-10-27 08:48:51',1),(212,1,'管理','呵呵','售后服务',NULL,9,'2017-10-27 08:48:51',1),(213,1,'管理','呵呵','售后服务',NULL,10,'2017-10-27 08:48:51',1),(214,1,'管理','呵呵','售后服务',NULL,11,'2017-10-27 08:48:51',1),(215,1,'管理','呵呵','内勤',NULL,12,'2017-10-27 08:48:51',1),(216,1,'管理','呵呵','售后服务',NULL,13,'2017-10-27 08:48:51',1),(217,1,'管理','呵呵','内勤',NULL,14,'2017-10-27 08:48:51',1),(218,1,'管理','呵呵','生产部',NULL,15,'2017-10-27 08:48:51',1),(219,1,'管理','呵呵','售后服务',NULL,16,'2017-10-27 08:48:51',1),(220,1,'管理','呵呵','售后服务',NULL,17,'2017-10-27 08:48:51',1),(221,1,'管理','呵呵','售后服务',NULL,18,'2017-10-27 08:48:51',1),(222,1,'管理','呵呵','技术员',NULL,19,'2017-10-27 08:48:51',1),(223,1,'管理','呵呵','技术员',NULL,20,'2017-10-27 08:48:51',1),(224,1,'管理','呵呵','生产部',NULL,22,'2017-10-27 08:48:51',1),(225,1,'一样一样','一样一样','总经理','总经理一部',1,'2017-12-02 07:44:23',1),(226,1,'一样一样','一样一样','后勤部','后勤一部',2,'2017-12-02 07:44:24',1),(227,1,'一样一样','一样一样','销售部','销售一部',3,'2017-12-02 07:44:24',1),(228,1,'一样一样','一样一样','市场部','市场一部',4,'2017-12-02 07:44:24',1),(229,1,'一样一样','一样一样','生产部','生产一部',5,'2017-12-02 07:44:24',1),(230,1,'一样一样','一样一样','售后服务',NULL,7,'2017-12-02 07:44:24',1),(231,1,'一样一样','一样一样','售后服务',NULL,8,'2017-12-02 07:44:24',1),(232,1,'一样一样','一样一样','售后服务',NULL,9,'2017-12-02 07:44:24',1),(233,1,'一样一样','一样一样','售后服务',NULL,10,'2017-12-02 07:44:24',1),(234,1,'一样一样','一样一样','售后服务',NULL,11,'2017-12-02 07:44:24',1),(235,1,'一样一样','一样一样','内勤',NULL,12,'2017-12-02 07:44:24',1),(236,1,'一样一样','一样一样','售后服务',NULL,13,'2017-12-02 07:44:24',1),(237,1,'一样一样','一样一样','内勤',NULL,14,'2017-12-02 07:44:24',1),(238,1,'一样一样','一样一样','生产部',NULL,15,'2017-12-02 07:44:24',1),(239,1,'一样一样','一样一样','售后服务',NULL,16,'2017-12-02 07:44:24',1),(240,1,'一样一样','一样一样','售后服务',NULL,17,'2017-12-02 07:44:24',1),(241,1,'一样一样','一样一样','售后服务',NULL,18,'2017-12-02 07:44:24',1),(242,1,'一样一样','一样一样','技术员',NULL,19,'2017-12-02 07:44:24',1),(243,1,'一样一样','一样一样','技术员',NULL,20,'2017-12-02 07:44:24',1),(244,1,'一样一样','一样一样','生产部',NULL,22,'2017-12-02 07:44:24',1);
/*!40000 ALTER TABLE `app_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_news`
--

DROP TABLE IF EXISTS `app_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_news`
--

LOCK TABLES `app_news` WRITE;
/*!40000 ALTER TABLE `app_news` DISABLE KEYS */;
INSERT INTO `app_news` VALUES (9,1,'正大海工',NULL,'@李嘉云-华企立方「互联网+外贸」 现在最要紧的是要在电脑上可以操作，还有不是人为的退出，就应该让它一直在线，这是当务之急。','2017-10-24 01:09:10',1),(10,1,'研讨会',NULL,'细节决定未来','2017-10-24 04:47:53',1),(11,1,'研讨会',NULL,'细节决定未来','2017-10-24 04:47:54',1),(12,1,'研讨会',NULL,'细节决定未来','2017-10-24 04:47:58',1);
/*!40000 ALTER TABLE `app_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_news_img`
--

DROP TABLE IF EXISTS `app_news_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_news_img`
--

LOCK TABLES `app_news_img` WRITE;
/*!40000 ALTER TABLE `app_news_img` DISABLE KEYS */;
INSERT INTO `app_news_img` VALUES (6,9,'http://zd.meyapp.com:8089//upload/20171024/20171024090911242.png','/usr/java/server/apache-tomcat-8.0.30/webapps/ROOT/upload/20171024/20171024090911242.png','compress.png','2017-10-24',1);
/*!40000 ALTER TABLE `app_news_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order`
--

DROP TABLE IF EXISTS `app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order`
--

LOCK TABLES `app_order` WRITE;
/*!40000 ALTER TABLE `app_order` DISABLE KEYS */;
INSERT INTO `app_order` VALUES (5,NULL,3,1,'李伟珍','13616670248',1211221,4,'瓷砖机 ZDC-1200 ','瓷砖机',1,22222.00,22222.00,'加长靠山','哈哈\n','李伟珍','2017-10-24','2017-10-30','浙江省临海市江南街道','13616670248',NULL,NULL,NULL,NULL,NULL,'2017-10-24 01:24:00','1',5,NULL,NULL),(6,NULL,3,5,'李伟珍','13777675442',1211221,5,'瓷砖机 ZDC-1200 ','瓷砖机',1,22222.00,22222.00,'ZDC800瓷砖机','1台\n','李伟珍','2017-10-25','2017-10-29','浙江省临海市江南街道','13777675442',NULL,NULL,NULL,NULL,NULL,'2017-10-25 06:29:25','3',5,NULL,4),(7,NULL,14,1,'yy','yyyp',1111222334,2,'全自动切割机 ZDH-500','切割机',1,250.00,250.00,'hhhh','hhhhh','yy','2017-10-25','2017-11-28','临海/临海','12345678912',NULL,NULL,NULL,NULL,NULL,'2017-10-25 12:21:16','2',15,NULL,4),(8,NULL,14,1,'yyy','yyy',1254122544,1,'十四圆头抛光机 ZD-1200','抛光机',1,1.00,1.00,'','','yyy','2017-10-25','2017-11-26','','yyyy',NULL,NULL,NULL,NULL,NULL,'2017-10-25 12:37:17','2',22,NULL,4),(9,NULL,14,1,'李伟珍','12345678900',1254122544,3,'十四圆头抛光机 ZD-1200','抛光机',1,1.00,1.00,'好好好……','好好好……','李四','2017-10-21','2017-11-30','临海大道','123456789',NULL,NULL,NULL,NULL,NULL,'2017-10-25 13:22:54','3',22,NULL,4),(10,NULL,14,1,'小总','12345678900',1211221,3,'瓷砖机 ZDC-1200 ','瓷砖机',1,22222.00,22222.00,'','','吴','2017-10-27','2017-11-27','哈哈哈','12345678900',NULL,NULL,NULL,NULL,NULL,'2017-10-26 23:59:04','2',15,NULL,4),(11,NULL,14,1,'乖乖','00123456789',123456,15,'磨边机','11',50,100000.00,5000000.00,'乖乖','','乖乖','2017-10-27','2018-10-27','','00123456789',NULL,NULL,NULL,NULL,NULL,'2017-10-27 11:02:32','2',15,NULL,4),(12,NULL,14,1,'十月','12312312311',1111222333,1,'机床螺丝','螺丝',1,0.10,0.10,'定制','','十月','2018-10-28','2018-11-28','杭州','12312312311',NULL,NULL,NULL,NULL,NULL,'2017-10-28 01:47:59','3',15,NULL,4);
/*!40000 ALTER TABLE `app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order_notify`
--

DROP TABLE IF EXISTS `app_order_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order_notify`
--

LOCK TABLES `app_order_notify` WRITE;
/*!40000 ALTER TABLE `app_order_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_order_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order_tech`
--

DROP TABLE IF EXISTS `app_order_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order_tech`
--

LOCK TABLES `app_order_tech` WRITE;
/*!40000 ALTER TABLE `app_order_tech` DISABLE KEYS */;
INSERT INTO `app_order_tech` VALUES (1,6,2,NULL,4,'2017-10-25 08:27:04','0'),(2,6,2,NULL,4,'2017-10-25 08:33:35','0'),(3,6,2,NULL,4,'2017-10-25 12:44:51','0'),(4,6,19,NULL,4,'2017-10-25 12:44:51','2'),(5,6,20,NULL,4,'2017-10-25 12:44:51','2'),(6,7,2,NULL,4,'2017-10-25 12:48:49','0'),(7,7,19,NULL,4,'2017-10-25 12:48:49','0'),(8,7,20,NULL,4,'2017-10-25 12:48:49','0'),(9,7,2,NULL,4,'2017-10-25 12:49:37','0'),(10,7,19,NULL,4,'2017-10-25 12:49:37','0'),(11,7,20,NULL,4,'2017-10-25 12:49:37','0'),(12,7,2,NULL,4,'2017-10-25 12:51:59','0'),(13,7,19,NULL,4,'2017-10-25 12:51:59','0'),(14,7,20,NULL,4,'2017-10-25 12:51:59','0'),(15,7,2,NULL,4,'2017-10-25 12:58:56','0'),(16,7,19,NULL,4,'2017-10-25 12:58:56','0'),(17,7,20,NULL,4,'2017-10-25 12:58:56','0'),(18,7,2,NULL,4,'2017-10-25 12:59:07','0'),(19,7,19,NULL,4,'2017-10-25 12:59:07','0'),(20,7,20,NULL,4,'2017-10-25 12:59:07','0'),(21,7,2,NULL,4,'2017-10-25 12:59:21','0'),(22,7,19,NULL,4,'2017-10-25 12:59:21','0'),(23,7,20,NULL,4,'2017-10-25 12:59:22','0'),(24,7,2,NULL,4,'2017-10-25 13:08:42','0'),(25,7,19,NULL,4,'2017-10-25 13:08:42','0'),(26,7,20,NULL,4,'2017-10-25 13:08:42','0'),(27,9,2,NULL,4,'2017-10-25 13:28:32','0'),(28,9,19,NULL,4,'2017-10-25 13:28:32','0'),(29,9,20,NULL,4,'2017-10-25 13:28:32','2'),(30,7,2,NULL,4,'2017-10-26 00:02:01','0'),(31,7,19,NULL,4,'2017-10-26 00:02:01','0'),(32,7,20,NULL,4,'2017-10-26 00:02:01','0'),(33,10,2,NULL,4,'2017-10-27 00:05:02','0'),(34,10,19,NULL,4,'2017-10-27 00:05:02','0'),(35,10,20,NULL,4,'2017-10-27 00:05:02','0'),(36,10,2,NULL,4,'2017-10-27 00:05:16','0'),(37,10,19,NULL,4,'2017-10-27 00:05:16','0'),(38,10,20,NULL,4,'2017-10-27 00:05:16','0'),(39,7,2,NULL,4,'2017-10-27 10:39:38','0'),(40,7,19,NULL,4,'2017-10-27 10:39:38','0'),(41,7,20,NULL,4,'2017-10-27 10:39:38','0'),(42,7,2,NULL,4,'2017-10-27 10:43:31','0'),(43,7,19,NULL,4,'2017-10-27 10:43:31','0'),(44,7,20,NULL,4,'2017-10-27 10:43:31','0'),(45,11,2,NULL,4,'2017-10-27 11:09:13','0'),(46,11,19,NULL,4,'2017-10-27 11:09:13','1'),(47,11,20,NULL,4,'2017-10-27 11:09:13','0'),(48,12,2,NULL,4,'2017-10-28 01:57:09','0'),(49,12,19,NULL,4,'2017-10-28 01:57:09','2'),(50,12,20,NULL,4,'2017-10-28 01:57:09','0');
/*!40000 ALTER TABLE `app_order_tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_proxy`
--

DROP TABLE IF EXISTS `app_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_proxy`
--

LOCK TABLES `app_proxy` WRITE;
/*!40000 ALTER TABLE `app_proxy` DISABLE KEYS */;
INSERT INTO `app_proxy` VALUES (1,'临海办事处','浙江省临海市小芝镇虎山南路261号','0576-85771016','办事员','13524652541','浙江正大集团有限公司','2017-10-16 21:05:07',1),(2,'台州办事处','浙江省台州办事处','0576-85771017','办事员2','135246525xxx','浙江正大集团有限公司','2017-10-16 21:06:19',1),(4,'黑龙江代理商','哈尔滨市先锋路','15804503812','贾东','13703626522','正大科技','2017-10-24 03:25:00',1),(5,'林耀','浙江','15988909851','林耀','15988909851','正大','2017-10-25 08:07:12',1);
/*!40000 ALTER TABLE `app_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'admin','111111','吴真业','\"\"','18857653238','管理员','总经理','总经理一部',NULL,NULL,1),(2,'tech','111111','吴小东','adfdf-fdfe-fdf-erer-1111','13524625212','技术员','后勤部','后勤一部',NULL,NULL,1),(3,'office','111111','李伟珍','\"\"','13616670248','内勤','销售部','销售一部',NULL,NULL,1),(4,'service','111111','洪小辉','\"\"','15988990721','售后服务','市场部','市场一部',NULL,NULL,1),(5,'produce','111111','郭伟坚','adfdf-fdfe-fdf-erer-444','15988990719','生产部','生产部','生产一部',NULL,NULL,1),(6,'customer','111111','林耀','adfdf-fdfe-fdf-erer-555','15988909851','购机客户','',NULL,'1111222333','2017-09-03 00:00:00',1),(7,'test','111111','test',NULL,'13524309647','售后服务','售后服务',NULL,NULL,'2017-10-22 17:54:18',1),(8,'x','111111','x',NULL,'11222','售后服务','售后服务',NULL,NULL,'2017-10-22 17:56:16',1),(9,'111','111111','222',NULL,'333','售后服务','售后服务',NULL,NULL,'2017-10-22 18:20:09',1),(10,'HGJX001','123456','振业',NULL,'13666868811','售后服务','售后服务',NULL,NULL,'2017-10-25 20:10:29',1),(11,'hg001','111111','zhenye',NULL,'13666868811','售后服务','售后服务',NULL,NULL,'2017-10-25 20:12:18',1),(12,'zhenye','111111','zhenye8811',NULL,'13777670889','内勤','内勤',NULL,NULL,'2017-10-25 20:17:28',1),(13,'zhenye8811','111111','zhenye8811',NULL,'13777670889','售后服务','售后服务',NULL,NULL,'2017-10-25 20:17:46',1),(14,'wuzhenye','111111','wuzhenye',NULL,'13777670889','内勤','内勤',NULL,NULL,'2017-10-25 20:18:43',1),(15,'wuzhenyesc','111111','wuzhenyesc',NULL,'13777670889','生产部','生产部',NULL,NULL,'2017-10-25 20:23:01',1),(16,'wuzhenyekh','111111','wuzhenyekh',NULL,'13777670889','售后服务','售后服务',NULL,NULL,'2017-10-25 20:27:19',1),(17,'shouhe01','111111','shouhe',NULL,'13777670889','售后服务','售后服务',NULL,NULL,'2017-10-25 20:41:28',1),(18,'shouhe02','111111','shouhe02',NULL,'13777670889','售后服务','售后服务',NULL,NULL,'2017-10-25 20:42:02',1),(19,'jishu01','111111','jishu01',NULL,'123456789000','技术员','技术员',NULL,NULL,'2017-10-25 20:43:40',1),(20,'jishu02','111111','jishu02',NULL,'123456789','技术员','技术员',NULL,NULL,'2017-10-25 20:44:11',1),(21,'海工客户01','111111','海工客户01','864821032380747','12345678900','购机客户',NULL,NULL,'hg1234','2017-10-25 21:05:55',1),(22,'scb','111111','scb01',NULL,'scb01','生产部','生产部',NULL,NULL,'2017-10-25 21:12:07',1),(23,'购机客户','111111','购机客户',NULL,'12345678900','购机客户','购机客户',NULL,NULL,'2017-10-28 13:10:38',1);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_video`
--

DROP TABLE IF EXISTS `app_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL COMMENT 'submit user id',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '简介',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_video`
--

LOCK TABLES `app_video` WRITE;
/*!40000 ALTER TABLE `app_video` DISABLE KEYS */;
INSERT INTO `app_video` VALUES (2,1,'雕刻机','雕刻过程','2017-10-24 01:21:57',1),(3,1,'挡水条磨头夹的装卸','有客户反应说磨头夹装卸困难，在不熟悉结构原理的情况下是不好拆，','2017-10-24 04:55:12',1);
/*!40000 ALTER TABLE `app_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_video_src`
--

DROP TABLE IF EXISTS `app_video_src`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_video_src`
--

LOCK TABLES `app_video_src` WRITE;
/*!40000 ALTER TABLE `app_video_src` DISABLE KEYS */;
INSERT INTO `app_video_src` VALUES (2,2,'/usr/java/server/apache-tomcat-8.0.30/webapps/ROOT/upload/20171024/20171024092157726.mp4','http://zd.meyapp.com:8089//upload/20171024/20171024092157726.mp4','QQ空间视频_20170510220212.mp4','2017-10-24',1),(3,3,'/usr/java/server/apache-tomcat-8.0.30/webapps/ROOT/upload/20171024/20171024125512159.mp4','http://zd.meyapp.com:8089//upload/20171024/20171024125512159.mp4','wx_camera_1508736482458.mp4','2017-10-24',1);
/*!40000 ALTER TABLE `app_video_src` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_key` varchar(20) NOT NULL COMMENT '数据字典key',
  `name` varchar(100) NOT NULL COMMENT '数据字典名称',
  `value` varchar(100) DEFAULT NULL COMMENT '数据字典值',
  `state` tinyint(1) DEFAULT NULL COMMENT '数据字典状态 0 不可用 1可用',
  `commit` varchar(100) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'cfg_app_name','系统名称','移动OA',1,'系统名称');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-17 16:55:48
