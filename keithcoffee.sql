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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$GjumVG8m1yABdfdElKVLCG$yHBoE+bVF0Q59m6xJDhikcsWFMh2JUbGJm9OmyrXktk=','2023-10-12 08:44:34.003823',1,'keith','','','keithlee870507@gmail.com',1,1,'2023-10-08 18:09:52.479554');
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
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-08 18:35:37.653139','1','咖啡',1,'[{\"added\": {}}]',7,1),(2,'2023-10-08 18:35:50.280592','2','咖啡',1,'[{\"added\": {}}]',7,1),(3,'2023-10-08 18:40:38.628951','4','a',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"a\"}}]',8,1),(4,'2023-10-08 18:40:58.620542','1','咖啡',3,'',7,1),(5,'2023-10-08 18:44:21.401419','5','asda',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"asda\"}}]',8,1),(6,'2023-10-08 18:45:25.982578','5','asda',3,'',8,1),(7,'2023-10-08 18:45:31.243301','4','a',3,'',8,1),(8,'2023-10-11 06:33:39.170539','3','花 & 月',1,'[{\"added\": {}}]',7,1),(9,'2023-10-11 06:39:38.954796','6','Jan - 康乃馨 中深培',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jan - \\u5eb7\\u4e43\\u99a8 \\u4e2d\\u6df1\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jan - \\u5eb7\\u4e43\\u99a8 \\u4e2d\\u6df1\\u57f9\"}}]',8,1),(10,'2023-10-11 06:40:43.527543','4','花&月',1,'[{\"added\": {}}]',7,1),(11,'2023-10-11 06:40:46.415859','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,1),(12,'2023-10-11 06:43:18.112609','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7c21\\u4ecb\"]}}]',8,1),(13,'2023-10-11 06:47:55.767599','7','Feb - 紫羅蘭',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Feb - \\u7d2b\\u7f85\\u862d\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Feb - \\u7d2b\\u7f85\\u862d\"}}]',8,1),(14,'2023-10-11 06:48:07.635688','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(15,'2023-10-11 06:53:06.495656','8','Mar - 水仙花 深培',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Mar - \\u6c34\\u4ed9\\u82b1 \\u6df1\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Mar - \\u6c34\\u4ed9\\u82b1 \\u6df1\\u57f9\"}}]',8,1),(16,'2023-10-11 06:55:18.069445','9','Apr - 鈴蘭 中培',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Apr - \\u9234\\u862d \\u4e2d\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Apr - \\u9234\\u862d \\u4e2d\\u57f9\"}}]',8,1),(17,'2023-10-11 06:58:57.931498','10','Apr - 櫻花 淺培',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Apr - \\u6afb\\u82b1 \\u6dfa\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Apr - \\u6afb\\u82b1 \\u6dfa\\u57f9\"}}]',8,1),(18,'2023-10-11 06:59:05.667698','9','May - 鈴蘭 中培',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(19,'2023-10-11 07:57:59.220102','10','Apr - 櫻花 淺培',2,'[]',8,1),(20,'2023-10-11 07:58:48.808392','10','Apr - 櫻花 淺培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(21,'2023-10-11 07:59:04.106343','6','Jan - 康乃馨 中深培',2,'[]',8,1),(22,'2023-10-11 07:59:08.963936','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(23,'2023-10-11 08:00:01.457903','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(24,'2023-10-11 08:02:56.623032','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(25,'2023-10-11 08:03:23.787397','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(26,'2023-10-11 08:12:52.221639','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(27,'2023-10-11 08:13:16.616540','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(28,'2023-10-11 08:15:36.622327','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(29,'2023-10-11 08:19:31.257323','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(30,'2023-10-11 08:19:53.404872','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(31,'2023-10-11 08:20:01.010282','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(32,'2023-10-11 08:20:04.302432','8','Mar - 水仙花 深培',2,'[]',8,1),(33,'2023-10-11 08:20:08.235155','10','Apr - 櫻花 淺培',2,'[]',8,1),(34,'2023-10-11 08:20:15.751072','10','Apr - 櫻花 淺培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(35,'2023-10-11 08:20:43.369240','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(36,'2023-10-11 08:22:42.237721','8','Mar - 水仙花 深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(37,'2023-10-11 08:23:34.727284','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(38,'2023-10-11 08:25:05.728460','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(39,'2023-10-11 08:34:24.000171','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(40,'2023-10-11 08:36:31.796092','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(41,'2023-10-11 09:46:49.747379','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(42,'2023-10-11 09:55:30.689415','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(43,'2023-10-11 09:59:15.888958','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(44,'2023-10-11 10:02:02.182984','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(45,'2023-10-11 10:06:51.115219','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(46,'2023-10-11 10:07:00.782318','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(47,'2023-10-11 10:07:44.979305','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(48,'2023-10-11 10:07:50.395510','9','May - 鈴蘭 中培',2,'[]',8,1),(49,'2023-10-11 10:12:05.928362','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(50,'2023-10-11 10:12:14.689788','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(51,'2023-10-11 10:12:37.960350','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(52,'2023-10-11 10:17:06.296107','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(53,'2023-10-11 10:17:25.775538','9','May - 鈴蘭 中培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(54,'2023-10-11 10:21:14.740214','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(55,'2023-10-11 10:29:21.925393','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(56,'2023-10-11 10:31:33.190276','9','May - 鈴蘭 中培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(57,'2023-10-11 10:31:41.412745','9','May - 鈴蘭 中培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(58,'2023-10-11 10:31:52.869442','8','Mar - 水仙花 深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(59,'2023-10-11 11:12:30.580941','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(60,'2023-10-11 11:12:38.589287','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(61,'2023-10-11 11:12:46.586948','8','Mar - 水仙花 深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(62,'2023-10-11 11:13:36.196240','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(63,'2023-10-11 11:13:41.079295','8','Mar - 水仙花 深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(64,'2023-10-11 11:13:46.687685','9','May - 鈴蘭 中培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(65,'2023-10-11 11:13:52.055187','10','Apr - 櫻花 淺培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(66,'2023-10-11 11:14:31.054725','3','花 & 月',3,'',7,1),(67,'2023-10-11 11:14:31.058919','2','咖啡',3,'',7,1),(68,'2023-10-11 11:15:48.878027','5','FLM',1,'[{\"added\": {}}]',7,1),(69,'2023-10-11 11:20:53.949503','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(70,'2023-10-11 11:21:24.209529','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(71,'2023-10-11 11:23:23.866675','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(72,'2023-10-11 11:23:36.002788','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(73,'2023-10-11 11:26:14.419719','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(74,'2023-10-11 11:26:49.547643','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(75,'2023-10-11 11:29:06.898963','10','Apr - 櫻花 淺培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(76,'2023-10-11 11:29:13.483107','8','Mar - 水仙花 深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(77,'2023-10-11 11:29:18.661148','9','May - 鈴蘭 中培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(78,'2023-10-11 11:29:24.314033','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(79,'2023-10-11 11:38:40.729433','6','Jan - 康乃馨 中深培',2,'[]',8,1),(80,'2023-10-11 11:39:08.536411','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(81,'2023-10-11 11:39:11.661229','8','Mar - 水仙花 深培',2,'[]',8,1),(82,'2023-10-11 11:39:23.919415','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(83,'2023-10-11 11:39:30.368531','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(84,'2023-10-11 11:39:41.499593','8','Mar - 水仙花 深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(85,'2023-10-11 11:39:48.988064','10','Apr - 櫻花 淺培',2,'[]',8,1),(86,'2023-10-11 11:40:14.062265','10','Apr - 櫻花 淺培',2,'[]',8,1),(87,'2023-10-11 11:43:28.618667','9','May - 鈴蘭 中培',2,'[]',8,1),(88,'2023-10-11 11:43:34.418665','8','Mar - 水仙花 深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(89,'2023-10-11 11:43:38.601187','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(90,'2023-10-11 11:43:41.766215','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(91,'2023-10-11 12:15:33.083148','10','Apr - 櫻花 淺培',2,'[]',8,1),(92,'2023-10-12 06:01:20.485305','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Jan - \\u5eb7\\u4e43\\u99a8 \\u4e2d\\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Jan - \\u5eb7\\u4e43\\u99a8 \\u4e2d\\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(93,'2023-10-12 06:01:27.407244','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Feb - \\u7d2b\\u7f85\\u862d \\u4e2d\\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Feb - \\u7d2b\\u7f85\\u862d \\u4e2d\\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(94,'2023-10-12 06:01:47.992389','8','Mar - 水仙花 深培',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Mar - \\u6c34\\u4ed9\\u82b1 \\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Mar - \\u6c34\\u4ed9\\u82b1 \\u6df1\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(95,'2023-10-12 06:01:53.098248','9','May - 鈴蘭 中培',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"May - \\u9234\\u862d \\u4e2d\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"May - \\u9234\\u862d \\u4e2d\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(96,'2023-10-12 06:01:57.775297','10','Apr - 櫻花 淺培',2,'[{\"changed\": {\"name\": \"product variant\", \"object\": \"Apr - \\u6afb\\u82b1 \\u6dfa\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}, {\"changed\": {\"name\": \"product variant\", \"object\": \"Apr - \\u6afb\\u82b1 \\u6dfa\\u57f9\", \"fields\": [\"\\u5c3a\\u5bf8\"]}}]',8,1),(97,'2023-10-12 06:31:26.202148','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7522\\u54c1\\u72c0\\u614b\"]}}]',8,1),(98,'2023-10-12 06:31:34.549756','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7522\\u54c1\\u72c0\\u614b\"]}}]',8,1),(99,'2023-10-12 18:43:07.995932','6','CSA',1,'[{\"added\": {}}]',7,1),(100,'2023-10-12 19:06:39.370360','11','哥倫比亞  Columbia  中培',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u502b\\u6bd4\\u4e9e  Columbia  \\u4e2d\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u502b\\u6bd4\\u4e9e  Columbia  \\u4e2d\\u57f9\"}}]',8,1),(101,'2023-10-12 19:15:29.665815','12','哥斯大黎加 Costa Rica  淺培',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u65af\\u5927\\u9ece\\u52a0 Costa Rica  \\u6dfa\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u65af\\u5927\\u9ece\\u52a0 Costa Rica  \\u6dfa\\u57f9\"}}]',8,1),(102,'2023-10-12 19:17:09.392806','13','宏都拉斯 Honduras  中淺培',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5b8f\\u90fd\\u62c9\\u65af Honduras  \\u4e2d\\u6dfa\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5b8f\\u90fd\\u62c9\\u65af Honduras  \\u4e2d\\u6dfa\\u57f9\"}}]',8,1),(103,'2023-10-12 19:19:19.673289','14','尼加拉瓜 Nicaragua  中淺焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5c3c\\u52a0\\u62c9\\u74dc Nicaragua  \\u4e2d\\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5c3c\\u52a0\\u62c9\\u74dc Nicaragua  \\u4e2d\\u6dfa\\u7119\"}}]',8,1),(104,'2023-10-12 19:20:52.724108','15','巴拿馬 Panama  中深焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5df4\\u62ff\\u99ac Panama  \\u4e2d\\u6df1\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5df4\\u62ff\\u99ac Panama  \\u4e2d\\u6df1\\u7119\"}}]',8,1),(105,'2023-10-13 07:33:11.070260','4','花&月',3,'',7,1),(106,'2023-10-13 16:41:29.535024','7','BFLM',1,'[{\"added\": {}}]',7,1),(107,'2023-10-13 16:41:35.198621','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(108,'2023-10-13 16:41:42.378779','6','Jan - 康乃馨 中深培',2,'[]',8,1),(109,'2023-10-13 16:41:51.798231','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,1),(110,'2023-10-13 16:42:35.287415','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,1),(111,'2023-10-13 16:42:42.135467','7','Feb - 紫羅蘭 中深培',2,'[]',8,1),(112,'2023-10-13 16:42:48.623696','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(113,'2023-10-13 16:43:04.306665','7','Feb - 紫羅蘭 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\"]}}]',8,1),(114,'2023-10-13 16:44:02.035052','6','Jan - 康乃馨 中深培',2,'[{\"changed\": {\"fields\": [\"\\u7de8\\u865f\", \"Category\"]}}]',8,1),(115,'2023-10-13 17:54:33.789999','16','Jun - 玫瑰花  淺焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jun - \\u73ab\\u7470\\u82b1  \\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jun - \\u73ab\\u7470\\u82b1  \\u6dfa\\u7119\"}}]',8,1),(116,'2023-10-13 17:55:03.658150','6','Jan - 康乃馨 中深焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(117,'2023-10-13 17:55:13.238539','7','Feb - 紫羅蘭 中深焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(118,'2023-10-13 17:55:20.598750','8','Mar - 水仙花 深焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(119,'2023-10-13 17:55:25.210139','8','Mar - 水仙花 深焙',2,'[]',8,1),(120,'2023-10-13 17:55:35.947276','9','May - 鈴蘭 中焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(121,'2023-10-13 17:55:44.400285','10','Apr - 櫻花 淺焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(122,'2023-10-13 17:55:50.437635','11','哥倫比亞  Columbia  中焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(123,'2023-10-13 17:55:55.958341','12','哥斯大黎加 Costa Rica  淺焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(124,'2023-10-13 17:56:02.642945','13','宏都拉斯 Honduras  中淺焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(125,'2023-10-13 17:56:29.046322','16','Jun - 玫瑰花  淺焙',2,'[]',8,1),(126,'2023-10-13 17:58:15.081689','17','Jul - 飛燕草  遣焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jul - \\u98db\\u71d5\\u8349  \\u9063\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Jul - \\u98db\\u71d5\\u8349  \\u9063\\u7119\"}}]',8,1),(127,'2023-10-13 17:58:32.225944','6','Jan - 康乃馨 中深焙',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(128,'2023-10-13 17:58:46.528540','7','Feb - 紫羅蘭 中深焙',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(129,'2023-10-13 17:59:01.632085','8','Mar - 水仙花 深焙',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(130,'2023-10-13 17:59:11.831368','10','Apr - 櫻花 淺焙',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(131,'2023-10-13 17:59:19.000743','9','May - 鈴蘭 中焙',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(132,'2023-10-13 18:00:01.757536','17','Jul - 飛燕草  淺焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\", \"Image\"]}}]',8,1),(133,'2023-10-13 18:00:12.250738','16','Jun - 玫瑰花  淺焙',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(134,'2023-10-13 18:01:31.826642','18','Aug - 劍蘭  中淺焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Aug - \\u528d\\u862d  \\u4e2d\\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Aug - \\u528d\\u862d  \\u4e2d\\u6dfa\\u7119\"}}]',8,1),(135,'2023-10-13 18:02:29.090804','19','Sep - 紫苑花  中焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Sep - \\u7d2b\\u82d1\\u82b1  \\u4e2d\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Sep - \\u7d2b\\u82d1\\u82b1  \\u4e2d\\u7119\"}}]',8,1),(136,'2023-10-13 18:04:20.473173','20','Oct - 金盞花  中焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Oct - \\u91d1\\u76de\\u82b1  \\u4e2d\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Oct - \\u91d1\\u76de\\u82b1  \\u4e2d\\u7119\"}}]',8,1),(137,'2023-10-13 18:07:32.396200','21','Nov - 菊花  淺焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Nov - \\u83ca\\u82b1  \\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Nov - \\u83ca\\u82b1  \\u6dfa\\u7119\"}}]',8,1),(138,'2023-10-13 18:08:05.978648','20','Oct - 金盞花  中焙',2,'[{\"changed\": {\"fields\": [\"\\u63cf\\u8ff0\"]}}]',8,1),(139,'2023-10-13 18:08:22.933202','19','Sep - 紫苑花  中焙',2,'[{\"changed\": {\"fields\": [\"\\u63cf\\u8ff0\"]}}]',8,1),(140,'2023-10-13 18:08:58.087644','21','Nov - 菊花  淺焙',2,'[]',8,1),(141,'2023-10-13 18:10:17.911215','22','Dec - 風信子',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Dec - \\u98a8\\u4fe1\\u5b50\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"Dec - \\u98a8\\u4fe1\\u5b50\"}}]',8,1),(142,'2023-10-13 18:10:31.953990','7','BFLM',3,'',7,1),(143,'2023-10-13 18:19:06.623195','8','AFR',1,'[{\"added\": {}}]',7,1),(144,'2023-10-13 18:20:13.858165','15','巴拿馬  中深焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(145,'2023-10-13 18:20:30.994846','14','尼加拉瓜  中淺焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(146,'2023-10-13 18:20:37.014443','13','宏都拉斯  中淺焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(147,'2023-10-13 18:20:42.133149','12','哥斯大黎加  淺焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(148,'2023-10-13 18:20:47.936396','11','哥倫比亞  中焙',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(149,'2023-10-13 18:22:16.513047','23','肯亞  中淺焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u80af\\u4e9e  \\u4e2d\\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u80af\\u4e9e  \\u4e2d\\u6dfa\\u7119\"}}]',8,1),(150,'2023-10-13 18:23:12.905949','24','盧安達  中深焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u76e7\\u5b89\\u9054  \\u4e2d\\u6df1\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u76e7\\u5b89\\u9054  \\u4e2d\\u6df1\\u7119\"}}]',8,1),(151,'2023-10-13 18:31:07.037891','25','坦尚尼亞  中深培',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5766\\u5c1a\\u5c3c\\u4e9e  \\u4e2d\\u6df1\\u57f9\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5766\\u5c1a\\u5c3c\\u4e9e  \\u4e2d\\u6df1\\u57f9\"}}]',8,1),(152,'2023-10-13 18:31:55.160004','26','衣索比亞  中淺焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u8863\\u7d22\\u6bd4\\u4e9e  \\u4e2d\\u6dfa\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u8863\\u7d22\\u6bd4\\u4e9e  \\u4e2d\\u6dfa\\u7119\"}}]',8,1),(153,'2023-10-13 18:33:29.562421','27','辛巴威  中深焙',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u8f9b\\u5df4\\u5a01  \\u4e2d\\u6df1\\u7119\"}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u8f9b\\u5df4\\u5a01  \\u4e2d\\u6df1\\u7119\"}}]',8,1),(154,'2023-10-13 18:42:41.132359','9','POV',1,'[{\"added\": {}}]',7,1),(155,'2023-10-13 18:43:15.048389','28','暗調盅 Subdued Brew',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6697\\u8abf\\u76c5 Subdued Brew\"}}]',8,1),(156,'2023-10-13 18:44:49.498405','29','漆墨杯 Inkwell Mug',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6f06\\u58a8\\u676f Inkwell Mug\"}}]',8,1),(157,'2023-10-13 18:45:29.253391','30','黑幕杯 Noir Screen',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u9ed1\\u5e55\\u676f Noir Screen\"}}]',8,1),(158,'2023-10-13 18:46:21.208396','31','黑陶杯 Ebony Ceramic',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u9ed1\\u9676\\u676f Ebony Ceramic\"}}]',8,1),(159,'2023-10-13 18:46:28.219640','29','漆墨杯 Inkwell',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u7a31\"]}}]',8,1),(160,'2023-10-13 18:50:32.007351','10','SNK',1,'[{\"added\": {}}]',7,1),(161,'2023-10-13 18:50:58.300133','32','幽墨 Inkwell Elegance',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5e7d\\u58a8 Inkwell Elegance\"}}]',8,1),(162,'2023-10-13 18:51:38.583909','33','暗馥 Subtle Aroma Infuser',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6697\\u99a5 Subtle Aroma Infuser\"}}]',8,1),(163,'2023-10-13 18:52:12.343577','34','翠煙 Emerald Mist Brewer',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u7fe0\\u7159 Emerald Mist Brewer\"}}]',8,1),(164,'2023-10-13 18:53:01.093457','35','花影 Blossom Shadow',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u82b1\\u5f71 Blossom Shadow\"}}]',8,1),(165,'2023-10-13 18:58:31.436672','11','GRI',1,'[{\"added\": {}}]',7,1),(166,'2023-10-13 18:58:59.621899','36','匠 Artisan',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5320 Artisan\"}}]',8,1),(167,'2023-10-13 18:59:42.795015','37','悅 Harmony',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6085 Harmony\"}}]',8,1),(168,'2023-10-13 19:00:21.347422','38','旋 Spiral',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u65cb Spiral\"}}]',8,1),(169,'2023-10-13 19:00:56.993963','39','紋 Pattern',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u7d0b Pattern\"}}]',8,1),(170,'2023-10-13 19:01:34.878109','40','馨 Serene',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u99a8 Serene\"}}]',8,1),(171,'2023-10-13 19:07:44.686038','12','CGB',1,'[{\"added\": {}}]',7,1),(172,'2023-10-13 19:08:18.379417','41','哥倫比亞禮盒',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u54e5\\u502b\\u6bd4\\u4e9e\\u79ae\\u76d2\"}}]',8,1),(173,'2023-10-13 19:08:56.705187','42','櫻花禮盒',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6afb\\u82b1\\u79ae\\u76d2\"}}]',8,1),(174,'2023-10-13 19:09:30.398157','43','水仙花禮盒',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u6c34\\u4ed9\\u82b1\\u79ae\\u76d2\"}}]',8,1),(175,'2023-10-13 19:09:59.493850','44','紫苑花禮盒',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u7d2b\\u82d1\\u82b1\\u79ae\\u76d2\"}}]',8,1),(176,'2023-10-13 19:10:39.335536','45','菊花禮盒',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u83ca\\u82b1\\u79ae\\u76d2\"}}]',8,1),(177,'2023-10-13 19:11:37.463989','46','菊花禮盒 限量',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u83ca\\u82b1\\u79ae\\u76d2 \\u9650\\u91cf\"}}]',8,1),(178,'2023-10-13 19:15:59.446488','13','EDI',1,'[{\"added\": {}}]',7,1),(179,'2023-10-13 19:16:35.833068','47','康乃馨 特別版',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u5eb7\\u4e43\\u99a8 \\u7279\\u5225\\u7248\"}}]',8,1),(180,'2023-10-13 19:17:08.027115','48','紫羅蘭 特別版',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product variant\", \"object\": \"\\u7d2b\\u7f85\\u862d \\u7279\\u5225\\u7248\"}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-08 18:09:06.898996'),(2,'auth','0001_initial','2023-10-08 18:09:07.269055'),(3,'admin','0001_initial','2023-10-08 18:09:07.384039'),(4,'admin','0002_logentry_remove_auto_add','2023-10-08 18:09:07.389693'),(5,'admin','0003_logentry_add_action_flag_choices','2023-10-08 18:09:07.396761'),(6,'contenttypes','0002_remove_content_type_name','2023-10-08 18:09:07.469188'),(7,'auth','0002_alter_permission_name_max_length','2023-10-08 18:09:07.510962'),(8,'auth','0003_alter_user_email_max_length','2023-10-08 18:09:07.559011'),(9,'auth','0004_alter_user_username_opts','2023-10-08 18:09:07.574532'),(10,'auth','0005_alter_user_last_login_null','2023-10-08 18:09:07.648775'),(11,'auth','0006_require_contenttypes_0002','2023-10-08 18:09:07.669913'),(12,'auth','0007_alter_validators_add_error_messages','2023-10-08 18:09:07.669913'),(13,'auth','0008_alter_user_username_max_length','2023-10-08 18:09:07.717880'),(14,'auth','0009_alter_user_last_name_max_length','2023-10-08 18:09:07.758927'),(15,'auth','0010_alter_group_name_max_length','2023-10-08 18:09:07.798973'),(16,'auth','0011_update_proxy_permissions','2023-10-08 18:09:07.812538'),(17,'auth','0012_alter_user_first_name_max_length','2023-10-08 18:09:07.876101'),(18,'product','0001_initial','2023-10-08 18:09:08.118914'),(19,'sessions','0001_initial','2023-10-08 18:09:08.149035'),(20,'product','0002_alter_product_code_alter_product_product_desc_and_more','2023-10-08 18:18:07.858983'),(21,'product','0003_alter_product_code','2023-10-08 18:19:36.849315'),(22,'product','0004_alter_productvariant_options_and_more','2023-10-08 18:31:53.076019'),(23,'product','0005_alter_category_name_alter_productvariant_color','2023-10-08 18:38:01.438640'),(24,'product','0006_alter_product_code','2023-10-10 05:20:33.581202'),(25,'product','0007_alter_productvariant_size','2023-10-11 06:38:31.653856'),(26,'product','0008_alter_product_code','2023-10-11 06:47:31.083521'),(27,'product','0009_alter_product_code','2023-10-11 10:12:23.269659'),(28,'product','0010_alter_product_code','2023-10-11 11:41:38.676616'),(29,'product','0011_alter_product_code','2023-10-11 11:41:38.739517'),(30,'product','0012_alter_product_options_product_status_and_more','2023-10-11 12:15:05.348612'),(31,'product','0013_alter_product_options_alter_product_status','2023-10-12 07:27:07.620998'),(32,'product','0014_remove_productvariant_color_and_more','2023-10-12 18:26:51.759993'),(33,'Home','0001_initial','2023-10-12 18:26:51.860442'),(34,'product','0015_alter_product_code','2023-10-12 19:06:33.777454');
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
INSERT INTO `django_session` VALUES ('ppeiiomnm8z29nlskao85uznlji7mi5c','.eJxVjEEOwiAQRe_C2hCgII5L9z0DmWFAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnEVWpx-N8L4THUH_MB6bzK2uswTyV2RB-1ybJxet8P9OyjYy1ZT1vZsLkwDMOQ8sFPJDdZbVJoo27RxBh8RwXqIishkY9j4bJTW4MTnC_NwN_s:1qpYGk:w6I0G9JdYBbAX5Kjzu0NG6q7wArSUqLHlNOaiOIHy9o','2023-10-22 18:12:46.272165'),('qesrhk9nn5laey2yo8kp0lajg168a8x3','.eJxVjEEOwiAQRe_C2hCgII5L9z0DmWFAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnEVWpx-N8L4THUH_MB6bzK2uswTyV2RB-1ybJxet8P9OyjYy1ZT1vZsLkwDMOQ8sFPJDdZbVJoo27RxBh8RwXqIishkY9j4bJTW4MTnC_NwN_s:1qqrJ4:OLsj5zeENSurmLISPZZ2LUvtP8xSa64ua6jeI360hcc','2023-10-26 08:44:34.006644');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (5,'FLM'),(6,'CSA'),(8,'AFR'),(9,'POV'),(10,'SNK'),(11,'GRI'),(12,'CGB'),(13,'EDI');
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
INSERT INTO `product_product` VALUES (6,'Jan - 康乃馨 中深焙','康乃馨代表著「愛」、「希望」、「幸運」和「純潔」。','康乃馨風格的咖啡以其獨特的花香聞名。 每一杯都散發出康乃馨花朵的柔和清香，彷彿置身於花園之中。 這令人陶醉的香氣使人心情愉悅，為您的日常生活增添了一抹浪漫。\r\n\r\n康乃馨咖啡的色澤如同康乃馨花瓣一般，柔和的粉紅色或深淺不一的玫瑰色，充滿溫和和溫馨的感覺。 它在杯中波浪般晃動，如同康乃馨花瓣在微風中搖曳。\r\n\r\n口感上，康乃馨咖啡的醇厚和花香完美融合，令人陶醉。 每一口都充滿了康乃馨的溫柔，為您帶來溫馨的體驗。為您帶來令人愉悅的咖啡時光。 無論是自己品味，或是與親朋好友分享，它都能讓您感受到浪漫與溫情的融合。 這是一款充滿愛的咖啡，帶來溫馨的享受。','product_image/一月康乃馨_WX5aTbw.png',1200,'FLM - 0006','2023-10-11','2023-10-14',5,'o'),(7,'Feb - 紫羅蘭 中深焙','紫羅蘭的花語為「永恆的魅力」、象徵「智慧」、「謙遜」。','紫羅蘭風格的咖啡以其獨特的花香而聞名。 每一杯都洋溢著紫羅蘭花瓣的芬芳，彷彿走進了花園的仙境。 這種獨特的香氣是如此的神秘和令人陶醉，讓人感覺自己置身於一個花朵的海洋。\r\n\r\n紫羅蘭咖啡的色澤，常常呈現出深邃的紫羅蘭紫色，充滿了神秘感。 它的深沉色彩在杯中翻滾，彷彿是一縷紫羅蘭的花香被注入其中。\r\n\r\n口感上，紫羅蘭咖啡兼具咖啡的濃鬱和紫羅蘭的花香，每一口都如同一次神秘之旅，充滿了令人陶醉的口感。是一款充滿神秘感和嬌柔之美的咖啡。 它適合獨自享用，也適合與親朋好友一同品味。 這是一款充滿神秘魅力的咖啡，為您帶來絕妙的享受。','product_image/二月紫羅蘭_NE3ZYK8.png',1200,'FLM - 0007','2023-10-11','2023-10-14',5,'o'),(8,'Mar - 水仙花 深焙','黃色水仙花代表「重生」、「幸運」、「繁榮」和「友誼」。','水仙花咖啡以其清新芬芳而聞名。 每一杯都帶著水仙花瓣的淡雅香氣，彷彿漫步在春日花園。 這種獨特的花香是如此的清新宜人，讓人感覺自己沐浴在花海之中。\r\n\r\n水仙花咖啡的顏色也充滿了自然之美，它常常呈現出淡淡的水仙花黃，彷彿是一縷晨曦透過花瓣灑在杯中。水仙花咖啡帶有咖啡的濃鬱和水仙花的清雅，每一口都如同一次輕盈的花語，充滿了令人陶醉的口感。\r\n\r\n水仙花風格的咖啡產品，是一款充滿清新與自然之美的咖啡。 它適合在清晨享用，也適合在夏日午後與好友相聚。 這是一款如同水仙花般的咖啡，為您帶來清新宜人的享受。','product_image/三月水仙花_V9QGivj.png',1200,'FLM - 0008','2023-10-11','2023-10-14',5,'o'),(9,'May - 鈴蘭 中焙','溫柔爾雅的形象跟高雅純潔的鈴蘭和百合極為相襯。','鈴蘭風格的咖啡產品，如同那潔白的鈴蘭花，給人一種清新而純淨的感覺，是一杯真正的芳香之選。\r\n\r\n鈴蘭咖啡散發出柔和的花香，混合著咖啡的濃鬱，讓人彷彿置身於盛開的鈴蘭花叢之間。 這款清新的香氣讓您感受到大自然的寧靜和花園的宜人。\r\n\r\n色彩上，鈴蘭咖啡呈現出如同鈴蘭花瓣一樣的潔白色調，令人一見鍾情。 這種色彩代表純淨和清新，給人一種親近大自然的感受。鈴蘭咖啡兼具咖啡的濃鬱和鈴蘭的清新，每一口都像是漫步在花園中，充滿寧靜和愉悅。\r\n\r\n適合在寧靜的下午或與朋友分享時光。 它將帶給您宛如置身於花園中的愉悅感受，為您的咖啡時光增添一抹純淨與清新。','product_image/五月鈴蘭_zDuIFFc.png',1200,'FLM - 0009','2023-10-11','2023-10-14',5,'o'),(10,'Apr - 櫻花 淺焙','活著就要像櫻花一樣燦爛，即使是死，也應該果斷地離去。','櫻花咖啡以其芳香而聞名。 每一杯都散發著淡淡的櫻花香氣，如同櫻花樹下的輕柔風吹拂。 這款獨特的花香給人一種溫馨和浪漫的感覺，彷彿置身於櫻花大道之間。\r\n\r\n櫻花咖啡的顏色也令人陶醉，通常呈現出粉嫩的櫻花顏色，如同花瓣一般柔和。 這個溫暖的色調讓人感到愉悅，彷彿在春天的午後徜徉。\r\n\r\n櫻花咖啡有著咖啡的濃鬱和櫻花的溫柔，每一口都像是一次美麗的邂逅，充滿了夢幻和優雅。\r\n\r\n是一款充滿浪漫和夢幻的咖啡。 它適合在與愛人共度浪漫時光，也適合在尋找靈感的時候。 這是一款如同綻放的櫻花般的咖啡，為您帶來充滿優雅與幸福的享受。','product_image/四月櫻花_MXAhK8K.png',1200,'FLM - 0010','2023-10-11','2023-10-14',5,'o'),(11,'哥倫比亞  中焙','哥倫比亞，源自熱情的中南美洲，中烘焙，帶來綿密風味的咖啡饗宴','哥倫比亞，這片風景如畫的中南美洲之珍寶，以其卓越的咖啡豆而自豪。我們的中等烘焙呈現出多層次的風味，深受咖啡愛好者們的喜愛。哥倫比亞的咖啡融合了當地大地的鮮明特色，散發出柔和的酸度，伴隨著堅果、巧克力和水果的香氣，為您帶來一場美味之旅。在每一口中，您都能感受到這片土地的熱情和活力，彷彿漫遊在哥倫比亞的山谷和森林之中。哥倫比亞咖啡，是這片美麗土地的真實寫照，每一杯都是對當地農夫辛勤耕耘的致敬，以及對大自然慷慨的感恩之情。無論何時何地，哥倫比亞咖啡都將帶您深入體驗這個美麗國度的魅力，讓您享受一趟真實而美味的冒險之旅。','product_image/哥倫比亞_cJbKLNC.png',1000,'CSA - 0011','2023-10-13','2023-10-14',6,'o'),(12,'哥斯大黎加  淺焙','哥斯大黎加，淺培培度，綻放熱帶風情，豐富風味的代表。','哥斯大黎加的明亮烘培咖啡帶有極富層次的風味，充滿柑橘和莓果的香氣，伴隨著輕柔的焦糖和巧克力風味。我們的咖啡豆來自哥斯大黎加的高海拔農田，以精湛的烘培工藝展現其獨特風味。每一口都是一次美味之旅，讓您感受中南美洲的自然之美和新鮮感。哥斯大黎加，是咖啡愛好者的不可錯過之選，帶您深入熱帶風情，體驗咖啡的多樣性，一口一口都是對這片土地的尊敬和感恩之情。','product_image/哥斯大黎加.png',1000,'CSA - 0012','2023-10-13','2023-10-14',6,'o'),(13,'宏都拉斯  中淺焙','宏都拉斯，中淺培烘培，風味豐富，源自中南美洲的佳作。','宏都拉斯的豐富烘培咖啡帶有濃烈的風味，充滿堅果和巧克力的香氣，伴隨著深厚的焦糖和紅莓風味。我們的咖啡豆來自宏都拉斯的陽光沐浴農田，以精心製作的方式呈現出最佳風味。每一口都是一次充滿驚喜的品味之旅，帶您感受這片土地的熱情和活力。宏都拉斯的咖啡，是中南美洲的瑰寶，每一杯都是對辛勤農夫的致敬，以及對自然恩賜的感恩之情。無論何時何地，宏都拉斯咖啡都能為您帶來滿滿的滿足感，讓您享受純粹的美味。','product_image/宏都拉斯.png',1000,'CSA - 0013','2023-10-13','2023-10-14',6,'o'),(14,'尼加拉瓜  中淺焙','尼加拉瓜，中淺焙烘培，風味豐富，中南美洲之寶。','尼加拉瓜的豐盛烘培咖啡帶來豐富的風味，充滿可可和堅果的香氣，伴隨著淡淡的橙子和焦糖風味。 我們的咖啡豆來自尼加拉瓜的陽光沐浴農田，每一顆豆子都經過精心挑選，為您呈現最佳品質。 每一口都是中南美洲風景的迷人之旅，讓您感受這片土地的魅力。 尼加拉瓜咖啡，是咖啡愛好者的珍貴寶石，每一杯都是對這個美麗國度的致敬，以及對大自然慷慨的感恩之情。 無論您身在何處，尼加拉瓜咖啡都能帶您品味中南美洲最美好的風味。','product_image/尼加拉瓜.png',1000,'CSA - 0014','2023-10-13','2023-10-14',6,'o'),(15,'巴拿馬  中深焙','巴拿馬，中深焙烘培，綻放風味，中南美洲明珠。','巴拿馬的芳醇烘培咖啡帶來馥鬱的風味，散發出可可和杏仁的香氣，伴隨著微妙的橙子和焦糖風味。 我們的咖啡豆來自巴拿馬的陽光沐浴農田，每一顆豆子都經過精心製作，呈現最佳品質。 每一口都是充滿驚喜的品味之旅，讓您感受這片土地的魅力。 巴拿馬咖啡，是咖啡愛好者的珍貴寶石，每一杯都是對這個美麗國度的致敬，以及對大自然慷慨的感恩之情。 無論您身在何處，巴拿馬咖啡都能帶您品味中南美洲最美好的風味。','product_image/巴拿馬.png',1500,'CSA - 0015','2023-10-13','2023-10-14',6,'o'),(16,'Jun - 玫瑰花  淺焙','六月玫瑰，淡淡花香烘培，咖啡中的花園之舞。','六月玫瑰的淡淡花香烘培咖啡如同花園之舞，散發出迷人的花香。每一口都帶您穿越花朵盛開的季節，伴隨著輕柔的經典淺焙風味，散發出淡淡的茉莉、玫瑰和茶花的香氣。我們的咖啡豆嚴選自咖啡園，以精湛的烘焙工藝保留鮮花的香氣，為您帶來芬芳怡人的品味之旅。六月玫瑰，是咖啡與花融合的藝術品，是對自然之美的讚歌，一杯咖啡中的花園令人陶醉，品味其中每一層綿長的風情。','product_image/六月玫瑰_CnwMhmy.png',1200,'FLM - 0016','2023-10-14','2023-10-14',5,'o'),(17,'Jul - 飛燕草  淺焙','七月飛燕草，輕盈清新烘培，咖啡中的夏日微風。','輕盈清新烘培咖啡帶您走進夏日微風，感受陽光明媚。每一口都伴隨著淡淡的草香和水果的風味，猶如夏季花園的清新氣息。我們的咖啡豆精心挑選自咖啡園，以獨特的烘焙工藝保留清新風味，為您帶來一場輕盈的味蕾之旅。七月飛燕草，是咖啡中的夏季風景，是對夏日美好的讚歌，一杯咖啡中的夏日微風讓人心情愉悅，品味其中每一片陽光明媚。','product_image/七月飛燕草_CGaHYv6.png',1200,'FLM - 0017','2023-10-14','2023-10-14',5,'o'),(18,'Aug - 劍蘭  中淺焙','「力量」、「率真」、「堅持不懈」既是8月出生的朋友的特質。','八月劍蘭的清新風華烘培咖啡散發高貴風度，充滿優雅的風味。每一口都伴隨著清新的草本香氣和柔和的柑橘風味，彷彿置身花園之中。我們的咖啡豆精心來自咖啡園，經過精湛的烘焙工藝展現清新風華，為您帶來一場高貴優雅的味蕾之旅。八月劍蘭，是咖啡中的高貴花朵，是對優雅之美的讚歌，一杯咖啡中的高貴風度令人陶醉，品味其中每一層風華。','product_image/八月劍蘭.png',1200,'FLM - 0018','2023-10-14','2023-10-14',5,'o'),(19,'Sep - 紫苑花  中焙','雖然與小雛菊一樣同為陪襯用的小花，卻帶有不能漠視的自身魅力！','九月紫苑花的柔情淺淺烘培咖啡彷彿是咖啡中的溫馨之吻，帶來溫暖的風味。 每一口都伴隨著柔和的花香和淡淡的水果風味，彷彿漫步在秋日花田中。 我們的咖啡豆精心挑選自咖啡園，以精湛的烘焙工藝展現柔情深處的味蕾體驗，為您帶來一場溫暖的情感之旅。 九月紫苑花，是咖啡中的溫馨花朵，是對柔情之美的讚歌，一杯咖啡中的溫馨風味令人懷念，品味其中每一片柔情。','product_image/九月紫苑花.png',1200,'FLM - 0019','2023-10-14','2023-10-14',5,'o'),(20,'Oct - 金盞花  中焙','代表「熱情」、「創造力」、「成功」、「渴望」、旭日的美麗。','十月金盞花的金色陽光烘培咖啡帶來溫暖的希望，充滿陽光的風味。 每一口都伴隨著陽光烘焙風味，充滿柑橘和堅果的香氣，彷彿是金色秋日的象徵。 我們的咖啡豆精心挑選自咖啡園，以精湛的烘焙工藝為您呈現金色陽光的味蕾之旅。 十月金盞花，是咖啡中的溫暖希望，是對陽光之美的讚歌，一杯咖啡中的溫暖充滿希望，品味其中每一片陽光。','product_image/十月金盞花.png',1200,'FLM - 0020','2023-10-14','2023-10-14',5,'o'),(21,'Nov - 菊花  淺焙','11月份壽星跟菊花一樣圓圓滑滑，想法和口才都出眾。','十一月菊花的菊花淡香烘培咖啡帶來幽雅的風味，伴隨著淡淡的花香和微妙的茶葉風味，猶如漫步在秋日花園中。 我們的咖啡豆精心挑選自咖啡園，以獨特的烘焙工藝為您呈現菊花淡香的味蕾之旅。 十一月菊花，是咖啡中的幽雅風味，是對大自然之美的讚歌，一杯咖啡中的幽雅氛圍令人陶醉，品味其中每一層花香。','product_image/十一月菊花.png',1200,'FLM - 0021','2023-10-14','2023-10-14',5,'o'),(22,'Dec - 風信子','風信子的花語是「喜悅」、「愛意」和「堅定正直」。','十二月風信子的寧靜柔和烘培咖啡帶來寧靜之美，伴隨著淡淡的花香和柔和的水果風味，宛如漫步在冬季花園中。 我們的咖啡豆精心挑選自咖啡園，以精湛的烘焙工藝為您呈現寧靜柔和的味蕾之旅。 十二月風信子，是咖啡中的寧靜之美，是對冬季的頌歌，一杯咖啡中的寧靜氛圍令人平靜，品味其中每一層花香。','product_image/十二月風信子.png',1200,'FLM - 0022','2023-10-14','2023-10-14',5,'o'),(23,'肯亞  中淺焙','經典肯亞，香濃微淺烘，風味獨特。','肯亞咖啡以其令人難忘的風味而聞名，中淺烘焙使它保留了豐富的酸度和水果風味。您將品嚐到當地高原的精華，酸甜交織的滋味，令人陶醉。這種咖啡不僅代表著肯亞的風土人情，更是熱愛咖啡的人的首選。精心栽種，精湛的處理，以及獨特的土壤，結合在一起，創造出鮮明的桃子、黑醋栗和檸檬風味。中淺烘焙使其具有出色的酸度和完美的平衡，使每一杯變得特別而令人愉悅。','product_image/肯亞.png',900,'AFR - 0023','2023-10-14','2023-10-14',8,'o'),(24,'盧安達  中深焙','盧安達瑰麗，中深烘培，驚豔味覺。','盧安達的咖啡養分豐富，我們以中深烘焙方式為您帶來驚豔的味道，深厚而多層次，伴隨著堅果和巧克力的迷人風味。這款咖啡來自於千山萬峰之國，擁有多雨的氣候，使咖啡豆在成長過程中吸收大自然的精華。中深烘焙後，豆子散發著香甜的焦糖香氣，帶來引人入勝的杏仁和可可風味，以及清新的柑橘風味。','product_image/盧安達.png',900,'AFR - 0024','2023-10-14','2023-10-14',8,'o'),(25,'坦尚尼亞  中深培','坦尚尼亞，中深烘，非洲之珍。','坦尚尼亞的咖啡源自非洲之心，中深烘焙讓其成為非洲咖啡之珍，散發出堅果和深度巧克力風味。坦尚尼亞的咖啡栽培在高山的環境中，由於土壤的特性和經驗豐富的種植者，咖啡豆展現出多層次的風味。中深烘焙後，您將品嚐到深度巧克力、香草和橙子的濃郁風味，每一杯都是非洲風情的詩篇。','product_image/坦尚尼亞.png',900,'AFR - 0025','2023-10-14','2023-10-14',8,'o'),(26,'衣索比亞  中淺焙','衣索比亞，中淺烘，自然花果香。','衣索比亞是咖啡發源地之一，中淺烘焙帶來自然花果香，綿長的收結和亮麗的酸度，是咖啡愛好者的最愛。這款咖啡如詩如畫，中淺烘焙後，散發出茉莉、藍莓和柚子的馥郁香氣。每一杯都是一次探索，帶您飛越高山和叢林，體驗自然的花果風味。','product_image/衣索比亞.png',1000,'AFR - 0026','2023-10-14','2023-10-14',8,'o'),(27,'辛巴威  中深焙','辛巴威的咖啡特色是和肯亞類似有較強的酸度及水果的香味。','辛巴威咖啡獨具風味，中深烘培釋放出豐富的細膩風味，您將感受到溫暖的焦糖和堅果香氣，令人陶醉。這種咖啡來自於辛巴威的高山，豆子在高海拔和豐沛的降雨中茁壯成長。中深烘焙後，咖啡變得濃郁而多層次，伴隨著堅果、巧克力和紅果風味，為您呈現細膩的餘韻。','product_image/辛巴威.png',900,'AFR - 0027','2023-10-14','2023-10-14',8,'o'),(28,'暗調盅 Subdued Brew','暗調盅，簡約美感。','暗調盅是咖啡手沖濾杯的極致表現，以簡約美感融入你的咖啡時光。黑色的外觀融合了漆墨的深邃，仿佛一幅抽象藝術品。它悄悄彰顯你對咖啡的嚮往，每一次的手沖都如同一次藝術表演。','product_image/暗調盅.png',2000,'POV - 0028','2023-10-14','2023-10-14',9,'o'),(29,'漆墨杯 Inkwell','匯聚了藝術的靈感，其深邃的黑色外觀如同一個墨水瓶。','漆墨杯是獨一無二的咖啡手沖濾杯，像是你手中的一幅藝術品。其名取自中國傳統漆器工藝，黑如墨，深邃迷人。每次泡製，都是一場藝術的饗宴。漆墨杯擁有優異的保溫性能，確保你的咖啡在每一口都能夠如絲般順滑。','product_image/漆墨杯.png',1500,'POV - 0029','2023-10-14','2023-10-14',9,'o'),(30,'黑幕杯 Noir Screen','黑幕杯，咖啡的微光。','黑幕杯是一道咖啡的微光，如電影院裡的黑幕，只為呈現最純粹的咖啡體驗。黑陶的質感令你深陷其中，手沖過程就像是劇情的展開，每一次的咖啡都值得期待。黑幕杯的設計獨特，適合手沖和倒咖啡，為你帶來獨特的風味。','product_image/黑幕杯.png',1500,'POV - 0030','2023-10-14','2023-10-14',9,'o'),(31,'黑陶杯 Ebony Ceramic','黑陶杯，手感溫潤。','黑陶杯以溫潤的手感和極緻的工藝展現獨特的咖啡之美。它的名稱來自於黑陶的製作，杯身如同一件藝術品，在手中締造完美的咖啡時光。黑陶杯的特殊材質能夠保存咖啡的溫度和風味，每一口都充滿濃郁的層次感。','product_image/黑陶杯.png',2450,'POV - 0031','2023-10-14','2023-10-14',9,'o'),(32,'幽墨 Inkwell Elegance','幽墨，優雅如墨，為每位咖啡愛好者提供精湛的手沖體驗。','幽墨手沖壺以極簡的黑白色調設計，完美呈現藝術與功能的結合。其精緻細膩的不銹鋼濾網和優雅的手柄，使您每次的沖煮都如同一幅優美的水墨畫。','product_image/幽墨壺.png',2500,'SNK - 0032','2023-10-14','2023-10-14',10,'o'),(33,'暗馥 Subtle Aroma Infuser','綿密香氣，讓您的咖啡沖煮充滿藝術氛圍。','暗馥手沖壺以簡約而精湛的工藝打造，每一次的沖煮都是一場獨特的饗宴。其優美的曲線和高質感的陶瓷，使咖啡變得更加豐富和複雜。','product_image/暗馥壶.png',2500,'SNK - 0033','2023-10-14','2023-10-14',10,'o'),(34,'翠煙 Emerald Mist Brewer','翠煙，彷彿置身於綠意中，享受純粹的咖啡之美。','翠煙手沖壺帶來清新自然的咖啡體驗。其特有的玻璃設計，讓您觀察咖啡在壺中緩緩散發的美麗色澤。每一滴咖啡都彷彿一場大自然的探險。','product_image/翠煙壺.png',2600,'SNK - 0034','2023-10-14','2023-10-14',10,'o'),(35,'花影 Blossom Shadow','花影，如詩如畫，將咖啡沖煮升華為一種藝術。','花影手沖壺以簡約的設計與繪畫般的圖案背景相得益彰。每一次的沖煮都是一場如詩如畫的藝術表演，充滿著文青與時尚的氛圍。','product_image/花影壶.png',2700,'SNK - 0035','2023-10-14','2023-10-14',10,'o'),(36,'匠 Artisan','匠，擁有卓越的磨豆技藝，為咖啡愛好者帶來絕佳風味。','匠咖啡磨豆機是專為追求完美的咖啡烹製而設計。其精確的磨豆設定和堅固的不銹鋼刀片確保每一次磨豆都保持一致性和風味。它是獨立咖啡師和家用咖啡烹製者的理想之選。','product_image/匠.png',3000,'GRI - 0036','2023-10-14','2023-10-14',11,'o'),(37,'悅 Harmony','悅，將咖啡的和諧之美注入每一杯。','悅咖啡磨豆機以其平衡的性能而聞名。不論您是追求濃郁風味還是清新口感，悅都能滿足您的需求。其磨豆機頭設計簡約且易於清潔，是咖啡愛好者的好夥伴。','product_image/悅.png',3500,'GRI - 0037','2023-10-14','2023-10-14',11,'o'),(38,'旋 Spiral','旋，風味盡在掌握，融合創意的磨豆體驗。','旋咖啡磨豆機擁有獨特的螺旋式刀片設計，確保豆子被均勻磨成理想的粒度。它是創意咖啡廳和挑剔的烘焙師的選擇。無論您烹製濃郁濃縮咖啡還是清新美式咖啡，旋都能滿足您。','product_image/旋.png',3300,'GRI - 0038','2023-10-14','2023-10-14',11,'o'),(39,'紋 Pattern','紋，咖啡藝術的精髓，呈現風味的藝術品。','紋咖啡磨豆機以其獨特的花紋刀片而著稱，確保每一杯咖啡都是藝術品。它適用於對視覺和味覺同樣講究的咖啡師。磨出的咖啡粉潔白紋理分明，令人驚豔。','product_image/紋.png',2800,'GRI - 0039','2023-10-14','2023-10-14',11,'o'),(40,'馨 Serene','馨，帶來寧靜的咖啡體驗，充滿和平。','馨咖啡磨豆機是為追求寧靜環境中的咖啡愛好者設計的。其超靜音操作，低能耗，確保每一次的磨豆都充滿和平感。擁有一杯馨咖啡，享受寧靜時刻。','product_image/馨.png',4000,'GRI - 0040','2023-10-14','2023-10-14',11,'o'),(41,'哥倫比亞禮盒','哥倫比亞風味之旅。','這個咖啡禮盒將帶您踏上一場令人陶醉的哥倫比亞風味之旅。精選的哥倫比亞咖啡豆，在高海拔環境中種植，風味獨特。每一口都如同漫步在哥倫比亞的咖啡農場，品味到陽光、大地和豐收的滋味。讓您的味蕾隨著每杯而翱翔。','product_image/哥倫比亞禮盒.png',3300,'CGB - 0041','2023-10-14','2023-10-14',12,'o'),(42,'櫻花禮盒','春日盛開的咖啡。','這款禮盒彷彿是春天的一場盛大櫻花祭典。我們挑選了最優質的咖啡豆，帶有淡淡的櫻花芬芳。每一口咖啡都伴隨著花香，令人賞心悅目。這是春天的味道，無需等待季節，隨時都能品味。','product_image/櫻花禮盒.png',2500,'CGB - 0042','2023-10-14','2023-10-14',12,'o'),(43,'水仙花禮盒','優雅的花香咖啡。','水仙花禮盒，為您帶來一杯充滿優雅花香的咖啡饗宴。這款咖啡豆以水仙花的芬芳為靈感，口感清新宜人，彷彿置身於花園。咖啡中的花香馬上讓您沉浸在愜意的咖啡時光。','product_image/水仙花禮盒.png',3333,'CGB - 0043','2023-10-14','2023-10-14',12,'o'),(44,'紫苑花禮盒','寧靜的紫色之旅。','這個禮盒是一場寧靜的咖啡之旅，彷彿漫步在紫色的花海中。我們的咖啡豆經過精心挑選，帶有淡淡的紫苑花香。一杯咖啡將您帶入宁靜和平靜的境界，尋找心靈的寧靜。','product_image/紫苑花禮盒.png',3500,'CGB - 0044','2023-10-14','2023-10-14',12,'o'),(45,'菊花禮盒','菊花的優雅。','這款禮盒是對菊花的一場崇敬，將咖啡與菊花的優雅結合。每一口咖啡都帶有菊花的清香，如同漫步在花園中。這款咖啡將為您帶來優雅和芬芳的咖啡體驗。','product_image/菊花禮盒.png',2500,'CGB - 0045','2023-10-14','2023-10-14',12,'o'),(46,'菊花禮盒 限量','特別的花香驚喜。','這是一個特別版本的菊花禮盒，帶來更多令人驚喜的花香體驗。我們的咖啡與菊花交織，創造出令人難以置信的口感。每一口都是一場咖啡和花的盛宴，帶來甜蜜的享受。這是一份特別的禮物，為特別的人設計。','product_image/菊花禮盒-1.png',3333,'CGB - 0046','2023-10-14','2023-10-14',12,'o'),(47,'康乃馨 特別版','沉浸在花香的美好，康乃馨特別版帶您進入咖啡的花園。','康乃馨特別版，是一場充滿優雅的花香饗宴。我們精選的咖啡豆在焙燒過程中融合了康乃馨花瓣的香氣，帶來清新且令人愉悅的味道。每一口都如同在花園中漫遊，感受大自然的美好。這款特別版的咖啡絕對是所有花香愛好者的最愛。','product_image/康乃馨特別版.png',3600,'EDI - 0047','2023-10-14','2023-10-14',13,'o'),(48,'紫羅蘭 特別版','紫羅蘭的夢幻魅力，一杯特別版咖啡的紫色詩意。','紫羅蘭特別版，讓您的咖啡體驗充滿夢幻和神秘。我們的特別版咖啡豆以優雅的紫羅蘭花香為靈感，混合了大膽的風味。每一口都彷彿是一場踏入花海的夢境，帶來無限的愉悅。品味這款特別版咖啡，讓紫羅蘭的神奇魅力充滿您的杯中。','product_image/紫羅蘭特別版.png',4500,'EDI - 0048','2023-10-14','2023-10-14',13,'o');
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
INSERT INTO `product_productvariant` VALUES (5,'0.5 POUND',5,6,'2023-10-11','2023-10-12'),(6,'1 POUND',5,6,'2023-10-11','2023-10-12'),(7,'0.5 POUND',5,7,'2023-10-11','2023-10-12'),(8,'1 POUND',5,7,'2023-10-11','2023-10-12'),(9,'0.5 POUND',5,8,'2023-10-11','2023-10-12'),(10,'1 POUND',5,8,'2023-10-11','2023-10-12'),(11,'0.5 POUND',5,9,'2023-10-11','2023-10-12'),(12,'1 POUND',5,9,'2023-10-11','2023-10-12'),(13,'0.5 POUND',5,10,'2023-10-11','2023-10-12'),(14,'1 POUND',5,10,'2023-10-11','2023-10-12'),(15,'0.5 POUND',5,11,'2023-10-13','2023-10-13'),(16,'1 POUND',5,11,'2023-10-13','2023-10-13'),(17,'0.5 POUND',5,12,'2023-10-13','2023-10-13'),(18,'1 POUND',5,12,'2023-10-13','2023-10-13'),(19,'0.5 POUND',5,13,'2023-10-13','2023-10-13'),(20,'1 POUND',5,13,'2023-10-13','2023-10-13'),(21,'0.5 POUND',5,14,'2023-10-13','2023-10-13'),(22,'1 POUND',5,14,'2023-10-13','2023-10-13'),(23,'0.5 POUND',5,15,'2023-10-13','2023-10-13'),(24,'1 POUND',5,15,'2023-10-13','2023-10-13'),(25,'0.5 POUND',5,16,'2023-10-14','2023-10-14'),(26,'1 POUND',5,16,'2023-10-14','2023-10-14'),(27,'0.5 POUND',5,17,'2023-10-14','2023-10-14'),(28,'1 POUND',5,17,'2023-10-14','2023-10-14'),(29,'0.5 POUND',5,18,'2023-10-14','2023-10-14'),(30,'1 POUND',5,18,'2023-10-14','2023-10-14'),(31,'0.5 POUND',5,19,'2023-10-14','2023-10-14'),(32,'1 POUND',5,19,'2023-10-14','2023-10-14'),(33,'0.5 POUND',5,20,'2023-10-14','2023-10-14'),(34,'1 POUND',5,20,'2023-10-14','2023-10-14'),(35,'0.5 POUND',5,21,'2023-10-14','2023-10-14'),(36,'1 POUND',5,21,'2023-10-14','2023-10-14'),(37,'0.5 POUND',5,22,'2023-10-14','2023-10-14'),(38,'1 POUND',5,22,'2023-10-14','2023-10-14'),(39,'0.5 POUND',5,23,'2023-10-14','2023-10-14'),(40,'1 POUND',5,23,'2023-10-14','2023-10-14'),(41,'0.5 POUND',5,24,'2023-10-14','2023-10-14'),(42,'1 POUND',5,24,'2023-10-14','2023-10-14'),(43,'0.5 POUND',5,25,'2023-10-14','2023-10-14'),(44,'1 POUND',5,25,'2023-10-14','2023-10-14'),(45,'0.5 POUND',5,26,'2023-10-14','2023-10-14'),(46,'1 POUND',5,26,'2023-10-14','2023-10-14'),(47,'0.5 POUND',5,27,'2023-10-14','2023-10-14'),(48,'1 POUND',5,27,'2023-10-14','2023-10-14'),(49,'Black',5,28,'2023-10-14','2023-10-14'),(50,'Black',3,29,'2023-10-14','2023-10-14'),(51,'Black',3,30,'2023-10-14','2023-10-14'),(52,'Black',2,31,'2023-10-14','2023-10-14'),(53,'Black',3,32,'2023-10-14','2023-10-14'),(54,'Black',4,33,'2023-10-14','2023-10-14'),(55,'Black',5,34,'2023-10-14','2023-10-14'),(56,'Black',5,35,'2023-10-14','2023-10-14'),(57,'Green',3,36,'2023-10-14','2023-10-14'),(58,'Black',4,37,'2023-10-14','2023-10-14'),(59,'Black',2,38,'2023-10-14','2023-10-14'),(60,'Black',6,39,'2023-10-14','2023-10-14'),(61,'Green',3,40,'2023-10-14','2023-10-14'),(62,'盒裝',3,41,'2023-10-14','2023-10-14'),(63,'盒裝',3,42,'2023-10-14','2023-10-14'),(64,'盒裝',5,43,'2023-10-14','2023-10-14'),(65,'盒裝',5,44,'2023-10-14','2023-10-14'),(66,'盒裝',5,45,'2023-10-14','2023-10-14'),(67,'盒裝',5,46,'2023-10-14','2023-10-14'),(68,'0.5 POUND',3,47,'2023-10-14','2023-10-14'),(69,'0.5 POUND',3,48,'2023-10-14','2023-10-14');
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

-- Dump completed on 2023-10-14 10:22:55
