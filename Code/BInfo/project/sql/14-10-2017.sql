-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.19-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for project
DROP DATABASE IF EXISTS `project`;
CREATE DATABASE IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project`;


-- Dumping structure for table project.apartment
DROP TABLE IF EXISTS `apartment`;
CREATE TABLE IF NOT EXISTS `apartment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
  `garden` bit(1) NOT NULL,
  `size` float NOT NULL,
  `floor` int(11) NOT NULL,
  `floors` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table project.apartment: ~8 rows (approximately)
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` (`id`, `address`, `number`, `rooms`, `garden`, `size`, `floor`, `floors`) VALUES
	(10, 'asd', 124, 1, b'1', 1, 1, 412414),
	(11, 'test', 1234, 12, b'0', 12, 12, 3),
	(12, 'asdasdadasd', 12, 1, b'0', 1, 1, 1),
	(13, 'asdasdsad', 321, 2, b'1', 2, 2, 2),
	(14, 'asd', 123123, 12, b'0', 321, 123, 132),
	(15, 'sdf', 34, 123, b'0', 321, 321, 123),
	(22, '1338', 1338, 1338, b'1', 1338, 1338, 1338),
	(23, 'test', 12321312, 23123913, b'1', 2193120, 12309930, 9312);
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;


-- Dumping structure for table project.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table project.role: ~0 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `role`) VALUES
	(1, 'ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for table project.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table project.user: ~9 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `active`, `email`, `name`, `last_name`, `password`) VALUES
	(2, 1, 'Vagabonden@outlook.com', 'Patrick', 'Klæbel', '$2a$10$74tR.PQ.JAuyqStkQUHDi.ktnccCWcVNht5TqnGupjZYxM9CcRZay'),
	(3, 1, 'Vagabonden@outlook.com1', 'Pat', 'Trik', '$2a$10$WzT44kyaf2yeQ7D6ldB1U.i/u3t.PbiqEq28EbCgTnqz2DBb5M3JW'),
	(4, 0, 'asd@atp.dk', 'adasd', 'asdasd', '$2a$10$wWUxrVV2RZN4fuu4N2GrJO00x.QdxkI0pyo8TyfDGYGHpSz1PMUKi'),
	(5, 1, 'aga@atp.dk', 'asdadasd', 'sadasdsad', '$2a$10$f92bLMQL.EC38kZ2p4iZ6uXW4ftft7MRBNAOI2XvLXy.fUwuQlqI6'),
	(6, 1, 'atp@atp.dk', 'Patrick', 'p', '$2a$10$bJ.R0Noao9BYndnzUvu5r.wZa1Y0XA8b1WaWYzi1/D9fahfEOdhcO'),
	(7, 1, 'atp@atp.dk123', 'Patrick', 'p', '$2a$10$Noyxeo/kilgWgWKY/Gc1leG/Hd6bv5aPh/exnn23iQgf86e2eVvxO'),
	(8, 1, 'pizza@atp.dk', 'Piat', 'AWad', '$2a$10$Ws6Futy29w.efnO9R46MUuRIxOKFLuI7pfclCicgtAOgjYmapz.Ma'),
	(9, 1, 'Vagabonden@outlook.com2133', 'Patrick', 'Klaebel', '$2a$10$XbEOh1xMoQe2319.A/2gruDKxrU0U/rkSr.wqzsN82AmQlY3CcTMm'),
	(10, 1, 'Vagabonden@outlook.pdk', 'pasda', 'Waka', '$2a$10$1eG3/SwjaGGSqx2hF9O0ZuB6dKYQIOlgkzHoLxfRxr19FUvnay9h2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table project.user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table project.user_role: ~9 rows (approximately)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
