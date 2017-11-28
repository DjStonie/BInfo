-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: andels_database
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment` (
  `id_apartment` int(11) NOT NULL AUTO_INCREMENT,
  `address_road` varchar(45) DEFAULT NULL,
  `address_number` varchar(45) DEFAULT NULL,
  `address_floor` varchar(45) DEFAULT NULL,
  `address_side` varchar(45) DEFAULT NULL,
  `rooms` double DEFAULT NULL,
  `squaremeters` double DEFAULT NULL,
  `floors` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_apartment`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartment_neighbours`
--

DROP TABLE IF EXISTS `apartment_neighbours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment_neighbours` (
  `id_apartment` int(11) NOT NULL,
  `neighbour` int(11) NOT NULL,
  PRIMARY KEY (`id_apartment`,`neighbour`),
  KEY `neighbour_idx` (`neighbour`),
  CONSTRAINT `id_apartment_2` FOREIGN KEY (`id_apartment`) REFERENCES `apartment` (`id_apartment`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `neighbour` FOREIGN KEY (`neighbour`) REFERENCES `apartment` (`id_apartment`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment_neighbours`
--

LOCK TABLES `apartment_neighbours` WRITE;
/*!40000 ALTER TABLE `apartment_neighbours` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartment_neighbours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_and_ancienittet`
--

DROP TABLE IF EXISTS `list_and_ancienittet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_and_ancienittet` (
  `email` varchar(45) NOT NULL,
  `list_priority` int(11) DEFAULT NULL,
  `ancienittet` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `email_3` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_and_ancienittet`
--

LOCK TABLES `list_and_ancienittet` WRITE;
/*!40000 ALTER TABLE `list_and_ancienittet` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_and_ancienittet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_types`
--

DROP TABLE IF EXISTS `role_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_types` (
  `id_role` int(11) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_types`
--

LOCK TABLES `role_types` WRITE;
/*!40000 ALTER TABLE `role_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `pay_due` datetime DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `list_priority` int(11) DEFAULT NULL,
  `Ancienittet` int(11) DEFAULT NULL,
  `my_apartment` int(11) DEFAULT NULL,
  `offered` int(11) DEFAULT NULL,
  `max_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `id_apartments_3_idx` (`my_apartment`),
  CONSTRAINT `id_apartments_3` FOREIGN KEY (`my_apartment`) REFERENCES `apartment` (`id_apartment`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `email` varchar(45) NOT NULL,
  `id_apartment` int(11) NOT NULL,
  PRIMARY KEY (`email`,`id_apartment`),
  KEY `apartment_fk_idx` (`id_apartment`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_apartment` FOREIGN KEY (`id_apartment`) REFERENCES `apartment` (`id_apartment`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `email` varchar(45) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`email`,`role`),
  KEY `role_idx` (`role`),
  CONSTRAINT `email_2` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role_types` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-20 12:27:22
