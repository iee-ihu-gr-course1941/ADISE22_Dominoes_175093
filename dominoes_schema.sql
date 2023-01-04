-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dominoes
CREATE DATABASE IF NOT EXISTS `dominoes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `dominoes`;

-- Dumping structure for table dominoes.board
CREATE TABLE IF NOT EXISTS `board` (
  `x` int(2) NOT NULL,
  `piece` enum('0_0','1_0','0_1','2_0','0_2','3_0','0_3','4_0','0_4','5_0','0_5','6_0','0_6','1_1','2_1','1_2','3_1','1_3','4_1','1_4','5_1','1_5','6_1,','1_6','2_2','3_2','2_3','4_2','2_4','5_2','2_5','6_2','2_6','3_3','4_3','3_4','5_3','3_5','6_3','3_6','4_4','5_4','4_5','6_4','4_6','5_5','6_5','5_6','6_6') DEFAULT NULL,
  PRIMARY KEY (`x`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.board: ~28 rows (approximately)
INSERT INTO `board` (`x`, `piece`) VALUES
	(1, NULL),
	(2, NULL),
	(3, NULL),
	(4, NULL),
	(5, NULL),
	(6, NULL),
	(7, NULL),
	(8, NULL),
	(9, NULL),
	(10, NULL),
	(11, NULL),
	(12, NULL),
	(13, NULL),
	(14, NULL),
	(15, NULL),
	(16, NULL),
	(17, NULL),
	(18, NULL),
	(19, NULL),
	(20, NULL),
	(21, NULL),
	(22, NULL),
	(23, NULL),
	(24, NULL),
	(25, NULL),
	(26, NULL),
	(27, NULL),
	(28, NULL);

-- Dumping structure for table dominoes.board_empty
CREATE TABLE IF NOT EXISTS `board_empty` (
  `x` int(2) NOT NULL,
  `piece` enum('0_0','1_0','0_1','2_0','0_2','3_0','0_3','4_0','0_4','5_0','0_5','6_0','0_6','1_1','2_1','1_2','3_1','1_3','4_1','1_4','5_1','1_5','6_1,','1_6','2_2','3_2','2_3','4_2','2_4','5_2','2_5','6_2','2_6','3_3','4_3','3_4','5_3','3_5','6_3','3_6','4_4','5_4','4_5','6_4','4_6','5_5','6_5','5_6','6_6') DEFAULT NULL,
  PRIMARY KEY (`x`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table dominoes.board_empty: ~28 rows (approximately)
INSERT INTO `board_empty` (`x`, `piece`) VALUES
	(1, NULL),
	(2, NULL),
	(3, NULL),
	(4, NULL),
	(5, NULL),
	(6, NULL),
	(7, NULL),
	(8, NULL),
	(9, NULL),
	(10, NULL),
	(11, NULL),
	(12, NULL),
	(13, NULL),
	(14, NULL),
	(15, NULL),
	(16, NULL),
	(17, NULL),
	(18, NULL),
	(19, NULL),
	(20, NULL),
	(21, NULL),
	(22, NULL),
	(23, NULL),
	(24, NULL),
	(25, NULL),
	(26, NULL),
	(27, NULL),
	(28, NULL);

-- Dumping structure for procedure dominoes.clean_board
DELIMITER //
CREATE PROCEDURE `clean_board`()
BEGIN
	REPLACE INTO board SELECT * FROM board_empty;

 UPDATE piecesp1 SET piece=NULL WHERE X>0;
 
  UPDATE piecesp2 SET piece=NULL WHERE X>0;
 
 
 UPDATE `players` SET username=NULL, token=NULL;
UPDATE `game_status` SET `status`='not active', `p_turn`=NULL, `result`=NULL;

END//
DELIMITER ;

-- Dumping structure for table dominoes.game_status
CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `seat_turn` enum('1','2') DEFAULT NULL,
  `result` enum('A','B') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.game_status: ~1 rows (approximately)
INSERT INTO `game_status` (`status`, `seat_turn`, `result`, `last_change`) VALUES
	('initialized', NULL, NULL, '2023-01-04 16:29:06');

-- Dumping structure for table dominoes.piecesp1
CREATE TABLE IF NOT EXISTS `piecesp1` (
  `x` tinyint(1) NOT NULL,
  `piece` enum('0_0','0_1','0_2','0_3','0_4','0_5','0_6','1_1','1_2','1_3','1_4','1_5','1_6','2_2','2_3','2_4','2_5','2_6','3_3','3_4','3_5','3_6','4_4','4_5','4_6','5_5','5_6','6_6') DEFAULT NULL,
  `playerseat` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.piecesp1: ~7 rows (approximately)
INSERT INTO `piecesp1` (`x`, `piece`, `playerseat`) VALUES
	(1, NULL, '1'),
	(2, NULL, '1'),
	(3, NULL, '1'),
	(4, NULL, '1'),
	(5, NULL, '1'),
	(6, NULL, '1'),
	(7, NULL, '1');

-- Dumping structure for table dominoes.piecesp2
CREATE TABLE IF NOT EXISTS `piecesp2` (
  `x` tinyint(1) NOT NULL,
  `piece` enum('0_0','0_1','0_2','0_3','0_4','0_5','0_6','1_1','1_2','1_3','1_4','1_5','1_6','2_2','2_3','2_4','2_5','2_6','3_3','3_4','3_5','3_6','4_4','4_5','4_6','5_5','5_6','6_6') DEFAULT NULL,
  `playerseat` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.piecesp2: ~7 rows (approximately)
INSERT INTO `piecesp2` (`x`, `piece`, `playerseat`) VALUES
	(1, NULL, '1'),
	(2, NULL, '1'),
	(3, NULL, '1'),
	(4, NULL, '1'),
	(5, NULL, '1'),
	(6, NULL, '1'),
	(7, NULL, '1');

-- Dumping structure for table dominoes.players
CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(20) DEFAULT NULL,
  `seat` enum('1','2') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`seat`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.players: ~2 rows (approximately)
INSERT INTO `players` (`username`, `seat`, `token`, `last_action`) VALUES
	(NULL, '1', NULL, '2023-01-04 16:34:33'),
	(NULL, '2', NULL, '2023-01-04 16:29:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
