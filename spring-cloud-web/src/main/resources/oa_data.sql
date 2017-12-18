-- MySQL dump 10.13  Distrib 5.6.36, for Linux (i686)
--
-- Host: localhost    Database: oa
-- ------------------------------------------------------
-- Server version	5.6.36

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_advice`
--

LOCK TABLES `app_advice` WRITE;
/*!40000 ALTER TABLE `app_advice` DISABLE KEYS */;
INSERT INTO `app_advice` VALUES (1,6,'111','2017-10-12',1),(2,6,'11111','2017-10-13',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_case`
--

LOCK TABLES `app_case` WRITE;
/*!40000 ALTER TABLE `app_case` DISABLE KEYS */;
INSERT INTO `app_case` VALUES (17,'111','2222','2017-10-10 14:00:47',1,2),(18,'111??','11121','2017-10-10 14:00:47',1,2),(19,'111','2222','2017-10-10 14:00:47',1,2),(20,'111','2222','2017-10-10 14:00:47',1,2),(21,'111','222','2017-10-10 14:00:47',1,2),(22,'111','222','2017-10-10 14:00:47',1,2),(23,'111','xxx','2017-10-10 14:00:47',1,2),(24,'111','xxx','2017-10-10 14:00:47',1,2),(25,'11','222','2017-10-10 14:00:47',1,2);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_case_img`
--

LOCK TABLES `app_case_img` WRITE;
/*!40000 ALTER TABLE `app_case_img` DISABLE KEYS */;
INSERT INTO `app_case_img` VALUES (1,17,'/upload/20171008/20171008023540938.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008023540938.jpeg',NULL,'2017-10-08',1),(2,17,'/upload/20171008/20171008023541121.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008023541121.jpeg',NULL,'2017-10-08',1),(3,18,'/upload/20171008/20171008023834349.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008023834349.jpeg',NULL,'2017-10-08',1),(4,18,'/upload/20171008/20171008023834380.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008023834380.jpeg',NULL,'2017-10-08',1),(5,19,'/upload/20171008/20171008120413144.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008120413144.jpeg','1.jpg','2017-10-08',1),(6,20,'/upload/20171008/20171008121445548.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008121445548.jpeg','2.jpg','2017-10-08',1),(7,21,'/upload/20171008/20171008121557792.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008121557792.jpeg','3.jpg','2017-10-08',1),(8,22,'/upload/20171008/20171008121923370.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008121923370.jpeg','4.jpg','2017-10-08',1),(9,23,'/upload/20171008/20171008123238227.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008123238227.jpeg','5.jpg','2017-10-08',1),(10,23,'/upload/20171008/20171008123238328.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008123238328.jpeg','5.jpg','2017-10-08',1),(11,24,'/upload/20171008/20171008124658894.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008124658894.jpeg','5.jpg','2017-10-08',1),(12,24,'/upload/20171008/20171008124704609.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008124704609.jpeg','5.jpg','2017-10-08',1),(13,25,'/upload/20171008/20171008124846061.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171008/20171008124846061.jpeg','5.jpg','2017-10-08',1),(14,1,'/upload/20171014/20171014091113433.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171014/20171014091113433.jpeg','199.jpeg','2017-10-14',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_device`
--

LOCK TABLES `app_device` WRITE;
/*!40000 ALTER TABLE `app_device` DISABLE KEYS */;
INSERT INTO `app_device` VALUES (1,'1111222333',NULL,'机床螺丝','xxxxxx NB','螺丝',1000,0.10,1,'2017-10-02 10:12:26'),(2,'1111222334',NULL,'全自动切割机 ZDH-500','全自动切割机 ZD','切割机',300,250.00,1,'2017-10-02 14:52:12'),(3,'1254122544',NULL,'十四圆头抛光机 ZD-1200','十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200十四圆头抛光机 ZD-1200','抛光机',1,1.00,1,'2017-10-02 14:58:08'),(4,'1211221',NULL,'瓷砖机 ZDC-1200 ','瓷砖机 ZDC-1200 ','瓷砖机',352,22222.00,1,'2017-10-02 14:58:02'),(5,'121212',NULL,'全自动切割机 ZDH-500','全自动切割机 ZDH-500','切割机',111,1111.00,1,'2017-10-02 14:58:33'),(6,'11',1,'222','666','333',444,555.00,1,'2017-10-18 17:24:11');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_maintain`
--

LOCK TABLES `app_maintain` WRITE;
/*!40000 ALTER TABLE `app_maintain` DISABLE KEYS */;
INSERT INTO `app_maintain` VALUES (1,1,'专业石材的清养方洁与保法','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','2017-10-14 01:56:57',1),(2,1,'专业石材的清养方洁与保法','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','2017-10-14 01:56:57',1),(3,1,'专业石材的清养方洁与保法','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','2017-10-14 01:56:57',1),(4,1,'专业石材的清养方洁与保法','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）','2017-10-14 01:56:58',1),(5,1,'11','12121','12121','2017-10-14 08:36:58',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_message`
--

