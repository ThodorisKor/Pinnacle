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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
