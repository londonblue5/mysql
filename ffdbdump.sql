CREATE DATABASE  IF NOT EXISTS `frankfurtdb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `frankfurtdb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: frankfurtdb
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `journey_days`
--

DROP TABLE IF EXISTS `journey_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_days` (
  `Journey_id` int unsigned NOT NULL,
  `Days_active` varchar(100) NOT NULL,
  PRIMARY KEY (`Journey_id`,`Days_active`),
  CONSTRAINT `FK_Journey_info_Journey_id` FOREIGN KEY (`Journey_id`) REFERENCES `journey_info` (`Journey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_days`
--

LOCK TABLES `journey_days` WRITE;
/*!40000 ALTER TABLE `journey_days` DISABLE KEYS */;
INSERT INTO `journey_days` VALUES (1,'Everyday'),(2,'Everyday'),(3,'Everyday'),(4,'Everyday'),(5,'Monday to Saturday'),(6,'Monday to Saturday');
/*!40000 ALTER TABLE `journey_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey_info`
--

DROP TABLE IF EXISTS `journey_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_info` (
  `Journey_id` int unsigned NOT NULL,
  `Line_id` int unsigned NOT NULL,
  `Departure_time` datetime NOT NULL,
  `Arrival_time` datetime NOT NULL,
  PRIMARY KEY (`Journey_id`),
  KEY `Line_id_idx` (`Line_id`),
  CONSTRAINT `FK_Line_Line_id` FOREIGN KEY (`Line_id`) REFERENCES `line` (`Line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_info`
--

LOCK TABLES `journey_info` WRITE;
/*!40000 ALTER TABLE `journey_info` DISABLE KEYS */;
INSERT INTO `journey_info` VALUES (1,1,'2025-01-03 06:35:00','2025-01-03 06:55:00'),(2,1,'2025-01-03 16:48:00','2025-01-03 17:10:00'),(3,2,'2025-01-03 09:05:00','2025-01-03 09:55:00'),(4,2,'2025-01-04 20:11:00','2025-01-04 20:43:00'),(5,6,'2025-01-04 21:32:00','2025-01-04 22:00:00'),(6,6,'2025-01-04 11:35:00','2025-01-04 12:22:00'),(7,7,'2025-01-05 12:48:00','2025-01-05 13:37:00');
/*!40000 ALTER TABLE `journey_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Journey_info_BEFORE_INSERT` BEFORE INSERT ON `journey_info` FOR EACH ROW BEGIN
-- Check if Departure_time is before Arrival_time
    IF NEW.Departure_time >= NEW.Arrival_time THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Departure_time must be before Arrival_time.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Journey_info_BEFORE_UPDATE` BEFORE UPDATE ON `journey_info` FOR EACH ROW BEGIN
-- Check if Departure_time is before Arrival_time
    IF NEW.Departure_time >= NEW.Arrival_time THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Departure_time must be before Arrival_time.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `journey_stop_arrival`
--

DROP TABLE IF EXISTS `journey_stop_arrival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_stop_arrival` (
  `Journey_id` int unsigned NOT NULL,
  `Stop_id` int unsigned NOT NULL,
  `Scheduled_arrival` datetime NOT NULL,
  `Actual_arrival` datetime NOT NULL,
  PRIMARY KEY (`Journey_id`,`Stop_id`),
  KEY `Stop_id_idx` (`Stop_id`),
  KEY `FK_Journey_delay_idx` (`Scheduled_arrival`,`Actual_arrival`),
  CONSTRAINT `FK2_Journey_info_Journey_id` FOREIGN KEY (`Journey_id`) REFERENCES `journey_info` (`Journey_id`),
  CONSTRAINT `FK_Journey_delay` FOREIGN KEY (`Scheduled_arrival`, `Actual_arrival`) REFERENCES `journey_stop_delay` (`Scheduled_arrival`, `Actual_arrival`),
  CONSTRAINT `FK_Stop_info_Stop_id` FOREIGN KEY (`Stop_id`) REFERENCES `stop_info` (`Stop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_stop_arrival`
--

LOCK TABLES `journey_stop_arrival` WRITE;
/*!40000 ALTER TABLE `journey_stop_arrival` DISABLE KEYS */;
INSERT INTO `journey_stop_arrival` VALUES (1,1,'2024-12-21 07:36:00','2024-12-21 07:38:00'),(2,3,'2025-01-03 06:35:00','2025-01-03 06:39:00'),(4,1,'2025-01-03 09:05:00','2025-01-03 09:05:30'),(3,3,'2025-01-03 16:48:00','2025-01-03 16:48:00'),(6,7,'2025-01-04 20:11:00','2025-01-04 20:13:00');
/*!40000 ALTER TABLE `journey_stop_arrival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey_stop_delay`
--

DROP TABLE IF EXISTS `journey_stop_delay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_stop_delay` (
  `Scheduled_arrival` datetime NOT NULL,
  `Actual_arrival` datetime NOT NULL,
  `Actual_delay` time NOT NULL,
  PRIMARY KEY (`Scheduled_arrival`,`Actual_arrival`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_stop_delay`
--

LOCK TABLES `journey_stop_delay` WRITE;
/*!40000 ALTER TABLE `journey_stop_delay` DISABLE KEYS */;
INSERT INTO `journey_stop_delay` VALUES ('2024-12-20 18:22:03','2024-12-20 18:23:03','00:01:00'),('2024-12-21 07:36:00','2024-12-21 07:38:00','00:02:00'),('2025-01-03 06:35:00','2025-01-03 06:39:00','00:04:00'),('2025-01-03 09:05:00','2025-01-03 09:05:30','00:00:30'),('2025-01-03 16:48:00','2025-01-03 16:48:00','00:00:00'),('2025-01-04 20:11:00','2025-01-04 20:13:00','00:02:00');
/*!40000 ALTER TABLE `journey_stop_delay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `Line_id` int unsigned NOT NULL,
  `Line_name` varchar(100) NOT NULL,
  `Line_type` enum('S-Bahn','U-Bahn','Bus','Regional_train','Tram') NOT NULL,
  PRIMARY KEY (`Line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (1,'TRAFFIQ','S-Bahn'),(2,'MTV','U-Bahn'),(3,'ZV VHT','Bus'),(4,'IV HG','U-Bahn'),(5,'VGO-FB','Regional_train'),(6,'NIO','Tram'),(7,'VLDWLDK','Bus');
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_stops`
--

DROP TABLE IF EXISTS `line_stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line_stops` (
  `Line_id` int unsigned NOT NULL,
  `Stop_id` int unsigned NOT NULL,
  `Sequence` int NOT NULL,
  PRIMARY KEY (`Line_id`,`Stop_id`),
  KEY `Stop_id_idx` (`Stop_id`),
  CONSTRAINT `FK2_Line_Line_id` FOREIGN KEY (`Line_id`) REFERENCES `line` (`Line_id`),
  CONSTRAINT `FK2_Stop_info_Stop_id` FOREIGN KEY (`Stop_id`) REFERENCES `stop_info` (`Stop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_stops`
--

LOCK TABLES `line_stops` WRITE;
/*!40000 ALTER TABLE `line_stops` DISABLE KEYS */;
INSERT INTO `line_stops` VALUES (1,1,1),(1,3,5),(1,4,2),(2,1,8),(2,5,6),(3,2,10),(4,6,1),(5,4,8),(6,7,2);
/*!40000 ALTER TABLE `line_stops` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Line_stops_BEFORE_INSERT` BEFORE INSERT ON `line_stops` FOR EACH ROW BEGIN
   -- Ensure Sequence is a positive integer
    IF NEW.Sequence <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sequence must be a positive integer.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Line_stops_BEFORE_UPDATE` BEFORE UPDATE ON `line_stops` FOR EACH ROW BEGIN
   -- Ensure Sequence is a positive integer
    IF NEW.Sequence <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sequence must be a positive integer.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `Passenger_id` int unsigned NOT NULL,
  `First_name` varchar(100) NOT NULL,
  `Phone_number` varchar(15) NOT NULL,
  `Last_name` varchar(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Status` enum('student','low_income','aged_6-14','aged_65+') DEFAULT NULL,
  PRIMARY KEY (`Passenger_id`,`First_name`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Phone_number_UNIQUE` (`Phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Giorgos','6977777777','Mikros','gmik@gmail.com','student'),(2,'Anthi','6988888888','Terastiou','ater@gmail.com','student'),(3,'Frau','6900000000','Litsa','frau@gmail.com','aged_6-14'),(4,'Nikas','6944444444','Manikas','nmn@ece.auth.gr',NULL),(5,'Lias','6911111111','Karabalikas','lkr@gmail.com',NULL);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Passenger_BEFORE_INSERT` BEFORE INSERT ON `passenger` FOR EACH ROW BEGIN
    -- Check for valid email:
    IF NOT NEW.Email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The email address is not valid.';
    END IF; 
    -- Check for valid phone number:
    IF NOT NEW.Phone_number REGEXP '^[0-9]{10}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The phone number is not valid (it must have 10 digits).';
    END IF;

    -- Check for valid status (or NULL):
    IF NEW.Status IS NOT NULL AND NEW.Status NOT IN ('student', 'low_income', 'aged_6-14', 'aged_65+') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The status is not valid. Allowed values: student, low_income, aged_6-14, aged_65+.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Passenger_BEFORE_UPDATE` BEFORE UPDATE ON `passenger` FOR EACH ROW BEGIN
 -- Check for valid email:
    IF NOT NEW.Email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The email address is not valid.';
    END IF; 
    -- Check for valid phone number:
    IF NOT NEW.Phone_number REGEXP '^[0-9]{10}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The phone number is not valid (it must have 10 digits).';
    END IF;

    -- Check for valid status (or NULL):
    IF NEW.Status IS NOT NULL AND NEW.Status NOT IN ('student', 'low_income', 'aged_6-14', 'aged_65+') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The status is not valid. Allowed values: student, low_income, aged_6-14, aged_65+.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `passenger_ticket`
--

DROP TABLE IF EXISTS `passenger_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_ticket` (
  `Passenger_id` int unsigned NOT NULL,
  `Ticket_id` int unsigned NOT NULL,
  `Purchase_datetime` datetime NOT NULL,
  PRIMARY KEY (`Passenger_id`,`Ticket_id`),
  KEY `Ticket_id_idx` (`Ticket_id`),
  CONSTRAINT `FK_Passenger_Passenger_id` FOREIGN KEY (`Passenger_id`) REFERENCES `passenger` (`Passenger_id`),
  CONSTRAINT `FK_Ticket_1_Ticket_id` FOREIGN KEY (`Ticket_id`) REFERENCES `ticket_1` (`Ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_ticket`
--

LOCK TABLES `passenger_ticket` WRITE;
/*!40000 ALTER TABLE `passenger_ticket` DISABLE KEYS */;
INSERT INTO `passenger_ticket` VALUES (1,5,'2024-12-17 06:35:12'),(1,7,'2024-12-31 16:35:12'),(2,2,'2025-01-09 07:34:12'),(2,3,'2025-01-09 18:04:12'),(3,9,'2025-01-11 11:13:47'),(4,32,'2025-01-12 14:39:05'),(5,99,'2025-01-12 23:58:27');
/*!40000 ALTER TABLE `passenger_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `popular_lines`
--

DROP TABLE IF EXISTS `popular_lines`;
/*!50001 DROP VIEW IF EXISTS `popular_lines`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `popular_lines` AS SELECT 
 1 AS `Line`,
 1 AS `Ticket_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `price_level`
--

DROP TABLE IF EXISTS `price_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_level` (
  `Price_level_id` int unsigned NOT NULL,
  `Zone_count` int NOT NULL,
  PRIMARY KEY (`Price_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_level`
--

LOCK TABLES `price_level` WRITE;
/*!40000 ALTER TABLE `price_level` DISABLE KEYS */;
INSERT INTO `price_level` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8);
/*!40000 ALTER TABLE `price_level` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Price_level_BEFORE_INSERT` BEFORE INSERT ON `price_level` FOR EACH ROW BEGIN
-- Check if the Price_level_id is equal to Zone_count
    IF NEW.Price_level_id != NEW.Zone_count THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The Price_level_id must be equal to Zone_count.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Price_level_BEFORE_UPDATE` BEFORE UPDATE ON `price_level` FOR EACH ROW BEGIN
-- Check if the Price_level_id is equal to Zone_count
    IF NEW.Price_level_id != NEW.Zone_count THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The Price_level_id must be equal to Zone_count.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stop_info`
--

DROP TABLE IF EXISTS `stop_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stop_info` (
  `Stop_id` int unsigned NOT NULL,
  `Stop_name` varchar(100) NOT NULL,
  `Stop_type` enum('S-Bahn','U-Bahn','Bus','Regional_train','Tram') NOT NULL,
  `Latitude` decimal(9,6) NOT NULL,
  `Longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`Stop_id`),
  KEY `FK_Stop_locations_Longitude_idx` (`Latitude`,`Longitude`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_Stop_locations` FOREIGN KEY (`Latitude`, `Longitude`) REFERENCES `stop_locations_zones` (`Latitude`, `Longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop_info`
--

LOCK TABLES `stop_info` WRITE;
/*!40000 ALTER TABLE `stop_info` DISABLE KEYS */;
INSERT INTO `stop_info` VALUES (1,'Frankfurt (Main) Gutleut-/Heilbronner Straße','U-Bahn',50.099764,8.654205),(2,'Frankfurt (Main) Weser-/Münchener Straße','S-Bahn',50.107956,8.670281),(3,'Frankfurt (Main) Hauptbahnhof/Münchener Straße','U-Bahn',50.106929,8.666220),(4,'Frankfurt (Main) Platz der Republik','Bus',50.109117,8.661382),(5,'Frankfurt (Main) Hauptbahnhof','S-Bahn',50.107155,8.663759),(6,'Frankfurt (Main) Taunusanlage','Regional_train',50.113481,8.668762),(7,'Frankfurt (Main) Roßmarkt','Tram',50.112522,8.676024);
/*!40000 ALTER TABLE `stop_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stop_locations_zones`
--

DROP TABLE IF EXISTS `stop_locations_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stop_locations_zones` (
  `Latitude` decimal(9,6) NOT NULL,
  `Longitude` decimal(9,6) NOT NULL,
  `Zone` int NOT NULL,
  PRIMARY KEY (`Latitude`,`Longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop_locations_zones`
--

LOCK TABLES `stop_locations_zones` WRITE;
/*!40000 ALTER TABLE `stop_locations_zones` DISABLE KEYS */;
INSERT INTO `stop_locations_zones` VALUES (50.099764,8.654205,3),(50.101741,8.654026,3),(50.103136,8.657273,3),(50.104078,8.695398,4),(50.104506,8.664784,4),(50.105425,8.694789,4),(50.105562,8.650854,4),(50.106929,8.666220,3),(50.107155,8.663759,3),(50.107527,8.655732,4),(50.107956,8.670281,3),(50.108991,8.673895,1),(50.109117,8.661382,3),(50.110854,8.684088,2),(50.110928,8.682004,2),(50.112522,8.676024,3),(50.113481,8.668762,3),(50.113960,8.679286,1);
/*!40000 ALTER TABLE `stop_locations_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Stop_Locations_Zones_BEFORE_INSERT` BEFORE INSERT ON `stop_locations_zones` FOR EACH ROW BEGIN
 -- Check if Latitude is between -90 and 90
    IF NEW.Latitude < -90 OR NEW.Latitude > 90 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Latitude must be between -90 and 90.';
    END IF;

    -- Check if Longitude is between -180 and 180
    IF NEW.Longitude < -180 OR NEW.Longitude > 180 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Longitude must be between -180 and 180.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Stop_Locations_Zones_BEFORE_UPDATE` BEFORE UPDATE ON `stop_locations_zones` FOR EACH ROW BEGIN
 -- Check if Latitude is between -90 and 90
    IF NEW.Latitude < -90 OR NEW.Latitude > 90 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Latitude must be between -90 and 90.';
    END IF;

    -- Check if Longitude is between -180 and 180
    IF NEW.Longitude < -180 OR NEW.Longitude > 180 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Longitude must be between -180 and 180.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket_1`
--

DROP TABLE IF EXISTS `ticket_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_1` (
  `Ticket_id` int unsigned NOT NULL,
  `Type_id` int unsigned NOT NULL,
  `Category_id` int unsigned NOT NULL,
  `Price_level_id` int unsigned NOT NULL,
  `Discount_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`Ticket_id`),
  KEY `Discount_id_idx` (`Discount_id`),
  KEY `Type_id_idx` (`Type_id`),
  KEY `Category_id_idx` (`Category_id`),
  KEY `Price_level_idx` (`Price_level_id`),
  CONSTRAINT `FK2_Ticket_discount_Discount_id` FOREIGN KEY (`Discount_id`) REFERENCES `ticket_discount` (`Discount_id`),
  CONSTRAINT `FK_Price_level_id` FOREIGN KEY (`Price_level_id`) REFERENCES `price_level` (`Price_level_id`),
  CONSTRAINT `FK_Ticket_category_Category_id` FOREIGN KEY (`Category_id`) REFERENCES `ticket_category` (`Category_id`),
  CONSTRAINT `FK_Ticket_type_Type_id` FOREIGN KEY (`Type_id`) REFERENCES `ticket_type` (`Type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_1`
--

LOCK TABLES `ticket_1` WRITE;
/*!40000 ALTER TABLE `ticket_1` DISABLE KEYS */;
INSERT INTO `ticket_1` VALUES (1,4,3,5,2),(2,6,3,8,3),(3,1,2,1,2),(4,2,1,1,1),(5,1,1,1,1),(7,1,1,1,1),(9,2,1,2,1),(32,2,1,2,1),(99,5,2,3,1);
/*!40000 ALTER TABLE `ticket_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_base_price`
--

DROP TABLE IF EXISTS `ticket_base_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_base_price` (
  `Type_id` int unsigned NOT NULL,
  `Category_id` int unsigned NOT NULL,
  `Price_level_id` int unsigned NOT NULL,
  `Base_price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Type_id`,`Price_level_id`,`Category_id`),
  UNIQUE KEY `Base_price_UNIQUE` (`Base_price`),
  KEY `Category_id_idx` (`Category_id`),
  KEY `Price_level_idx` (`Price_level_id`),
  CONSTRAINT `FK2_Price_level_id` FOREIGN KEY (`Price_level_id`) REFERENCES `price_level` (`Price_level_id`),
  CONSTRAINT `FK2_Ticket_category_Category_id` FOREIGN KEY (`Category_id`) REFERENCES `ticket_category` (`Category_id`),
  CONSTRAINT `FK2_Ticket_type_Type_id` FOREIGN KEY (`Type_id`) REFERENCES `ticket_type` (`Type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_base_price`
--

LOCK TABLES `ticket_base_price` WRITE;
/*!40000 ALTER TABLE `ticket_base_price` DISABLE KEYS */;
INSERT INTO `ticket_base_price` VALUES (1,1,1,0.90),(1,2,1,1.80),(2,1,2,3.20),(3,3,2,3.40),(4,1,4,7.00),(1,2,8,7.60),(6,3,5,17.50);
/*!40000 ALTER TABLE `ticket_base_price` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ticket_base_price_BEFORE_INSERT` BEFORE INSERT ON `ticket_base_price` FOR EACH ROW BEGIN
 -- Check if Base_price is positive
    IF NEW.Base_price <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Base_price must be a positive value.';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ticket_base_price_BEFORE_UPDATE` BEFORE UPDATE ON `ticket_base_price` FOR EACH ROW BEGIN
 -- Check if Base_price is positive
    IF NEW.Base_price <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Base_price must be a positive value.';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket_category`
--

DROP TABLE IF EXISTS `ticket_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_category` (
  `Category_id` int unsigned NOT NULL,
  `Category_name` enum('Personal','Family','Group') NOT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_category`
--

LOCK TABLES `ticket_category` WRITE;
/*!40000 ALTER TABLE `ticket_category` DISABLE KEYS */;
INSERT INTO `ticket_category` VALUES (1,'Personal'),(2,'Family'),(3,'Group');
/*!40000 ALTER TABLE `ticket_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_discount`
--

DROP TABLE IF EXISTS `ticket_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_discount` (
  `Discount_id` int unsigned NOT NULL,
  `Discount_name` enum('student','low_income','aged_6-14','aged_65+') DEFAULT NULL,
  `Discount_rate` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`Discount_id`),
  UNIQUE KEY `Discount_name_UNIQUE` (`Discount_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_discount`
--

LOCK TABLES `ticket_discount` WRITE;
/*!40000 ALTER TABLE `ticket_discount` DISABLE KEYS */;
INSERT INTO `ticket_discount` VALUES (1,'student',0.50),(2,'low_income',0.25),(3,'aged_6-14',0.25);
/*!40000 ALTER TABLE `ticket_discount` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ticket_discount_BEFORE_INSERT` BEFORE INSERT ON `ticket_discount` FOR EACH ROW BEGIN
 -- Check if Discount_rate is between 0 and 1
    IF NEW.Discount_rate < 0 OR NEW.Discount_rate > 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Discount_rate must be between 0 and 1.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ticket_discount_BEFORE_UPDATE` BEFORE UPDATE ON `ticket_discount` FOR EACH ROW BEGIN
 -- Check if Discount_rate is between 0 and 1
    IF NEW.Discount_rate < 0 OR NEW.Discount_rate > 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Discount_rate must be between 0 and 1.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket_final_price`
--

DROP TABLE IF EXISTS `ticket_final_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_final_price` (
  `Discount_id` int unsigned NOT NULL,
  `Base_price` decimal(5,2) NOT NULL,
  `Final_price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Discount_id`,`Base_price`),
  KEY `Base_price_idx` (`Base_price`),
  CONSTRAINT `FK_Ticket_Base_price` FOREIGN KEY (`Base_price`) REFERENCES `ticket_base_price` (`Base_price`),
  CONSTRAINT `FK_Ticket_Discount_Discount_id` FOREIGN KEY (`Discount_id`) REFERENCES `ticket_discount` (`Discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_final_price`
--

LOCK TABLES `ticket_final_price` WRITE;
/*!40000 ALTER TABLE `ticket_final_price` DISABLE KEYS */;
INSERT INTO `ticket_final_price` VALUES (1,0.90,0.45),(1,3.40,1.70),(1,17.50,8.75),(2,1.80,1.35),(2,7.00,5.25),(3,3.20,2.40),(3,7.60,5.70);
/*!40000 ALTER TABLE `ticket_final_price` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ticket_final_price_BEFORE_INSERT` BEFORE INSERT ON `ticket_final_price` FOR EACH ROW BEGIN
    -- Check if Final_price is positive
    IF NEW.Final_price <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Final_price must be a positive value.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ticket_final_price_BEFORE_UPDATE` BEFORE UPDATE ON `ticket_final_price` FOR EACH ROW BEGIN
    -- Check if Final_price is positive
    IF NEW.Final_price <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Final_price must be a positive value.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ticket_line`
--

DROP TABLE IF EXISTS `ticket_line`;
/*!50001 DROP VIEW IF EXISTS `ticket_line`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ticket_line` AS SELECT 
 1 AS `ticket_id`,
 1 AS `Line`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ticket_type`
--

DROP TABLE IF EXISTS `ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_type` (
  `Type_id` int unsigned NOT NULL,
  `Type_name` enum('Single','Short_distance','Day','Weekly','Monthly','Annual') NOT NULL,
  `Duration` float DEFAULT NULL,
  PRIMARY KEY (`Type_id`),
  UNIQUE KEY `Type_name_UNIQUE` (`Type_name`),
  UNIQUE KEY `Duration_UNIQUE` (`Duration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_type`
--

LOCK TABLES `ticket_type` WRITE;
/*!40000 ALTER TABLE `ticket_type` DISABLE KEYS */;
INSERT INTO `ticket_type` VALUES (1,'Single',80),(2,'Day',1440),(3,'Weekly',10080),(4,'Short_distance',50),(5,'Monthly',43200),(6,'Annual',525600);
/*!40000 ALTER TABLE `ticket_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ticket_type_BEFORE_INSERT` BEFORE INSERT ON `ticket_type` FOR EACH ROW BEGIN
    -- Check if the Duration is valid (greater than 0)
    IF NEW.Duration <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The Duration must be greater than 0.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Ticket_type_BEFORE_UPDATE` BEFORE UPDATE ON `ticket_type` FOR EACH ROW BEGIN
      -- Check if the Duration is valid (greater than 0)
    IF NEW.Duration <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The Duration must be greater than 0.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket_vehicle`
--

DROP TABLE IF EXISTS `ticket_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_vehicle` (
  `Ticket_id` int unsigned NOT NULL,
  `Vehicle_id` int unsigned NOT NULL,
  `Check_datetime` datetime NOT NULL,
  PRIMARY KEY (`Ticket_id`,`Vehicle_id`,`Check_datetime`),
  KEY `Vehicle_id_idx` (`Vehicle_id`),
  CONSTRAINT `FK2_Ticket_1_Ticket_id` FOREIGN KEY (`Ticket_id`) REFERENCES `ticket_1` (`Ticket_id`),
  CONSTRAINT `FK_Vehicle_type_Vehicle_id` FOREIGN KEY (`Vehicle_id`) REFERENCES `vehicle_type` (`Vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_vehicle`
--

LOCK TABLES `ticket_vehicle` WRITE;
/*!40000 ALTER TABLE `ticket_vehicle` DISABLE KEYS */;
INSERT INTO `ticket_vehicle` VALUES (2,1,'2025-01-04 11:33:45'),(99,1,'2025-01-08 21:38:52'),(4,2,'2025-01-05 16:42:00'),(3,3,'2025-01-04 09:01:17'),(7,4,'2025-01-06 19:13:49'),(9,4,'2025-01-07 06:25:18'),(1,6,'2025-01-04 13:58:12');
/*!40000 ALTER TABLE `ticket_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_journey`
--

DROP TABLE IF EXISTS `vehicle_journey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_journey` (
  `Vehicle_id` int unsigned NOT NULL,
  `Journey_id` int unsigned NOT NULL,
  PRIMARY KEY (`Vehicle_id`,`Journey_id`),
  KEY `Journey_id_idx` (`Journey_id`),
  CONSTRAINT `FK2_Vehicle_type_Vehicle_id` FOREIGN KEY (`Vehicle_id`) REFERENCES `vehicle_type` (`Vehicle_id`),
  CONSTRAINT `FK3_Journey_info_Journey_id` FOREIGN KEY (`Journey_id`) REFERENCES `journey_info` (`Journey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_journey`
--

LOCK TABLES `vehicle_journey` WRITE;
/*!40000 ALTER TABLE `vehicle_journey` DISABLE KEYS */;
INSERT INTO `vehicle_journey` VALUES (1,1),(7,1),(2,2),(5,3),(6,3),(3,5),(4,7);
/*!40000 ALTER TABLE `vehicle_journey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_location`
--

DROP TABLE IF EXISTS `vehicle_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_location` (
  `Vehicle_id` int unsigned NOT NULL,
  `Latitude` decimal(9,6) NOT NULL,
  `Longitude` decimal(9,6) NOT NULL,
  `Timestamp` time NOT NULL,
  PRIMARY KEY (`Vehicle_id`,`Latitude`,`Longitude`,`Timestamp`),
  CONSTRAINT `FK3_Vehicle_type_Vehicle_id` FOREIGN KEY (`Vehicle_id`) REFERENCES `vehicle_type` (`Vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_location`
--

LOCK TABLES `vehicle_location` WRITE;
/*!40000 ALTER TABLE `vehicle_location` DISABLE KEYS */;
INSERT INTO `vehicle_location` VALUES (1,50.024317,8.502934,'06:34:27'),(2,50.100583,8.295447,'15:38:02'),(3,50.432672,8.127659,'13:31:56'),(4,50.589326,8.756433,'20:58:19'),(5,50.164732,8.428811,'09:12:21'),(6,50.943201,8.781259,'15:04:54');
/*!40000 ALTER TABLE `vehicle_location` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Vehicle_location_BEFORE_INSERT` BEFORE INSERT ON `vehicle_location` FOR EACH ROW BEGIN
-- Check if Latitude is between -90 and 90
    IF NEW.Latitude < -90 OR NEW.Latitude > 90 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Latitude must be between -90 and 90.';
    END IF;

    -- Check if Longitude is between -180 and 180
    IF NEW.Longitude < -180 OR NEW.Longitude > 180 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Longitude must be between -180 and 180.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Vehicle_location_BEFORE_UPDATE` BEFORE UPDATE ON `vehicle_location` FOR EACH ROW BEGIN
-- Check if Latitude is between -90 and 90
    IF NEW.Latitude < -90 OR NEW.Latitude > 90 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Latitude must be between -90 and 90.';
    END IF;

    -- Check if Longitude is between -180 and 180
    IF NEW.Longitude < -180 OR NEW.Longitude > 180 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Longitude must be between -180 and 180.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type` (
  `Vehicle_id` int unsigned NOT NULL,
  `Vehicle_type` enum('S-Bahn','U-Bahn','Bus','Regional_train','Tram') NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`Vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (1,'S-Bahn',280),(2,'S-Bahn',280),(3,'U-Bahn',350),(4,'U-Bahn',360),(5,'Bus',55),(6,'Regional_train',320),(7,'Tram',224);
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Vehicle_type_BEFORE_INSERT` BEFORE INSERT ON `vehicle_type` FOR EACH ROW BEGIN
-- Check if Capacity is a positive number
    IF NEW.Capacity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Capacity must be a positive number.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Vehicle_type_BEFORE_UPDATE` BEFORE UPDATE ON `vehicle_type` FOR EACH ROW BEGIN
-- Check if Capacity is a positive number
    IF NEW.Capacity <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Capacity must be a positive number.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'frankfurtdb'
--

--
-- Dumping routines for database 'frankfurtdb'
--

--
-- Final view structure for view `popular_lines`
--

/*!50001 DROP VIEW IF EXISTS `popular_lines`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_lines` AS select `line`.`Line_name` AS `Line`,count(`ticket_vehicle`.`Ticket_id`) AS `Ticket_count` from (((`ticket_vehicle` join `vehicle_journey` on((`ticket_vehicle`.`Vehicle_id` = `vehicle_journey`.`Vehicle_id`))) join `journey_info` on((`vehicle_journey`.`Journey_id` = `journey_info`.`Journey_id`))) join `line` on((`journey_info`.`Line_id` = `line`.`Line_id`))) group by `Line` order by `Ticket_count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ticket_line`
--

/*!50001 DROP VIEW IF EXISTS `ticket_line`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ticket_line` AS select `ticket_vehicle`.`Ticket_id` AS `ticket_id`,`line`.`Line_name` AS `Line` from (((`ticket_vehicle` join `vehicle_journey` on((`ticket_vehicle`.`Vehicle_id` = `vehicle_journey`.`Vehicle_id`))) join `journey_info` on((`vehicle_journey`.`Journey_id` = `journey_info`.`Journey_id`))) join `line` on((`journey_info`.`Line_id` = `line`.`Line_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-17 19:20:53
