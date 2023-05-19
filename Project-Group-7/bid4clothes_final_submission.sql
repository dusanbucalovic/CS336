CREATE DATABASE  IF NOT EXISTS `bid4clothes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bid4clothes`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bid4clothes
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `admin_username` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('bill1234','billpassword');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `customer_email` varchar(50) DEFAULT NULL,
  `alert_id` int NOT NULL,
  `tag_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  KEY `customer_email` (`customer_email`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`customer_email`) REFERENCES `customers` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerttags`
--

DROP TABLE IF EXISTS `alerttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerttags` (
  `email` varchar(50) NOT NULL,
  `tag_content` varchar(50) NOT NULL,
  PRIMARY KEY (`email`,`tag_content`),
  CONSTRAINT `alerttags_ibfk_1` FOREIGN KEY (`email`) REFERENCES `customers` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerttags`
--

LOCK TABLES `alerttags` WRITE;
/*!40000 ALTER TABLE `alerttags` DISABLE KEYS */;
INSERT INTO `alerttags` VALUES ('anthony@gmail.com','blue');
/*!40000 ALTER TABLE `alerttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions`
--

DROP TABLE IF EXISTS `auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions` (
  `item_id` int NOT NULL,
  `sold` tinyint(1) DEFAULT NULL,
  `email_offer` varchar(50) DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `current_price` float DEFAULT NULL,
  `current_winner` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `email_offer` (`email_offer`),
  CONSTRAINT `auctions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `auctions_ibfk_2` FOREIGN KEY (`email_offer`) REFERENCES `customers` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions`
--

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;
INSERT INTO `auctions` VALUES (496135010,1,'anthony@gmail.com','2022-05-08 15:23:00',12,'jim@gmail.com'),(1094655801,0,'jim@gmail.com','2022-05-09 22:00:00',16,'anthony@gmail.com'),(1571120471,0,'jim@gmail.com','2022-05-11 22:00:00',0,NULL);
/*!40000 ALTER TABLE `auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beenalerted`
--

DROP TABLE IF EXISTS `beenalerted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beenalerted` (
  `email` varchar(50) NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`email`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `beenalerted_ibfk_1` FOREIGN KEY (`email`) REFERENCES `customers` (`customer_email`),
  CONSTRAINT `beenalerted_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beenalerted`
--

LOCK TABLES `beenalerted` WRITE;
/*!40000 ALTER TABLE `beenalerted` DISABLE KEYS */;
INSERT INTO `beenalerted` VALUES ('anthony@gmail.com',1571120471);
/*!40000 ALTER TABLE `beenalerted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `item_id` int NOT NULL,
  `email_bidder` varchar(50) DEFAULT NULL,
  `bid_datetime` datetime NOT NULL,
  `increment` float DEFAULT NULL,
  `max_limit` float DEFAULT NULL,
  `bid_amount` float NOT NULL,
  `auto_bid` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`item_id`,`bid_datetime`,`bid_amount`,`auto_bid`),
  KEY `email_bidder` (`email_bidder`),
  CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`email_bidder`) REFERENCES `customers` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (496135010,'jim@gmail.com','2022-05-08 15:22:38',1,15,12,_binary '\0'),(1094655801,'harry@gmail.com','2022-05-08 15:16:04',1,15,10,_binary '\0'),(1094655801,'anthony@gmail.com','2022-05-08 15:16:46',1,20,12,_binary '\0'),(1094655801,'anthony@gmail.com','2022-05-08 15:16:46',1,20,16,_binary '');
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_email` varchar(50) NOT NULL,
  `customer_password` varchar(50) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('anthony@gmail.com','swordfish5','Anthony Shopper'),('harry@gmail.com','hello','Harry'),('jim@gmail.com','swordfish1','Jim Tanner'),('sam@gmail.com','swordfish3','Sam Williams'),('tom@gmail.com','swordfish2','Tom Johnson');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `questions` varchar(100) NOT NULL,
  `answers` varchar(100) DEFAULT NULL,
  `rep_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`questions`),
  KEY `rep_email` (`rep_email`),
  CONSTRAINT `faqs_ibfk_1` FOREIGN KEY (`rep_email`) REFERENCES `reps` (`rep_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES ('How do I auction?','By auctioning.','james@gmail.com'),('How do I bid?','By bidding.','james@gmail.com'),('How do I sell items?','By selling.','james@gmail.com');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `min_price` float DEFAULT NULL,
  `item_description` varchar(200) DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `customer_email` (`customer_email`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`customer_email`) REFERENCES `customers` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (496135010,'My Socks','2022-05-08 15:21:31','2022-05-08 15:23:00',10,'This is a short-term sale for my socks.','anthony@gmail.com'),(1094655801,'My Green Shirt','2022-05-08 15:11:52','2022-05-09 22:00:00',10,'This is my green shirt.','jim@gmail.com'),(1571120471,'Blue Shirt','2022-05-08 15:19:10','2022-05-11 22:00:00',10,'This is a blue shirt.','jim@gmail.com');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reps`
--

DROP TABLE IF EXISTS `reps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reps` (
  `rep_email` varchar(50) NOT NULL,
  `rep_password` varchar(50) DEFAULT NULL,
  `rep_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rep_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reps`
--

LOCK TABLES `reps` WRITE;
/*!40000 ALTER TABLE `reps` DISABLE KEYS */;
INSERT INTO `reps` VALUES ('frank@gmail.com','rep','Frank Helper'),('hardy@gmail.com','rep','Hardy Helper'),('james@gmail.com','rep','James Helper'),('mary@gmail.com','rep','Mary Helper'),('rob@gmail.com','rep','Rob Helper'),('samhelp@gmail.com','rep','Sam Helper'),('sandy@gmail.com','rep','Sandra Helper'),('will@gmail.com','rep','William Helper');
/*!40000 ALTER TABLE `reps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `customer_email` varchar(50) NOT NULL,
  `rep_email` varchar(50) DEFAULT NULL,
  `resolved` tinyint(1) DEFAULT NULL,
  `question` varchar(100) NOT NULL,
  `answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`question`,`customer_email`),
  KEY `customer_email` (`customer_email`),
  KEY `rep_email` (`rep_email`),
  CONSTRAINT `support_tickets_ibfk_1` FOREIGN KEY (`customer_email`) REFERENCES `customers` (`customer_email`),
  CONSTRAINT `support_tickets_ibfk_2` FOREIGN KEY (`rep_email`) REFERENCES `reps` (`rep_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
INSERT INTO `support_tickets` VALUES ('anthony@gmail.com','frank@gmail.com',1,'Can you help me with this issue?','Yes');
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `item_id` int NOT NULL,
  `tag_type` varchar(50) NOT NULL,
  `tag_content` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_type`,`item_id`,`tag_content`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (496135010,'Color','White'),(496135010,'Item Size','Medium'),(496135010,'Item Type','Socks'),(496135010,'Quality','New'),(496135010,'Season (Fall)','Fall'),(496135010,'Season (Winter)','Winter'),(1094655801,'Color','Green'),(1094655801,'Item Size','Medium'),(1094655801,'Item Type','Shirt'),(1094655801,'Quality','New'),(1094655801,'Season (Fall)','Fall'),(1094655801,'Season (Winter)','Winter'),(1094655801,'Usage','Cold Weather'),(1571120471,'Color','Blue'),(1571120471,'Item Size','Small'),(1571120471,'Item Type','Shirt'),(1571120471,'Quality','New');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('jim@gmail.com','swordfish1'),('sam@gmail.com','swordfish3'),('tom@gmail.com','swordfish2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-08 15:33:41
