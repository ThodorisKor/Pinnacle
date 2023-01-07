-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for procedure pinnacle.add_card_to_combination
DELIMITER //
CREATE PROCEDURE `add_card_to_combination`(
	IN `x` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y` VARCHAR(30)
)
BEGIN

DECLARE comb VARCHAR(30) DEFAULT 0;
DECLARE locationString1 VARCHAR(30) DEFAULT 0;
DECLARE locationString2 VARCHAR(30) DEFAULT 0;
	
if(((SELECT location FROM deck WHERE  `number` = x AND `shape` = y) = 'player 1') AND (SELECT p_turn FROM `game_status`) = 'player 1') then
		SET comb = 'combination player 1';
		SET locationString1 = 'triada combination player 1';
		SET locationString2 = 'player 1';
	ELSE
		SET comb = 'combination player 2';
		SET locationString1 = 'triada combination player 2';
		SET locationString2 = 'player 2';
END if;

-- Ελεγχος για τριαδα
if((SELECT `number` FROM `deck` WHERE `location` = CONCAT('triada ',comb) LIMIT 1) = x) then
	UPDATE `deck` 
	SET location = CONCAT('tetrada ',comb)
	WHERE location IN ( locationString1,locationString2) AND `number` = x;
END if;
-- Τελος ελεγχου

 
-- Το x pairnei thn enum timh tou ara gia paradeigma an perasw ws parametro to 9 to x tha exei thn timh 8 
-- Ελεγχος για κεντα
if((SELECT location FROM deck WHERE `number` = x AND `shape` = Y ) <> CONCAT('tetrada ',comb)) then
	if(((x- (SELECT `number` FROM `deck` WHERE location = CONCAT('kenta ',comb) ORDER BY number DESC LIMIT 1) )  =0) 
		AND (SELECT `shape` FROM `deck` WHERE location = CONCAT('kenta ',comb) LIMIT 1 ) = y ) then
		 	UPDATE `deck`
			SET location = CONCAT('kenta ',comb)
			WHERE `number` = x AND `shape` =Y ;
			
	ELSEIF((((SELECT `number` FROM `deck` WHERE location = CONCAT('kenta ',comb) ORDER BY number ASC LIMIT 1) -x)  =2) 
		AND (SELECT `shape` FROM `deck` WHERE location = CONCAT('kenta ',comb) LIMIT 1 ) = y ) then
		 	UPDATE `deck`
			SET location = CONCAT('kenta ',comb)
			WHERE `number` = x AND `shape` =Y ;
	END if;
END if;
-- Τελος ελεγχου

END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.center_card
DELIMITER //
CREATE PROCEDURE `center_card`()
BEGIN
	while ((SELECT COUNT(location) FROM deck WHERE location='center') <1)   DO 
	UPDATE `deck` SET `location` = 'center' 
	WHERE `location` ='pile' 
	AND  (`number`,`shape`)  in (SELECT * 
		FROM (
	 	  SELECT `number`,`shape` 
	 	    FROM `deck` ORDER BY RAND() LIMIT 1 ) temp_tab);
	 	   END while ;   
END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.clean_deck
DELIMITER //
CREATE PROCEDURE `clean_deck`()
BEGIN  
  REPLACE INTO deck SELECT * FROM deck_empty;
END//
DELIMITER ;

-- Dumping structure for table pinnacle.deck
CREATE TABLE IF NOT EXISTS `deck` (
  `number` enum('1','2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `shape` varchar(30) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`number`,`shape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pinnacle.deck: ~52 rows (approximately)
INSERT INTO `deck` (`number`, `shape`, `location`) VALUES
	('2', 'clubs', 'player 2'),
	('2', 'diamonds', 'player 1'),
	('2', 'hearts', 'pile'),
	('2', 'spades', 'pile'),
	('3', 'clubs', 'player 2'),
	('3', 'diamonds', 'center'),
	('3', 'hearts', 'pile'),
	('3', 'spades', 'pile'),
	('4', 'clubs', 'pile'),
	('4', 'diamonds', 'player 1'),
	('4', 'hearts', 'pile'),
	('4', 'spades', 'player 2'),
	('5', 'clubs', 'pile'),
	('5', 'diamonds', 'pile'),
	('5', 'hearts', 'pile'),
	('5', 'spades', 'pile'),
	('6', 'clubs', 'player 1'),
	('6', 'diamonds', 'player 2'),
	('6', 'hearts', 'pile'),
	('6', 'spades', 'player 1'),
	('7', 'clubs', 'player 2'),
	('7', 'diamonds', 'pile'),
	('7', 'hearts', 'player 2'),
	('7', 'spades', 'player 2'),
	('8', 'clubs', 'pile'),
	('8', 'diamonds', 'player 2'),
	('8', 'hearts', 'pile'),
	('8', 'spades', 'player 1'),
	('9', 'clubs', 'pile'),
	('9', 'diamonds', 'pile'),
	('9', 'hearts', 'pile'),
	('9', 'spades', 'pile'),
	('10', 'clubs', 'player 2'),
	('10', 'diamonds', 'player 1'),
	('10', 'hearts', 'pile'),
	('10', 'spades', 'pile'),
	('J', 'clubs', 'pile'),
	('J', 'diamonds', 'pile'),
	('J', 'hearts', 'pile'),
	('J', 'spades', 'player 1'),
	('Q', 'clubs', 'player 1'),
	('Q', 'diamonds', 'player 2'),
	('Q', 'hearts', 'pile'),
	('Q', 'spades', 'player 1'),
	('K', 'clubs', 'player 2'),
	('K', 'diamonds', 'player 1'),
	('K', 'hearts', 'player 1'),
	('K', 'spades', 'pile'),
	('A', 'clubs', 'pile'),
	('A', 'diamonds', 'player 1'),
	('A', 'hearts', 'player 2'),
	('A', 'spades', 'pile');

-- Dumping structure for table pinnacle.deck_empty
CREATE TABLE IF NOT EXISTS `deck_empty` (
  `number` enum('1','2','3','4','5','6','7','8','9','10','J','Q','K','A') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shape` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `location` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`number`,`shape`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table pinnacle.deck_empty: ~52 rows (approximately)
INSERT INTO `deck_empty` (`number`, `shape`, `location`) VALUES
	('2', 'clubs', NULL),
	('2', 'diamonds', NULL),
	('2', 'hearts', NULL),
	('2', 'spades', NULL),
	('3', 'clubs', NULL),
	('3', 'diamonds', NULL),
	('3', 'hearts', NULL),
	('3', 'spades', NULL),
	('4', 'clubs', NULL),
	('4', 'diamonds', NULL),
	('4', 'hearts', NULL),
	('4', 'spades', NULL),
	('5', 'clubs', NULL),
	('5', 'diamonds', NULL),
	('5', 'hearts', NULL),
	('5', 'spades', NULL),
	('6', 'clubs', NULL),
	('6', 'diamonds', NULL),
	('6', 'hearts', NULL),
	('6', 'spades', NULL),
	('7', 'clubs', NULL),
	('7', 'diamonds', NULL),
	('7', 'hearts', NULL),
	('7', 'spades', NULL),
	('8', 'clubs', NULL),
	('8', 'diamonds', NULL),
	('8', 'hearts', NULL),
	('8', 'spades', NULL),
	('9', 'clubs', NULL),
	('9', 'diamonds', NULL),
	('9', 'hearts', NULL),
	('9', 'spades', NULL),
	('10', 'clubs', NULL),
	('10', 'diamonds', NULL),
	('10', 'hearts', NULL),
	('10', 'spades', NULL),
	('J', 'clubs', NULL),
	('J', 'diamonds', NULL),
	('J', 'hearts', NULL),
	('J', 'spades', NULL),
	('Q', 'clubs', NULL),
	('Q', 'diamonds', NULL),
	('Q', 'hearts', NULL),
	('Q', 'spades', NULL),
	('K', 'clubs', NULL),
	('K', 'diamonds', NULL),
	('K', 'hearts', NULL),
	('K', 'spades', NULL),
	('A', 'clubs', NULL),
	('A', 'diamonds', NULL),
	('A', 'hearts', NULL),
	('A', 'spades', NULL);

-- Dumping structure for table pinnacle.game_status
CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'not active',
  `p_turn` enum('player 1','player 2') DEFAULT NULL,
  `result` enum('player 1','player 2','draw') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pinnacle.game_status: ~1 rows (approximately)
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
	('started', 'player 1', NULL, '2023-01-06 16:34:39');

-- Dumping structure for procedure pinnacle.getcardpile
DELIMITER //
CREATE PROCEDURE `getcardpile`()
BEGIN
DECLARE vir INT DEFAULT 0;
    if((SELECT p_turn FROM `game_status`)='player 1') then
    SELECT COUNT(*)+1  INTO vir FROM deck WHERE `location`='player 1';
    while ((SELECT COUNT(location) FROM deck WHERE `location`='player 1') <vir)   DO 
     UPDATE `deck` SET `location` = 'player 1' 
    WHERE `location`='pile' 
    AND  (`number`,`shape`)  in (SELECT *
        FROM (
           SELECT `number`,`shape`
             FROM `deck` ORDER BY RAND() LIMIT 1 ) temp_tab);
             END while;
    ELSE
    SELECT COUNT(*)+1  INTO vir FROM deck WHERE `location`='player 2';
        while ((SELECT COUNT(location) FROM deck WHERE `location`='player 2') <vir)   DO 
     UPDATE `deck` SET `location` = 'player 2' 
    WHERE `location`='pile' 
    AND  (`number`,`shape`)  in (SELECT *
        FROM (
           SELECT `number`,`shape`
             FROM `deck` ORDER BY RAND() LIMIT 1 ) temp_tab);
             END while;
    END if;
END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.moirasma_xartiwn
DELIMITER //
CREATE PROCEDURE `moirasma_xartiwn`()
BEGIN
   CALL clean_deck();
	CALL player1_cards(); 
	CALL player2_cards();
	 
	CALL pile();
END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.new_center
DELIMITER //
CREATE PROCEDURE `new_center`()
BEGIN
	UPDATE deck SET location = NULL WHERE location='center';
END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.pile
DELIMITER //
CREATE PROCEDURE `pile`()
BEGIN  
	UPDATE `deck` SET `location` = 'pile' 
	WHERE `location` IS NULL 
	;
	
END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.player1_cards
DELIMITER //
CREATE PROCEDURE `player1_cards`()
BEGIN  
while ((SELECT COUNT(location) FROM deck WHERE location='player 1') <12)   DO 
	UPDATE `deck` SET `location` = 'player 1' 
	WHERE `location` IS NULL 
	AND  (`number`,`shape`)  in (SELECT * 
		FROM (
	 	  SELECT `number`,`shape` 
	 	    FROM `deck` ORDER BY RAND() LIMIT 1 ) temp_tab);
	 	   END while ;   
END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.player2_cards
DELIMITER //
CREATE PROCEDURE `player2_cards`()
BEGIN  
	while ((SELECT COUNT(location) FROM deck WHERE location='player 2') <12)   DO 
	UPDATE `deck` SET `location` = 'player 2' 
	WHERE `location` IS NULL 
	AND  (`number`,`shape`)  in (SELECT * 
		FROM (
	 	  SELECT `number`,`shape` 
	 	    FROM `deck` ORDER BY RAND() LIMIT 1 ) temp_tab);
	 	   END while ;   
END//
DELIMITER ;

-- Dumping structure for table pinnacle.players
CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(20) DEFAULT NULL,
  `id` int NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last action` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pinnacle.players: ~2 rows (approximately)
INSERT INTO `players` (`username`, `id`, `token`, `last action`) VALUES
	(NULL, 1, '410064aff8e3d5170554467cfe544104', '2023-01-06 16:34:55'),
	(NULL, 2, '3905b31af4375140e6e4c737350d1d01', '2023-01-06 16:34:55');

-- Dumping structure for procedure pinnacle.play_a_card_and_change_turn
DELIMITER //
CREATE PROCEDURE `play_a_card_and_change_turn`(x ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),y VARCHAR(30))
BEGIN
	CALL play_one_card(x,y);
	CALL turn();
END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.play_cards
DELIMITER //
CREATE PROCEDURE `play_cards`(
	IN `x1` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y1` VARCHAR(30),
	IN `x2` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y2` VARCHAR(30),
	IN `x3` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y3` VARCHAR(30),
	IN `x4` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y4` VARCHAR(30),
	IN `x5` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y5` VARCHAR(30),
	IN `x6` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y6` VARCHAR(30),
	IN `x7` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y7` VARCHAR(30),
	IN `x8` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y8` VARCHAR(30),
	IN `x9` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y9` VARCHAR(30),
	IN `x10` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y10` VARCHAR(30),
	IN `x11` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y11` VARCHAR(30),
	IN `x12` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y12` VARCHAR(30),
	IN `x13` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y13` VARCHAR(30)
)
BEGIN
 DECLARE comb VARCHAR(30) DEFAULT 0;
if(x1 IS NOT NULL AND y1 IS NOT NULL AND x2 IS NOT NULL AND y2 IS NOT NULL AND x3 IS NOT NULL AND y3 IS NOT NULL)
 then 
  if((SELECT location FROM deck WHERE  `number` = x1 AND `shape` = y1) = 'player 1') then
		SET comb = 'combination player 1';
	ELSE
		SET comb = 'combination player 2';
	END if;
  
-- ΕΛΕΓΧΟΣ ΟΣΟΝ ΑΦΟΡΑ ΣΥΝΔΥΑΣΜΟΥΣ ΦΥΛΛΩΝ ΙΔΙΟΥ ΑΡΙΘΜΟΥ 
	if(x1=x2 AND x2=x3 AND x3=x4 AND x4 IS NOT NULL AND x5 IS NULL) then
		UPDATE `deck` 
		SET `location` = CONCAT('tetrada ',comb)
		WHERE `number` IN (x1,x2,x3,x4) AND `shape` IN (y1,y2,y3,y4);
		
	ELSEIF(x1=x2 AND x2=x3 AND x4 IS NULL) then	
	
		UPDATE `deck` 
		SET `location` = CONCAT('triada ',comb)
		WHERE `number` IN (x1,x2,x3) AND `shape` IN (y1,y2,y3);
		END if;
-- ΤΕΛΟΣ ΕΛΕΓΧΟΥ

-- ΕΛΕΓΧΟΣ ΟΣΟΝ ΑΦΟΡΑ ΣΥΝΔΥΑΣΜΟΥΣ ΑΡΙΘΜΗΤΙΚΗΣ ΣΥΝΕΧΕΙΑΣ ΦΥΛΛΩΝ ΙΔΙΟΥ ΧΡΩΜΑΤΟΣ	
	if(x2-x1=1 AND x3-x2=1 AND y1=y2 AND y2=y3 AND x4 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3) AND `shape` IN (y1,y2,y3);
			
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND y1=y2 AND y2=y3 AND y3=y4 AND x5 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4) AND `shape` IN (y1,y2,y3,y4);
	
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x1=1 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND x6 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5) AND `shape` IN (y1,y2,y3,y4,y5);
	
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x4=1 AND x6-x5=1
			 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND y5=y6 AND x7 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5,x6) AND `shape` IN (y1,y2,y3,y4,y5,y6);

	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x4=1 AND x6-x5=1 AND x7-x6=1
			 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND y5=y6 AND y6=y7 AND x8 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5,x6,x7) AND `shape` IN (y1,y2,y3,y4,y5,y6,y7);
		
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x4=1 AND x6-x5=1 AND x7-x6=1 AND x8-x7=1
			 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND y5=y6 AND y6=y7 AND y7=y8 AND x9 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5,x6,x7,x8) AND `shape` IN (y1,y2,y3,y4,y5,y6,y7,y8);
	
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x4=1 AND x6-x5=1 AND x7-x6=1 AND x8-x7=1 AND x9-x8
			 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND y5=y6 AND y6=y7 AND y7=y8 AND y8=y9 AND x10 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5,x6,x7,x8,x9) AND `shape` IN (y1,y2,y3,y4,y5,y6,y7,y8,y9);
		
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x4=1 AND x6-x5=1 AND x7-x6=1 AND x8-x7=1 AND x9-x8 AND x10-x9=1
			 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND y5=y6 AND y6=y7 AND y7=y8 AND y8=y9 AND y9=y10 AND x11 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5,x6,x7,x8,x9,x10) AND `shape` IN (y1,y2,y3,y4,y5,y6,y7,y8,y9,y10);
		
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x4=1 AND x6-x5=1 AND x7-x6=1 AND x8-x7=1 AND x9-x8 AND x10-x9=1 AND x11-x10=1
			 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND y5=y6 AND y6=y7 AND y7=y8 AND y8=y9 AND y9=y10 AND y10=y11 
			 AND x12 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11) AND `shape` IN (y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11);
		
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x4=1 AND x6-x5=1 AND x7-x6=1 AND x8-x7=1 AND x9-x8 AND x10-x9=1 AND x11-x10=1 AND x12-x11=1
			 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND y5=y6 AND y6=y7 AND y7=y8 AND y8=y9 AND y9=y10 AND y10=y11 AND y11=y12
			 AND x13 IS NULL ) then
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12) AND `shape` IN (y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12);
	
	ELSEIF(x2-x1=1 AND x3-x2=1 AND x4-x3=1 AND x5-x4=1 AND x6-x5=1 AND x7-x6=1 AND x8-x7=1 AND x9-x8 AND x10-x9=1 AND x11-x10=1 AND x12-x11=1 AND x13-x12=1
			 AND y1=y2 AND y2=y3 AND y3=y4 AND y4=y5 AND y5=y6 AND y6=y7 AND y7=y8 AND y8=y9 AND y9=y10 AND y10=y11 AND y11=y12 AND y12=y13) then		   
		UPDATE `deck` 
		SET `location` = CONCAT('kenta ',comb)
		WHERE `number` IN (x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13) AND `shape` IN (y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13);
	END if;
-- ΤΕΛΟΣ ΕΛΕΓΧΟΥ
END if;

END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.play_one_card
DELIMITER //
CREATE PROCEDURE `play_one_card`(
	IN `x` ENUM('2','3','4','5','6','7','8','9','10','J','Q','K','A'),
	IN `y` VARCHAR(30)
)
BEGIN
	UPDATE `deck` 
	SET `location` = 'center'
	WHERE `number` = x AND `shape` = y;
	
	if((select p_turn FROM `game_status`) = 'player 1') then
			UPDATE `players`
			SET `last action` = NOW()
			WHERE id =1;
		else
			UPDATE `players`
			SET `last action` = NOW()
			WHERE id =2;
	end if;
END//
DELIMITER ;

-- Dumping structure for procedure pinnacle.turn
DELIMITER //
CREATE PROCEDURE `turn`()
BEGIN
	if((SELECT `last action` FROM `players` WHERE id=1) 	> (SELECT `last action` FROM `players` WHERE id=2)) then 
		UPDATE `game_status`
		SET `p_turn` = 'player 2';
	ELSE
		UPDATE `game_status`
		SET `p_turn` = 'player 1';
	END if;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
