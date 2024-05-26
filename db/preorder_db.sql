-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for preorder_db
CREATE DATABASE IF NOT EXISTS `preorder_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `preorder_db`;

-- Dumping structure for table preorder_db.merch_item
CREATE TABLE IF NOT EXISTS `merch_item` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `nama_item` varchar(255) NOT NULL,
  `harga` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table preorder_db.merch_item: ~12 rows (approximately)
DELETE FROM `merch_item`;
INSERT INTO `merch_item` (`id_item`, `nama_item`, `harga`) VALUES
	(1, 'Keychain Pavolia Reine', 36500),
	(2, 'Keychain Airani Iofifteen (New Outfit)', 36500),
	(3, 'Keychain Ayunda Risu (New Outfit)', 36500),
	(4, 'Keychain Airani Iofifteen', 35000),
	(5, 'Keychain Kobo Kanaeru', 35000),
	(6, 'Keychain Moona Hoshinova (New Outfit)', 36500),
	(7, 'Keychain Vestia Zeta', 35000),
	(8, 'Keychain Kureiji Ollie', 35000),
	(9, 'Keychain Kureiji Ollie (New Outfit)', 36500),
	(10, 'Keychain Anya Melfissa', 35000),
	(11, 'Keychain Kaela Kovalskia', 49500),
	(12, 'Keychain Moona Hoshinova (New Outfit)', 49500);

-- Dumping structure for table preorder_db.preorder_form
CREATE TABLE IF NOT EXISTS `preorder_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `jumlah` int NOT NULL DEFAULT '0',
  `item` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__merch_item` (`item`),
  KEY `FK__user` (`id_user`),
  CONSTRAINT `FK__merch_item` FOREIGN KEY (`item`) REFERENCES `merch_item` (`id_item`),
  CONSTRAINT `FK__user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table preorder_db.preorder_form: ~2 rows (approximately)
DELETE FROM `preorder_form`;
INSERT INTO `preorder_form` (`id`, `nama`, `email`, `phone`, `jumlah`, `item`, `id_user`) VALUES
	(6, 'guntur', 'guntur@akprind.ac.id', '080808', 5, 3, 2),
	(8, 'bayu', 'bayu@akprind.ac.id', '080808', 6, 11, 6);

-- Dumping structure for table preorder_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table preorder_db.user: ~6 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
	(1, 'bobi', '$2y$10$O8vI76qOKsSc/RaGvoB4P.Msf053CzWJW6xnetg2zBQGXP5S4J85e'),
	(2, 'guntur', '$2y$10$CcHfc.1RTegxY0xsOgCb9.oFFTTqrj.dauEzRf4y3OfWn900P8eCa'),
	(4, 'nizar', '$2y$10$07Xj/c.r/7hfOuP8s261r.gUoCwTfgJDCO4...5izX8VUADhJy7x.'),
	(5, 'thoriq', '$2y$10$cpYtYtqROkFo.PmY17QW5Os.jfKPXNj4QIaFRaXv38cML8FbGDzCi'),
	(6, 'bayu', '$2y$10$wLc5W4wac9agmOgzUlYo2.klCgGUnoS.uC78.tOjXJXzt2FL1S4Si'),
	(7, 'dodi', '$2y$10$QBZZuKAGuClmCZ1.snSld.QIXVzYJTQ8D2rLnvxsy63SfL9BMfBNW');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
