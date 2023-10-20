-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: keithcoffee
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add product variant',9,'add_productvariant'),(34,'Can change product variant',9,'change_productvariant'),(35,'Can delete product variant',9,'delete_productvariant'),(36,'Can view product variant',9,'view_productvariant'),(37,'Can add shoping cart',10,'add_shopingcart'),(38,'Can change shoping cart',10,'change_shopingcart'),(39,'Can delete shoping cart',10,'delete_shopingcart'),(40,'Can view shoping cart',10,'view_shopingcart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$GjumVG8m1yABdfdElKVLCG$yHBoE+bVF0Q59m6xJDhikcsWFMh2JUbGJm9OmyrXktk=','2023-10-20 09:52:21.585654',1,'keith','','','keithlee870507@gmail.com',1,1,'2023-10-08 18:09:52.479554'),(2,'pbkdf2_sha256$600000$9rshPSTHgftF60OXlBTsW8$Uvkj3mVUaVqDUk7s2B6xaIPpk2lRIQZ1Wen4p2Cm2AM=','2023-10-20 08:01:27.195202',0,'keithlee','µ¥Ä','µù╗µü⌐','test123@gmail.com',0,1,'2023-10-17 18:59:33.351030');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-08 18:35:37.653139','1','σÆûσòí',1,'[{\"added\": {}}]',7,1),(2,'2023-10-08 18:35:50.280592','2','σÆûσòí',1,'[{\"added\": {}}]',7,1),(3,'2023-10-08 18:40:38.628951','4','a',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"a\"}}]',8,1),(4,'2023-10-08 18:40:58.620542','1','σÆûσòí',3,'',7,1),(5,'2023-10-08 18:44:21.401419','5','asda',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"asda\"}}]',8,1),(6,'2023-10-08 18:45:25.982578','5','asda',3,'',8,1),(7,'2023-10-08 18:45:31.243301','4','a',3,'',8,1),(8,'2023-10-11 06:33:39.170539','3','Φè▒ & µ£ê',1,'[{\"added\": {}}]',7,1),(9,'2023-10-11 06:39:38.954796','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jan - \\u5eb7\\u4e43\\u99a8 \\u4e2d\\u6df1\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jan - \\u5eb7\\u4e43\\u99a8 \\u4e2d\\u6df1\\u57f9\"}}]',8,1),(10,'2023-10-11 06:40:43.527543','4','Φè▒&µ£ê',1,'[{\"added\": {}}]',7,1),(11,'2023-10-11 06:40:46.415859','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,1),(12,'2023-10-11 06:43:18.112609','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7c21\\u4ecb\"]}}]',8,1),(13,'2023-10-11 06:47:55.767599','7','Feb - τ┤½τ╛àΦÿ¡',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Feb - \\u7d2b\\u7f85\\u862d\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Feb - \\u7d2b\\u7f85\\u862d\"}}]',8,1),(14,'2023-10-11 06:48:07.635688','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(15,'2023-10-11 06:53:06.495656','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Mar - \\u6c34\\u4ed9\\u82b1 \\u6df1\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Mar - \\u6c34\\u4ed9\\u82b1 \\u6df1\\u57f9\"}}]',8,1),(16,'2023-10-11 06:55:18.069445','9','Apr - Θê┤Φÿ¡ Σ╕¡σƒ╣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Apr - \\u9234\\u862d \\u4e2d\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Apr - \\u9234\\u862d \\u4e2d\\u57f9\"}}]',8,1),(17,'2023-10-11 06:58:57.931498','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Apr - \\u6afb\\u82b1 \\u6dfa\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Apr - \\u6afb\\u82b1 \\u6dfa\\u57f9\"}}]',8,1),(18,'2023-10-11 06:59:05.667698','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(19,'2023-10-11 07:57:59.220102','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[]',8,1),(20,'2023-10-11 07:58:48.808392','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(21,'2023-10-11 07:59:04.106343','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(22,'2023-10-11 07:59:08.963936','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(23,'2023-10-11 08:00:01.457903','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(24,'2023-10-11 08:02:56.623032','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(25,'2023-10-11 08:03:23.787397','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(26,'2023-10-11 08:12:52.221639','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(27,'2023-10-11 08:13:16.616540','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(28,'2023-10-11 08:15:36.622327','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(29,'2023-10-11 08:19:31.257323','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(30,'2023-10-11 08:19:53.404872','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(31,'2023-10-11 08:20:01.010282','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(32,'2023-10-11 08:20:04.302432','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[]',8,1),(33,'2023-10-11 08:20:08.235155','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[]',8,1),(34,'2023-10-11 08:20:15.751072','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(35,'2023-10-11 08:20:43.369240','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(36,'2023-10-11 08:22:42.237721','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(37,'2023-10-11 08:23:34.727284','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(38,'2023-10-11 08:25:05.728460','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(39,'2023-10-11 08:34:24.000171','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(40,'2023-10-11 08:36:31.796092','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(41,'2023-10-11 09:46:49.747379','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(42,'2023-10-11 09:55:30.689415','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(43,'2023-10-11 09:59:15.888958','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(44,'2023-10-11 10:02:02.182984','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(45,'2023-10-11 10:06:51.115219','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(46,'2023-10-11 10:07:00.782318','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(47,'2023-10-11 10:07:44.979305','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(48,'2023-10-11 10:07:50.395510','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[]',8,1),(49,'2023-10-11 10:12:05.928362','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(50,'2023-10-11 10:12:14.689788','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(51,'2023-10-11 10:12:37.960350','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(52,'2023-10-11 10:17:06.296107','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(53,'2023-10-11 10:17:25.775538','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(54,'2023-10-11 10:21:14.740214','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(55,'2023-10-11 10:29:21.925393','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(56,'2023-10-11 10:31:33.190276','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(57,'2023-10-11 10:31:41.412745','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(58,'2023-10-11 10:31:52.869442','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(59,'2023-10-11 11:12:30.580941','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(60,'2023-10-11 11:12:38.589287','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(61,'2023-10-11 11:12:46.586948','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(62,'2023-10-11 11:13:36.196240','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(63,'2023-10-11 11:13:41.079295','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(64,'2023-10-11 11:13:46.687685','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(65,'2023-10-11 11:13:52.055187','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(66,'2023-10-11 11:14:31.054725','3','Φè▒ & µ£ê',3,'',7,1),(67,'2023-10-11 11:14:31.058919','2','σÆûσòí',3,'',7,1),(68,'2023-10-11 11:15:48.878027','5','FLM',1,'[{\"added\": {}}]',7,1),(69,'2023-10-11 11:20:53.949503','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(70,'2023-10-11 11:21:24.209529','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(71,'2023-10-11 11:23:23.866675','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(72,'2023-10-11 11:23:36.002788','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(73,'2023-10-11 11:26:14.419719','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(74,'2023-10-11 11:26:49.547643','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(75,'2023-10-11 11:29:06.898963','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(76,'2023-10-11 11:29:13.483107','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(77,'2023-10-11 11:29:18.661148','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(78,'2023-10-11 11:29:24.314033','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(79,'2023-10-11 11:38:40.729433','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(80,'2023-10-11 11:39:08.536411','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(81,'2023-10-11 11:39:11.661229','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[]',8,1),(82,'2023-10-11 11:39:23.919415','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(83,'2023-10-11 11:39:30.368531','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(84,'2023-10-11 11:39:41.499593','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(85,'2023-10-11 11:39:48.988064','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[]',8,1),(86,'2023-10-11 11:40:14.062265','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[]',8,1),(87,'2023-10-11 11:43:28.618667','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[]',8,1),(88,'2023-10-11 11:43:34.418665','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(89,'2023-10-11 11:43:38.601187','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(90,'2023-10-11 11:43:41.766215','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(91,'2023-10-11 12:15:33.083148','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[]',8,1),(92,'2023-10-12 06:01:20.485305','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Jan - \\u5eb7\\u4e43\\u99a8 \\u4e2d\\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Jan - \\u5eb7\\u4e43\\u99a8 \\u4e2d\\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(93,'2023-10-12 06:01:27.407244','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Feb - \\u7d2b\\u7f85\\u862d \\u4e2d\\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Feb - \\u7d2b\\u7f85\\u862d \\u4e2d\\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(94,'2023-10-12 06:01:47.992389','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒σƒ╣',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Mar - \\u6c34\\u4ed9\\u82b1 \\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Mar - \\u6c34\\u4ed9\\u82b1 \\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(95,'2023-10-12 06:01:53.098248','9','May - Θê┤Φÿ¡ Σ╕¡σƒ╣',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"May - \\u9234\\u862d \\u4e2d\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"May - \\u9234\\u862d \\u4e2d\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(96,'2023-10-12 06:01:57.775297','10','Apr - µ½╗Φè▒ µ╖║σƒ╣',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Apr - \\u6afb\\u82b1 \\u6dfa\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Apr - \\u6afb\\u82b1 \\u6dfa\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(97,'2023-10-12 06:31:26.202148','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7522\\u54c1\\u72c0\\u614b\"]}}]',8,1),(98,'2023-10-12 06:31:34.549756','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7522\\u54c1\\u72c0\\u614b\"]}}]',8,1),(99,'2023-10-12 18:43:07.995932','6','CSA',1,'[{\"added\": {}}]',7,1),(100,'2023-10-12 19:06:39.370360','11','σôÑσÇ½µ»öΣ║₧  Columbia  Σ╕¡σƒ╣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u502b\\u6bd4\\u4e9e  Columbia  \\u4e2d\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u502b\\u6bd4\\u4e9e  Columbia  \\u4e2d\\u57f9\"}}]',8,1),(101,'2023-10-12 19:15:29.665815','12','σôÑµû»σñºΘ╗Äσèá Costa Rica  µ╖║σƒ╣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u65af\\u5927\\u9ece\\u52a0 Costa Rica  \\u6dfa\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u65af\\u5927\\u9ece\\u52a0 Costa Rica  \\u6dfa\\u57f9\"}}]',8,1),(102,'2023-10-12 19:17:09.392806','13','σ«ÅΘâ╜µïëµû» Honduras  Σ╕¡µ╖║σƒ╣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5b8f\\u90fd\\u62c9\\u65af Honduras  \\u4e2d\\u6dfa\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5b8f\\u90fd\\u62c9\\u65af Honduras  \\u4e2d\\u6dfa\\u57f9\"}}]',8,1),(103,'2023-10-12 19:19:19.673289','14','σ░╝σèáµïëτô£ Nicaragua  Σ╕¡µ╖║τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5c3c\\u52a0\\u62c9\\u74dc Nicaragua  \\u4e2d\\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5c3c\\u52a0\\u62c9\\u74dc Nicaragua  \\u4e2d\\u6dfa\\u7119\"}}]',8,1),(104,'2023-10-12 19:20:52.724108','15','σ╖┤µï┐Θª¼ Panama  Σ╕¡µ╖▒τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5df4\\u62ff\\u99ac Panama  \\u4e2d\\u6df1\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5df4\\u62ff\\u99ac Panama  \\u4e2d\\u6df1\\u7119\"}}]',8,1),(105,'2023-10-13 07:33:11.070260','4','Φè▒&µ£ê',3,'',7,1),(106,'2023-10-13 16:41:29.535024','7','BFLM',1,'[{\"added\": {}}]',7,1),(107,'2023-10-13 16:41:35.198621','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(108,'2023-10-13 16:41:42.378779','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(109,'2023-10-13 16:41:51.798231','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,1),(110,'2023-10-13 16:42:35.287415','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,1),(111,'2023-10-13 16:42:42.135467','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[]',8,1),(112,'2023-10-13 16:42:48.623696','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(113,'2023-10-13 16:43:04.306665','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(114,'2023-10-13 16:44:02.035052','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒σƒ╣',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(115,'2023-10-13 17:54:33.789999','16','Jun - τÄ½τæ░Φè▒  µ╖║τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jun - \\u73ab\\u7470\\u82b1  \\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jun - \\u73ab\\u7470\\u82b1  \\u6dfa\\u7119\"}}]',8,1),(116,'2023-10-13 17:55:03.658150','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(117,'2023-10-13 17:55:13.238539','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(118,'2023-10-13 17:55:20.598750','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(119,'2023-10-13 17:55:25.210139','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒τäÖ',2,'[]',8,1),(120,'2023-10-13 17:55:35.947276','9','May - Θê┤Φÿ¡ Σ╕¡τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(121,'2023-10-13 17:55:44.400285','10','Apr - µ½╗Φè▒ µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(122,'2023-10-13 17:55:50.437635','11','σôÑσÇ½µ»öΣ║₧  Columbia  Σ╕¡τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(123,'2023-10-13 17:55:55.958341','12','σôÑµû»σñºΘ╗Äσèá Costa Rica  µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(124,'2023-10-13 17:56:02.642945','13','σ«ÅΘâ╜µïëµû» Honduras  Σ╕¡µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(125,'2023-10-13 17:56:29.046322','16','Jun - τÄ½τæ░Φè▒  µ╖║τäÖ',2,'[]',8,1),(126,'2023-10-13 17:58:15.081689','17','Jul - Θú¢τçòΦìë  ΘüúτäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jul - \\u98db\\u71d5\\u8349  \\u9063\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jul - \\u98db\\u71d5\\u8349  \\u9063\\u7119\"}}]',8,1),(127,'2023-10-13 17:58:32.225944','6','Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒τäÖ',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(128,'2023-10-13 17:58:46.528540','7','Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒τäÖ',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(129,'2023-10-13 17:59:01.632085','8','Mar - µ░┤Σ╗ÖΦè▒ µ╖▒τäÖ',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(130,'2023-10-13 17:59:11.831368','10','Apr - µ½╗Φè▒ µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(131,'2023-10-13 17:59:19.000743','9','May - Θê┤Φÿ¡ Σ╕¡τäÖ',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(132,'2023-10-13 18:00:01.757536','17','Jul - Θú¢τçòΦìë  µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\", \"Image\"]}}]',8,1),(133,'2023-10-13 18:00:12.250738','16','Jun - τÄ½τæ░Φè▒  µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(134,'2023-10-13 18:01:31.826642','18','Aug - σèìΦÿ¡  Σ╕¡µ╖║τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Aug - \\u528d\\u862d  \\u4e2d\\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Aug - \\u528d\\u862d  \\u4e2d\\u6dfa\\u7119\"}}]',8,1),(135,'2023-10-13 18:02:29.090804','19','Sep - τ┤½ΦïæΦè▒  Σ╕¡τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Sep - \\u7d2b\\u82d1\\u82b1  \\u4e2d\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Sep - \\u7d2b\\u82d1\\u82b1  \\u4e2d\\u7119\"}}]',8,1),(136,'2023-10-13 18:04:20.473173','20','Oct - Θçæτ¢₧Φè▒  Σ╕¡τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Oct - \\u91d1\\u76de\\u82b1  \\u4e2d\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Oct - \\u91d1\\u76de\\u82b1  \\u4e2d\\u7119\"}}]',8,1),(137,'2023-10-13 18:07:32.396200','21','Nov - ΦÅèΦè▒  µ╖║τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Nov - \\u83ca\\u82b1  \\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Nov - \\u83ca\\u82b1  \\u6dfa\\u7119\"}}]',8,1),(138,'2023-10-13 18:08:05.978648','20','Oct - Θçæτ¢₧Φè▒  Σ╕¡τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u63cf\\u8ff0\"]}}]',8,1),(139,'2023-10-13 18:08:22.933202','19','Sep - τ┤½ΦïæΦè▒  Σ╕¡τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u63cf\\u8ff0\"]}}]',8,1),(140,'2023-10-13 18:08:58.087644','21','Nov - ΦÅèΦè▒  µ╖║τäÖ',2,'[]',8,1),(141,'2023-10-13 18:10:17.911215','22','Dec - Θó¿Σ┐íσ¡É',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Dec - \\u98a8\\u4fe1\\u5b50\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Dec - \\u98a8\\u4fe1\\u5b50\"}}]',8,1),(142,'2023-10-13 18:10:31.953990','7','BFLM',3,'',7,1),(143,'2023-10-13 18:19:06.623195','8','AFR',1,'[{\"added\": {}}]',7,1),(144,'2023-10-13 18:20:13.858165','15','σ╖┤µï┐Θª¼  Σ╕¡µ╖▒τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(145,'2023-10-13 18:20:30.994846','14','σ░╝σèáµïëτô£  Σ╕¡µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(146,'2023-10-13 18:20:37.014443','13','σ«ÅΘâ╜µïëµû»  Σ╕¡µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(147,'2023-10-13 18:20:42.133149','12','σôÑµû»σñºΘ╗Äσèá  µ╖║τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(148,'2023-10-13 18:20:47.936396','11','σôÑσÇ½µ»öΣ║₧  Σ╕¡τäÖ',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(149,'2023-10-13 18:22:16.513047','23','Φé»Σ║₧  Σ╕¡µ╖║τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u80af\\u4e9e  \\u4e2d\\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u80af\\u4e9e  \\u4e2d\\u6dfa\\u7119\"}}]',8,1),(150,'2023-10-13 18:23:12.905949','24','τ¢ºσ«ëΘüö  Σ╕¡µ╖▒τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u76e7\\u5b89\\u9054  \\u4e2d\\u6df1\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u76e7\\u5b89\\u9054  \\u4e2d\\u6df1\\u7119\"}}]',8,1),(151,'2023-10-13 18:31:07.037891','25','σ¥ªσ░Üσ░╝Σ║₧  Σ╕¡µ╖▒σƒ╣',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5766\\u5c1a\\u5c3c\\u4e9e  \\u4e2d\\u6df1\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5766\\u5c1a\\u5c3c\\u4e9e  \\u4e2d\\u6df1\\u57f9\"}}]',8,1),(152,'2023-10-13 18:31:55.160004','26','Φíúτ┤óµ»öΣ║₧  Σ╕¡µ╖║τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u8863\\u7d22\\u6bd4\\u4e9e  \\u4e2d\\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u8863\\u7d22\\u6bd4\\u4e9e  \\u4e2d\\u6dfa\\u7119\"}}]',8,1),(153,'2023-10-13 18:33:29.562421','27','Φ╛¢σ╖┤σ¿ü  Σ╕¡µ╖▒τäÖ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u8f9b\\u5df4\\u5a01  \\u4e2d\\u6df1\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u8f9b\\u5df4\\u5a01  \\u4e2d\\u6df1\\u7119\"}}]',8,1),(154,'2023-10-13 18:42:41.132359','9','POV',1,'[{\"added\": {}}]',7,1),(155,'2023-10-13 18:43:15.048389','28','µÜùΦ¬┐τ¢à Subdued Brew',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6697\\u8abf\\u76c5 Subdued Brew\"}}]',8,1),(156,'2023-10-13 18:44:49.498405','29','µ╝åσó¿µ¥» Inkwell Mug',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6f06\\u58a8\\u676f Inkwell Mug\"}}]',8,1),(157,'2023-10-13 18:45:29.253391','30','Θ╗æσ╣òµ¥» Noir Screen',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u9ed1\\u5e55\\u676f Noir Screen\"}}]',8,1),(158,'2023-10-13 18:46:21.208396','31','Θ╗æΘÖ╢µ¥» Ebony Ceramic',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u9ed1\\u9676\\u676f Ebony Ceramic\"}}]',8,1),(159,'2023-10-13 18:46:28.219640','29','µ╝åσó¿µ¥» Inkwell',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(160,'2023-10-13 18:50:32.007351','10','SNK',1,'[{\"added\": {}}]',7,1),(161,'2023-10-13 18:50:58.300133','32','σ╣╜σó¿ Inkwell Elegance',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5e7d\\u58a8 Inkwell Elegance\"}}]',8,1),(162,'2023-10-13 18:51:38.583909','33','µÜùΘªÑ Subtle Aroma Infuser',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6697\\u99a5 Subtle Aroma Infuser\"}}]',8,1),(163,'2023-10-13 18:52:12.343577','34','τ┐áτàÖ Emerald Mist Brewer',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u7fe0\\u7159 Emerald Mist Brewer\"}}]',8,1),(164,'2023-10-13 18:53:01.093457','35','Φè▒σ╜▒ Blossom Shadow',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u82b1\\u5f71 Blossom Shadow\"}}]',8,1),(165,'2023-10-13 18:58:31.436672','11','GRI',1,'[{\"added\": {}}]',7,1),(166,'2023-10-13 18:58:59.621899','36','σîá Artisan',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5320 Artisan\"}}]',8,1),(167,'2023-10-13 18:59:42.795015','37','µéà Harmony',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6085 Harmony\"}}]',8,1),(168,'2023-10-13 19:00:21.347422','38','µùï Spiral',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u65cb Spiral\"}}]',8,1),(169,'2023-10-13 19:00:56.993963','39','τ┤ï Pattern',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u7d0b Pattern\"}}]',8,1),(170,'2023-10-13 19:01:34.878109','40','Θª¿ Serene',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u99a8 Serene\"}}]',8,1),(171,'2023-10-13 19:07:44.686038','12','CGB',1,'[{\"added\": {}}]',7,1),(172,'2023-10-13 19:08:18.379417','41','σôÑσÇ½µ»öΣ║₧τª«τ¢Æ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u502b\\u6bd4\\u4e9e\\u79ae\\u76d2\"}}]',8,1),(173,'2023-10-13 19:08:56.705187','42','µ½╗Φè▒τª«τ¢Æ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6afb\\u82b1\\u79ae\\u76d2\"}}]',8,1),(174,'2023-10-13 19:09:30.398157','43','µ░┤Σ╗ÖΦè▒τª«τ¢Æ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6c34\\u4ed9\\u82b1\\u79ae\\u76d2\"}}]',8,1),(175,'2023-10-13 19:09:59.493850','44','τ┤½ΦïæΦè▒τª«τ¢Æ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u7d2b\\u82d1\\u82b1\\u79ae\\u76d2\"}}]',8,1),(176,'2023-10-13 19:10:39.335536','45','ΦÅèΦè▒τª«τ¢Æ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u83ca\\u82b1\\u79ae\\u76d2\"}}]',8,1),(177,'2023-10-13 19:11:37.463989','46','ΦÅèΦè▒τª«τ¢Æ ΘÖÉΘçÅ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u83ca\\u82b1\\u79ae\\u76d2 \\u9650\\u91cf\"}}]',8,1),(178,'2023-10-13 19:15:59.446488','13','EDI',1,'[{\"added\": {}}]',7,1),(179,'2023-10-13 19:16:35.833068','47','σ║╖Σ╣âΘª¿ τë╣σêÑτëê',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5eb7\\u4e43\\u99a8 \\u7279\\u5225\\u7248\"}}]',8,1),(180,'2023-10-13 19:17:08.027115','48','τ┤½τ╛àΦÿ¡ τë╣σêÑτëê',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u7d2b\\u7f85\\u862d \\u7279\\u5225\\u7248\"}}]',8,1),(181,'2023-10-14 10:28:16.761470','5','FLM',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4e2d\\u6587\\u540d\"]}}]',7,1),(182,'2023-10-14 10:32:10.691437','5','FLM',2,'[]',7,1),(183,'2023-10-14 10:37:29.601336','6','CSA',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4e2d\\u6587\\u540d\"]}}]',7,1),(184,'2023-10-14 10:37:38.474519','8','AFR',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4e2d\\u6587\\u540d\"]}}]',7,1),(185,'2023-10-14 10:38:02.449172','9','POV',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4e2d\\u6587\\u540d\"]}}]',7,1),(186,'2023-10-14 10:38:08.573856','10','SNK',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4e2d\\u6587\\u540d\"]}}]',7,1),(187,'2023-10-14 10:38:17.481287','11','GRI',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4e2d\\u6587\\u540d\"]}}]',7,1),(188,'2023-10-14 10:38:26.621152','12','CGB',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4e2d\\u6587\\u540d\"]}}]',7,1),(189,'2023-10-14 10:38:33.300144','13','EDI',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4e2d\\u6587\\u540d\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'Home','shopingcart'),(7,'product','category'),(8,'product','product'),(9,'product','productvariant'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-08 18:09:06.898996'),(2,'auth','0001_initial','2023-10-08 18:09:07.269055'),(3,'admin','0001_initial','2023-10-08 18:09:07.384039'),(4,'admin','0002_logentry_remove_auto_add','2023-10-08 18:09:07.389693'),(5,'admin','0003_logentry_add_action_flag_choices','2023-10-08 18:09:07.396761'),(6,'contenttypes','0002_remove_content_type_name','2023-10-08 18:09:07.469188'),(7,'auth','0002_alter_permission_name_max_length','2023-10-08 18:09:07.510962'),(8,'auth','0003_alter_user_email_max_length','2023-10-08 18:09:07.559011'),(9,'auth','0004_alter_user_username_opts','2023-10-08 18:09:07.574532'),(10,'auth','0005_alter_user_last_login_null','2023-10-08 18:09:07.648775'),(11,'auth','0006_require_contenttypes_0002','2023-10-08 18:09:07.669913'),(12,'auth','0007_alter_validators_add_error_messages','2023-10-08 18:09:07.669913'),(13,'auth','0008_alter_user_username_max_length','2023-10-08 18:09:07.717880'),(14,'auth','0009_alter_user_last_name_max_length','2023-10-08 18:09:07.758927'),(15,'auth','0010_alter_group_name_max_length','2023-10-08 18:09:07.798973'),(16,'auth','0011_update_proxy_permissions','2023-10-08 18:09:07.812538'),(17,'auth','0012_alter_user_first_name_max_length','2023-10-08 18:09:07.876101'),(18,'product','0001_initial','2023-10-08 18:09:08.118914'),(19,'sessions','0001_initial','2023-10-08 18:09:08.149035'),(20,'product','0002_alter_product_code_alter_product_product_desc_and_more','2023-10-08 18:18:07.858983'),(21,'product','0003_alter_product_code','2023-10-08 18:19:36.849315'),(22,'product','0004_alter_productvariant_options_and_more','2023-10-08 18:31:53.076019'),(23,'product','0005_alter_category_name_alter_productvariant_color','2023-10-08 18:38:01.438640'),(24,'product','0006_alter_product_code','2023-10-10 05:20:33.581202'),(25,'product','0007_alter_productvariant_size','2023-10-11 06:38:31.653856'),(26,'product','0008_alter_product_code','2023-10-11 06:47:31.083521'),(27,'product','0009_alter_product_code','2023-10-11 10:12:23.269659'),(28,'product','0010_alter_product_code','2023-10-11 11:41:38.676616'),(29,'product','0011_alter_product_code','2023-10-11 11:41:38.739517'),(30,'product','0012_alter_product_options_product_status_and_more','2023-10-11 12:15:05.348612'),(31,'product','0013_alter_product_options_alter_product_status','2023-10-12 07:27:07.620998'),(32,'product','0014_remove_productvariant_color_and_more','2023-10-12 18:26:51.759993'),(33,'Home','0001_initial','2023-10-12 18:26:51.860442'),(34,'product','0015_alter_product_code','2023-10-12 19:06:33.777454'),(35,'product','0016_category_category_name','2023-10-14 10:27:52.570712'),(36,'product','0017_alter_product_category','2023-10-14 10:42:00.413540'),(37,'product','0018_alter_category_name','2023-10-14 10:49:12.847051');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1rdcgzaz18l0f99ezx506mry58rdkm3w','.eJxlzs0OgjAMB_B36Zks-8Ixjt59BtJ9CWpGhHEwhHd3GCISL80__bVNZ2hwSm0zjX5oOgc1MCh-ewbt3ccV3A3jtSe2j2noDFlHyKYjufTOP87b7OFAi2Obt01g8sQrZ4R2OgThSupLIZVEyowJ0md3WllELZW21BgeOHdcBU4Z02U-anFIUM_Aq7V-ns2xgOeEMXXpBTVbCuBqV_Wvelf9p4J-NcejLssbKjhciQ:1qtmEJ:-yjyJq8Si4BfRibc9c-0QHaJHxTTwn-DUqHndA_vBTY','2023-10-21 09:55:43.857102'),('3lr2dd77eognhobqlcrz0yp67egnuysh','eyJjYXJ0Ijp7fX0:1qsqOF:G5DZviQg1fLsJA15CSCFTJlBP-NPWryQfLk5DvMYxRA','2023-10-18 20:10:07.036619'),('ppeiiomnm8z29nlskao85uznlji7mi5c','.eJxVjEEOwiAQRe_C2hCgII5L9z0DmWFAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnEVWpx-N8L4THUH_MB6bzK2uswTyV2RB-1ybJxet8P9OyjYy1ZT1vZsLkwDMOQ8sFPJDdZbVJoo27RxBh8RwXqIishkY9j4bJTW4MTnC_NwN_s:1qpYGk:w6I0G9JdYBbAX5Kjzu0NG6q7wArSUqLHlNOaiOIHy9o','2023-10-22 18:12:46.272165'),('qesrhk9nn5laey2yo8kp0lajg168a8x3','.eJxVjMEOwiAQBf-FsyFAQaRH735Ds8uCVA0kQE9N_9026UGvb-bNyiZYepqWFuo0ExuZZJffDcG_Qz4AvSA_C_cl9zojPxR-0sYfhcLnfrp_gQQt7W-MUl_VjXBw5GIcyIhgBm01CIkYddg5OesBnLbOC0QVlSJloxJSOrNHPdTOxnXbvjIXO0c:1qseNW:dlXYZWIapdh4QlNdFrSNu-BSK7I2uYT1yJk1f6OsLog','2023-10-18 07:20:34.366710');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_shopingcart`
--

DROP TABLE IF EXISTS `home_shopingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_shopingcart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Home_shopingcart_product_id_53578317_fk_product_product_id` (`product_id`),
  CONSTRAINT `Home_shopingcart_product_id_53578317_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_shopingcart`
--

LOCK TABLES `home_shopingcart` WRITE;
/*!40000 ALTER TABLE `home_shopingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_shopingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `category_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (5,'FLM','Φè▒&µ£ê'),(6,'CSA','Σ╕¡σìùτ╛Äµ┤▓'),(8,'AFR','Θ¥₧µ┤▓'),(9,'POV','µëïµ▓ûµ┐╛µ¥»'),(10,'SNK','µëïµ▓ûσú║'),(11,'GRI','τú¿Φ▒åσÖ¿'),(12,'CGB','τª«τ¢Æ'),(13,'EDI','τë╣σêÑτëê');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `product_inst` varchar(30) NOT NULL,
  `product_desc` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `date_of_create` date NOT NULL,
  `date_of_update` date NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_product_category_id_0c725779_fk_product_category_id` (`category_id`),
  CONSTRAINT `product_product_category_id_0c725779_fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (6,'Jan - σ║╖Σ╣âΘª¿ Σ╕¡µ╖▒τäÖ','σ║╖Σ╣âΘª¿Σ╗úΦí¿ΦæùπÇîµä¢πÇìπÇüπÇîσ╕îµ£¢πÇìπÇüπÇîσ╣╕ΘüïπÇìσÆîπÇîτ┤öµ╜öπÇìπÇé','σ║╖Σ╣âΘª¿Θó¿µá╝τÜäσÆûσòíΣ╗Ñσà╢τì¿τë╣τÜäΦè▒ΘªÖΦü₧σÉìπÇé µ»ÅΣ╕Çµ¥»Θâ╜µòúτÖ╝σç║σ║╖Σ╣âΘª¿Φè▒µ£╡τÜäµƒöσÆîµ╕àΘªÖ∩╝îσ╜╖σ╜┐τ╜«Φ║½µû╝Φè▒σ£ÆΣ╣ïΣ╕¡πÇé ΘÇÖΣ╗ñΣ║║ΘÖ╢ΘåëτÜäΘªÖµ░úΣ╜┐Σ║║σ┐âµâàµäëµéà∩╝îτé║µé¿τÜäµùÑσ╕╕τöƒµ┤╗σó₧µ╖╗Σ║åΣ╕Çµè╣µ╡¬µ╝½πÇé\r\n\r\nσ║╖Σ╣âΘª¿σÆûσòíτÜäΦë▓µ╛ñσªéσÉîσ║╖Σ╣âΘª¿Φè▒τôúΣ╕ÇΦê¼∩╝îµƒöσÆîτÜäτ▓ëτ┤àΦë▓µêûµ╖▒µ╖║Σ╕ìΣ╕ÇτÜäτÄ½τæ░Φë▓∩╝îσààµ╗┐µ║½σÆîσÆîµ║½Θª¿τÜäµäƒΦª║πÇé σ«âσ£¿µ¥»Σ╕¡µ│óµ╡¬Φê¼µÖâσïò∩╝îσªéσÉîσ║╖Σ╣âΘª¿Φè▒τôúσ£¿σ╛«Θó¿Σ╕¡µÉûµ¢│πÇé\r\n\r\nσÅúµäƒΣ╕è∩╝îσ║╖Σ╣âΘª¿σÆûσòíτÜäΘåçσÄÜσÆîΦè▒ΘªÖσ«îτ╛ÄΦ₧ìσÉê∩╝îΣ╗ñΣ║║ΘÖ╢ΘåëπÇé µ»ÅΣ╕ÇσÅúΘâ╜σààµ╗┐Σ║åσ║╖Σ╣âΘª¿τÜäµ║½µƒö∩╝îτé║µé¿σ╕╢Σ╛åµ║½Θª¿τÜäΘ½öΘ⌐ùπÇéτé║µé¿σ╕╢Σ╛åΣ╗ñΣ║║µäëµéàτÜäσÆûσòíµÖéσàëπÇé τäíΦ½ûµÿ»Φç¬σ╖▒σôüσæ│∩╝îµêûµÿ»ΦêçΦª¬µ£ïσÑ╜σÅïσêåΣ║½∩╝îσ«âΘâ╜Φâ╜Φ«ôµé¿µäƒσÅùσê░µ╡¬µ╝½Φêçµ║½µâàτÜäΦ₧ìσÉêπÇé ΘÇÖµÿ»Σ╕Çµ¼╛σààµ╗┐µä¢τÜäσÆûσòí∩╝îσ╕╢Σ╛åµ║½Θª¿τÜäΣ║½σÅùπÇé','product_image/Σ╕Çµ£êσ║╖Σ╣âΘª¿_WX5aTbw.png',1200,'FLM - 0006','2023-10-11','2023-10-14',5,'o'),(7,'Feb - τ┤½τ╛àΦÿ¡ Σ╕¡µ╖▒τäÖ','τ┤½τ╛àΦÿ¡τÜäΦè▒Φ¬₧τé║πÇîµ░╕µüåτÜäΘ¡àσè¢πÇìπÇüΦ▒íσ╛╡πÇîµÖ║µàºπÇìπÇüπÇîΦ¼ÖΘü£πÇìπÇé','τ┤½τ╛àΦÿ¡Θó¿µá╝τÜäσÆûσòíΣ╗Ñσà╢τì¿τë╣τÜäΦè▒ΘªÖΦÇîΦü₧σÉìπÇé µ»ÅΣ╕Çµ¥»Θâ╜µ┤ïµ║óΦæùτ┤½τ╛àΦÿ¡Φè▒τôúτÜäΦè¼Φè│∩╝îσ╜╖σ╜┐Φ╡░ΘÇ▓Σ║åΦè▒σ£ÆτÜäΣ╗ÖσóâπÇé ΘÇÖτ¿«τì¿τë╣τÜäΘªÖµ░úµÿ»σªéµ¡ñτÜäτÑ₧τºÿσÆîΣ╗ñΣ║║ΘÖ╢Θåë∩╝îΦ«ôΣ║║µäƒΦª║Φç¬σ╖▒τ╜«Φ║½µû╝Σ╕ÇσÇïΦè▒µ£╡τÜäµ╡╖µ┤ïπÇé\r\n\r\nτ┤½τ╛àΦÿ¡σÆûσòíτÜäΦë▓µ╛ñ∩╝îσ╕╕σ╕╕σæêτÅ╛σç║µ╖▒ΘéâτÜäτ┤½τ╛àΦÿ¡τ┤½Φë▓∩╝îσààµ╗┐Σ║åτÑ₧τºÿµäƒπÇé σ«âτÜäµ╖▒µ▓ëΦë▓σ╜⌐σ£¿µ¥»Σ╕¡τ┐╗µ╗╛∩╝îσ╜╖σ╜┐µÿ»Σ╕Çτ╕╖τ┤½τ╛àΦÿ¡τÜäΦè▒ΘªÖΦó½µ│¿σàÑσà╢Σ╕¡πÇé\r\n\r\nσÅúµäƒΣ╕è∩╝îτ┤½τ╛àΦÿ¡σÆûσòíσà╝σà╖σÆûσòíτÜäµ┐âΘ¼▒σÆîτ┤½τ╛àΦÿ¡τÜäΦè▒ΘªÖ∩╝îµ»ÅΣ╕ÇσÅúΘâ╜σªéσÉîΣ╕Çµ¼íτÑ₧τºÿΣ╣ïµùà∩╝îσààµ╗┐Σ║åΣ╗ñΣ║║ΘÖ╢ΘåëτÜäσÅúµäƒπÇéµÿ»Σ╕Çµ¼╛σààµ╗┐τÑ₧τºÿµäƒσÆîσ¼îµƒöΣ╣ïτ╛ÄτÜäσÆûσòíπÇé σ«âΘü⌐σÉêτì¿Φç¬Σ║½τö¿∩╝îΣ╣ƒΘü⌐σÉêΦêçΦª¬µ£ïσÑ╜σÅïΣ╕ÇσÉîσôüσæ│πÇé ΘÇÖµÿ»Σ╕Çµ¼╛σààµ╗┐τÑ₧τºÿΘ¡àσè¢τÜäσÆûσòí∩╝îτé║µé¿σ╕╢Σ╛åτ╡òσªÖτÜäΣ║½σÅùπÇé','product_image/Σ║îµ£êτ┤½τ╛àΦÿ¡_NE3ZYK8.png',1200,'FLM - 0007','2023-10-11','2023-10-14',5,'o'),(8,'Mar - µ░┤Σ╗ÖΦè▒ µ╖▒τäÖ','Θ╗âΦë▓µ░┤Σ╗ÖΦè▒Σ╗úΦí¿πÇîΘçìτöƒπÇìπÇüπÇîσ╣╕ΘüïπÇìπÇüπÇîτ╣üµª«πÇìσÆîπÇîσÅïΦ¬╝πÇìπÇé','µ░┤Σ╗ÖΦè▒σÆûσòíΣ╗Ñσà╢µ╕àµû░Φè¼Φè│ΦÇîΦü₧σÉìπÇé µ»ÅΣ╕Çµ¥»Θâ╜σ╕╢Φæùµ░┤Σ╗ÖΦè▒τôúτÜäµ╖íΘ¢àΘªÖµ░ú∩╝îσ╜╖σ╜┐µ╝½µ¡Ñσ£¿µÿÑµùÑΦè▒σ£ÆπÇé ΘÇÖτ¿«τì¿τë╣τÜäΦè▒ΘªÖµÿ»σªéµ¡ñτÜäµ╕àµû░σ«£Σ║║∩╝îΦ«ôΣ║║µäƒΦª║Φç¬σ╖▒µ▓Éµ╡┤σ£¿Φè▒µ╡╖Σ╣ïΣ╕¡πÇé\r\n\r\nµ░┤Σ╗ÖΦè▒σÆûσòíτÜäΘíÅΦë▓Σ╣ƒσààµ╗┐Σ║åΦç¬τä╢Σ╣ïτ╛Ä∩╝îσ«âσ╕╕σ╕╕σæêτÅ╛σç║µ╖íµ╖íτÜäµ░┤Σ╗ÖΦè▒Θ╗â∩╝îσ╜╖σ╜┐µÿ»Σ╕Çτ╕╖µÖ¿µ¢ªΘÇÅΘüÄΦè▒τôúτüæσ£¿µ¥»Σ╕¡πÇéµ░┤Σ╗ÖΦè▒σÆûσòíσ╕╢µ£ëσÆûσòíτÜäµ┐âΘ¼▒σÆîµ░┤Σ╗ÖΦè▒τÜäµ╕àΘ¢à∩╝îµ»ÅΣ╕ÇσÅúΘâ╜σªéσÉîΣ╕Çµ¼íΦ╝òτ¢êτÜäΦè▒Φ¬₧∩╝îσààµ╗┐Σ║åΣ╗ñΣ║║ΘÖ╢ΘåëτÜäσÅúµäƒπÇé\r\n\r\nµ░┤Σ╗ÖΦè▒Θó¿µá╝τÜäσÆûσòíτöóσôü∩╝îµÿ»Σ╕Çµ¼╛σààµ╗┐µ╕àµû░ΦêçΦç¬τä╢Σ╣ïτ╛ÄτÜäσÆûσòíπÇé σ«âΘü⌐σÉêσ£¿µ╕àµÖ¿Σ║½τö¿∩╝îΣ╣ƒΘü⌐σÉêσ£¿σñÅµùÑσìêσ╛îΦêçσÑ╜σÅïτ¢╕ΦüÜπÇé ΘÇÖµÿ»Σ╕Çµ¼╛σªéσÉîµ░┤Σ╗ÖΦè▒Φê¼τÜäσÆûσòí∩╝îτé║µé¿σ╕╢Σ╛åµ╕àµû░σ«£Σ║║τÜäΣ║½σÅùπÇé','product_image/Σ╕ëµ£êµ░┤Σ╗ÖΦè▒_V9QGivj.png',1200,'FLM - 0008','2023-10-11','2023-10-14',5,'o'),(9,'May - Θê┤Φÿ¡ Σ╕¡τäÖ','µ║½µƒöτê╛Θ¢àτÜäσ╜óΦ▒íΦ╖ƒΘ½ÿΘ¢àτ┤öµ╜öτÜäΘê┤Φÿ¡σÆîτÖ╛σÉêµÑ╡τé║τ¢╕ΦÑ»πÇé','Θê┤Φÿ¡Θó¿µá╝τÜäσÆûσòíτöóσôü∩╝îσªéσÉîΘéúµ╜öτÖ╜τÜäΘê┤Φÿ¡Φè▒∩╝îτ╡ªΣ║║Σ╕Çτ¿«µ╕àµû░ΦÇîτ┤öµ╖¿τÜäµäƒΦª║∩╝îµÿ»Σ╕Çµ¥»τ£ƒµ¡úτÜäΦè│ΘªÖΣ╣ïΘü╕πÇé\r\n\r\nΘê┤Φÿ¡σÆûσòíµòúτÖ╝σç║µƒöσÆîτÜäΦè▒ΘªÖ∩╝îµ╖╖σÉêΦæùσÆûσòíτÜäµ┐âΘ¼▒∩╝îΦ«ôΣ║║σ╜╖σ╜┐τ╜«Φ║½µû╝τ¢¢ΘûïτÜäΘê┤Φÿ¡Φè▒σÅóΣ╣ïΘûôπÇé ΘÇÖµ¼╛µ╕àµû░τÜäΘªÖµ░úΦ«ôµé¿µäƒσÅùσê░σñºΦç¬τä╢τÜäσ»ºΘ¥£σÆîΦè▒σ£ÆτÜäσ«£Σ║║πÇé\r\n\r\nΦë▓σ╜⌐Σ╕è∩╝îΘê┤Φÿ¡σÆûσòíσæêτÅ╛σç║σªéσÉîΘê┤Φÿ¡Φè▒τôúΣ╕Çµ¿úτÜäµ╜öτÖ╜Φë▓Φ¬┐∩╝îΣ╗ñΣ║║Σ╕ÇΦªïΘì╛µâàπÇé ΘÇÖτ¿«Φë▓σ╜⌐Σ╗úΦí¿τ┤öµ╖¿σÆîµ╕àµû░∩╝îτ╡ªΣ║║Σ╕Çτ¿«Φª¬Φ┐æσñºΦç¬τä╢τÜäµäƒσÅùπÇéΘê┤Φÿ¡σÆûσòíσà╝σà╖σÆûσòíτÜäµ┐âΘ¼▒σÆîΘê┤Φÿ¡τÜäµ╕àµû░∩╝îµ»ÅΣ╕ÇσÅúΘâ╜σâÅµÿ»µ╝½µ¡Ñσ£¿Φè▒σ£ÆΣ╕¡∩╝îσààµ╗┐σ»ºΘ¥£σÆîµäëµéàπÇé\r\n\r\nΘü⌐σÉêσ£¿σ»ºΘ¥£τÜäΣ╕ïσìêµêûΦêçµ£ïσÅïσêåΣ║½µÖéσàëπÇé σ«âσ░çσ╕╢τ╡ªµé¿σ«¢σªéτ╜«Φ║½µû╝Φè▒σ£ÆΣ╕¡τÜäµäëµéàµäƒσÅù∩╝îτé║µé¿τÜäσÆûσòíµÖéσàëσó₧µ╖╗Σ╕Çµè╣τ┤öµ╖¿Φêçµ╕àµû░πÇé','product_image/Σ║öµ£êΘê┤Φÿ¡_zDuIFFc.png',1200,'FLM - 0009','2023-10-11','2023-10-14',5,'o'),(10,'Apr - µ½╗Φè▒ µ╖║τäÖ','µ┤╗Φæùσ░▒ΦªüσâÅµ½╗Φè▒Σ╕Çµ¿úτçªτê¢∩╝îσì│Σ╜┐µÿ»µ¡╗∩╝îΣ╣ƒµçëΦ⌐▓µ₧£µû╖σ£░Θ¢óσÄ╗πÇé','µ½╗Φè▒σÆûσòíΣ╗Ñσà╢Φè│ΘªÖΦÇîΦü₧σÉìπÇé µ»ÅΣ╕Çµ¥»Θâ╜µòúτÖ╝Φæùµ╖íµ╖íτÜäµ½╗Φè▒ΘªÖµ░ú∩╝îσªéσÉîµ½╗Φè▒µ¿╣Σ╕ïτÜäΦ╝òµƒöΘó¿σÉ╣µïéπÇé ΘÇÖµ¼╛τì¿τë╣τÜäΦè▒ΘªÖτ╡ªΣ║║Σ╕Çτ¿«µ║½Θª¿σÆîµ╡¬µ╝½τÜäµäƒΦª║∩╝îσ╜╖σ╜┐τ╜«Φ║½µû╝µ½╗Φè▒σñºΘüôΣ╣ïΘûôπÇé\r\n\r\nµ½╗Φè▒σÆûσòíτÜäΘíÅΦë▓Σ╣ƒΣ╗ñΣ║║ΘÖ╢Θåë∩╝îΘÇÜσ╕╕σæêτÅ╛σç║τ▓ëσ½⌐τÜäµ½╗Φè▒ΘíÅΦë▓∩╝îσªéσÉîΦè▒τôúΣ╕ÇΦê¼µƒöσÆîπÇé ΘÇÖσÇïµ║½µÜûτÜäΦë▓Φ¬┐Φ«ôΣ║║µäƒσê░µäëµéà∩╝îσ╜╖σ╜┐σ£¿µÿÑσñ⌐τÜäσìêσ╛îσ╛£σ╛ëπÇé\r\n\r\nµ½╗Φè▒σÆûσòíµ£ëΦæùσÆûσòíτÜäµ┐âΘ¼▒σÆîµ½╗Φè▒τÜäµ║½µƒö∩╝îµ»ÅΣ╕ÇσÅúΘâ╜σâÅµÿ»Σ╕Çµ¼íτ╛ÄΘ║ùτÜäΘééΘÇà∩╝îσààµ╗┐Σ║åσñóσ╣╗σÆîσä¬Θ¢àπÇé\r\n\r\nµÿ»Σ╕Çµ¼╛σààµ╗┐µ╡¬µ╝½σÆîσñóσ╣╗τÜäσÆûσòíπÇé σ«âΘü⌐σÉêσ£¿Φêçµä¢Σ║║σà▒σ║ªµ╡¬µ╝½µÖéσàë∩╝îΣ╣ƒΘü⌐σÉêσ£¿σ░ïµë╛Θ¥êµäƒτÜäµÖéσÇÖπÇé ΘÇÖµÿ»Σ╕Çµ¼╛σªéσÉîτ╢╗µö╛τÜäµ½╗Φè▒Φê¼τÜäσÆûσòí∩╝îτé║µé¿σ╕╢Σ╛åσààµ╗┐σä¬Θ¢àΦêçσ╣╕τªÅτÜäΣ║½σÅùπÇé','product_image/σ¢¢µ£êµ½╗Φè▒_MXAhK8K.png',1200,'FLM - 0010','2023-10-11','2023-10-14',5,'o'),(11,'σôÑσÇ½µ»öΣ║₧  Σ╕¡τäÖ','σôÑσÇ½µ»öΣ║₧∩╝îµ║ÉΦç¬τå▒µâàτÜäΣ╕¡σìùτ╛Äµ┤▓∩╝îΣ╕¡τâÿτäÖ∩╝îσ╕╢Σ╛åτ╢┐σ»åΘó¿σæ│τÜäσÆûσòíΘÑùσ«┤','σôÑσÇ½µ»öΣ║₧∩╝îΘÇÖτëçΘó¿µÖ»σªéτò½τÜäΣ╕¡σìùτ╛Äµ┤▓Σ╣ïτÅìσ»╢∩╝îΣ╗Ñσà╢σìôΦ╢èτÜäσÆûσòíΦ▒åΦÇîΦç¬Φ▒¬πÇéµêæσÇæτÜäΣ╕¡τ¡ëτâÿτäÖσæêτÅ╛σç║σñÜσ▒ñµ¼íτÜäΘó¿σæ│∩╝îµ╖▒σÅùσÆûσòíµä¢σÑ╜ΦÇàσÇæτÜäσû£µä¢πÇéσôÑσÇ½µ»öΣ║₧τÜäσÆûσòíΦ₧ìσÉêΣ║åτò╢σ£░σñºσ£░τÜäΘ««µÿÄτë╣Φë▓∩╝îµòúτÖ╝σç║µƒöσÆîτÜäΘà╕σ║ª∩╝îΣ╝┤ΘÜ¿Φæùσáàµ₧£πÇüσ╖ºσàïσè¢σÆîµ░┤µ₧£τÜäΘªÖµ░ú∩╝îτé║µé¿σ╕╢Σ╛åΣ╕Çσá┤τ╛Äσæ│Σ╣ïµùàπÇéσ£¿µ»ÅΣ╕ÇσÅúΣ╕¡∩╝îµé¿Θâ╜Φâ╜µäƒσÅùσê░ΘÇÖτëçσ£ƒσ£░τÜäτå▒µâàσÆîµ┤╗σè¢∩╝îσ╜╖σ╜┐µ╝½Θüèσ£¿σôÑσÇ½µ»öΣ║₧τÜäσ▒▒Φ░╖σÆîµú«µ₧ùΣ╣ïΣ╕¡πÇéσôÑσÇ½µ»öΣ║₧σÆûσòí∩╝îµÿ»ΘÇÖτëçτ╛ÄΘ║ùσ£ƒσ£░τÜäτ£ƒσ»ªσ»½τàº∩╝îµ»ÅΣ╕Çµ¥»Θâ╜µÿ»σ░ìτò╢σ£░Φ╛▓σñ½Φ╛¢σïñΦÇòΦÇÿτÜäΦç┤µò¼∩╝îΣ╗ÑσÅèσ░ìσñºΦç¬τä╢µà╖µà¿τÜäµäƒµü⌐Σ╣ïµâàπÇéτäíΦ½ûΣ╜òµÖéΣ╜òσ£░∩╝îσôÑσÇ½µ»öΣ║₧σÆûσòíΘâ╜σ░çσ╕╢µé¿µ╖▒σàÑΘ½öΘ⌐ùΘÇÖσÇïτ╛ÄΘ║ùσ£ïσ║ªτÜäΘ¡àσè¢∩╝îΦ«ôµé¿Σ║½σÅùΣ╕ÇΦ╢ƒτ£ƒσ»ªΦÇîτ╛Äσæ│τÜäσåÆΘÜ¬Σ╣ïµùàπÇé','product_image/σôÑσÇ½µ»öΣ║₧_cJbKLNC.png',1000,'CSA - 0011','2023-10-13','2023-10-14',6,'o'),(12,'σôÑµû»σñºΘ╗Äσèá  µ╖║τäÖ','σôÑµû»σñºΘ╗Äσèá∩╝îµ╖║σƒ╣σƒ╣σ║ª∩╝îτ╢╗µö╛τå▒σ╕╢Θó¿µâà∩╝îΦ▒Éσ»îΘó¿σæ│τÜäΣ╗úΦí¿πÇé','σôÑµû»σñºΘ╗ÄσèáτÜäµÿÄΣ║«τâÿσƒ╣σÆûσòíσ╕╢µ£ëµÑ╡σ»îσ▒ñµ¼íτÜäΘó¿σæ│∩╝îσààµ╗┐µƒæµ⌐ÿσÆîΦÄôµ₧£τÜäΘªÖµ░ú∩╝îΣ╝┤ΘÜ¿ΦæùΦ╝òµƒöτÜäτäªτ│ûσÆîσ╖ºσàïσè¢Θó¿σæ│πÇéµêæσÇæτÜäσÆûσòíΦ▒åΣ╛åΦç¬σôÑµû»σñºΘ╗ÄσèáτÜäΘ½ÿµ╡╖µïöΦ╛▓τö░∩╝îΣ╗Ñτ▓╛µ╣¢τÜäτâÿσƒ╣σ╖ÑΦù¥σ▒òτÅ╛σà╢τì¿τë╣Θó¿σæ│πÇéµ»ÅΣ╕ÇσÅúΘâ╜µÿ»Σ╕Çµ¼íτ╛Äσæ│Σ╣ïµùà∩╝îΦ«ôµé¿µäƒσÅùΣ╕¡σìùτ╛Äµ┤▓τÜäΦç¬τä╢Σ╣ïτ╛ÄσÆîµû░Θ««µäƒπÇéσôÑµû»σñºΘ╗Äσèá∩╝îµÿ»σÆûσòíµä¢σÑ╜ΦÇàτÜäΣ╕ìσÅ»Θî»ΘüÄΣ╣ïΘü╕∩╝îσ╕╢µé¿µ╖▒σàÑτå▒σ╕╢Θó¿µâà∩╝îΘ½öΘ⌐ùσÆûσòíτÜäσñÜµ¿úµÇº∩╝îΣ╕ÇσÅúΣ╕ÇσÅúΘâ╜µÿ»σ░ìΘÇÖτëçσ£ƒσ£░τÜäσ░èµò¼σÆîµäƒµü⌐Σ╣ïµâàπÇé','product_image/σôÑµû»σñºΘ╗Äσèá.png',1000,'CSA - 0012','2023-10-13','2023-10-14',6,'o'),(13,'σ«ÅΘâ╜µïëµû»  Σ╕¡µ╖║τäÖ','σ«ÅΘâ╜µïëµû»∩╝îΣ╕¡µ╖║σƒ╣τâÿσƒ╣∩╝îΘó¿σæ│Φ▒Éσ»î∩╝îµ║ÉΦç¬Σ╕¡σìùτ╛Äµ┤▓τÜäΣ╜│Σ╜£πÇé','σ«ÅΘâ╜µïëµû»τÜäΦ▒Éσ»îτâÿσƒ╣σÆûσòíσ╕╢µ£ëµ┐âτâêτÜäΘó¿σæ│∩╝îσààµ╗┐σáàµ₧£σÆîσ╖ºσàïσè¢τÜäΘªÖµ░ú∩╝îΣ╝┤ΘÜ¿Φæùµ╖▒σÄÜτÜäτäªτ│ûσÆîτ┤àΦÄôΘó¿σæ│πÇéµêæσÇæτÜäσÆûσòíΦ▒åΣ╛åΦç¬σ«ÅΘâ╜µïëµû»τÜäΘÖ╜σàëµ▓Éµ╡┤Φ╛▓τö░∩╝îΣ╗Ñτ▓╛σ┐âΦú╜Σ╜£τÜäµû╣σ╝ÅσæêτÅ╛σç║µ£ÇΣ╜│Θó¿σæ│πÇéµ»ÅΣ╕ÇσÅúΘâ╜µÿ»Σ╕Çµ¼íσààµ╗┐Θ⌐Üσû£τÜäσôüσæ│Σ╣ïµùà∩╝îσ╕╢µé¿µäƒσÅùΘÇÖτëçσ£ƒσ£░τÜäτå▒µâàσÆîµ┤╗σè¢πÇéσ«ÅΘâ╜µïëµû»τÜäσÆûσòí∩╝îµÿ»Σ╕¡σìùτ╛Äµ┤▓τÜäτæ░σ»╢∩╝îµ»ÅΣ╕Çµ¥»Θâ╜µÿ»σ░ìΦ╛¢σïñΦ╛▓σñ½τÜäΦç┤µò¼∩╝îΣ╗ÑσÅèσ░ìΦç¬τä╢µü⌐Φ│£τÜäµäƒµü⌐Σ╣ïµâàπÇéτäíΦ½ûΣ╜òµÖéΣ╜òσ£░∩╝îσ«ÅΘâ╜µïëµû»σÆûσòíΘâ╜Φâ╜τé║µé¿σ╕╢Σ╛åµ╗┐µ╗┐τÜäµ╗┐Φ╢│µäƒ∩╝îΦ«ôµé¿Σ║½σÅùτ┤öτ▓╣τÜäτ╛Äσæ│πÇé','product_image/σ«ÅΘâ╜µïëµû».png',1000,'CSA - 0013','2023-10-13','2023-10-14',6,'o'),(14,'σ░╝σèáµïëτô£  Σ╕¡µ╖║τäÖ','σ░╝σèáµïëτô£∩╝îΣ╕¡µ╖║τäÖτâÿσƒ╣∩╝îΘó¿σæ│Φ▒Éσ»î∩╝îΣ╕¡σìùτ╛Äµ┤▓Σ╣ïσ»╢πÇé','σ░╝σèáµïëτô£τÜäΦ▒Éτ¢¢τâÿσƒ╣σÆûσòíσ╕╢Σ╛åΦ▒Éσ»îτÜäΘó¿σæ│∩╝îσààµ╗┐σÅ»σÅ»σÆîσáàµ₧£τÜäΘªÖµ░ú∩╝îΣ╝┤ΘÜ¿Φæùµ╖íµ╖íτÜäµ⌐Öσ¡ÉσÆîτäªτ│ûΘó¿σæ│πÇé µêæσÇæτÜäσÆûσòíΦ▒åΣ╛åΦç¬σ░╝σèáµïëτô£τÜäΘÖ╜σàëµ▓Éµ╡┤Φ╛▓τö░∩╝îµ»ÅΣ╕ÇΘíåΦ▒åσ¡ÉΘâ╜τ╢ôΘüÄτ▓╛σ┐âµîæΘü╕∩╝îτé║µé¿σæêτÅ╛µ£ÇΣ╜│σôüΦ│¬πÇé µ»ÅΣ╕ÇσÅúΘâ╜µÿ»Σ╕¡σìùτ╛Äµ┤▓Θó¿µÖ»τÜäΦ┐╖Σ║║Σ╣ïµùà∩╝îΦ«ôµé¿µäƒσÅùΘÇÖτëçσ£ƒσ£░τÜäΘ¡àσè¢πÇé σ░╝σèáµïëτô£σÆûσòí∩╝îµÿ»σÆûσòíµä¢σÑ╜ΦÇàτÜäτÅìΦ▓┤σ»╢τƒ│∩╝îµ»ÅΣ╕Çµ¥»Θâ╜µÿ»σ░ìΘÇÖσÇïτ╛ÄΘ║ùσ£ïσ║ªτÜäΦç┤µò¼∩╝îΣ╗ÑσÅèσ░ìσñºΦç¬τä╢µà╖µà¿τÜäµäƒµü⌐Σ╣ïµâàπÇé τäíΦ½ûµé¿Φ║½σ£¿Σ╜òΦÖò∩╝îσ░╝σèáµïëτô£σÆûσòíΘâ╜Φâ╜σ╕╢µé¿σôüσæ│Σ╕¡σìùτ╛Äµ┤▓µ£Çτ╛ÄσÑ╜τÜäΘó¿σæ│πÇé','product_image/σ░╝σèáµïëτô£.png',1000,'CSA - 0014','2023-10-13','2023-10-14',6,'o'),(15,'σ╖┤µï┐Θª¼  Σ╕¡µ╖▒τäÖ','σ╖┤µï┐Θª¼∩╝îΣ╕¡µ╖▒τäÖτâÿσƒ╣∩╝îτ╢╗µö╛Θó¿σæ│∩╝îΣ╕¡σìùτ╛Äµ┤▓µÿÄτÅáπÇé','σ╖┤µï┐Θª¼τÜäΦè│Θåçτâÿσƒ╣σÆûσòíσ╕╢Σ╛åΘªÑΘ¼▒τÜäΘó¿σæ│∩╝îµòúτÖ╝σç║σÅ»σÅ»σÆîµ¥ÅΣ╗üτÜäΘªÖµ░ú∩╝îΣ╝┤ΘÜ¿Φæùσ╛«σªÖτÜäµ⌐Öσ¡ÉσÆîτäªτ│ûΘó¿σæ│πÇé µêæσÇæτÜäσÆûσòíΦ▒åΣ╛åΦç¬σ╖┤µï┐Θª¼τÜäΘÖ╜σàëµ▓Éµ╡┤Φ╛▓τö░∩╝îµ»ÅΣ╕ÇΘíåΦ▒åσ¡ÉΘâ╜τ╢ôΘüÄτ▓╛σ┐âΦú╜Σ╜£∩╝îσæêτÅ╛µ£ÇΣ╜│σôüΦ│¬πÇé µ»ÅΣ╕ÇσÅúΘâ╜µÿ»σààµ╗┐Θ⌐Üσû£τÜäσôüσæ│Σ╣ïµùà∩╝îΦ«ôµé¿µäƒσÅùΘÇÖτëçσ£ƒσ£░τÜäΘ¡àσè¢πÇé σ╖┤µï┐Θª¼σÆûσòí∩╝îµÿ»σÆûσòíµä¢σÑ╜ΦÇàτÜäτÅìΦ▓┤σ»╢τƒ│∩╝îµ»ÅΣ╕Çµ¥»Θâ╜µÿ»σ░ìΘÇÖσÇïτ╛ÄΘ║ùσ£ïσ║ªτÜäΦç┤µò¼∩╝îΣ╗ÑσÅèσ░ìσñºΦç¬τä╢µà╖µà¿τÜäµäƒµü⌐Σ╣ïµâàπÇé τäíΦ½ûµé¿Φ║½σ£¿Σ╜òΦÖò∩╝îσ╖┤µï┐Θª¼σÆûσòíΘâ╜Φâ╜σ╕╢µé¿σôüσæ│Σ╕¡σìùτ╛Äµ┤▓µ£Çτ╛ÄσÑ╜τÜäΘó¿σæ│πÇé','product_image/σ╖┤µï┐Θª¼.png',1500,'CSA - 0015','2023-10-13','2023-10-14',6,'o'),(16,'Jun - τÄ½τæ░Φè▒  µ╖║τäÖ','σà¡µ£êτÄ½τæ░∩╝îµ╖íµ╖íΦè▒ΘªÖτâÿσƒ╣∩╝îσÆûσòíΣ╕¡τÜäΦè▒σ£ÆΣ╣ïΦê₧πÇé','σà¡µ£êτÄ½τæ░τÜäµ╖íµ╖íΦè▒ΘªÖτâÿσƒ╣σÆûσòíσªéσÉîΦè▒σ£ÆΣ╣ïΦê₧∩╝îµòúτÖ╝σç║Φ┐╖Σ║║τÜäΦè▒ΘªÖπÇéµ»ÅΣ╕ÇσÅúΘâ╜σ╕╢µé¿τ⌐┐Φ╢èΦè▒µ£╡τ¢¢ΘûïτÜäσ¡úτ»Ç∩╝îΣ╝┤ΘÜ¿ΦæùΦ╝òµƒöτÜäτ╢ôσà╕µ╖║τäÖΘó¿σæ│∩╝îµòúτÖ╝σç║µ╖íµ╖íτÜäΦîëΦÄëπÇüτÄ½τæ░σÆîΦî╢Φè▒τÜäΘªÖµ░úπÇéµêæσÇæτÜäσÆûσòíΦ▒åσÜ┤Θü╕Φç¬σÆûσòíσ£Æ∩╝îΣ╗Ñτ▓╛µ╣¢τÜäτâÿτäÖσ╖ÑΦù¥Σ┐¥τòÖΘ««Φè▒τÜäΘªÖµ░ú∩╝îτé║µé¿σ╕╢Σ╛åΦè¼Φè│µÇíΣ║║τÜäσôüσæ│Σ╣ïµùàπÇéσà¡µ£êτÄ½τæ░∩╝îµÿ»σÆûσòíΦêçΦè▒Φ₧ìσÉêτÜäΦù¥Φíôσôü∩╝îµÿ»σ░ìΦç¬τä╢Σ╣ïτ╛ÄτÜäΦ«Üµ¡î∩╝îΣ╕Çµ¥»σÆûσòíΣ╕¡τÜäΦè▒σ£ÆΣ╗ñΣ║║ΘÖ╢Θåë∩╝îσôüσæ│σà╢Σ╕¡µ»ÅΣ╕Çσ▒ñτ╢┐Θò╖τÜäΘó¿µâàπÇé','product_image/σà¡µ£êτÄ½τæ░_CnwMhmy.png',1200,'FLM - 0016','2023-10-14','2023-10-14',5,'o'),(17,'Jul - Θú¢τçòΦìë  µ╖║τäÖ','Σ╕âµ£êΘú¢τçòΦìë∩╝îΦ╝òτ¢êµ╕àµû░τâÿσƒ╣∩╝îσÆûσòíΣ╕¡τÜäσñÅµùÑσ╛«Θó¿πÇé','Φ╝òτ¢êµ╕àµû░τâÿσƒ╣σÆûσòíσ╕╢µé¿Φ╡░ΘÇ▓σñÅµùÑσ╛«Θó¿∩╝îµäƒσÅùΘÖ╜σàëµÿÄσ¬ÜπÇéµ»ÅΣ╕ÇσÅúΘâ╜Σ╝┤ΘÜ¿Φæùµ╖íµ╖íτÜäΦìëΘªÖσÆîµ░┤µ₧£τÜäΘó¿σæ│∩╝îτî╢σªéσñÅσ¡úΦè▒σ£ÆτÜäµ╕àµû░µ░úµü»πÇéµêæσÇæτÜäσÆûσòíΦ▒åτ▓╛σ┐âµîæΘü╕Φç¬σÆûσòíσ£Æ∩╝îΣ╗Ñτì¿τë╣τÜäτâÿτäÖσ╖ÑΦù¥Σ┐¥τòÖµ╕àµû░Θó¿σæ│∩╝îτé║µé¿σ╕╢Σ╛åΣ╕Çσá┤Φ╝òτ¢êτÜäσæ│Φò╛Σ╣ïµùàπÇéΣ╕âµ£êΘú¢τçòΦìë∩╝îµÿ»σÆûσòíΣ╕¡τÜäσñÅσ¡úΘó¿µÖ»∩╝îµÿ»σ░ìσñÅµùÑτ╛ÄσÑ╜τÜäΦ«Üµ¡î∩╝îΣ╕Çµ¥»σÆûσòíΣ╕¡τÜäσñÅµùÑσ╛«Θó¿Φ«ôΣ║║σ┐âµâàµäëµéà∩╝îσôüσæ│σà╢Σ╕¡µ»ÅΣ╕ÇτëçΘÖ╜σàëµÿÄσ¬ÜπÇé','product_image/Σ╕âµ£êΘú¢τçòΦìë_CGaHYv6.png',1200,'FLM - 0017','2023-10-14','2023-10-14',5,'o'),(18,'Aug - σèìΦÿ¡  Σ╕¡µ╖║τäÖ','πÇîσè¢ΘçÅπÇìπÇüπÇîτÄçτ£ƒπÇìπÇüπÇîσáàµîüΣ╕ìµçêπÇìµùóµÿ»8µ£êσç║τöƒτÜäµ£ïσÅïτÜäτë╣Φ│¬πÇé','σà½µ£êσèìΦÿ¡τÜäµ╕àµû░Θó¿ΦÅ»τâÿσƒ╣σÆûσòíµòúτÖ╝Θ½ÿΦ▓┤Θó¿σ║ª∩╝îσààµ╗┐σä¬Θ¢àτÜäΘó¿σæ│πÇéµ»ÅΣ╕ÇσÅúΘâ╜Σ╝┤ΘÜ¿Φæùµ╕àµû░τÜäΦìëµ£¼ΘªÖµ░úσÆîµƒöσÆîτÜäµƒæµ⌐ÿΘó¿σæ│∩╝îσ╜╖σ╜┐τ╜«Φ║½Φè▒σ£ÆΣ╣ïΣ╕¡πÇéµêæσÇæτÜäσÆûσòíΦ▒åτ▓╛σ┐âΣ╛åΦç¬σÆûσòíσ£Æ∩╝îτ╢ôΘüÄτ▓╛µ╣¢τÜäτâÿτäÖσ╖ÑΦù¥σ▒òτÅ╛µ╕àµû░Θó¿ΦÅ»∩╝îτé║µé¿σ╕╢Σ╛åΣ╕Çσá┤Θ½ÿΦ▓┤σä¬Θ¢àτÜäσæ│Φò╛Σ╣ïµùàπÇéσà½µ£êσèìΦÿ¡∩╝îµÿ»σÆûσòíΣ╕¡τÜäΘ½ÿΦ▓┤Φè▒µ£╡∩╝îµÿ»σ░ìσä¬Θ¢àΣ╣ïτ╛ÄτÜäΦ«Üµ¡î∩╝îΣ╕Çµ¥»σÆûσòíΣ╕¡τÜäΘ½ÿΦ▓┤Θó¿σ║ªΣ╗ñΣ║║ΘÖ╢Θåë∩╝îσôüσæ│σà╢Σ╕¡µ»ÅΣ╕Çσ▒ñΘó¿ΦÅ»πÇé','product_image/σà½µ£êσèìΦÿ¡.png',1200,'FLM - 0018','2023-10-14','2023-10-14',5,'o'),(19,'Sep - τ┤½ΦïæΦè▒  Σ╕¡τäÖ','Θ¢ûτä╢Φêçσ░ÅΘ¢¢ΦÅèΣ╕Çµ¿úσÉîτé║ΘÖ¬ΦÑ»τö¿τÜäσ░ÅΦè▒∩╝îσì╗σ╕╢µ£ëΣ╕ìΦâ╜µ╝áΦªûτÜäΦç¬Φ║½Θ¡àσè¢∩╝ü','Σ╣¥µ£êτ┤½ΦïæΦè▒τÜäµƒöµâàµ╖║µ╖║τâÿσƒ╣σÆûσòíσ╜╖σ╜┐µÿ»σÆûσòíΣ╕¡τÜäµ║½Θª¿Σ╣ïσÉ╗∩╝îσ╕╢Σ╛åµ║½µÜûτÜäΘó¿σæ│πÇé µ»ÅΣ╕ÇσÅúΘâ╜Σ╝┤ΘÜ¿ΦæùµƒöσÆîτÜäΦè▒ΘªÖσÆîµ╖íµ╖íτÜäµ░┤µ₧£Θó¿σæ│∩╝îσ╜╖σ╜┐µ╝½µ¡Ñσ£¿τºïµùÑΦè▒τö░Σ╕¡πÇé µêæσÇæτÜäσÆûσòíΦ▒åτ▓╛σ┐âµîæΘü╕Φç¬σÆûσòíσ£Æ∩╝îΣ╗Ñτ▓╛µ╣¢τÜäτâÿτäÖσ╖ÑΦù¥σ▒òτÅ╛µƒöµâàµ╖▒ΦÖòτÜäσæ│Φò╛Θ½öΘ⌐ù∩╝îτé║µé¿σ╕╢Σ╛åΣ╕Çσá┤µ║½µÜûτÜäµâàµäƒΣ╣ïµùàπÇé Σ╣¥µ£êτ┤½ΦïæΦè▒∩╝îµÿ»σÆûσòíΣ╕¡τÜäµ║½Θª¿Φè▒µ£╡∩╝îµÿ»σ░ìµƒöµâàΣ╣ïτ╛ÄτÜäΦ«Üµ¡î∩╝îΣ╕Çµ¥»σÆûσòíΣ╕¡τÜäµ║½Θª¿Θó¿σæ│Σ╗ñΣ║║µç╖σ┐╡∩╝îσôüσæ│σà╢Σ╕¡µ»ÅΣ╕ÇτëçµƒöµâàπÇé','product_image/Σ╣¥µ£êτ┤½ΦïæΦè▒.png',1200,'FLM - 0019','2023-10-14','2023-10-14',5,'o'),(20,'Oct - Θçæτ¢₧Φè▒  Σ╕¡τäÖ','Σ╗úΦí¿πÇîτå▒µâàπÇìπÇüπÇîσë╡ΘÇáσè¢πÇìπÇüπÇîµêÉσèƒπÇìπÇüπÇîµ╕┤µ£¢πÇìπÇüµù¡µùÑτÜäτ╛ÄΘ║ùπÇé','σìüµ£êΘçæτ¢₧Φè▒τÜäΘçæΦë▓ΘÖ╜σàëτâÿσƒ╣σÆûσòíσ╕╢Σ╛åµ║½µÜûτÜäσ╕îµ£¢∩╝îσààµ╗┐ΘÖ╜σàëτÜäΘó¿σæ│πÇé µ»ÅΣ╕ÇσÅúΘâ╜Σ╝┤ΘÜ¿ΦæùΘÖ╜σàëτâÿτäÖΘó¿σæ│∩╝îσààµ╗┐µƒæµ⌐ÿσÆîσáàµ₧£τÜäΘªÖµ░ú∩╝îσ╜╖σ╜┐µÿ»ΘçæΦë▓τºïµùÑτÜäΦ▒íσ╛╡πÇé µêæσÇæτÜäσÆûσòíΦ▒åτ▓╛σ┐âµîæΘü╕Φç¬σÆûσòíσ£Æ∩╝îΣ╗Ñτ▓╛µ╣¢τÜäτâÿτäÖσ╖ÑΦù¥τé║µé¿σæêτÅ╛ΘçæΦë▓ΘÖ╜σàëτÜäσæ│Φò╛Σ╣ïµùàπÇé σìüµ£êΘçæτ¢₧Φè▒∩╝îµÿ»σÆûσòíΣ╕¡τÜäµ║½µÜûσ╕îµ£¢∩╝îµÿ»σ░ìΘÖ╜σàëΣ╣ïτ╛ÄτÜäΦ«Üµ¡î∩╝îΣ╕Çµ¥»σÆûσòíΣ╕¡τÜäµ║½µÜûσààµ╗┐σ╕îµ£¢∩╝îσôüσæ│σà╢Σ╕¡µ»ÅΣ╕ÇτëçΘÖ╜σàëπÇé','product_image/σìüµ£êΘçæτ¢₧Φè▒.png',1200,'FLM - 0020','2023-10-14','2023-10-14',5,'o'),(21,'Nov - ΦÅèΦè▒  µ╖║τäÖ','11µ£êΣ╗╜σú╜µÿƒΦ╖ƒΦÅèΦè▒Σ╕Çµ¿úσ£ôσ£ôµ╗æµ╗æ∩╝îµâ│µ│òσÆîσÅúµëìΘâ╜σç║τ£╛πÇé','σìüΣ╕Çµ£êΦÅèΦè▒τÜäΦÅèΦè▒µ╖íΘªÖτâÿσƒ╣σÆûσòíσ╕╢Σ╛åσ╣╜Θ¢àτÜäΘó¿σæ│∩╝îΣ╝┤ΘÜ¿Φæùµ╖íµ╖íτÜäΦè▒ΘªÖσÆîσ╛«σªÖτÜäΦî╢ΦæëΘó¿σæ│∩╝îτî╢σªéµ╝½µ¡Ñσ£¿τºïµùÑΦè▒σ£ÆΣ╕¡πÇé µêæσÇæτÜäσÆûσòíΦ▒åτ▓╛σ┐âµîæΘü╕Φç¬σÆûσòíσ£Æ∩╝îΣ╗Ñτì¿τë╣τÜäτâÿτäÖσ╖ÑΦù¥τé║µé¿σæêτÅ╛ΦÅèΦè▒µ╖íΘªÖτÜäσæ│Φò╛Σ╣ïµùàπÇé σìüΣ╕Çµ£êΦÅèΦè▒∩╝îµÿ»σÆûσòíΣ╕¡τÜäσ╣╜Θ¢àΘó¿σæ│∩╝îµÿ»σ░ìσñºΦç¬τä╢Σ╣ïτ╛ÄτÜäΦ«Üµ¡î∩╝îΣ╕Çµ¥»σÆûσòíΣ╕¡τÜäσ╣╜Θ¢àµ░¢σ£ìΣ╗ñΣ║║ΘÖ╢Θåë∩╝îσôüσæ│σà╢Σ╕¡µ»ÅΣ╕Çσ▒ñΦè▒ΘªÖπÇé','product_image/σìüΣ╕Çµ£êΦÅèΦè▒.png',1200,'FLM - 0021','2023-10-14','2023-10-14',5,'o'),(22,'Dec - Θó¿Σ┐íσ¡É','Θó¿Σ┐íσ¡ÉτÜäΦè▒Φ¬₧µÿ»πÇîσû£µéàπÇìπÇüπÇîµä¢µäÅπÇìσÆîπÇîσáàσ«Üµ¡úτ¢┤πÇìπÇé','σìüΣ║îµ£êΘó¿Σ┐íσ¡ÉτÜäσ»ºΘ¥£µƒöσÆîτâÿσƒ╣σÆûσòíσ╕╢Σ╛åσ»ºΘ¥£Σ╣ïτ╛Ä∩╝îΣ╝┤ΘÜ¿Φæùµ╖íµ╖íτÜäΦè▒ΘªÖσÆîµƒöσÆîτÜäµ░┤µ₧£Θó¿σæ│∩╝îσ«¢σªéµ╝½µ¡Ñσ£¿σå¼σ¡úΦè▒σ£ÆΣ╕¡πÇé µêæσÇæτÜäσÆûσòíΦ▒åτ▓╛σ┐âµîæΘü╕Φç¬σÆûσòíσ£Æ∩╝îΣ╗Ñτ▓╛µ╣¢τÜäτâÿτäÖσ╖ÑΦù¥τé║µé¿σæêτÅ╛σ»ºΘ¥£µƒöσÆîτÜäσæ│Φò╛Σ╣ïµùàπÇé σìüΣ║îµ£êΘó¿Σ┐íσ¡É∩╝îµÿ»σÆûσòíΣ╕¡τÜäσ»ºΘ¥£Σ╣ïτ╛Ä∩╝îµÿ»σ░ìσå¼σ¡úτÜäΘáîµ¡î∩╝îΣ╕Çµ¥»σÆûσòíΣ╕¡τÜäσ»ºΘ¥£µ░¢σ£ìΣ╗ñΣ║║σ╣│Θ¥£∩╝îσôüσæ│σà╢Σ╕¡µ»ÅΣ╕Çσ▒ñΦè▒ΘªÖπÇé','product_image/σìüΣ║îµ£êΘó¿Σ┐íσ¡É.png',1200,'FLM - 0022','2023-10-14','2023-10-14',5,'o'),(23,'Φé»Σ║₧  Σ╕¡µ╖║τäÖ','τ╢ôσà╕Φé»Σ║₧∩╝îΘªÖµ┐âσ╛«µ╖║τâÿ∩╝îΘó¿σæ│τì¿τë╣πÇé','Φé»Σ║₧σÆûσòíΣ╗Ñσà╢Σ╗ñΣ║║Θ¢úσ┐ÿτÜäΘó¿σæ│ΦÇîΦü₧σÉì∩╝îΣ╕¡µ╖║τâÿτäÖΣ╜┐σ«âΣ┐¥τòÖΣ║åΦ▒Éσ»îτÜäΘà╕σ║ªσÆîµ░┤µ₧£Θó¿σæ│πÇéµé¿σ░çσôüσÜÉσê░τò╢σ£░Θ½ÿσÄƒτÜäτ▓╛ΦÅ»∩╝îΘà╕τö£Σ║ñτ╣öτÜäµ╗ïσæ│∩╝îΣ╗ñΣ║║ΘÖ╢ΘåëπÇéΘÇÖτ¿«σÆûσòíΣ╕ìσâàΣ╗úΦí¿ΦæùΦé»Σ║₧τÜäΘó¿σ£ƒΣ║║µâà∩╝îµ¢┤µÿ»τå▒µä¢σÆûσòíτÜäΣ║║τÜäΘªûΘü╕πÇéτ▓╛σ┐âµá╜τ¿«∩╝îτ▓╛µ╣¢τÜäΦÖòτÉå∩╝îΣ╗ÑσÅèτì¿τë╣τÜäσ£ƒσúñ∩╝îτ╡ÉσÉêσ£¿Σ╕ÇΦ╡╖∩╝îσë╡ΘÇáσç║Θ««µÿÄτÜäµíâσ¡ÉπÇüΘ╗æΘåïµáùσÆîµ¬╕µ¬¼Θó¿σæ│πÇéΣ╕¡µ╖║τâÿτäÖΣ╜┐σà╢σà╖µ£ëσç║Φë▓τÜäΘà╕σ║ªσÆîσ«îτ╛ÄτÜäσ╣│Φíí∩╝îΣ╜┐µ»ÅΣ╕Çµ¥»Φ«èσ╛ùτë╣σêÑΦÇîΣ╗ñΣ║║µäëµéàπÇé','product_image/Φé»Σ║₧.png',900,'AFR - 0023','2023-10-14','2023-10-14',8,'o'),(24,'τ¢ºσ«ëΘüö  Σ╕¡µ╖▒τäÖ','τ¢ºσ«ëΘüöτæ░Θ║ù∩╝îΣ╕¡µ╖▒τâÿσƒ╣∩╝îΘ⌐ÜΦ▒öσæ│Φª║πÇé','τ¢ºσ«ëΘüöτÜäσÆûσòíΘñèσêåΦ▒Éσ»î∩╝îµêæσÇæΣ╗ÑΣ╕¡µ╖▒τâÿτäÖµû╣σ╝Åτé║µé¿σ╕╢Σ╛åΘ⌐ÜΦ▒öτÜäσæ│Θüô∩╝îµ╖▒σÄÜΦÇîσñÜσ▒ñµ¼í∩╝îΣ╝┤ΘÜ¿Φæùσáàµ₧£σÆîσ╖ºσàïσè¢τÜäΦ┐╖Σ║║Θó¿σæ│πÇéΘÇÖµ¼╛σÆûσòíΣ╛åΦç¬µû╝σìâσ▒▒ΦÉ¼σ│░Σ╣ïσ£ï∩╝îµôüµ£ëσñÜΘ¢¿τÜäµ░úσÇÖ∩╝îΣ╜┐σÆûσòíΦ▒åσ£¿µêÉΘò╖ΘüÄτ¿ïΣ╕¡σÉ╕µö╢σñºΦç¬τä╢τÜäτ▓╛ΦÅ»πÇéΣ╕¡µ╖▒τâÿτäÖσ╛î∩╝îΦ▒åσ¡ÉµòúτÖ╝ΦæùΘªÖτö£τÜäτäªτ│ûΘªÖµ░ú∩╝îσ╕╢Σ╛åσ╝òΣ║║σàÑσï¥τÜäµ¥ÅΣ╗üσÆîσÅ»σÅ»Θó¿σæ│∩╝îΣ╗ÑσÅèµ╕àµû░τÜäµƒæµ⌐ÿΘó¿σæ│πÇé','product_image/τ¢ºσ«ëΘüö.png',900,'AFR - 0024','2023-10-14','2023-10-14',8,'o'),(25,'σ¥ªσ░Üσ░╝Σ║₧  Σ╕¡µ╖▒σƒ╣','σ¥ªσ░Üσ░╝Σ║₧∩╝îΣ╕¡µ╖▒τâÿ∩╝îΘ¥₧µ┤▓Σ╣ïτÅìπÇé','σ¥ªσ░Üσ░╝Σ║₧τÜäσÆûσòíµ║ÉΦç¬Θ¥₧µ┤▓Σ╣ïσ┐â∩╝îΣ╕¡µ╖▒τâÿτäÖΦ«ôσà╢µêÉτé║Θ¥₧µ┤▓σÆûσòíΣ╣ïτÅì∩╝îµòúτÖ╝σç║σáàµ₧£σÆîµ╖▒σ║ªσ╖ºσàïσè¢Θó¿σæ│πÇéσ¥ªσ░Üσ░╝Σ║₧τÜäσÆûσòíµá╜σƒ╣σ£¿Θ½ÿσ▒▒τÜäτÆ░σóâΣ╕¡∩╝îτö▒µû╝σ£ƒσúñτÜäτë╣µÇºσÆîτ╢ôΘ⌐ùΦ▒Éσ»îτÜäτ¿«µñìΦÇà∩╝îσÆûσòíΦ▒åσ▒òτÅ╛σç║σñÜσ▒ñµ¼íτÜäΘó¿σæ│πÇéΣ╕¡µ╖▒τâÿτäÖσ╛î∩╝îµé¿σ░çσôüσÜÉσê░µ╖▒σ║ªσ╖ºσàïσè¢πÇüΘªÖΦìëσÆîµ⌐Öσ¡ÉτÜäµ┐âΘâüΘó¿σæ│∩╝îµ»ÅΣ╕Çµ¥»Θâ╜µÿ»Θ¥₧µ┤▓Θó¿µâàτÜäΦ⌐⌐τ»çπÇé','product_image/σ¥ªσ░Üσ░╝Σ║₧.png',900,'AFR - 0025','2023-10-14','2023-10-14',8,'o'),(26,'Φíúτ┤óµ»öΣ║₧  Σ╕¡µ╖║τäÖ','Φíúτ┤óµ»öΣ║₧∩╝îΣ╕¡µ╖║τâÿ∩╝îΦç¬τä╢Φè▒µ₧£ΘªÖπÇé','Φíúτ┤óµ»öΣ║₧µÿ»σÆûσòíτÖ╝µ║Éσ£░Σ╣ïΣ╕Ç∩╝îΣ╕¡µ╖║τâÿτäÖσ╕╢Σ╛åΦç¬τä╢Φè▒µ₧£ΘªÖ∩╝îτ╢┐Θò╖τÜäµö╢τ╡ÉσÆîΣ║«Θ║ùτÜäΘà╕σ║ª∩╝îµÿ»σÆûσòíµä¢σÑ╜ΦÇàτÜäµ£Çµä¢πÇéΘÇÖµ¼╛σÆûσòíσªéΦ⌐⌐σªéτò½∩╝îΣ╕¡µ╖║τâÿτäÖσ╛î∩╝îµòúτÖ╝σç║ΦîëΦÄëπÇüΦùìΦÄôσÆîµƒÜσ¡ÉτÜäΘªÑΘâüΘªÖµ░úπÇéµ»ÅΣ╕Çµ¥»Θâ╜µÿ»Σ╕Çµ¼íµÄóτ┤ó∩╝îσ╕╢µé¿Θú¢Φ╢èΘ½ÿσ▒▒σÆîσÅóµ₧ù∩╝îΘ½öΘ⌐ùΦç¬τä╢τÜäΦè▒µ₧£Θó¿σæ│πÇé','product_image/Φíúτ┤óµ»öΣ║₧.png',1000,'AFR - 0026','2023-10-14','2023-10-14',8,'o'),(27,'Φ╛¢σ╖┤σ¿ü  Σ╕¡µ╖▒τäÖ','Φ╛¢σ╖┤σ¿üτÜäσÆûσòíτë╣Φë▓µÿ»σÆîΦé»Σ║₧Θí₧Σ╝╝µ£ëΦ╝âσ╝╖τÜäΘà╕σ║ªσÅèµ░┤µ₧£τÜäΘªÖσæ│πÇé','Φ╛¢σ╖┤σ¿üσÆûσòíτì¿σà╖Θó¿σæ│∩╝îΣ╕¡µ╖▒τâÿσƒ╣Θçïµö╛σç║Φ▒Éσ»îτÜäτ┤░Φå⌐Θó¿σæ│∩╝îµé¿σ░çµäƒσÅùσê░µ║½µÜûτÜäτäªτ│ûσÆîσáàµ₧£ΘªÖµ░ú∩╝îΣ╗ñΣ║║ΘÖ╢ΘåëπÇéΘÇÖτ¿«σÆûσòíΣ╛åΦç¬µû╝Φ╛¢σ╖┤σ¿üτÜäΘ½ÿσ▒▒∩╝îΦ▒åσ¡Éσ£¿Θ½ÿµ╡╖µïöσÆîΦ▒Éµ▓¢τÜäΘÖìΘ¢¿Σ╕¡Φîüσú»µêÉΘò╖πÇéΣ╕¡µ╖▒τâÿτäÖσ╛î∩╝îσÆûσòíΦ«èσ╛ùµ┐âΘâüΦÇîσñÜσ▒ñµ¼í∩╝îΣ╝┤ΘÜ¿Φæùσáàµ₧£πÇüσ╖ºσàïσè¢σÆîτ┤àµ₧£Θó¿σæ│∩╝îτé║µé¿σæêτÅ╛τ┤░Φå⌐τÜäΘñÿΘƒ╗πÇé','product_image/Φ╛¢σ╖┤σ¿ü.png',900,'AFR - 0027','2023-10-14','2023-10-14',8,'o'),(28,'µÜùΦ¬┐τ¢à Subdued Brew','µÜùΦ¬┐τ¢à∩╝îτ░íτ┤äτ╛ÄµäƒπÇé','µÜùΦ¬┐τ¢àµÿ»σÆûσòíµëïµ▓ûµ┐╛µ¥»τÜäµÑ╡Φç┤Φí¿τÅ╛∩╝îΣ╗Ñτ░íτ┤äτ╛ÄµäƒΦ₧ìσàÑΣ╜áτÜäσÆûσòíµÖéσàëπÇéΘ╗æΦë▓τÜäσñûΦºÇΦ₧ìσÉêΣ║åµ╝åσó¿τÜäµ╖▒Θéâ∩╝îΣ╗┐Σ╜¢Σ╕Çσ╣àµè╜Φ▒íΦù¥ΦíôσôüπÇéσ«âµéäµéäσ╜░Θí»Σ╜áσ░ìσÆûσòíτÜäσÜ«σ╛Ç∩╝îµ»ÅΣ╕Çµ¼íτÜäµëïµ▓ûΘâ╜σªéσÉîΣ╕Çµ¼íΦù¥ΦíôΦí¿µ╝öπÇé','product_image/µÜùΦ¬┐τ¢à.png',2000,'POV - 0028','2023-10-14','2023-10-14',9,'o'),(29,'µ╝åσó¿µ¥» Inkwell','σî»ΦüÜΣ║åΦù¥ΦíôτÜäΘ¥êµäƒ∩╝îσà╢µ╖▒ΘéâτÜäΘ╗æΦë▓σñûΦºÇσªéσÉîΣ╕ÇσÇïσó¿µ░┤τô╢πÇé','µ╝åσó¿µ¥»µÿ»τì¿Σ╕ÇτäíΣ║îτÜäσÆûσòíµëïµ▓ûµ┐╛µ¥»∩╝îσâÅµÿ»Σ╜áµëïΣ╕¡τÜäΣ╕Çσ╣àΦù¥ΦíôσôüπÇéσà╢σÉìσÅûΦç¬Σ╕¡σ£ïσé│τ╡▒µ╝åσÖ¿σ╖ÑΦù¥∩╝îΘ╗æσªéσó¿∩╝îµ╖▒ΘéâΦ┐╖Σ║║πÇéµ»Åµ¼íµ│íΦú╜∩╝îΘâ╜µÿ»Σ╕Çσá┤Φù¥ΦíôτÜäΘÑùσ«┤πÇéµ╝åσó¿µ¥»µôüµ£ëσä¬τò░τÜäΣ┐¥µ║½µÇºΦâ╜∩╝îτó║Σ┐¥Σ╜áτÜäσÆûσòíσ£¿µ»ÅΣ╕ÇσÅúΘâ╜Φâ╜σñáσªéτ╡▓Φê¼Θáåµ╗æπÇé','product_image/µ╝åσó¿µ¥».png',1500,'POV - 0029','2023-10-14','2023-10-14',9,'o'),(30,'Θ╗æσ╣òµ¥» Noir Screen','Θ╗æσ╣òµ¥»∩╝îσÆûσòíτÜäσ╛«σàëπÇé','Θ╗æσ╣òµ¥»µÿ»Σ╕ÇΘüôσÆûσòíτÜäσ╛«σàë∩╝îσªéΘ¢╗σ╜▒ΘÖóΦúíτÜäΘ╗æσ╣ò∩╝îσÅ¬τé║σæêτÅ╛µ£Çτ┤öτ▓╣τÜäσÆûσòíΘ½öΘ⌐ùπÇéΘ╗æΘÖ╢τÜäΦ│¬µäƒΣ╗ñΣ╜áµ╖▒ΘÖ╖σà╢Σ╕¡∩╝îµëïµ▓ûΘüÄτ¿ïσ░▒σâÅµÿ»σèçµâàτÜäσ▒òΘûï∩╝îµ»ÅΣ╕Çµ¼íτÜäσÆûσòíΘâ╜σÇ╝σ╛ùµ£ƒσ╛àπÇéΘ╗æσ╣òµ¥»τÜäΦ¿¡Φ¿êτì¿τë╣∩╝îΘü⌐σÉêµëïµ▓ûσÆîσÇÆσÆûσòí∩╝îτé║Σ╜áσ╕╢Σ╛åτì¿τë╣τÜäΘó¿σæ│πÇé','product_image/Θ╗æσ╣òµ¥».png',1500,'POV - 0030','2023-10-14','2023-10-14',9,'o'),(31,'Θ╗æΘÖ╢µ¥» Ebony Ceramic','Θ╗æΘÖ╢µ¥»∩╝îµëïµäƒµ║½µ╜ñπÇé','Θ╗æΘÖ╢µ¥»Σ╗Ñµ║½µ╜ñτÜäµëïµäƒσÆîµÑ╡τ╖╗τÜäσ╖ÑΦù¥σ▒òτÅ╛τì¿τë╣τÜäσÆûσòíΣ╣ïτ╛ÄπÇéσ«âτÜäσÉìτ¿▒Σ╛åΦç¬µû╝Θ╗æΘÖ╢τÜäΦú╜Σ╜£∩╝îµ¥»Φ║½σªéσÉîΣ╕ÇΣ╗╢Φù¥Φíôσôü∩╝îσ£¿µëïΣ╕¡τ╖áΘÇáσ«îτ╛ÄτÜäσÆûσòíµÖéσàëπÇéΘ╗æΘÖ╢µ¥»τÜäτë╣µ«èµ¥ÉΦ│¬Φâ╜σñáΣ┐¥σ¡ÿσÆûσòíτÜäµ║½σ║ªσÆîΘó¿σæ│∩╝îµ»ÅΣ╕ÇσÅúΘâ╜σààµ╗┐µ┐âΘâüτÜäσ▒ñµ¼íµäƒπÇé','product_image/Θ╗æΘÖ╢µ¥».png',2450,'POV - 0031','2023-10-14','2023-10-14',9,'o'),(32,'σ╣╜σó¿ Inkwell Elegance','σ╣╜σó¿∩╝îσä¬Θ¢àσªéσó¿∩╝îτé║µ»ÅΣ╜ìσÆûσòíµä¢σÑ╜ΦÇàµÅÉΣ╛¢τ▓╛µ╣¢τÜäµëïµ▓ûΘ½öΘ⌐ùπÇé','σ╣╜σó¿µëïµ▓ûσú║Σ╗ÑµÑ╡τ░íτÜäΘ╗æτÖ╜Φë▓Φ¬┐Φ¿¡Φ¿ê∩╝îσ«îτ╛ÄσæêτÅ╛Φù¥ΦíôΦêçσèƒΦâ╜τÜäτ╡ÉσÉêπÇéσà╢τ▓╛τ╖╗τ┤░Φå⌐τÜäΣ╕ìΘè╣Θï╝µ┐╛τ╢▓σÆîσä¬Θ¢àτÜäµëïµƒä∩╝îΣ╜┐µé¿µ»Åµ¼íτÜäµ▓ûτà«Θâ╜σªéσÉîΣ╕Çσ╣àσä¬τ╛ÄτÜäµ░┤σó¿τò½πÇé','product_image/σ╣╜σó¿σú║.png',2500,'SNK - 0032','2023-10-14','2023-10-14',10,'o'),(33,'µÜùΘªÑ Subtle Aroma Infuser','τ╢┐σ»åΘªÖµ░ú∩╝îΦ«ôµé¿τÜäσÆûσòíµ▓ûτà«σààµ╗┐Φù¥Φíôµ░¢σ£ìπÇé','µÜùΘªÑµëïµ▓ûσú║Σ╗Ñτ░íτ┤äΦÇîτ▓╛µ╣¢τÜäσ╖ÑΦù¥µëôΘÇá∩╝îµ»ÅΣ╕Çµ¼íτÜäµ▓ûτà«Θâ╜µÿ»Σ╕Çσá┤τì¿τë╣τÜäΘÑùσ«┤πÇéσà╢σä¬τ╛ÄτÜäµ¢▓τ╖ÜσÆîΘ½ÿΦ│¬µäƒτÜäΘÖ╢τô╖∩╝îΣ╜┐σÆûσòíΦ«èσ╛ùµ¢┤σèáΦ▒Éσ»îσÆîΦñçΘ¢£πÇé','product_image/µÜùΘªÑσú╢.png',2500,'SNK - 0033','2023-10-14','2023-10-14',10,'o'),(34,'τ┐áτàÖ Emerald Mist Brewer','τ┐áτàÖ∩╝îσ╜╖σ╜┐τ╜«Φ║½µû╝τ╢áµäÅΣ╕¡∩╝îΣ║½σÅùτ┤öτ▓╣τÜäσÆûσòíΣ╣ïτ╛ÄπÇé','τ┐áτàÖµëïµ▓ûσú║σ╕╢Σ╛åµ╕àµû░Φç¬τä╢τÜäσÆûσòíΘ½öΘ⌐ùπÇéσà╢τë╣µ£ëτÜäτÄ╗τÆâΦ¿¡Φ¿ê∩╝îΦ«ôµé¿ΦºÇσ»ƒσÆûσòíσ£¿σú║Σ╕¡τ╖⌐τ╖⌐µòúτÖ╝τÜäτ╛ÄΘ║ùΦë▓µ╛ñπÇéµ»ÅΣ╕Çµ╗┤σÆûσòíΘâ╜σ╜╖σ╜┐Σ╕Çσá┤σñºΦç¬τä╢τÜäµÄóΘÜ¬πÇé','product_image/τ┐áτàÖσú║.png',2600,'SNK - 0034','2023-10-14','2023-10-14',10,'o'),(35,'Φè▒σ╜▒ Blossom Shadow','Φè▒σ╜▒∩╝îσªéΦ⌐⌐σªéτò½∩╝îσ░çσÆûσòíµ▓ûτà«σìçΦÅ»τé║Σ╕Çτ¿«Φù¥ΦíôπÇé','Φè▒σ╜▒µëïµ▓ûσú║Σ╗Ñτ░íτ┤äτÜäΦ¿¡Φ¿êΦêçτ╣¬τò½Φê¼τÜäσ£ûµíêΦâîµÖ»τ¢╕σ╛ùτ¢èσ╜░πÇéµ»ÅΣ╕Çµ¼íτÜäµ▓ûτà«Θâ╜µÿ»Σ╕Çσá┤σªéΦ⌐⌐σªéτò½τÜäΦù¥ΦíôΦí¿µ╝ö∩╝îσààµ╗┐ΦæùµûçΘ¥ÆΦêçµÖéσ░ÜτÜäµ░¢σ£ìπÇé','product_image/Φè▒σ╜▒σú╢.png',2700,'SNK - 0035','2023-10-14','2023-10-14',10,'o'),(36,'σîá Artisan','σîá∩╝îµôüµ£ëσìôΦ╢èτÜäτú¿Φ▒åµèÇΦù¥∩╝îτé║σÆûσòíµä¢σÑ╜ΦÇàσ╕╢Σ╛åτ╡òΣ╜│Θó¿σæ│πÇé','σîáσÆûσòíτú¿Φ▒åµ⌐ƒµÿ»σ░êτé║Φ┐╜µ▒éσ«îτ╛ÄτÜäσÆûσòíτâ╣Φú╜ΦÇîΦ¿¡Φ¿êπÇéσà╢τ▓╛τó║τÜäτú¿Φ▒åΦ¿¡σ«ÜσÆîσáàσ¢║τÜäΣ╕ìΘè╣Θï╝σêÇτëçτó║Σ┐¥µ»ÅΣ╕Çµ¼íτú¿Φ▒åΘâ╜Σ┐¥µîüΣ╕ÇΦç┤µÇºσÆîΘó¿σæ│πÇéσ«âµÿ»τì¿τ½ïσÆûσòíσ╕½σÆîσ«╢τö¿σÆûσòíτâ╣Φú╜ΦÇàτÜäτÉåµâ│Σ╣ïΘü╕πÇé','product_image/σîá.png',3000,'GRI - 0036','2023-10-14','2023-10-14',11,'o'),(37,'µéà Harmony','µéà∩╝îσ░çσÆûσòíτÜäσÆîΦ½ºΣ╣ïτ╛Äµ│¿σàÑµ»ÅΣ╕Çµ¥»πÇé','µéàσÆûσòíτú¿Φ▒åµ⌐ƒΣ╗Ñσà╢σ╣│ΦííτÜäµÇºΦâ╜ΦÇîΦü₧σÉìπÇéΣ╕ìΦ½ûµé¿µÿ»Φ┐╜µ▒éµ┐âΘâüΘó¿σæ│Θéäµÿ»µ╕àµû░σÅúµäƒ∩╝îµéàΘâ╜Φâ╜µ╗┐Φ╢│µé¿τÜäΘ£Çµ▒éπÇéσà╢τú¿Φ▒åµ⌐ƒΘá¡Φ¿¡Φ¿êτ░íτ┤äΣ╕öµÿôµû╝µ╕àµ╜ö∩╝îµÿ»σÆûσòíµä¢σÑ╜ΦÇàτÜäσÑ╜σñÑΣ╝┤πÇé','product_image/µéà.png',3500,'GRI - 0037','2023-10-14','2023-10-14',11,'o'),(38,'µùï Spiral','µùï∩╝îΘó¿σæ│τ¢íσ£¿µÄîµÅí∩╝îΦ₧ìσÉêσë╡µäÅτÜäτú¿Φ▒åΘ½öΘ⌐ùπÇé','µùïσÆûσòíτú¿Φ▒åµ⌐ƒµôüµ£ëτì¿τë╣τÜäΦ₧║µùïσ╝ÅσêÇτëçΦ¿¡Φ¿ê∩╝îτó║Σ┐¥Φ▒åσ¡ÉΦó½σ¥çσï╗τú¿µêÉτÉåµâ│τÜäτ▓Æσ║ªπÇéσ«âµÿ»σë╡µäÅσÆûσòíσ╗│σÆîµîæσëöτÜäτâÿτäÖσ╕½τÜäΘü╕µôçπÇéτäíΦ½ûµé¿τâ╣Φú╜µ┐âΘâüµ┐âτ╕«σÆûσòíΘéäµÿ»µ╕àµû░τ╛Äσ╝ÅσÆûσòí∩╝îµùïΘâ╜Φâ╜µ╗┐Φ╢│µé¿πÇé','product_image/µùï.png',3300,'GRI - 0038','2023-10-14','2023-10-14',11,'o'),(39,'τ┤ï Pattern','τ┤ï∩╝îσÆûσòíΦù¥ΦíôτÜäτ▓╛Θ½ô∩╝îσæêτÅ╛Θó¿σæ│τÜäΦù¥ΦíôσôüπÇé','τ┤ïσÆûσòíτú¿Φ▒åµ⌐ƒΣ╗Ñσà╢τì¿τë╣τÜäΦè▒τ┤ïσêÇτëçΦÇîΦæùτ¿▒∩╝îτó║Σ┐¥µ»ÅΣ╕Çµ¥»σÆûσòíΘâ╜µÿ»Φù¥ΦíôσôüπÇéσ«âΘü⌐τö¿µû╝σ░ìΦªûΦª║σÆîσæ│Φª║σÉîµ¿úΦ¼¢τ⌐╢τÜäσÆûσòíσ╕½πÇéτú¿σç║τÜäσÆûσòíτ▓ëµ╜öτÖ╜τ┤ïτÉåσêåµÿÄ∩╝îΣ╗ñΣ║║Θ⌐ÜΦ▒öπÇé','product_image/τ┤ï.png',2800,'GRI - 0039','2023-10-14','2023-10-14',11,'o'),(40,'Θª¿ Serene','Θª¿∩╝îσ╕╢Σ╛åσ»ºΘ¥£τÜäσÆûσòíΘ½öΘ⌐ù∩╝îσààµ╗┐σÆîσ╣│πÇé','Θª¿σÆûσòíτú¿Φ▒åµ⌐ƒµÿ»τé║Φ┐╜µ▒éσ»ºΘ¥£τÆ░σóâΣ╕¡τÜäσÆûσòíµä¢σÑ╜ΦÇàΦ¿¡Φ¿êτÜäπÇéσà╢Φ╢àΘ¥£Θƒ│µôìΣ╜£∩╝îΣ╜ÄΦâ╜ΦÇù∩╝îτó║Σ┐¥µ»ÅΣ╕Çµ¼íτÜäτú¿Φ▒åΘâ╜σààµ╗┐σÆîσ╣│µäƒπÇéµôüµ£ëΣ╕Çµ¥»Θª¿σÆûσòí∩╝îΣ║½σÅùσ»ºΘ¥£µÖéσê╗πÇé','product_image/Θª¿.png',4000,'GRI - 0040','2023-10-14','2023-10-14',11,'o'),(41,'σôÑσÇ½µ»öΣ║₧τª«τ¢Æ','σôÑσÇ½µ»öΣ║₧Θó¿σæ│Σ╣ïµùàπÇé','ΘÇÖσÇïσÆûσòíτª«τ¢Æσ░çσ╕╢µé¿Φ╕ÅΣ╕èΣ╕Çσá┤Σ╗ñΣ║║ΘÖ╢ΘåëτÜäσôÑσÇ½µ»öΣ║₧Θó¿σæ│Σ╣ïµùàπÇéτ▓╛Θü╕τÜäσôÑσÇ½µ»öΣ║₧σÆûσòíΦ▒å∩╝îσ£¿Θ½ÿµ╡╖µïöτÆ░σóâΣ╕¡τ¿«µñì∩╝îΘó¿σæ│τì¿τë╣πÇéµ»ÅΣ╕ÇσÅúΘâ╜σªéσÉîµ╝½µ¡Ñσ£¿σôÑσÇ½µ»öΣ║₧τÜäσÆûσòíΦ╛▓σá┤∩╝îσôüσæ│σê░ΘÖ╜σàëπÇüσñºσ£░σÆîΦ▒Éµö╢τÜäµ╗ïσæ│πÇéΦ«ôµé¿τÜäσæ│Φò╛ΘÜ¿Φæùµ»Åµ¥»ΦÇîτ┐▒τ┐öπÇé','product_image/σôÑσÇ½µ»öΣ║₧τª«τ¢Æ.png',3300,'CGB - 0041','2023-10-14','2023-10-14',12,'o'),(42,'µ½╗Φè▒τª«τ¢Æ','µÿÑµùÑτ¢¢ΘûïτÜäσÆûσòíπÇé','ΘÇÖµ¼╛τª«τ¢Æσ╜╖σ╜┐µÿ»µÿÑσñ⌐τÜäΣ╕Çσá┤τ¢¢σñºµ½╗Φè▒τÑ¡σà╕πÇéµêæσÇæµîæΘü╕Σ║åµ£Çσä¬Φ│¬τÜäσÆûσòíΦ▒å∩╝îσ╕╢µ£ëµ╖íµ╖íτÜäµ½╗Φè▒Φè¼Φè│πÇéµ»ÅΣ╕ÇσÅúσÆûσòíΘâ╜Σ╝┤ΘÜ¿ΦæùΦè▒ΘªÖ∩╝îΣ╗ñΣ║║Φ│₧σ┐âµéàτ¢«πÇéΘÇÖµÿ»µÿÑσñ⌐τÜäσæ│Θüô∩╝îτäíΘ£Çτ¡ëσ╛àσ¡úτ»Ç∩╝îΘÜ¿µÖéΘâ╜Φâ╜σôüσæ│πÇé','product_image/µ½╗Φè▒τª«τ¢Æ.png',2500,'CGB - 0042','2023-10-14','2023-10-14',12,'o'),(43,'µ░┤Σ╗ÖΦè▒τª«τ¢Æ','σä¬Θ¢àτÜäΦè▒ΘªÖσÆûσòíπÇé','µ░┤Σ╗ÖΦè▒τª«τ¢Æ∩╝îτé║µé¿σ╕╢Σ╛åΣ╕Çµ¥»σààµ╗┐σä¬Θ¢àΦè▒ΘªÖτÜäσÆûσòíΘÑùσ«┤πÇéΘÇÖµ¼╛σÆûσòíΦ▒åΣ╗Ñµ░┤Σ╗ÖΦè▒τÜäΦè¼Φè│τé║Θ¥êµäƒ∩╝îσÅúµäƒµ╕àµû░σ«£Σ║║∩╝îσ╜╖σ╜┐τ╜«Φ║½µû╝Φè▒σ£ÆπÇéσÆûσòíΣ╕¡τÜäΦè▒ΘªÖΘª¼Σ╕èΦ«ôµé¿µ▓ëµ╡╕σ£¿µä£µäÅτÜäσÆûσòíµÖéσàëπÇé','product_image/µ░┤Σ╗ÖΦè▒τª«τ¢Æ.png',3333,'CGB - 0043','2023-10-14','2023-10-14',12,'o'),(44,'τ┤½ΦïæΦè▒τª«τ¢Æ','σ»ºΘ¥£τÜäτ┤½Φë▓Σ╣ïµùàπÇé','ΘÇÖσÇïτª«τ¢Æµÿ»Σ╕Çσá┤σ»ºΘ¥£τÜäσÆûσòíΣ╣ïµùà∩╝îσ╜╖σ╜┐µ╝½µ¡Ñσ£¿τ┤½Φë▓τÜäΦè▒µ╡╖Σ╕¡πÇéµêæσÇæτÜäσÆûσòíΦ▒åτ╢ôΘüÄτ▓╛σ┐âµîæΘü╕∩╝îσ╕╢µ£ëµ╖íµ╖íτÜäτ┤½ΦïæΦè▒ΘªÖπÇéΣ╕Çµ¥»σÆûσòíσ░çµé¿σ╕╢σàÑσ«üΘ¥£σÆîσ╣│Θ¥£τÜäσóâτòî∩╝îσ░ïµë╛σ┐âΘ¥êτÜäσ»ºΘ¥£πÇé','product_image/τ┤½ΦïæΦè▒τª«τ¢Æ.png',3500,'CGB - 0044','2023-10-14','2023-10-14',12,'o'),(45,'ΦÅèΦè▒τª«τ¢Æ','ΦÅèΦè▒τÜäσä¬Θ¢àπÇé','ΘÇÖµ¼╛τª«τ¢Æµÿ»σ░ìΦÅèΦè▒τÜäΣ╕Çσá┤σ┤çµò¼∩╝îσ░çσÆûσòíΦêçΦÅèΦè▒τÜäσä¬Θ¢àτ╡ÉσÉêπÇéµ»ÅΣ╕ÇσÅúσÆûσòíΘâ╜σ╕╢µ£ëΦÅèΦè▒τÜäµ╕àΘªÖ∩╝îσªéσÉîµ╝½µ¡Ñσ£¿Φè▒σ£ÆΣ╕¡πÇéΘÇÖµ¼╛σÆûσòíσ░çτé║µé¿σ╕╢Σ╛åσä¬Θ¢àσÆîΦè¼Φè│τÜäσÆûσòíΘ½öΘ⌐ùπÇé','product_image/ΦÅèΦè▒τª«τ¢Æ.png',2500,'CGB - 0045','2023-10-14','2023-10-14',12,'o'),(46,'ΦÅèΦè▒τª«τ¢Æ ΘÖÉΘçÅ','τë╣σêÑτÜäΦè▒ΘªÖΘ⌐Üσû£πÇé','ΘÇÖµÿ»Σ╕ÇσÇïτë╣σêÑτëêµ£¼τÜäΦÅèΦè▒τª«τ¢Æ∩╝îσ╕╢Σ╛åµ¢┤σñÜΣ╗ñΣ║║Θ⌐Üσû£τÜäΦè▒ΘªÖΘ½öΘ⌐ùπÇéµêæσÇæτÜäσÆûσòíΦêçΦÅèΦè▒Σ║ñτ╣ö∩╝îσë╡ΘÇáσç║Σ╗ñΣ║║Θ¢úΣ╗Ñτ╜«Σ┐íτÜäσÅúµäƒπÇéµ»ÅΣ╕ÇσÅúΘâ╜µÿ»Σ╕Çσá┤σÆûσòíσÆîΦè▒τÜäτ¢¢σ«┤∩╝îσ╕╢Σ╛åτö£Φ££τÜäΣ║½σÅùπÇéΘÇÖµÿ»Σ╕ÇΣ╗╜τë╣σêÑτÜäτª«τë⌐∩╝îτé║τë╣σêÑτÜäΣ║║Φ¿¡Φ¿êπÇé','product_image/ΦÅèΦè▒τª«τ¢Æ-1.png',3333,'CGB - 0046','2023-10-14','2023-10-14',12,'o'),(47,'σ║╖Σ╣âΘª¿ τë╣σêÑτëê','µ▓ëµ╡╕σ£¿Φè▒ΘªÖτÜäτ╛ÄσÑ╜∩╝îσ║╖Σ╣âΘª¿τë╣σêÑτëêσ╕╢µé¿ΘÇ▓σàÑσÆûσòíτÜäΦè▒σ£ÆπÇé','σ║╖Σ╣âΘª¿τë╣σêÑτëê∩╝îµÿ»Σ╕Çσá┤σààµ╗┐σä¬Θ¢àτÜäΦè▒ΘªÖΘÑùσ«┤πÇéµêæσÇæτ▓╛Θü╕τÜäσÆûσòíΦ▒åσ£¿τäÖτçÆΘüÄτ¿ïΣ╕¡Φ₧ìσÉêΣ║åσ║╖Σ╣âΘª¿Φè▒τôúτÜäΘªÖµ░ú∩╝îσ╕╢Σ╛åµ╕àµû░Σ╕öΣ╗ñΣ║║µäëµéàτÜäσæ│ΘüôπÇéµ»ÅΣ╕ÇσÅúΘâ╜σªéσÉîσ£¿Φè▒σ£ÆΣ╕¡µ╝½Θüè∩╝îµäƒσÅùσñºΦç¬τä╢τÜäτ╛ÄσÑ╜πÇéΘÇÖµ¼╛τë╣σêÑτëêτÜäσÆûσòíτ╡òσ░ìµÿ»µëÇµ£ëΦè▒ΘªÖµä¢σÑ╜ΦÇàτÜäµ£Çµä¢πÇé','product_image/σ║╖Σ╣âΘª¿τë╣σêÑτëê.png',3600,'EDI - 0047','2023-10-14','2023-10-14',13,'o'),(48,'τ┤½τ╛àΦÿ¡ τë╣σêÑτëê','τ┤½τ╛àΦÿ¡τÜäσñóσ╣╗Θ¡àσè¢∩╝îΣ╕Çµ¥»τë╣σêÑτëêσÆûσòíτÜäτ┤½Φë▓Φ⌐⌐µäÅπÇé','τ┤½τ╛àΦÿ¡τë╣σêÑτëê∩╝îΦ«ôµé¿τÜäσÆûσòíΘ½öΘ⌐ùσààµ╗┐σñóσ╣╗σÆîτÑ₧τºÿπÇéµêæσÇæτÜäτë╣σêÑτëêσÆûσòíΦ▒åΣ╗Ñσä¬Θ¢àτÜäτ┤½τ╛àΦÿ¡Φè▒ΘªÖτé║Θ¥êµäƒ∩╝îµ╖╖σÉêΣ║åσñºΦå╜τÜäΘó¿σæ│πÇéµ»ÅΣ╕ÇσÅúΘâ╜σ╜╖σ╜┐µÿ»Σ╕Çσá┤Φ╕ÅσàÑΦè▒µ╡╖τÜäσñóσóâ∩╝îσ╕╢Σ╛åτäíΘÖÉτÜäµäëµéàπÇéσôüσæ│ΘÇÖµ¼╛τë╣σêÑτëêσÆûσòí∩╝îΦ«ôτ┤½τ╛àΦÿ¡τÜäτÑ₧σÑçΘ¡àσè¢σààµ╗┐µé¿τÜäµ¥»Σ╕¡πÇé','product_image/τ┤½τ╛àΦÿ¡τë╣σêÑτëê.png',4500,'EDI - 0048','2023-10-14','2023-10-14',13,'o');
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productvariant`
--

DROP TABLE IF EXISTS `product_productvariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_productvariant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `size` varchar(20) DEFAULT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `date_of_create` date NOT NULL,
  `date_of_update` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_productvariant_product_id_43c5a310_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_productvariant_product_id_43c5a310_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `product_productvariant_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productvariant`
--

LOCK TABLES `product_productvariant` WRITE;
/*!40000 ALTER TABLE `product_productvariant` DISABLE KEYS */;
INSERT INTO `product_productvariant` VALUES (5,'0.5 POUND',5,6,'2023-10-11','2023-10-12'),(6,'1 POUND',5,6,'2023-10-11','2023-10-12'),(7,'0.5 POUND',5,7,'2023-10-11','2023-10-12'),(8,'1 POUND',5,7,'2023-10-11','2023-10-12'),(9,'0.5 POUND',5,8,'2023-10-11','2023-10-12'),(10,'1 POUND',5,8,'2023-10-11','2023-10-12'),(11,'0.5 POUND',5,9,'2023-10-11','2023-10-12'),(12,'1 POUND',5,9,'2023-10-11','2023-10-12'),(13,'0.5 POUND',5,10,'2023-10-11','2023-10-12'),(14,'1 POUND',5,10,'2023-10-11','2023-10-12'),(15,'0.5 POUND',5,11,'2023-10-13','2023-10-13'),(16,'1 POUND',5,11,'2023-10-13','2023-10-13'),(17,'0.5 POUND',5,12,'2023-10-13','2023-10-13'),(18,'1 POUND',5,12,'2023-10-13','2023-10-13'),(19,'0.5 POUND',5,13,'2023-10-13','2023-10-13'),(20,'1 POUND',5,13,'2023-10-13','2023-10-13'),(21,'0.5 POUND',5,14,'2023-10-13','2023-10-13'),(22,'1 POUND',5,14,'2023-10-13','2023-10-13'),(23,'0.5 POUND',5,15,'2023-10-13','2023-10-13'),(24,'1 POUND',5,15,'2023-10-13','2023-10-13'),(25,'0.5 POUND',5,16,'2023-10-14','2023-10-14'),(26,'1 POUND',5,16,'2023-10-14','2023-10-14'),(27,'0.5 POUND',5,17,'2023-10-14','2023-10-14'),(28,'1 POUND',5,17,'2023-10-14','2023-10-14'),(29,'0.5 POUND',5,18,'2023-10-14','2023-10-14'),(30,'1 POUND',5,18,'2023-10-14','2023-10-14'),(31,'0.5 POUND',5,19,'2023-10-14','2023-10-14'),(32,'1 POUND',5,19,'2023-10-14','2023-10-14'),(33,'0.5 POUND',5,20,'2023-10-14','2023-10-14'),(34,'1 POUND',5,20,'2023-10-14','2023-10-14'),(35,'0.5 POUND',5,21,'2023-10-14','2023-10-14'),(36,'1 POUND',5,21,'2023-10-14','2023-10-14'),(37,'0.5 POUND',5,22,'2023-10-14','2023-10-14'),(38,'1 POUND',5,22,'2023-10-14','2023-10-14'),(39,'0.5 POUND',5,23,'2023-10-14','2023-10-14'),(40,'1 POUND',5,23,'2023-10-14','2023-10-14'),(41,'0.5 POUND',5,24,'2023-10-14','2023-10-14'),(42,'1 POUND',5,24,'2023-10-14','2023-10-14'),(43,'0.5 POUND',5,25,'2023-10-14','2023-10-14'),(44,'1 POUND',5,25,'2023-10-14','2023-10-14'),(45,'0.5 POUND',5,26,'2023-10-14','2023-10-14'),(46,'1 POUND',5,26,'2023-10-14','2023-10-14'),(47,'0.5 POUND',5,27,'2023-10-14','2023-10-14'),(48,'1 POUND',5,27,'2023-10-14','2023-10-14'),(49,'Black',5,28,'2023-10-14','2023-10-14'),(50,'Black',3,29,'2023-10-14','2023-10-14'),(51,'Black',3,30,'2023-10-14','2023-10-14'),(52,'Black',2,31,'2023-10-14','2023-10-14'),(53,'Black',3,32,'2023-10-14','2023-10-14'),(54,'Black',4,33,'2023-10-14','2023-10-14'),(55,'Black',5,34,'2023-10-14','2023-10-14'),(56,'Black',5,35,'2023-10-14','2023-10-14'),(57,'Green',3,36,'2023-10-14','2023-10-14'),(58,'Black',4,37,'2023-10-14','2023-10-14'),(59,'Black',2,38,'2023-10-14','2023-10-14'),(60,'Black',6,39,'2023-10-14','2023-10-14'),(61,'Green',3,40,'2023-10-14','2023-10-14'),(62,'τ¢ÆΦú¥',3,41,'2023-10-14','2023-10-14'),(63,'τ¢ÆΦú¥',3,42,'2023-10-14','2023-10-14'),(64,'τ¢ÆΦú¥',5,43,'2023-10-14','2023-10-14'),(65,'τ¢ÆΦú¥',5,44,'2023-10-14','2023-10-14'),(66,'τ¢ÆΦú¥',5,45,'2023-10-14','2023-10-14'),(67,'τ¢ÆΦú¥',5,46,'2023-10-14','2023-10-14'),(68,'0.5 POUND',3,47,'2023-10-14','2023-10-14'),(69,'0.5 POUND',3,48,'2023-10-14','2023-10-14');
/*!40000 ALTER TABLE `product_productvariant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-20 18:29:34
