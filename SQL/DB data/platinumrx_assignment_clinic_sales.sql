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
-- Table structure for table `clinic_sales`
--

DROP TABLE IF EXISTS `clinic_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_sales` (
  `oid` varchar(50) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `sales_channel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  CONSTRAINT `clinic_sales_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `customer` (`uid`),
  CONSTRAINT `clinic_sales_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `clinics` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_sales`
--

LOCK TABLES `clinic_sales` WRITE;
/*!40000 ALTER TABLE `clinic_sales` DISABLE KEYS */;
INSERT INTO `clinic_sales` VALUES ('ord-00100-00100','bk-09f3e-95hj','cnc-0100001',24999.00,'2021-09-23 12:03:22','sodexo'),('ord-00100-00101','cu-9283-kkd8','cnc-0100001',18000.00,'2021-09-23 14:10:50','cash'),('ord-00200-00100','cu-5582-mmn2','cnc-0100002',32000.00,'2021-09-25 10:45:10','upi'),('ord-00300-00220','cu-5582-mmn2','cnc-0200001',15000.00,'2021-10-02 11:20:15','sodexo');
/*!40000 ALTER TABLE `clinic_sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03 10:26:13
