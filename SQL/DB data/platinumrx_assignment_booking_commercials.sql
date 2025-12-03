-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: platinumrx_assignment
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `booking_commercials`
--

DROP TABLE IF EXISTS `booking_commercials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_commercials` (
  `id` varchar(50) NOT NULL,
  `booking_id` varchar(50) DEFAULT NULL,
  `bill_id` varchar(50) DEFAULT NULL,
  `bill_date` datetime DEFAULT NULL,
  `item_id` varchar(50) DEFAULT NULL,
  `item_quantity` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `booking_commercials_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`),
  CONSTRAINT `booking_commercials_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_commercials`
--

LOCK TABLES `booking_commercials` WRITE;
/*!40000 ALTER TABLE `booking_commercials` DISABLE KEYS */;
INSERT INTO `booking_commercials` VALUES ('k91d-pp31-ee82','bk-11kd9-88lpq','bl-12ppw-3311','2021-10-10 10:00:00','itm-pp92-kd91',2.00),('o88e-wk17-pp92','bk-55kd1-19wke','bl-77lee-3399','2021-11-12 18:45:00','itm-a07vh-aer8',2.00),('p19s-al91-zz32','bk-98pl0-78dke','bl-aj18d-33p9','2021-11-25 15:00:00','itm-kk19-zz28',3.00),('q34r-3q4o8-q34u','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a9e8-q8fu',3.00),('q3o4-ahf32-o2u4','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a07vh-aer8',1.00),('w92l-qq91-mm02','bk-55kd1-19wke','bl-77lee-3399','2021-11-12 18:45:00','itm-kk19-zz28',1.00);
/*!40000 ALTER TABLE `booking_commercials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03 10:26:12