LOCK TABLES `app_message` WRITE;
/*!40000 ALTER TABLE `app_message` DISABLE KEYS */;
INSERT INTO `app_message` VALUES (1,1,'关于国庆放假通知','本公司严格按照国务院规定，今年（2017年）从10月1日起到10月8号，共八天假期！请相关部门负责人做好工作安排',NULL,NULL,NULL,'2017-10-04 17:12:51',1),(2,3,'订单编号13422101114客户李先生订购的设备已经发货','订单编号13422101114客户李先生订购的设备已经发货','生产部','生产一部',NULL,'2017-10-18 13:09:03',1),(3,3,'订单编号13422101114客户李先生订购的设备已经发货','订单编号13422101114客户李先生订购的设备已经发货','后勤部',NULL,NULL,'2017-10-18 13:09:03',1),(4,1,'111','222','总经理','总经理一部',1,'2017-10-21 16:00:07',1),(5,1,'111','222','后勤部','后勤一部',2,'2017-10-21 16:00:07',1),(6,1,'111','222','销售部','销售一部',3,'2017-10-21 16:00:07',1),(7,1,'111','222','市场部','市场一部',4,'2017-10-21 16:00:07',1),(8,1,'abcdef','xxx','总经理','总经理一部',1,'2017-10-22 02:01:06',1),(9,1,'abcdef','xxx','后勤部','后勤一部',2,'2017-10-22 02:01:06',1),(10,1,'abcdef','xxx','销售部','销售一部',3,'2017-10-22 02:01:06',1),(11,1,'abcdef','xxx','市场部','市场一部',4,'2017-10-22 02:01:06',1),(12,1,'结构','这种族','总经理','总经理一部',1,'2017-10-22 10:37:33',1),(13,1,'结构','这种族','后勤部','后勤一部',2,'2017-10-22 10:37:34',1),(14,1,'结构','这种族','销售部','销售一部',3,'2017-10-22 10:37:34',1),(15,1,'结构','这种族','市场部','市场一部',4,'2017-10-22 10:37:34',1),(16,1,'结构','这种族','生产部','生产一部',5,'2017-10-22 10:37:34',1),(17,1,'结构','这种族','',NULL,6,'2017-10-22 10:37:34',1),(18,1,'结构','这种族','售后服务',NULL,7,'2017-10-22 10:37:34',1),(19,1,'结构','这种族','售后服务',NULL,8,'2017-10-22 10:37:34',1),(20,1,'结构','这种族','售后服务',NULL,9,'2017-10-22 10:37:34',1),(21,3,'您有一比新订单需要生产','订单编号11,请在我的工单里面查收','售后管理',NULL,7,'2017-10-29 21:28:26',1),(22,3,'您有一比新订单需要生产','订单编号12,请在我的工单里面查收','生产部','生产一部',5,'2017-10-29 21:36:43',1),(23,3,'您有一比新订单需要生产','订单编号13,请在我的工单里面查收','生产部','生产一部',5,'2017-10-29 22:45:00',1),(24,3,'您有一比新订单需要生产','订单编号14,请在我的工单里面查收','生产部','生产一部',5,'2017-11-01 15:18:00',1),(25,3,'有新订单待发货','订单编号16,请在我的工单里面查收','售后管理',NULL,7,'2017-11-08 23:17:15',1),(26,3,'有新订单待发货','订单编号17,请在我的工单里面查收','售后管理',NULL,7,'2017-11-09 21:04:50',1),(27,3,'有新订单待发货','订单编号19,请在我的工单里面查收','售后管理',NULL,7,'2017-11-09 21:18:14',1),(28,3,'有新订单待发货','订单编号20,请在我的工单里面查收','售后管理',NULL,7,'2017-11-27 14:10:12',1),(29,3,'有新订单待发货','订单编号21,请在我的工单里面查收','售后管理',NULL,7,'2017-12-12 14:21:48',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_news`
--

LOCK TABLES `app_news` WRITE;
/*!40000 ALTER TABLE `app_news` DISABLE KEYS */;
INSERT INTO `app_news` VALUES (1,1,'111',NULL,'2222','2017-10-14 01:11:13',1),(2,1,'111',NULL,'2222','2017-10-14 08:34:49',1),(3,1,'11212',NULL,'121212','2017-10-14 08:36:16',1),(4,1,'xxx',NULL,'11212','2017-10-22 14:52:58',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_news_img`
--

LOCK TABLES `app_news_img` WRITE;
/*!40000 ALTER TABLE `app_news_img` DISABLE KEYS */;
INSERT INTO `app_news_img` VALUES (1,3,'/upload/20171014/20171014163616233.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171014/20171014163616233.jpeg','199.jpeg','2017-10-14',1),(2,4,'//upload/20171022/20171022225257798.jpeg','/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171022/20171022225257798.jpeg','199.jpeg','2017-10-22',1);
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
  `order_id` varchar(32) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL COMMENT '发布人',
  `proxy` int(11) DEFAULT NULL COMMENT '办事处',
  `buser` varchar(200) DEFAULT NULL COMMENT '业务员',
  `bphone` varchar(200) DEFAULT NULL COMMENT '业务员联系方式',
  `ext` varchar(100) DEFAULT NULL COMMENT '定制信息',
  `remark` varchar(100) DEFAULT NULL COMMENT '补充说明',
  `cust` varchar(300) DEFAULT NULL COMMENT '客户',
  `stime` varchar(20) DEFAULT NULL COMMENT '下单时间',
  `dtime` varchar(20) DEFAULT NULL COMMENT '送货时间',
  `address` varchar(500) DEFAULT NULL COMMENT '送货地址',
  `phone` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `logistics` varchar(20) DEFAULT NULL COMMENT '物流公司',
  `iphone` varchar(50) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL COMMENT '物流司机',
  `logphone` varchar(20) DEFAULT NULL COMMENT '司机联系电话',
  `delatime` varchar(20) DEFAULT NULL,
  `fqid` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` char(2) DEFAULT '1' COMMENT '状态 0 无效 1 - 2 -3 -4 -5 ... -> over',
  `srv` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order`
--

LOCK TABLES `app_order` WRITE;
/*!40000 ALTER TABLE `app_order` DISABLE KEYS */;
INSERT INTO `app_order` VALUES (6,'2017121622',3,1,'9测试人员98','13566666666998','红色12','98','测试客户998','2017-09-08','2017-09-08','上海浦东98','13222222222998','申通',NULL,'刘长进','13524511524',NULL,NULL,'2017-10-23 12:23:15','2',NULL),(7,NULL,3,1,'111','2222','1212','1221','333','2017-01-02','2017-02-01','5555','4444',NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-23 15:29:14','3',4),(8,NULL,3,1,'三法司的','1212','12','222','1212','2017-01-01','2017-12-01','1212','1212','xxx','12345','123444','122222','2017-11-30',NULL,'2017-10-23 15:33:54','2',NULL),(9,'2017121622',3,1,'吴昌','13524326515','需要红色外壳','','京东','2017-01-01','2017-03-04','上海仓库211','35265254125','xxx','x','xx','xx','2017-01-01',NULL,'2017-10-29 11:36:46','2',NULL),(10,NULL,3,1,'122','2222','2222','','3333','2017-10-01','2017-10-05','44444','4444',NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-29 20:49:31','1',NULL),(11,NULL,3,1,'1122','2222','122','','3333','2017-10-11','2017-12-01','55555','4444',NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-29 21:28:26','2',4),(12,NULL,3,1,'1111','222','1212','212','3333','2017-10-11','2017-12-12','5555','4444',NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-29 21:36:30','1',NULL),(13,NULL,3,1,'xin','132222','2222','','121212','2017-10-10','2017-12-13','121212','121212',NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-29 22:44:59','1',NULL),(14,NULL,3,1,'111','222','121','xx','3333','2017-10-01','2017-12-10','5555','4444',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-01 15:18:00','1',NULL),(15,'2017110915',3,1,'111','12','1112','2222','13','2017-10-12','2017-12-20','15','14',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-09 22:29:39','1',NULL),(17,'2017111017',3,1,'12','13','1111','2222','14','2017-01-02','2017-06-02','16','15',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-09 22:29:39','1',NULL),(18,'2017111018',3,1,'111','222','xxx','','333','2017-02-03','2017-04-08','555','444',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-09 22:29:39','1',NULL),(19,'2017111019',3,1,'111','222','xxx','','333','2017-02-03','2017-04-08','555','444',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-09 22:29:39','1',NULL),(20,'2017112720',3,1,'吴昌','13524309647','小行星','小行星2','小儿','2017-08-02','2017-10-03','上海，北京','135225411125',NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-27 14:10:12','1',NULL),(21,'2017121221',3,1,'反对三风俗的','反对三风俗的','古典风格','古典风格的仿','风俗的风俗的','2017-01-01','2017-01-01','1352652555555','风俗的风俗的',NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-12 14:21:47','1',NULL);
/*!40000 ALTER TABLE `app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order_device`
--

DROP TABLE IF EXISTS `app_order_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_order_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL COMMENT '设备ID',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `weight` double(8,2) DEFAULT NULL COMMENT '重量',
  `numb` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order_device`
--

LOCK TABLES `app_order_device` WRITE;
/*!40000 ALTER TABLE `app_order_device` DISABLE KEYS */;
INSERT INTO `app_order_device` VALUES (1,2,16,NULL,12),(2,1,17,NULL,1),(3,2,19,NULL,12),(4,1,19,NULL,13),(5,1,20,NULL,12),(6,3,20,NULL,12),(7,4,6,NULL,1),(8,4,7,NULL,1),(9,4,8,NULL,1),(10,4,9,NULL,1),(11,4,10,NULL,1),(12,4,11,NULL,1),(13,4,12,NULL,1),(14,4,13,NULL,1),(15,4,14,NULL,1),(16,4,15,NULL,1),(17,4,18,NULL,1),(18,1,21,NULL,12),(19,2,21,NULL,122);
/*!40000 ALTER TABLE `app_order_device` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `date` varchar(20) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `pid` int(11) DEFAULT NULL COMMENT '服务派公人员',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` varchar(10) NOT NULL DEFAULT '0' COMMENT '状态 0等待处理 1处理中 2处理完毕',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order_tech`
--

LOCK TABLES `app_order_tech` WRITE;
/*!40000 ALTER TABLE `app_order_tech` DISABLE KEYS */;
INSERT INTO `app_order_tech` VALUES (1,7,2,NULL,NULL,4,'2017-10-23 16:33:34','2'),(2,8,4,NULL,NULL,7,'2017-10-30 23:46:34','0'),(3,8,2,NULL,NULL,7,'2017-11-09 23:13:02','0'),(4,8,2,NULL,NULL,7,'2017-11-09 23:13:04','0'),(5,6,2,NULL,NULL,7,'2017-12-16 06:08:19','0'),(6,6,4,NULL,NULL,7,'2017-12-16 06:08:19','0'),(7,6,2,NULL,NULL,7,'2017-12-16 06:10:20','0'),(8,6,4,NULL,NULL,7,'2017-12-16 06:10:20','0'),(9,6,4,NULL,NULL,7,'2017-12-16 07:00:16','0');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_proxy`
--

LOCK TABLES `app_proxy` WRITE;
/*!40000 ALTER TABLE `app_proxy` DISABLE KEYS */;
INSERT INTO `app_proxy` VALUES (1,'临海办事处','浙江省临海市小芝镇虎山南路261号','0576-85771016','办事员','13524652541','浙江正大集团有限公司','2017-10-16 21:05:07',1),(2,'台州办事处','浙江省台州办事处','0576-85771017','办事员2','135246525xxx','浙江正大集团有限公司','2017-10-16 21:06:19',1),(3,'12','12','12','12','12','121','2017-10-16 23:50:18',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'admin','111111','吴小西','xxxxx','135246252122','管理员','管理员','总经理一部',NULL,NULL,1),(2,'tech','111111','吴小东','adfdf-fdfe-fdf-erer-1111','13524625212','技术员','技术员','后勤一部',NULL,NULL,1),(3,'office','111111','吴小北','adfdf-fdfe-fdf-2222','13524625212','内勤','内勤','销售一部',NULL,NULL,1),(4,'service','111111','吴小南','adfdf-fdfe-fdf-erer-333','13524625212','售后服务','售后服务','市场一部',NULL,NULL,1),(6,'customer','111111','吴外来','adfdf-fdfe-fdf-erer-555','13524625212','购机客户','',NULL,'1111222333','2017-09-03 00:00:00',1),(7,'manager','111111','吴小二','adfdf-fdfe-fdf-erer-555','13524309647','售后管理','售后管理',NULL,NULL,'2017-10-22 17:54:18',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_video`
--

LOCK TABLES `app_video` WRITE;
/*!40000 ALTER TABLE `app_video` DISABLE KEYS */;
INSERT INTO `app_video` VALUES (1,1,'111','11122333','2017-10-15 08:58:58',1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_video_src`
--

LOCK TABLES `app_video_src` WRITE;
/*!40000 ALTER TABLE `app_video_src` DISABLE KEYS */;
INSERT INTO `app_video_src` VALUES (1,1,'/home/changqi.wu/java/idea-work/java-web/spring-cloud-jpa/target/spring-cloud-jpa-1.0-SNAPSHOT/upload/20171015/20171015165851022.mp4','/upload/20171015/20171015165851022.mp4','cat.mp4',NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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

-- Dump completed on 2017-12-16 15:15:43
