-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: pet_forge
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adopt`
--

DROP TABLE IF EXISTS `adopt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopt` (
  `adopt_id` bigint NOT NULL AUTO_INCREMENT COMMENT '领养表的id',
  `adopt_code` varchar(16) NOT NULL COMMENT '订单编号',
  `pet_id` bigint NOT NULL COMMENT '领养宠物的id',
  `client_id` bigint NOT NULL COMMENT '领养人id',
  `adopt_money` int NOT NULL DEFAULT '0' COMMENT '领养押金',
  `adopt_info` varchar(64) DEFAULT NULL COMMENT '订单备注',
  `in_adopt` tinyint NOT NULL DEFAULT '2' COMMENT '是否通过，2为待审核，1为通过，0为未通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间，也是领养时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_del` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`adopt_id`),
  UNIQUE KEY `adopt_code` (`adopt_code`,`is_del`),
  KEY `pet_id` (`pet_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `adopt_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`),
  CONSTRAINT `adopt_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='领养宠物订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopt`
--

LOCK TABLES `adopt` WRITE;
/*!40000 ALTER TABLE `adopt` DISABLE KEYS */;
INSERT INTO `adopt` VALUES (1,'22301121',26,1,234,'领养三毛',1,'2025-02-21 20:05:54','2025-02-08 12:56:04','0'),(2,'22301122',34,3,300,'小狐狸^_^',1,'2025-02-16 13:12:20','2025-02-02 05:54:55','0'),(3,'22301123',22,3,10,'五花比四花多一花',1,'2025-02-26 19:17:03','2025-02-12 19:51:52','0'),(4,'22301194',19,1,888,'喵喵喵',0,'2025-02-22 06:57:01','2025-02-06 00:27:12','0'),(5,'22301225',28,6,200,'养着玩',1,'2025-02-19 17:36:53','2025-02-18 11:25:42','0'),(6,'22302136',23,3,32323,'测试',2,'2025-02-09 10:10:37','2025-02-17 00:24:56','0'),(7,'22302137',19,2,2333,'狸二花，名花有主',2,'2025-02-14 12:16:45','2025-02-28 14:10:00','0'),(8,'22302188',24,6,233,'金毛嘿嘿嘿',2,'2025-02-14 11:49:46','2025-02-11 12:27:46','0'),(9,'22502239',11,1,1000,'梦婷姐说看着挺好看的',1,'2025-02-15 04:28:46','2025-02-13 23:25:16','0'),(10,'225030110',18,14,1000,'看着好可爱',1,'2025-03-01 11:59:09','2025-03-01 11:59:09','0');
/*!40000 ALTER TABLE `adopt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '挂号单id',
  `client_id` bigint NOT NULL COMMENT '用户id',
  `pet_id` bigint NOT NULL COMMENT '宠物id',
  `appointment_date` datetime NOT NULL COMMENT '就诊时间',
  `department_id` bigint NOT NULL COMMENT '部门id',
  `doctor_id` bigint NOT NULL COMMENT '医生id',
  `appointment_info` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '挂号简短信息',
  `is_suc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处理',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_del` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`appointment_id`),
  KEY `fk_appointment_client` (`client_id`),
  KEY `fk_appointment_pet` (`pet_id`),
  KEY `fk_appointment_department` (`department_id`),
  KEY `fk_appointment_doctor` (`doctor_id`),
  CONSTRAINT `fk_appointment_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `fk_appointment_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `fk_appointment_pet` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='挂号单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,5,'2025-02-26 13:09:04',1,1,'严重的肛裂',1,'2025-02-02 11:10:29','2025-02-27 05:20:59','0'),(2,4,5,'2025-02-24 20:45:13',4,5,'尝试第一次挂号',0,'2025-02-26 07:49:12','2025-02-16 02:52:05','0'),(3,3,12,'2025-02-26 00:14:13',8,4,'熬夜写代码',1,'2025-02-24 13:21:01','2025-02-02 03:35:32','0'),(4,1,3,'2025-02-27 00:11:55',8,4,'查看骨骼',1,'2025-02-11 05:05:42','2025-02-08 06:33:55','0'),(5,3,12,'2025-02-05 13:28:37',4,5,'写不动代码去医院挂号',0,'2025-02-01 09:53:16','2025-02-19 12:35:22','0'),(6,3,12,'2025-02-18 06:20:57',8,4,'熬夜写代码',1,'2025-02-20 14:59:07','2025-02-17 16:31:38','0'),(7,3,12,'2025-02-15 15:36:09',8,4,'写不动代码去医院挂号',0,'2025-02-22 23:33:51','2025-02-18 13:00:18','0'),(8,3,12,'2025-02-02 06:08:58',1,1,'贾不贾说这猫有病，还不轻',1,'2025-02-28 09:06:17','2025-02-05 21:04:39','0'),(9,2,33,'2025-03-01 12:11:00',1,1,'贾不贾说这猫吃多了，来看看',0,'2025-03-01 12:12:16','2025-03-01 12:12:16','0');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `client_username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `client_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '6b6864bf70c40ccbc2752cd9ef11e77b' COMMENT '用户密码',
  `client_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户姓名',
  `client_gender` tinyint(1) DEFAULT '0' COMMENT '用户性别',
  `client_tel` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户电话',
  `client_age` date DEFAULT '2001-01-03' COMMENT '用户生日',
  `client_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '一个新用户' COMMENT '用户简介',
  `client_photo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'zs.jpg' COMMENT '用户照片名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_del` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_username` (`client_username`,`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'tomas','6b6864bf70c40ccbc2752cd9ef11e77b','Tomas',0,'sanyu0201@163.com','2001-01-03','来自提瓦特❥(^_-)','ying.jpg','2025-02-12 03:26:49','2025-02-23 11:58:27','0'),(2,'lei-jun','6b6864bf70c40ccbc2752cd9ef11e77b','雷军',0,'sanyu0201@163.com','1990-01-01','喜欢宅家撸猫','lei-jun.jpg','2025-02-12 14:50:22','2025-02-10 14:02:20','0'),(3,'jiabujia','6b6864bf70c40ccbc2752cd9ef11e77b','贾不贾',1,'sanyu0201@163.com','2000-01-01','作者','san-yu.jpg','2025-02-17 20:33:14','2025-02-15 21:56:00','0'),(4,'fox','6b6864bf70c40ccbc2752cd9ef11e77b','狐狸',0,'sanyu0201@163.com','2000-01-07','粉毛狐狸','ba-chong.jpg','2025-02-06 23:19:41','2025-02-14 07:08:46','0'),(5,'hong','d7d203f6e81e3b6e26ed8e5d72c97926','红中',1,'sanyu0201@163.com','2023-01-22','一个新用户','zs.jpg','2025-02-12 18:36:41','2025-02-19 05:12:17','0'),(6,'bei','96f39677a13f2756f55bda6b38659f32','北风',0,'sanyu0201@163.com','2000-01-03','黜聪明，拙肢体，同于大道','zs.jpg','2025-02-24 07:00:07','2025-02-17 15:20:51','0'),(7,'wang','6b6864bf70c40ccbc2752cd9ef11e77b','骰子',1,'sanyu0201@163.com','2023-01-22','一个新用户','zs.jpg','2025-02-07 15:28:26','2025-02-22 12:18:57','2023-01-22 15:24:57'),(9,'wang','6b6864bf70c40ccbc2752cd9ef11e77b','骰子',1,'sanyu0201@163.com','2023-01-22','一个新用户','zs.jpg','2025-02-25 11:46:25','2025-02-22 16:00:59','0'),(10,'liu666','5eb2a76d38d58bf5ac206908c3cd722b','六饼',0,'sanyu0201@163.com','2023-01-22','一个新用户','zs.jpg','2025-02-27 19:11:29','2025-02-26 02:48:41','0'),(11,'wu','3a714b07ec44c1f6eca4bb7b7bddad1f','五饼',1,'sanyu0201@163.com','2023-01-23','一个新用户','zs.jpg','2025-02-02 03:33:21','2025-02-04 11:04:56','0'),(12,'liu-tiao','01fc1652d99677fdbb9c5a5b11b2376f','六条',1,'sanyu0201@163.com','2023-01-23','666666','zs.jpg','2025-02-14 12:09:15','2025-02-23 06:55:49','0'),(13,'ba-tiao','6b6864bf70c40ccbc2752cd9ef11e77b','八条',1,'sanyu0201@163.com','2023-02-09','一个新用户','zs.jpg','2025-02-09 02:35:39','2025-02-15 13:14:31','0'),(14,'xiaodang','6b6864bf70c40ccbc2752cd9ef11e77b','xiaodang',1,'2247591496@qq.com','2025-03-01','一个新用户','zs.jpg','2025-02-26 00:24:57','2025-02-15 18:20:22','0');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` bigint NOT NULL AUTO_INCREMENT COMMENT '科室id',
  `department_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '科室名称',
  `department_info` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '科室简介',
  `department_address` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '科室地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_del` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'犬猫科','主要整治猫猫狗狗','一楼227','2025-02-25 04:17:57','2025-02-25 12:01:29','0'),(2,'骨科','专治跌打损伤','三楼238','2025-02-12 14:42:47','2025-02-24 20:44:05','0'),(3,'化验室','进行化验','三楼226','2025-02-08 02:39:58','2025-02-27 19:10:25','0'),(4,'美容室','对宠物进行美容','三楼327','2025-02-18 19:17:59','2025-02-03 10:56:22','0'),(8,'中兽科','传统中医治兽','一楼125','2025-02-03 06:02:27','2025-02-05 09:34:38','0');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` bigint NOT NULL AUTO_INCREMENT COMMENT '医生id',
  `department_id` bigint DEFAULT NULL COMMENT '部门id',
  `doctor_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '医生工号',
  `doctor_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '医生姓名',
  `doctor_gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '医生性别，1男0女',
  `doctor_age` date NOT NULL DEFAULT '2001-01-03' COMMENT '医生生日',
  `doctor_photo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'defaultDoctor.jpg' COMMENT '医生照片名称',
  `doctor_tel` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '医生联系方式',
  `doctor_job` varchar(16) DEFAULT '医生' COMMENT '医生职位',
  `doctor_info` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '医生简介',
  `doctor_password` varchar(32) NOT NULL DEFAULT '6b6864bf70c40ccbc2752cd9ef11e77b' COMMENT '医生密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_del` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `doctor_code` (`doctor_code`) USING BTREE,
  KEY `fk_doctor_department` (`department_id`),
  CONSTRAINT `fk_doctor_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='医生表，外键部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,1,'32312221','童德统',1,'1990-10-10','doctor-1.jpg','sanyu0201@163.com','副院长','国内著名医学专家，擅长绝育','6b6864bf70c40ccbc2752cd9ef11e77b','2025-02-14 12:06:59','2025-02-18 03:51:52','0'),(2,4,'32301062','爱丽丝',0,'2003-02-01','doctor-2.jpg','sanyu0201@163.com','麻醉科主任','擅长麻醉','6b6864bf70c40ccbc2752cd9ef11e77b','2025-02-22 05:53:43','2025-02-26 11:33:22','0'),(4,8,'32301063','汤姆',1,'2000-01-11','doctor-3.jpg','sanyu0201@163.com','医生','擅长x光拍片','6b6864bf70c40ccbc2752cd9ef11e77b','2025-02-07 02:44:23','2025-02-21 13:29:49','0'),(5,4,'32301064','张大嘴',0,'2002-01-05','doctor-4.jpg','sanyu0201@163.com','医生','著名宠物医美专家','6b6864bf70c40ccbc2752cd9ef11e77b','2025-02-19 19:07:07','2025-02-09 01:29:15','0'),(6,3,'32301065','李妙手',1,'2001-01-06','3b161abe-7142-449c-ab36-07a689da65de.jpg','sanyu0201@163.com','医生','国外著名医学专家','6b6864bf70c40ccbc2752cd9ef11e77b','2025-02-23 07:05:33','2025-02-15 21:58:07','0'),(8,2,'32301076','李正骨',0,'2000-01-28','3cd8e749-e177-4e5b-846c-930efab7bd38.jpg','sanyu0201@163.com','医生','国内外著名骨科专家','6b6864bf70c40ccbc2752cd9ef11e77b','2025-02-20 03:42:02','2025-02-03 09:38:02','0'),(9,8,'32302189','钟回春',1,'2000-02-10','92833192-79d4-42d6-a657-d000d8ca6295.jpg','sanyu0201@163.com','医生','多年老中医','6b6864bf70c40ccbc2752cd9ef11e77b','2025-02-09 09:59:47','2025-02-28 14:57:01','0');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `employee_username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员账号',
  `employee_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '6b6864bf70c40ccbc2752cd9ef11e77b' COMMENT '管理员密码',
  `employee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员姓名',
  `employee_level` int NOT NULL DEFAULT '0' COMMENT '管理员等级',
  `employee_tel` varchar(12) NOT NULL COMMENT '管理员联系方式',
  `employee_photo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'zs.jpg' COMMENT '管理员照片名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_del` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_username` (`employee_username`,`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'admin','6b6864bf70c40ccbc2752cd9ef11e77b','炒鸡管理员',6,'13882244666','admm.jpg','2025-02-08 06:36:12','2025-02-06 07:00:05','0'),(2,'yun','af2292f0a8074e588713093386058d4d','李云',4,'13882244666','doctor-1.jpg','2025-02-13 22:22:03','2025-02-06 17:01:57','0'),(3,'ra9','6b6864bf70c40ccbc2752cd9ef11e77b','托马斯',2,'13882244666','ju-cat.jpg','2025-02-20 15:09:48','2025-02-17 10:33:23','0'),(4,'wheat','6b6864bf70c40ccbc2752cd9ef11e77b','贾贾贾',4,'13882244666','san-yu.jpg','2025-02-10 11:25:39','2025-02-01 03:41:59','0'),(5,'zs','6b6864bf70c40ccbc2752cd9ef11e77b','张三',0,'13882244666','zs.jpg','2025-02-24 07:01:09','2025-02-21 05:52:45','0');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foster`
--

DROP TABLE IF EXISTS `foster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foster` (
  `foster_id` bigint NOT NULL AUTO_INCREMENT COMMENT '寄养表的id',
  `foster_code` varchar(16) NOT NULL COMMENT '订单编号',
  `pet_id` bigint NOT NULL COMMENT '寄养宠物的id',
  `client_id` bigint NOT NULL COMMENT '寄养人id',
  `foster_term` date NOT NULL COMMENT '寄养到期时间',
  `foster_money` int NOT NULL DEFAULT '0' COMMENT '寄养押金',
  `foster_info` varchar(64) DEFAULT NULL COMMENT '订单备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_del` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`foster_id`),
  UNIQUE KEY `foster_code` (`foster_code`,`is_del`),
  KEY `pet_id` (`pet_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `foster_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`),
  CONSTRAINT `foster_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='寄养表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foster`
--

LOCK TABLES `foster` WRITE;
/*!40000 ALTER TABLE `foster` DISABLE KEYS */;
INSERT INTO `foster` VALUES (1,'12301121',8,1,'2025-01-28',100,'寄养波斯','2025-02-04 07:09:52','2025-02-27 01:31:25','0'),(2,'12301122',32,3,'2025-01-13',800,'好好照顾','2025-02-15 07:56:51','2025-02-13 15:57:50','0'),(3,'12301123',33,2,'2025-07-28',20000,'调教ing','2025-02-09 23:59:01','2025-02-06 19:35:29','0'),(4,'12301124',5,4,'2025-07-13',300,'','2025-02-19 19:10:23','2025-02-13 23:34:59','0'),(5,'12301125',32,3,'2025-09-15',200,'有事外出','2025-02-06 23:22:56','2025-02-16 22:57:01','0');
/*!40000 ALTER TABLE `foster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msg` (
  `msg_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `client_id` bigint NOT NULL COMMENT '用户ID',
  `doctor_id` bigint NOT NULL COMMENT '医生ID',
  `is_client` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为用户发送，0为医生',
  `msg_content` varchar(64) DEFAULT NULL COMMENT '消息内容',
  `is_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为图片消息',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_del` varchar(32) NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`msg_id`),
  KEY `client_id` (`client_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `msg_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `msg_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
INSERT INTO `msg` VALUES (1,1,4,1,'在吗？',0,'2025-02-08 04:11:21','2025-02-08 05:20:03','0'),(2,1,4,0,'你好，在的',0,'2025-02-19 17:41:15','2025-02-06 20:45:11','0'),(3,1,2,0,'你好，有什么需要帮助的吗？',0,'2025-02-13 23:33:51','2025-02-07 10:24:43','0'),(4,1,4,0,'你有什么想问的',0,'2025-02-19 17:42:22','2025-02-19 15:17:30','0'),(5,1,4,1,'就是那个',0,'2025-02-26 15:35:59','2025-02-21 11:17:57','0'),(6,1,4,1,'我家的鱼的鳞片都立起来了',0,'2025-02-06 08:09:43','2025-02-06 00:31:33','0'),(7,1,4,1,'昨天还好好的',0,'2025-02-27 17:53:14','2025-02-05 13:19:59','0'),(8,2,4,1,'你好啊',0,'2025-02-25 03:12:34','2025-02-15 22:02:23','0'),(9,1,1,1,'童医生，你好',0,'2025-02-24 08:20:34','2025-02-07 10:31:16','0'),(10,1,2,1,'暂时没有',0,'2025-02-25 05:31:54','2025-02-24 12:08:03','0'),(11,1,4,0,'看你的描述，可能是立鳞病',0,'2025-02-03 17:20:32','2025-02-27 02:33:33','0'),(12,1,4,0,'水质太差了就会这样',0,'2025-02-12 11:11:27','2025-02-19 18:45:32','0'),(13,1,1,0,'你好',0,'2025-02-13 08:25:06','2025-02-21 08:32:36','0'),(14,1,1,1,'我的鱼的鳞片为什么都竖起来了',0,'2025-02-27 09:12:51','2025-02-09 02:36:45','0'),(15,1,1,1,'前两天还好好的',0,'2025-02-28 09:04:07','2025-02-19 16:31:30','0'),(16,1,1,0,'可能染上了立鳞病',0,'2025-02-13 03:17:02','2025-02-12 17:22:43','0'),(17,1,1,1,'立鳞病？那是什么',0,'2025-02-08 13:02:31','2025-02-09 10:19:14','0'),(18,1,1,0,'其会使病鱼体表肿胀，部分鳞片向外张开使鳞片竖起。',0,'2025-02-07 04:13:34','2025-02-15 00:28:19','0'),(19,1,1,1,'真的吗',0,'2025-02-20 21:20:05','2025-02-07 08:11:51','0'),(20,1,1,1,'那怎么办啊',0,'2025-02-12 07:13:13','2025-02-12 20:57:15','0'),(21,1,4,1,'啊这。。。。。',0,'2025-02-28 21:35:14','2025-02-14 16:00:00','0'),(22,1,2,0,'好的，有需要随时叫我',0,'2025-02-28 08:48:02','2025-02-12 08:30:29','0'),(23,1,2,1,'❥(^_-)',0,'2025-02-13 17:24:45','2025-02-22 17:20:29','0'),(24,1,1,0,'你发张照片我看看',0,'2025-02-27 01:28:10','2025-02-18 18:58:34','0'),(25,1,1,1,'这样行吗？',0,'2025-02-20 04:59:19','2025-02-12 13:32:03','0'),(26,1,1,1,'ms-img-01.png',1,'2025-02-14 12:07:03','2025-02-19 07:39:17','0'),(27,1,1,0,'ms-img-02.png',1,'2025-02-06 18:18:11','2025-02-27 15:15:23','0'),(28,1,1,1,'ms-img-03.png',1,'2025-02-26 21:45:07','2025-02-03 18:42:12','0'),(29,1,1,1,'你好',0,'2025-02-10 05:05:47','2025-02-10 08:42:29','0'),(30,1,1,1,'fca128e5-449f-4e2a-a491-2481b63c986f.jpg',1,'2025-02-17 16:37:04','2025-02-19 22:42:44','0'),(31,1,1,1,'你是Tomas吗',0,'2025-02-26 18:08:22','2025-02-16 12:53:54','0'),(32,1,1,1,'你能看到消息吗',0,'2025-02-27 16:30:34','2025-02-13 01:02:00','0'),(33,1,1,0,'我可以',0,'2025-02-01 13:45:05','2025-02-09 18:02:49','0'),(34,1,2,1,'你好，在吗',0,'2025-02-26 11:44:14','2025-02-07 21:44:01','0'),(35,1,2,0,'我在',0,'2025-02-07 22:56:52','2025-02-28 03:50:45','0'),(36,1,2,1,'我屁股疼怎么办',0,'2025-02-12 12:26:37','2025-02-17 07:49:10','0'),(37,1,2,0,'打一顿就不疼了',0,'2025-02-17 01:39:02','2025-02-23 02:02:56','0'),(38,1,2,1,'好的，明白',0,'2025-02-23 07:12:02','2025-02-08 03:00:33','0'),(39,14,5,1,'你好，张大嘴',0,'2025-03-01 12:03:14','2025-03-01 12:03:14','0'),(40,14,5,0,'我在，请讲',0,'2025-03-01 12:03:36','2025-03-01 12:03:36','0');
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `notice_id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `notice_title` varchar(64) NOT NULL COMMENT '公告标题',
  `notice_file` varchar(64) NOT NULL COMMENT '文本文件名称',
  `creat_id` bigint NOT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_del` varchar(32) NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`notice_id`),
  KEY `creat_id` (`creat_id`),
  KEY `update_id` (`update_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`creat_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'宠物医院开业公告','notice-1.txt',1,'2025-02-17 18:09:28',1,'2025-02-25 22:59:12',0,'0'),(4,'论纯白','4d7dcc2e-7465-49aa-b476-c85a255162a9.txt',2,'2025-02-02 17:23:47',2,'2025-02-23 15:52:22',1,'0'),(5,'做好宠物的疾病防治','f91d4670-9d59-44c8-af5d-b74ef6f4dc76.txt',2,'2025-02-07 02:51:57',2,'2025-02-06 03:11:29',0,'0'),(6,'dd','fa9c33fc-1bb0-446f-8a76-5aed34228976.txt',3,'2025-02-24 18:20:21',3,'2025-02-22 18:30:14',0,'2023-01-11 18:05:16'),(7,'开始采用宠物医院管理系统','4b50890c-a992-4d15-b5da-1dc26306df12.txt',3,'2025-02-20 16:25:03',2,'2025-02-28 17:43:26',0,'0'),(8,'加强节粮减损，杜绝粮食浪费','9a9214e5-333c-4146-9f96-4a5c00b52215.txt',3,'2025-02-02 22:30:44',3,'2025-02-05 15:43:38',0,'0'),(9,'绅士笑话集','af588adb-9a60-4506-b058-98012ad9ea2c.txt',2,'2025-02-02 08:36:57',2,'2025-02-28 00:15:08',1,'0'),(10,'密码管理通知','6d65ebec-c282-4c6c-a36e-8c1338906e34.txt',1,'2025-02-27 06:30:43',1,'2025-02-04 09:36:50',0,'0'),(11,'日常锻炼','f2130e5c-8394-4715-9261-a1341d8691af.txt',1,'2025-03-01 12:13:58',1,'2025-03-01 12:13:58',0,'0');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `pet_id` bigint NOT NULL AUTO_INCREMENT COMMENT '宠物的id',
  `pet_name` varchar(16) NOT NULL DEFAULT '未名' COMMENT '宠物姓名',
  `pet_variety` varchar(16) NOT NULL DEFAULT '未知' COMMENT '宠物的品种',
  `pet_sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '宠物性别，0母1公',
  `pet_age` date NOT NULL DEFAULT '2001-01-03' COMMENT '宠物生日',
  `pet_status` varchar(16) DEFAULT '健康' COMMENT '宠物状态',
  `pet_info` varchar(64) DEFAULT '无' COMMENT '宠物动态',
  `client_id` bigint DEFAULT NULL COMMENT '宠物主人id',
  `pet_photo` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'defaultPet.jpg' COMMENT '宠物照片名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_del` varchar(32) NOT NULL DEFAULT '0' COMMENT '逻辑删除，默认0，填充删除日期',
  PRIMARY KEY (`pet_id`),
  KEY `fk_pet_client` (`client_id`) USING BTREE,
  CONSTRAINT `fk_pet_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COMMENT='宠物信息表，外键用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES (1,'saber','金毛犬',0,'2005-01-13','怀孕待产',NULL,NULL,NULL,'2025-02-12 12:22:19','2025-02-15 14:26:23','2023-01-07 19:12:53'),(2,'甘雨','椰羊',0,'1905-01-13','频繁掉毛',NULL,NULL,NULL,'2025-02-18 23:58:59','2025-02-28 00:07:33','2023-01-07 19:12:55'),(3,'心海','观赏鱼',0,'2000-01-13','非常健康','心海十分开心',1,'f66eb858-e13c-438a-b235-8889d2d416be.png','2025-02-13 12:13:34','2025-02-06 06:44:53','0'),(4,'神里凌华','柴犬',0,'2004-01-13','肛裂',NULL,NULL,NULL,'2025-02-08 14:10:08','2025-02-05 08:17:23','2023-01-07 19:17:09'),(5,'雷电小兵','吉娃娃',1,'1990-08-09','绝育手术','这宠物十分开心',4,'a78d73bc-a557-41e0-8a8f-8ddc5c22e7ce.png','2025-02-04 08:30:24','2025-02-16 13:05:47','0'),(6,'笔试测试调试','但是',1,'2022-12-29','良好',NULL,NULL,NULL,'2025-02-19 22:43:49','2025-02-26 03:01:38','2023-01-18 17:31:31'),(7,'波一斯','波斯猫',0,'2016-12-15','频繁掉毛','等待有缘人领养',NULL,'boss-cat.jpg','2025-02-05 21:55:59','2025-02-06 23:20:45','0'),(8,'波二斯','波斯猫',1,'2016-12-17','良好','等待有缘人领养',NULL,'fd1cdd8a-3411-4b95-a20d-5ad3993c94af.jpg','2025-02-22 15:48:07','2025-02-07 16:52:16','0'),(9,'波三斯','波斯猫',0,'2013-12-23','频繁掉毛','等待有缘人领养',NULL,'a943938f-7d21-49d3-a909-22f2c2dc2c9b.jpg','2025-02-22 00:44:41','2025-02-06 21:57:03','0'),(10,'波四斯','波斯猫',0,'2012-12-03','良好','这宠物十分开心',2,'92d90558-d92f-4dd8-bca3-5088825e0729.jpg','2025-02-12 22:24:14','2025-02-27 01:28:08','0'),(11,'大橘莹','橘猫',0,'2007-12-23','体重超标','它有了温暖的家，感恩',1,'ju-cat.jpg','2025-02-10 05:09:05','2025-02-01 17:37:58','0'),(12,'二橘','橘猫',1,'2009-12-24','体重超标','这宠物十分开心',3,'280906db-7875-44f7-babc-da106823b59e.jpg','2025-02-27 21:31:00','2025-02-12 02:13:48','0'),(13,'三橘','橘猫',0,'2009-12-23','良好','等待有缘人领养',NULL,'42e28f7b-c1ab-49fd-a486-4f4ce35c565b.jpg','2025-02-11 11:14:48','2025-02-10 04:55:04','0'),(14,'四橘','橘猫',1,'2010-12-23','需要绝育','等待有缘人领养',NULL,'3e56e4f8-5459-4559-85af-f7b0ecc2ff1d.jpg','2025-02-17 18:01:52','2025-02-07 14:16:34','0'),(15,'五橘','橘猫',0,'2012-12-23','头部肿胀',NULL,NULL,'','2025-02-01 10:10:28','2025-02-25 23:09:56','2023-01-07 19:17:16'),(16,'五橘','橘猫',0,'2012-12-23','头部肿胀','等待有缘人领养',NULL,'cf037563-88bd-40dd-b139-908b8ac72fbd.jpg','2025-02-06 05:30:51','2025-02-23 08:23:52','0'),(17,'六橘','橘猫',1,'2012-12-23','发情期','等待有缘人领养',NULL,'a6f7dc61-0f4f-47b9-bfee-535d5c6d80f6.jpg','2025-02-07 13:00:23','2025-02-27 12:50:35','0'),(18,'狸大花','狸花猫',0,'2012-12-23','发情期','它有了温暖的家，感恩',14,'li-hua.jpg','2025-02-13 12:09:17','2025-02-28 22:52:32','0'),(19,'狸二花','狸花猫',1,'2013-12-23','需要绝育','这宠物十分开心',3,'f0050984-abe6-4091-bbbf-c34efef0a70c.jpg','2025-02-02 17:21:40','2025-02-08 07:42:37','0'),(20,'狸三花','狸花猫',0,'2012-12-23','发情期','等待有缘人领养',NULL,'0a7107fe-bc9b-4a6a-a55e-f32b81c0aae1.jpg','2025-02-02 07:31:36','2025-02-15 15:49:06','0'),(21,'狸四花','狸花猫',0,'2013-12-30','需要绝育','等待有缘人领养',NULL,'a4ef72a4-c8a3-4ae9-a830-adf0861763e9.jpg','2025-02-04 05:47:17','2025-02-02 09:51:06','0'),(22,'狸五花','狸花猫',0,'2018-12-23','体重超标','等待有缘人领养',NULL,'ae30b79c-3ff9-4890-83ef-7c88b842128f.jpg','2025-02-27 09:08:32','2025-02-09 21:29:49','0'),(23,'狸六花','狸花猫',0,'2022-12-24','频繁掉毛','等待有缘人领养',NULL,'bd8ca20c-6aa7-42eb-8413-d6b041e374f0.jpg','2025-02-19 21:22:15','2025-02-05 00:39:11','0'),(24,'金大毛','金毛犬是',0,'2012-12-24','良好','等待有缘人领养',NULL,'jin-mao.jpg','2025-02-28 09:58:41','2025-02-15 12:04:47','0'),(25,'金二毛','金毛犬',0,'2014-12-24','发情期','等待有缘人领养',NULL,'c0aff136-1496-4837-a90e-39438a276852.png','2025-02-22 10:57:27','2025-02-13 18:28:05','0'),(26,'金三毛','金毛犬',1,'2012-12-31','发情期','等待有缘人领养',NULL,'f72b2d65-0d23-47bc-acf0-7f60be5e91e1.png','2025-02-03 02:17:07','2025-02-21 06:12:12','0'),(27,'金四毛','金毛犬',0,'2012-12-29','乱叫','等待有缘人领养',NULL,'328d2c1b-d6e4-4554-9b80-cd15a43d7541.png','2025-02-11 07:28:25','2025-02-19 01:22:39','0'),(28,'金五毛','金毛犬',1,'2022-12-30','体重超标','它有了温暖的家，感恩',6,'jin-mao.jpg','2025-02-05 18:24:41','2025-02-08 07:43:41','0'),(29,'布大偶','布偶猫',0,'2012-12-30','脱水','等待有缘人领养',NULL,'bu-ou.jpg','2025-02-08 05:18:53','2025-02-16 00:29:23','0'),(30,'金七毛','金毛犬',0,'2022-12-30','频繁掉毛',NULL,NULL,'','2025-02-14 05:44:58','2025-02-19 07:42:33','2023-01-07 19:17:22'),(31,'布小偶','布偶猫',0,'2012-12-31','频繁掉毛','等待有缘人领养',NULL,'3d61f5ee-cb55-4350-8c93-e3c66b14acc2.png','2025-02-20 17:35:44','2025-02-27 12:47:23','0'),(32,'布偶二','布偶猫',1,'2012-12-30','良好','这宠物十分开心',3,'3b5d2e67-8af1-4a58-9bed-91d5876a1d97.png','2025-02-17 19:12:36','2025-02-13 09:33:39','0'),(33,'八重神子','藏狐',0,'2013-01-01','需要绝育','这宠物十分开心',2,'05b8baa0-6488-433b-848b-03bb098b256d.png','2025-02-18 04:07:59','2025-02-17 21:47:14','0'),(34,'九重狐狸','红狐狸',0,'2013-01-10','良好','等待有缘人领养',NULL,'94af26d2-80ff-4cdf-85ab-330c9a436c3c.png','2025-02-24 10:44:22','2025-02-18 00:17:21','0');
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pet_forge'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-01 12:30:33
