-- MySQL dump 10.13  Distrib 5.5.25, for Win32 (x86)
--
-- Host: localhost    Database: dormitory
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Table structure for table `t_b_class`
--

DROP TABLE IF EXISTS `t_b_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_class` (
  `id` varchar(36) NOT NULL,
  `classname` varchar(45) DEFAULT NULL,
  `teachername` varchar(10) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_class`
--

LOCK TABLES `t_b_class` WRITE;
/*!40000 ALTER TABLE `t_b_class` DISABLE KEYS */;
INSERT INTO `t_b_class` VALUES ('402881e44cbbfe2c014cbbfecf730001','11级软件工程2班','李彦宏','2015-04-29 17:56:54'),('402881e44cbc0292014cbd3aac1f0001','11级计算机科学与技术1班','马化腾','2015-04-15 21:18:01');
/*!40000 ALTER TABLE `t_b_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_b_damage`
--

DROP TABLE IF EXISTS `t_b_damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_damage` (
  `id` varchar(36) NOT NULL,
  `damagestation` varchar(200) DEFAULT NULL,
  `damagetime` date DEFAULT NULL,
  `fixtime` date DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `dormid` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `isfixed` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`dormid`),
  KEY `fk_t_b_damage_t_b_dorm1` (`dormid`),
  CONSTRAINT `fk_t_b_damage_t_b_dorm1` FOREIGN KEY (`dormid`) REFERENCES `t_b_dorm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_damage`
--

LOCK TABLES `t_b_damage` WRITE;
/*!40000 ALTER TABLE `t_b_damage` DISABLE KEYS */;
INSERT INTO `t_b_damage` VALUES ('402881e64cf9f0fe014cf9f189ea0000','888','2015-04-01','2015-04-30','123','402881e54ce9ee7d014ce9f0b6450000','2015-04-27 18:33:30','1');
/*!40000 ALTER TABLE `t_b_damage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_b_dorm`
--

DROP TABLE IF EXISTS `t_b_dorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_dorm` (
  `id` varchar(36) NOT NULL,
  `dormname` varchar(30) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `dormadmin` varchar(10) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_dorm`
--

LOCK TABLES `t_b_dorm` WRITE;
/*!40000 ALTER TABLE `t_b_dorm` DISABLE KEYS */;
INSERT INTO `t_b_dorm` VALUES ('1','已离校',0,4,'','离校','2015-04-24 16:27:10'),('402881e54ce9ee7d014ce9f0b6450000','一宿舍',10,9,'高圆圆','这是男生宿舍','2015-04-29 19:49:26'),('402881e54cea6e2e014cea72c01e0000','二宿舍',10,10,'罗玉凤','这也是男生宿舍','2015-04-24 16:27:10'),('402881e64d051ccf014d0520f3bf0000','三宿舍',5,4,'古天乐','这是女生宿舍','2015-04-29 20:22:35'),('402881e64d05267d014d0529d4050002','四宿舍',1,1,'王勇','','2015-04-29 20:32:16');
/*!40000 ALTER TABLE `t_b_dorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_b_score`
--

DROP TABLE IF EXISTS `t_b_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_score` (
  `id` varchar(36) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `scoredate` date DEFAULT NULL,
  `dormid` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`dormid`),
  KEY `fk_t_b_score_t_b_dorm1` (`dormid`),
  CONSTRAINT `fk_t_b_score_t_b_dorm1` FOREIGN KEY (`dormid`) REFERENCES `t_b_dorm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_score`
--

LOCK TABLES `t_b_score` WRITE;
/*!40000 ALTER TABLE `t_b_score` DISABLE KEYS */;
INSERT INTO `t_b_score` VALUES ('402881e64d041299014d04135f070000',5,'2015-04-29','402881e54ce9ee7d014ce9f0b6450000','2015-04-29 16:20:25'),('402881e64d04422d014d0443092c0000',1,'2015-04-29','402881e54cea6e2e014cea72c01e0000','2015-04-29 16:20:11'),('402881e64d054958014d055417390003',4,'2015-04-22','402881e64d051ccf014d0520f3bf0000','2015-04-29 21:18:26'),('402881e64d054958014d055459c70004',5,'2015-04-29','402881e64d05267d014d0529d4050002','2015-04-29 21:18:43'),('402881e64d232d9d014d232e253f0000',5,'2015-05-05','402881e54ce9ee7d014ce9f0b6450000','2015-05-05 16:25:36');
/*!40000 ALTER TABLE `t_b_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_b_student`
--

DROP TABLE IF EXISTS `t_b_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_student` (
  `id` varchar(36) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `classid` varchar(36) NOT NULL,
  `dormid` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`classid`,`dormid`),
  KEY `fk_t_b_student_t_b_class1` (`classid`),
  KEY `fk_t_b_student_t_b_dorm1` (`dormid`),
  CONSTRAINT `fk_t_b_student_t_b_class1` FOREIGN KEY (`classid`) REFERENCES `t_b_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_b_student_t_b_dorm1` FOREIGN KEY (`dormid`) REFERENCES `t_b_dorm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_student`
--

LOCK TABLES `t_b_student` WRITE;
/*!40000 ALTER TABLE `t_b_student` DISABLE KEYS */;
INSERT INTO `t_b_student` VALUES ('402881e64d05267d014d0527e3f80000','范冰冰','2','2015-04-22','6666','13575798836','402881e44cbbfe2c014cbbfecf730001','402881e64d051ccf014d0520f3bf0000','2015-04-29 20:30:09'),('402881e64d05267d014d0528d8570001','姚明','1','2015-04-15','8888','13566666666','402881e44cbc0292014cbd3aac1f0001','402881e54ce9ee7d014ce9f0b6450000','2015-04-29 20:31:12');
/*!40000 ALTER TABLE `t_b_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_b_visitor`
--

DROP TABLE IF EXISTS `t_b_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_visitor` (
  `id` varchar(36) NOT NULL,
  `visitorname` varchar(10) DEFAULT NULL,
  `studentid` varchar(36) NOT NULL,
  `relationship` varchar(10) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`studentid`),
  KEY `fk_t_b_visitor_t_b_student1` (`studentid`),
  CONSTRAINT `fk_t_b_visitor_t_b_student1` FOREIGN KEY (`studentid`) REFERENCES `t_b_student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_visitor`
--

LOCK TABLES `t_b_visitor` WRITE;
/*!40000 ALTER TABLE `t_b_visitor` DISABLE KEYS */;
INSERT INTO `t_b_visitor` VALUES ('402881e64d094b2b014d095f25cc0000','李晨','402881e64d05267d014d0527e3f80000','1','2015-04-30 14:08:39','2015-04-30 16:08:44','来了','2015-04-30 16:09:00');
/*!40000 ALTER TABLE `t_b_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_depart`
--

DROP TABLE IF EXISTS `t_s_depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_depart` (
  `id` varchar(36) NOT NULL,
  `departname` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `parentid` varchar(36) NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_s_depart_t_s_depart1` (`parentid`),
  CONSTRAINT `fk_t_s_depart_t_s_depart1` FOREIGN KEY (`parentid`) REFERENCES `t_s_depart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_depart`
--

LOCK TABLES `t_s_depart` WRITE;
/*!40000 ALTER TABLE `t_s_depart` DISABLE KEYS */;
INSERT INTO `t_s_depart` VALUES ('1','test','test','1',NULL);
/*!40000 ALTER TABLE `t_s_depart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_resource`
--

DROP TABLE IF EXISTS `t_s_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_resource` (
  `id` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `href` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `resourceType` int(11) DEFAULT NULL,
  `parentid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_s_resource_t_s_resource1` (`parentid`),
  CONSTRAINT `fk_t_s_resource_t_s_resource1` FOREIGN KEY (`parentid`) REFERENCES `t_s_resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_resource`
--

LOCK TABLES `t_s_resource` WRITE;
/*!40000 ALTER TABLE `t_s_resource` DISABLE KEYS */;
INSERT INTO `t_s_resource` VALUES ('1','2014-08-27 16:05:40','系统','/','系统',1,1,NULL),('2',NULL,NULL,'userController.do?goUser','用户管理',1,1,'5'),('3',NULL,NULL,'roleController.do?goRole','角色管理',2,1,'5'),('4',NULL,NULL,'resourceController.do?goResource','菜单管理',3,1,'5'),('402881e44cb6a685014cb6a840aa0000','2015-04-14 17:07:19','基本信息管理','/','信息管理',2,1,'1'),('402881e44cb71ec1014cb723b7f40000','2015-04-15 13:55:55','学生基本信息管理','studentController.do?goStudent','学生管理',1,1,'402881e44cb6a685014cb6a840aa0000'),('402881e44cbbe87e014cbbea99a80000','2015-04-15 15:10:56','班级信息管理','classController.do?goClass','班级管理',2,1,'402881e44cb6a685014cb6a840aa0000'),('402881e54ce5b4be014ce5b838fa0000','2015-04-23 17:59:57','管理访客','visitorController.do?goVisitor','访客管理',3,1,'402881e44cb6a685014cb6a840aa0000'),('402881e54ce5b4be014ce5b8def70001','2015-04-27 10:00:44','管理损坏情况','damageController.do?goDamage','损耗管理',4,1,'402881e44cb6a685014cb6a840aa0000'),('402881e54ce5b4be014ce5b9a0bb0002','2015-04-23 18:01:30','管理宿舍信息','dormController.do?goDorm','宿舍管理',5,1,'402881e44cb6a685014cb6a840aa0000'),('402881e64d0404df014d040685870000','2015-04-29 15:14:05','对宿舍进行评分','scoreController.do?goScore','宿舍评分',6,1,'402881e44cb6a685014cb6a840aa0000'),('5',NULL,NULL,'/','系统管理',9,1,'1');
/*!40000 ALTER TABLE `t_s_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_role`
--

DROP TABLE IF EXISTS `t_s_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role` (
  `id` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_role`
--

LOCK TABLES `t_s_role` WRITE;
/*!40000 ALTER TABLE `t_s_role` DISABLE KEYS */;
INSERT INTO `t_s_role` VALUES ('1','2015-04-29 15:14:30','admin','admin'),('402881e54c7e34f6014c7e367bfb0000','2015-04-07 20:08:41','','咨询客服');
/*!40000 ALTER TABLE `t_s_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_role_resource`
--

DROP TABLE IF EXISTS `t_s_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role_resource` (
  `role_id` varchar(36) NOT NULL,
  `resource_id` varchar(36) NOT NULL,
  KEY `FK17BAC656127E527` (`role_id`),
  KEY `FK17BAC653B9CBFA7` (`resource_id`),
  CONSTRAINT `FK17BAC653B9CBFA7` FOREIGN KEY (`resource_id`) REFERENCES `t_s_resource` (`id`),
  CONSTRAINT `FK17BAC656127E527` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_role_resource`
--

LOCK TABLES `t_s_role_resource` WRITE;
/*!40000 ALTER TABLE `t_s_role_resource` DISABLE KEYS */;
INSERT INTO `t_s_role_resource` VALUES ('402881e54c7e34f6014c7e367bfb0000','2'),('402881e54c7e34f6014c7e367bfb0000','3'),('402881e54c7e34f6014c7e367bfb0000','1'),('402881e54c7e34f6014c7e367bfb0000','5'),('1','1'),('1','402881e44cb6a685014cb6a840aa0000'),('1','402881e44cb71ec1014cb723b7f40000'),('1','402881e44cbbe87e014cbbea99a80000'),('1','402881e54ce5b4be014ce5b838fa0000'),('1','402881e54ce5b4be014ce5b8def70001'),('1','402881e54ce5b4be014ce5b9a0bb0002'),('1','402881e64d0404df014d040685870000'),('1','5'),('1','2'),('1','3'),('1','4');
/*!40000 ALTER TABLE `t_s_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_user`
--

DROP TABLE IF EXISTS `t_s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_user` (
  `id` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `position_desc` varchar(100) DEFAULT NULL,
  `real_name` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userName` varchar(50) NOT NULL,
  `departid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_s_user_t_s_depart1` (`departid`),
  CONSTRAINT `fk_t_s_user_t_s_depart1` FOREIGN KEY (`departid`) REFERENCES `t_s_depart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_user`
--

LOCK TABLES `t_s_user` WRITE;
/*!40000 ALTER TABLE `t_s_user` DISABLE KEYS */;
INSERT INTO `t_s_user` VALUES ('1','2015-04-03 14:32:12','ser@bjpowernode.com','21232f297a57a5a743894a0e4a801fc3','','','','动力节点',1,'admin',NULL),('402881e54c7e3e72014c7e3f6dbc0000','2015-04-03 15:47:08','','dc483e80a7a0bd9ef71d8cf973673924','','','','',1,'test',NULL);
/*!40000 ALTER TABLE `t_s_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_user_role`
--

DROP TABLE IF EXISTS `t_s_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_user_role` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  KEY `FKD0596186127E527` (`role_id`),
  KEY `FKD059618652A907` (`user_id`),
  CONSTRAINT `FKD0596186127E527` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`),
  CONSTRAINT `FKD059618652A907` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_user_role`
--

LOCK TABLES `t_s_user_role` WRITE;
/*!40000 ALTER TABLE `t_s_user_role` DISABLE KEYS */;
INSERT INTO `t_s_user_role` VALUES ('1','1'),('402881e54c7e3e72014c7e3f6dbc0000','402881e54c7e34f6014c7e367bfb0000');
/*!40000 ALTER TABLE `t_s_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-05 17:04:21
