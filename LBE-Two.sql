-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: lbe2
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorites_users_idx` (`user_id`),
  KEY `fk_favorites_quotes1_idx` (`quote_id`),
  CONSTRAINT `fk_favorites_quotes1` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorites_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (4,1,2),(5,1,1),(6,4,5),(7,4,2),(8,5,1),(10,5,6),(11,1,6);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quoted_by` varchar(100) DEFAULT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `posted_by_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quotes_users1_idx` (`posted_by_id`),
  CONSTRAINT `fk_quotes_users1` FOREIGN KEY (`posted_by_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'William Shakespear','To be or not to be, that is the question.',1,'2016-04-25 13:21:40','2016-04-25 13:21:40'),(2,'Charles Dickens','Please Sir May i have some more?',1,'2016-04-25 13:26:52','2016-04-25 13:26:52'),(3,'Grrr','im gonna sing the doom song now...',2,'2016-04-25 13:28:22','2016-04-25 13:28:22'),(4,'Zim','The Parental Units are malfunctioning again!',2,'2016-04-25 13:38:52','2016-04-25 13:38:52'),(5,'Charlie Brown','Good Gravy',1,'2016-04-25 15:23:57','2016-04-25 15:23:57'),(6,'Katterina Kittycat','This is the best tea party ever Meow Meow',5,'2016-04-25 16:41:52','2016-04-25 16:41:52');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jonathan Ben-Ammi','jbenammi','jbenammi@gmail.com','f7c3bc1d808e04732adf679965ccc34ca7ae3441','1978-04-19 00:00:00','2016-04-25 13:16:16','2016-04-25 13:16:16'),(2,'Gitai Ben-Ammi','Gitai','gitaiba@gmail.com','f7c3bc1d808e04732adf679965ccc34ca7ae3441','1978-12-27 00:00:00','2016-04-25 13:22:18','2016-04-25 13:22:18'),(3,'Katerina Kittycat','MeowMeow','KK@theneighborhood.com','f7c3bc1d808e04732adf679965ccc34ca7ae3441','1982-03-27 00:00:00','2016-04-25 14:13:56','2016-04-25 14:13:56'),(4,'Jeff Hedfors','Jeff','jeff@gmail.com','f7c3bc1d808e04732adf679965ccc34ca7ae3441','1968-05-19 00:00:00','2016-04-25 15:50:03','2016-04-25 15:50:03'),(5,'Daniel Tiger','Grrrrr','DT@theneighborhood.com','f7c3bc1d808e04732adf679965ccc34ca7ae3441','2010-07-23 00:00:00','2016-04-25 16:40:59','2016-04-25 16:40:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-25 16:51:44
