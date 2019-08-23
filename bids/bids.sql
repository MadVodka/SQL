-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bids
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `bid_date` date DEFAULT NULL,
  `bid_value` double DEFAULT NULL,
  `items_item_id` int(11) NOT NULL,
  `users_user_id` int(11) NOT NULL,
  PRIMARY KEY (`bid_id`),
  KEY `fk_bids_items1_idx` (`items_item_id`),
  KEY `fk_bids_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_bids_items1` FOREIGN KEY (`items_item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bids_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (1,'2019-08-10',208,8,3),(2,'2019-08-12',216,8,1),(3,'2019-08-15',110,1,4),(4,'2019-08-16',120,1,2),(5,'2019-08-18',130,1,4),(6,'2019-08-19',140,1,2),(7,'2019-06-11',530,11,1),(8,'2019-06-11',560,11,2),(9,'2019-06-11',590,11,5),(10,'2019-07-29',220,2,4),(11,'2019-08-17',15400,7,1),(12,'2019-08-21',15800,7,5),(13,'2019-08-11',213,6,2),(14,'2019-08-13',226,6,3),(15,'2019-08-14',239,6,2),(16,'2019-08-14',252,6,5),(17,'2019-08-20',265,6,3),(18,'2019-08-15',105,13,2),(19,'2019-08-19',110,13,4),(20,'2019-08-22',115,13,5);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `start_price` double DEFAULT NULL,
  `bid_increment` double DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `stop_date` date DEFAULT NULL,
  `buy_it_now` binary(1) DEFAULT NULL,
  `users_user_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_items_users_idx` (`users_user_id`),
  CONSTRAINT `fk_items_users` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Телефон','Samsung',100,10,'2019-08-11','2019-08-30',NULL,1),(2,'Монитор','Asus Rog',200,20,'2019-07-04','2019-08-25',NULL,5),(3,'Мотоцикл','Yamaha',10000,300,'2019-08-01','2019-08-11',NULL,3),(4,'Телевизор','Philips',300,15,'2019-05-24','2019-06-03',NULL,5),(5,'Диван','Раскладной, тканевый',250,25,'2019-02-11','2019-03-11',NULL,3),(6,'Кресло','Офисное, настраиваемое',200,13,'2019-08-10','2019-08-29',NULL,4),(7,'Автомобиль','внедорожник Toyota L200',15000,400,'2019-08-17','2019-09-17',NULL,2),(8,'Стиральная машина','Zanussi',200,8,'2019-08-02','2019-08-20',NULL,2),(9,'Платье','вечернее, красное',140,10,'2019-07-25','2019-08-25',NULL,1),(10,'Ботинки','кожаные, черные',170,17,'2019-08-19','2019-08-30',NULL,4),(11,'Маршрутизатор','Cisco',500,30,'2019-06-11','2019-06-15',NULL,3),(12,'Ноутбук','Lenovo',450,10,'2019-08-20','2019-08-31',NULL,2),(13,'Зонт','черный',100,5,'2019-08-14','2019-08-24',NULL,1),(14,'Видеокарта','Nvidia GTX 1800',360,6,'2019-08-14','2019-09-05',NULL,4);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) DEFAULT NULL,
  `billing_address` varchar(100) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Николай Штин','Сбербанк','shtin','4yn373cf'),(2,'Евгений Шульга','Альфа','eshul','vpfd03fne1'),(3,'Петр Филимонов','Тинькофф','petrfil','n4rr3brt28 '),(4,'Александр Швец','Открытие','shvec','G4Mvvke47'),(5,'Иван Иван','Webmoney','ivani','32Nnjn9ds');
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

-- Dump completed on 2019-08-23  9:54:09
