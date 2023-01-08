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

-- Dumping structure for table dominoes.allpieces
CREATE TABLE IF NOT EXISTS `allpieces` (
  `x` int(2) NOT NULL,
  `piece` enum('0_0','1_0','0_1','2_0','0_2','3_0','0_3','4_0','0_4','5_0','0_5','6_0','0_6','1_1','2_1','1_2','3_1','1_3','4_1','1_4','5_1','1_5','6_1,','1_6','2_2','3_2','2_3','4_2','2_4','5_2','2_5','6_2','2_6','3_3','4_3','3_4','5_3','3_5','6_3','3_6','4_4','5_4','4_5','6_4','4_6','5_5','6_5','5_6','6_6') NOT NULL,
  `player` enum('1','2') DEFAULT NULL,
  PRIMARY KEY (`piece`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.allpieces: ~28 rows (approximately)
INSERT INTO `allpieces` (`x`, `piece`, `player`) VALUES
	(1, '0_0', '2'),
	(2, '0_1', NULL),
	(3, '0_2', NULL),
	(4, '0_3', '2'),
	(5, '0_4', NULL),
	(6, '0_5', '2'),
	(7, '0_6', '2'),
	(8, '1_1', '2'),
	(9, '1_2', NULL),
	(10, '1_3', '1'),
	(11, '1_4', '2'),
	(12, '1_5', '1'),
	(13, '1_6', '1'),
	(14, '2_2', NULL),
	(15, '2_3', '1'),
	(16, '2_4', '2'),
	(17, '2_5', NULL),
	(18, '2_6', NULL),
	(19, '3_3', NULL),
	(20, '3_4', NULL),
	(21, '3_5', NULL),
	(22, '3_6', '1'),
	(23, '4_4', '1'),
	(24, '4_5', '1'),
	(25, '4_6', '2'),
	(26, '5_5', NULL),
	(27, '5_6', NULL),
	(28, '6_6', NULL);

-- Dumping structure for table dominoes.board
CREATE TABLE IF NOT EXISTS `board` (
  `x` int(2) NOT NULL,
  `piece` enum('0_0','1_0','0_1','2_0','0_2','3_0','0_3','4_0','0_4','5_0','0_5','6_0','0_6','1_1','2_1','1_2','3_1','1_3','4_1','1_4','5_1','1_5','6_1','1_6','2_2','3_2','2_3','4_2','2_4','5_2','2_5','6_2','2_6','3_3','4_3','3_4','5_3','3_5','6_3','3_6','4_4','5_4','4_5','6_4','4_6','5_5','6_5','5_6','6_6') DEFAULT NULL,
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
  
 UPDATE allpieces SET player=NULL WHERE X>0;
 
 UPDATE players SET username=NULL, token=NULL;
 
UPDATE game_status SET status='not active', seat_turn=NULL, result=NULL;
	
	
    END//
DELIMITER ;

-- Dumping structure for procedure dominoes.fill_random_pieces
DELIMITER //
CREATE PROCEDURE `fill_random_pieces`()
BEGIN

DECLARE random_number INT;

SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp1 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp1.x=1 ;
UPDATE allpieces SET player =1 WHERE X = random_number;




SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp2 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp2.x=1 ;
UPDATE allpieces SET player =2 WHERE X = random_number;




SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp1 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp1.x=2 ;
UPDATE allpieces SET player =1 WHERE X = random_number;





SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp2 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp2.x=2 ;
UPDATE allpieces SET player =2 WHERE X = random_number;





SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp1 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp1.x=3 ;
UPDATE allpieces SET player =1 WHERE X = random_number;




SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp2 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp2.x=3 ;
UPDATE allpieces SET player =2 WHERE X = random_number;







SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp1 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp1.x=4 ;
UPDATE allpieces SET player =1 WHERE X = random_number;




SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp2 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp2.x=4 ;
UPDATE allpieces SET player =2 WHERE X = random_number;





SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp1 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp1.x=5 ;
UPDATE allpieces SET player =1 WHERE X = random_number;



SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp2 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp2.x=5 ;
UPDATE allpieces SET player =2 WHERE X = random_number;




SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp1 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp1.x=6 ;
UPDATE allpieces SET player =1 WHERE X = random_number;



SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp2 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp2.x=6 ;
UPDATE allpieces SET player =2 WHERE X = random_number;




SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp1 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp1.x=7 ;
UPDATE allpieces SET player =1 WHERE X = random_number;



SET random_number =FLOOR(1 + RAND()*(28-1+1));

while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

UPDATE piecesp2 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp2.x=7 ;
UPDATE allpieces SET player =2 WHERE X = random_number;


END//
DELIMITER ;

-- Dumping structure for table dominoes.game_status
CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `seat_turn` enum('1','2') DEFAULT NULL,
  `result` enum('A','B') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.game_status: ~0 rows (approximately)
INSERT INTO `game_status` (`status`, `seat_turn`, `result`, `last_change`) VALUES
	('aborded', NULL, NULL, '2023-01-07 03:40:17');

-- Dumping structure for procedure dominoes.move_piece
DELIMITER //
CREATE PROCEDURE `move_piece`(x1 int,x2 INT,y1 INT ,y2 INT)
BEGIN
   
   
 DECLARE  myturn  CHAR;
 
 
  
 SELECT seat_turn INTO myturn FROM game_status WHERE status='started'; 
    	
    	
    	
   
IF (myturn='1') then 	
 			
 		 if  EXISTS (SELECT * FROM  piecesp1 WHERE piece=(select CONCAT(y1,'_',y2)) OR piece=(select CONCAT(y2,'_',y1)) AND X=x1 ) then 
			
 	
					update board
					set piece= (select CONCAT(y1,'_',y2))
					where board.x=x2 ; 
					
					
					
					update piecesp1
					set piece=null
					where piecesp1.x=x1 ; 
					
			update game_status set seat_turn=if(myturn='1','2','1');
	
 	 END if;

ELSEIF (myturn='2') then 
			 
			  if  EXISTS (SELECT * FROM  piecesp2 WHERE piece=(select CONCAT(y1,'_',y2)) OR piece=(select CONCAT(y2,'_',y1)) AND X=x1 ) then 
			 
					update board
					set piece= (select CONCAT(y1,'_',y2))
					where board.x=x2 ; 
					
					
					
					update piecesp2
					set piece=null
					where piecesp2.x=x1 ; 

	update game_status set seat_turn=if(myturn='1','2','1');
	
		 END if;
	END IF;		


    END//
DELIMITER ;

-- Dumping structure for table dominoes.piecesp1
CREATE TABLE IF NOT EXISTS `piecesp1` (
  `x` tinyint(1) NOT NULL,
  `piece` enum('0_0','0_1','0_2','0_3','0_4','0_5','0_6','1_1','1_2','1_3','1_4','1_5','1_6','2_2','2_3','2_4','2_5','2_6','3_3','3_4','3_5','3_6','4_4','4_5','4_6','5_5','5_6','6_6') DEFAULT NULL,
  `playerseat` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.piecesp1: ~8 rows (approximately)
INSERT INTO `piecesp1` (`x`, `piece`, `playerseat`) VALUES
	(1, '3_6', '1'),
	(2, '4_5', '1'),
	(3, '2_3', '1'),
	(4, '4_4', '1'),
	(5, '1_6', '1'),
	(6, '1_3', '1'),
	(7, '1_5', '1'),
	(8, NULL, '1');

-- Dumping structure for table dominoes.piecesp2
CREATE TABLE IF NOT EXISTS `piecesp2` (
  `x` tinyint(1) NOT NULL,
  `piece` enum('0_0','0_1','0_2','0_3','0_4','0_5','0_6','1_1','1_2','1_3','1_4','1_5','1_6','2_2','2_3','2_4','2_5','2_6','3_3','3_4','3_5','3_6','4_4','4_5','4_6','5_5','5_6','6_6') DEFAULT NULL,
  `playerseat` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dominoes.piecesp2: ~8 rows (approximately)
INSERT INTO `piecesp2` (`x`, `piece`, `playerseat`) VALUES
	(1, '0_6', '2'),
	(2, '2_4', '2'),
	(3, '4_6', '2'),
	(4, '1_4', '2'),
	(5, '0_3', '2'),
	(6, '1_1', '2'),
	(7, '0_0', '2'),
	(8, '0_5', '1');

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
	('asdf', '1', '1135f1ec4df9f0a854f949fc06e963cc', '2023-01-07 03:40:17'),
	(NULL, '2', NULL, '2023-01-07 03:26:17');

-- Dumping structure for procedure dominoes.take_piece2
DELIMITER //
CREATE PROCEDURE `take_piece2`()
BEGIN
 
	DECLARE random_number,turn,num2 INT;

SELECT seat_turn INTO turn FROM game_status;
 
SET random_number =FLOOR(1 + RAND()*(28-1+1));




while ('1'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number ) or '2'=(SELECT player FROM allpieces WHERE   allpieces.x=random_number )  ) do
SET random_number =FLOOR(1 + RAND()*(28-1+1));
END while;

SET  num2 =FLOOR(1 + RAND()*(8-1+1));

if (turn='1') then
if ((SELECT COUNT(*) FROM piecesp1 WHERE piecesp1.piece) <8 ) then 

while ( (SELECT piece FROM piecesp1 WHERE   x=num2 ) IS not NULL ) do
SET num2 =FLOOR(1 + RAND()*(8-1+1));
END while;

UPDATE piecesp1 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp1.x=num2 ;
UPDATE allpieces SET player =1 WHERE X = random_number;
END if;

ELSEIF (turn='2') then
if ((SELECT COUNT(*) FROM piecesp2 WHERE piecesp2.piece) <8 ) then 
while ( (SELECT piece FROM piecesp2 WHERE   x=num2 ) IS not NULL  ) do
SET num2 =FLOOR(1 + RAND()*(8-1+1));
END while;
 
UPDATE piecesp2 SET piece = (SELECT piece FROM allpieces WHERE allpieces.player is null AND allpieces.x= random_number  ) WHERE piecesp2.x=num2 ;
UPDATE allpieces SET player =2 WHERE X = random_number;
END if;
END if ;
	
    END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
