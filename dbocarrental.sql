-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: dbocarrental
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `group_authorities`
--

DROP TABLE IF EXISTS `group_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_authorities` (
  `group_id` bigint(20) unsigned NOT NULL,
  `authority` varchar(50) NOT NULL,
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_authorities_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_authorities`
--

LOCK TABLES `group_authorities` WRITE;
/*!40000 ALTER TABLE `group_authorities` DISABLE KEYS */;
INSERT INTO `group_authorities` VALUES (1,'ROLE_USER'),(1,'ROLE_ADMIN');
/*!40000 ALTER TABLE `group_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_members`
--

DROP TABLE IF EXISTS `group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_members`
--

LOCK TABLES `group_members` WRITE;
/*!40000 ALTER TABLE `group_members` DISABLE KEYS */;
INSERT INTO `group_members` VALUES (1,'admin',1);
/*!40000 ALTER TABLE `group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Admins');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblagency`
--

DROP TABLE IF EXISTS `tblagency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblagency` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Agency_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblagency`
--

LOCK TABLES `tblagency` WRITE;
/*!40000 ALTER TABLE `tblagency` DISABLE KEYS */;
INSERT INTO `tblagency` VALUES (1,'Kosova'),(7,'Prishtina'),(8,'Mitrovica'),(9,NULL),(10,NULL),(11,NULL),(12,'Mitrovca');
/*!40000 ALTER TABLE `tblagency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbooking`
--

DROP TABLE IF EXISTS `tblbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbooking` (
  `Booking_Number` int(11) NOT NULL,
  `Booking_Date` date DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Time_Stamp` varchar(19) DEFAULT NULL,
  `Costomer_ID` int(11) NOT NULL,
  `Agency_ID` int(11) NOT NULL,
  `Car_ID` int(11) NOT NULL,
  PRIMARY KEY (`Booking_Number`),
  KEY `fk_tblbooking_tblcostomer1_idx` (`Costomer_ID`),
  KEY `fk_tblbooking_tblagency1_idx` (`Agency_ID`),
  KEY `fk_tblbooking_tblcar1_idx` (`Car_ID`),
  CONSTRAINT `fk_tblbooking_tblagency1` FOREIGN KEY (`Agency_ID`) REFERENCES `tblagency` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblbooking_tblcar1` FOREIGN KEY (`Car_ID`) REFERENCES `tblcar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblbooking_tblcostomer1` FOREIGN KEY (`Costomer_ID`) REFERENCES `tblcostomer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbooking`
--

LOCK TABLES `tblbooking` WRITE;
/*!40000 ALTER TABLE `tblbooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbranch`
--

DROP TABLE IF EXISTS `tblbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbranch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Agency_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tblbranch_tblagency1_idx` (`Agency_ID`),
  CONSTRAINT `fk_tblbranch_tblagency1` FOREIGN KEY (`Agency_ID`) REFERENCES `tblagency` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbranch`
--

LOCK TABLES `tblbranch` WRITE;
/*!40000 ALTER TABLE `tblbranch` DISABLE KEYS */;
INSERT INTO `tblbranch` VALUES (1,'Prishtina',1);
/*!40000 ALTER TABLE `tblbranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbranch_address`
--

DROP TABLE IF EXISTS `tblbranch_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbranch_address` (
  `Country` varchar(45) DEFAULT NULL,
  `City_Name` varchar(45) DEFAULT NULL,
  `Street_Number` varchar(5) DEFAULT NULL,
  `Postal_Code` varchar(10) DEFAULT NULL,
  `Phone_Number` varchar(45) DEFAULT NULL,
  `Street_Name` varchar(45) DEFAULT NULL,
  `Branch_ID` int(11) NOT NULL,
  PRIMARY KEY (`Branch_ID`),
  KEY `fk_tblbranch_address_tblbranch1_idx` (`Branch_ID`),
  CONSTRAINT `fk_tblbranch_address_tblbranch1` FOREIGN KEY (`Branch_ID`) REFERENCES `tblbranch` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbranch_address`
--

LOCK TABLES `tblbranch_address` WRITE;
/*!40000 ALTER TABLE `tblbranch_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbranch_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcar`
--

DROP TABLE IF EXISTS `tblcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Regjistration_Number` varchar(30) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `Date_of_Manufacturing` date DEFAULT NULL,
  `Base_Price_Per_Day` float DEFAULT NULL,
  `Car_type_ID` int(11) NOT NULL,
  `Branch_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tblcar_tblcar_type1_idx` (`Car_type_ID`),
  KEY `fk_tblcar_tblbranch1_idx` (`Branch_ID`),
  CONSTRAINT `fk_tblcar_tblbranch1` FOREIGN KEY (`Branch_ID`) REFERENCES `tblbranch` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblcar_tblcar_type1` FOREIGN KEY (`Car_type_ID`) REFERENCES `tblcar_type` (`Car_type_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcar`
--

LOCK TABLES `tblcar` WRITE;
/*!40000 ALTER TABLE `tblcar` DISABLE KEYS */;
INSERT INTO `tblcar` VALUES (24,NULL,NULL,NULL,500,173,1);
/*!40000 ALTER TABLE `tblcar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcar_type`
--

DROP TABLE IF EXISTS `tblcar_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcar_type` (
  `Car_type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Producer` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Automatic` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Car_type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcar_type`
--

LOCK TABLES `tblcar_type` WRITE;
/*!40000 ALTER TABLE `tblcar_type` DISABLE KEYS */;
INSERT INTO `tblcar_type` VALUES (160,'Fiat','Fiatasdf','Punto','\0'),(161,'Ford','Ford','Fiesta',''),(163,'Audi','Auto prishtina','quatro',''),(170,'Fesal','sdlfa','adslakf','\0'),(171,'sdjfakj','kdfsjkaf','djaskdfjk',''),(173,'Audi','Volswagen','a4',''),(175,'Audi','Volswagen','r8','\0'),(176,'BMW','BMW','320 GT',''),(177,'dfasd','sdfa','sdfa','\0'),(178,'opel','sdfasdf','sdf','\0'),(179,'sdfasdfsdfasd','asdfasdf','sdfasdf',''),(180,'Volvo','Volvo','s60','\0');
/*!40000 ALTER TABLE `tblcar_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcostomer`
--

DROP TABLE IF EXISTS `tblcostomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcostomer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Login_Name` varchar(45) DEFAULT NULL,
  `Register_Date` datetime DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Surname` varchar(45) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Company_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcostomer`
--

LOCK TABLES `tblcostomer` WRITE;
/*!40000 ALTER TABLE `tblcostomer` DISABLE KEYS */;
INSERT INTO `tblcostomer` VALUES (1,'kujta','0000-00-00 00:00:00','mitjuki@hotmail.com','kujtim','mjeku','1992-04-19','ArtCode');
/*!40000 ALTER TABLE `tblcostomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcostomer_address`
--

DROP TABLE IF EXISTS `tblcostomer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcostomer_address` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Country` varchar(45) DEFAULT NULL,
  `City_Name` varchar(45) DEFAULT NULL,
  `Street_Number` varchar(5) DEFAULT NULL,
  `Postal_Code` varchar(10) DEFAULT NULL,
  `Phone_Number` varchar(45) DEFAULT NULL,
  `Street_Name` varchar(45) DEFAULT NULL,
  `Costomer_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tblcostomer_address_tblcostomer_idx` (`Costomer_ID`),
  CONSTRAINT `fk_tblcostomer_address_tblcostomer` FOREIGN KEY (`Costomer_ID`) REFERENCES `tblcostomer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcostomer_address`
--

LOCK TABLES `tblcostomer_address` WRITE;
/*!40000 ALTER TABLE `tblcostomer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcostomer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','$2a$10$F3jTGzG.TvJRj9GlErLJ3eukneWjE5uUMOL8m4lBaBKpvqltebBhG',1),('alex','123456',1),('mkyong','$2a$10$Fgkk1Im2TiNruAZROUDCTeyN.Co6wCPBvkdk2W.KtsKds/WYalR86',1);
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

-- Dump completed on 2016-02-25 16:54:37
