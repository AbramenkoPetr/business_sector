-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name1` varchar(64) NOT NULL,
  `name2` varchar(64) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Петр','Абраменко','abram1312@mail.ru','password','мужской','img/avatar_abr.jpg','2024-06-05'),(25,'Иван',NULL,'abram1313@mail.ru','password',NULL,NULL,'2024-06-06'),(34,'Иван',NULL,'abram1314@mail.ru','password',NULL,NULL,'2024-06-07'),(35,'Иван',NULL,'abram1315@mail.ru','password',NULL,NULL,'2024-06-07'),(36,'Иван',NULL,'abram1316@mail.ru','password',NULL,NULL,'2024-06-07'),(37,'Иван',NULL,'abram1317@mail.ru','password',NULL,NULL,'2024-06-07'),(38,'Иван',NULL,'abram1318@mail.ru','password',NULL,NULL,'2024-06-07'),(39,'Иван',NULL,'abram1319@mail.ru','password',NULL,NULL,'2024-06-07'),(40,'Иван',NULL,'abram1320@mail.ru','password',NULL,NULL,'2024-06-07'),(41,'Иван',NULL,'abram1321@mail.ru','password',NULL,NULL,'2024-06-07'),(42,'Иван',NULL,'abram1322@mail.ru','password',NULL,NULL,'2024-06-07'),(43,'Иван',NULL,'abram1323@mail.ru','password',NULL,NULL,'2024-06-07'),(44,'Иван',NULL,'abram1324@mail.ru','password',NULL,NULL,'2024-06-07'),(45,'Иван',NULL,'abram1325@mail.ru','password',NULL,NULL,'2024-06-07'),(46,'Иван',NULL,'abram1326@mail.ru','password',NULL,NULL,'2024-06-07');
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

-- Dump completed on 2024-06-07  7:56:40
