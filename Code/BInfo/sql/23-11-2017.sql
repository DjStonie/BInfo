-- --------------------------------------------------------
-- Vært:                         127.0.0.1
-- Server-version:               5.7.19-log - MySQL Community Server (GPL)
-- ServerOS:                     Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for project
CREATE DATABASE IF NOT EXISTS `binfo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `binfo`;

-- Dumping structure for tabel project.apartment
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table project.apartment: ~9 rows (approximately)
DELETE FROM `apartment`;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` (`id`, `address`, `number`, `rooms`, `garden`, `size`, `floor`, `floors`) VALUES
	(11, 'test', 1234, 12, b'0', 12, 12, 3),
	(12, 'asdasdadasd', 12, 1, b'0', 1, 1, 1),
	(13, 'asdasdsad', 321, 2, b'1', 2, 2, 2),
	(14, 'asd', 123123, 12, b'0', 321, 123, 132),
	(15, 'sdf', 34, 123, b'0', 321, 321, 123),
	(22, '1338', 1338, 1338, b'1', 1338, 1338, 1338),
	(23, 'test', 12321312, 23123913, b'1', 2193120, 12309930, 9312),
	(24, 'adsadadasd', 123145, 552, b'0', 525, 52, 52),
	(25, 'asdad', 512, 512, b'0', 564, 5, 345);
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;

-- Dumping structure for tabel project.role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table project.role: ~2 rows (approximately)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `role`) VALUES
	(1, 'ADMIN'),
	(2, 'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for tabel project.user
CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(255) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table project.user: ~1 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`email`, `active`, `name`, `last_name`, `password`) VALUES
	('test@test.dk', 1, 'test', 'test', '$2a$10$4OPEvHu1lqkLU1M6KcgFvuJQpGktZvW9vbu6bzYGWiZX6Dg6dq1zi'),
	('Vagabonden@outlook.com', 1, 'Patrick', 'Klæbel', '$2a$10$s6mxpHYz3SSiiHZqdKzHnuSORP5eAFxs9UAx9yGVq6JyK3XJeFLda');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for tabel project.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FK_user_role_role` (`role_id`),
  KEY `FK_user_role_user` (`user_id`),
  CONSTRAINT `FK_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table project.user_role: ~4 rows (approximately)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	('Vagabonden@outlook.com', 1),
	('Vagabonden@outlook.com', 2),
	('test@test.dk', 1),
	('test@test.dk', 2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
