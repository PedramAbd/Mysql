-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: graduation
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `lastname` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(22) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'محسن','مقدم','1234',''),(2,'سیمین','مقصودی','1234','');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `personnelID` varchar(8) COLLATE utf8_persian_ci NOT NULL,
  `firstname` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `lastname` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(22) COLLATE utf8_persian_ci NOT NULL,
  `departmentID` varchar(2) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`personnelID`),
  UNIQUE KEY `personnelcode_UNIQUE` (`personnelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('12345678','محمود','رضایی','1234','40',''),('23546987','صادق','راد','1234','23','');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_instance`
--

DROP TABLE IF EXISTS `process_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_instance` (
  `pInstanceID` int(11) NOT NULL AUTO_INCREMENT,
  `processID` int(11) NOT NULL,
  PRIMARY KEY (`pInstanceID`),
  UNIQUE KEY `pInstanceID_UNIQUE` (`pInstanceID`),
  KEY `fk_process_process_idx` (`processID`),
  CONSTRAINT `fk_processInstance_process` FOREIGN KEY (`processID`) REFERENCES `processes` (`processID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_instance`
--

LOCK TABLES `process_instance` WRITE;
/*!40000 ALTER TABLE `process_instance` DISABLE KEYS */;
INSERT INTO `process_instance` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `process_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_requests`
--

DROP TABLE IF EXISTS `process_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_requests` (
  `studentID` varchar(8) COLLATE utf8_persian_ci NOT NULL,
  `processID` int(11) NOT NULL,
  `status` varchar(5) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`studentID`,`processID`),
  KEY `fk_request_student_idx` (`studentID`),
  KEY `fk_request_process_idx` (`processID`),
  CONSTRAINT `fk_request_process` FOREIGN KEY (`processID`) REFERENCES `processes` (`processID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_request_student` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_requests`
--

LOCK TABLES `process_requests` WRITE;
/*!40000 ALTER TABLE `process_requests` DISABLE KEYS */;
INSERT INTO `process_requests` VALUES ('94102047',1,'stall');
/*!40000 ALTER TABLE `process_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processes`
--

DROP TABLE IF EXISTS `processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processes` (
  `processID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `step2` int(11) DEFAULT NULL,
  `step1` int(11) DEFAULT NULL,
  `step3` int(11) DEFAULT NULL,
  PRIMARY KEY (`processID`),
  UNIQUE KEY `processID_UNIQUE` (`processID`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_process_step1_idx` (`step1`),
  KEY `fk_process_step2_idx` (`step2`),
  KEY `step3` (`step3`),
  CONSTRAINT `fk_process_step1` FOREIGN KEY (`step1`) REFERENCES `steps` (`stepID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_process_step2` FOREIGN KEY (`step2`) REFERENCES `steps` (`stepID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `processes_ibfk_1` FOREIGN KEY (`step3`) REFERENCES `steps` (`stepID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processes`
--

LOCK TABLES `processes` WRITE;
/*!40000 ALTER TABLE `processes` DISABLE KEYS */;
INSERT INTO `processes` VALUES (1,'دی جی پشمک',123,254,456),(2,'سلام',456,458,NULL),(11,'hel',458,457,NULL),(12,'سگ ماهی',457,123,NULL);
/*!40000 ALTER TABLE `processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step_instance`
--

DROP TABLE IF EXISTS `step_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `step_instance` (
  `sInstanceID` int(11) NOT NULL AUTO_INCREMENT,
  `stepID` int(11) NOT NULL,
  `pInstanceID` int(11) NOT NULL,
  `personnelID` varchar(8) COLLATE utf8_persian_ci NOT NULL,
  `start` varchar(19) COLLATE utf8_persian_ci NOT NULL,
  `end` varchar(19) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`sInstanceID`),
  UNIQUE KEY `sInstanceID_UNIQUE` (`sInstanceID`),
  KEY `fk_stepInstance_post_idx` (`personnelID`),
  KEY `fk_stepInstance_processInstance_idx` (`pInstanceID`),
  KEY `fk_stepInstance_step_idx` (`stepID`),
  CONSTRAINT `fk_stepInstance_post` FOREIGN KEY (`personnelID`) REFERENCES `posts` (`personnelID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stepInstance_processInstance` FOREIGN KEY (`pInstanceID`) REFERENCES `process_instance` (`pInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stepInstance_step1` FOREIGN KEY (`stepID`) REFERENCES `steps` (`stepID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step_instance`
--

LOCK TABLES `step_instance` WRITE;
/*!40000 ALTER TABLE `step_instance` DISABLE KEYS */;
INSERT INTO `step_instance` VALUES (1,123,1,'12345678','1396-10-10',NULL);
/*!40000 ALTER TABLE `step_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steps`
--

DROP TABLE IF EXISTS `steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `steps` (
  `stepID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `stepIDaccept` int(11) NOT NULL,
  `stepIDreject` int(11) NOT NULL,
  `processID` int(11) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `firstStep` tinyint(4) NOT NULL,
  PRIMARY KEY (`stepID`),
  UNIQUE KEY `stepID_UNIQUE` (`stepID`),
  KEY `fk_step_process_idx` (`processID`),
  KEY `fk_step_step1_idx` (`stepIDaccept`),
  KEY `fk_step_step2_idx` (`stepIDreject`),
  CONSTRAINT `fk_step_process` FOREIGN KEY (`processID`) REFERENCES `processes` (`processID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_step_step1` FOREIGN KEY (`stepIDaccept`) REFERENCES `steps` (`stepID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_step_step2` FOREIGN KEY (`stepIDreject`) REFERENCES `steps` (`stepID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steps`
--

LOCK TABLES `steps` WRITE;
/*!40000 ALTER TABLE `steps` DISABLE KEYS */;
INSERT INTO `steps` VALUES (123,'sa',123,123,1,40,1),(254,'ada',123,456,1,40,0),(456,'faf',123,456,2,23,0),(457,'45698878',123,456,11,40,0),(458,'121345646',456,123,11,98,0);
/*!40000 ALTER TABLE `steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `studentID` varchar(8) COLLATE utf8_persian_ci NOT NULL,
  `firstname` varchar(30) COLLATE utf8_persian_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(22) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `birthday` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `pInstanceID` int(11) DEFAULT NULL,
  `csInstanceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `studentID_UNIQUE` (`studentID`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_student_pInstance_idx` (`pInstanceID`),
  KEY `fk_student_sInstance_idx` (`csInstanceID`),
  CONSTRAINT `fk_student_pInstance` FOREIGN KEY (`pInstanceID`) REFERENCES `process_instance` (`pInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_sInstance` FOREIGN KEY (`csInstanceID`) REFERENCES `step_instance` (`sInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('94102047','حسین','کشاورز','1234','hoseinkeshavarz1997@gmail.com','1375-10-14',1,1),('94105609','پدرام','عبدزاده','1234','pedramabdzadeh@gmail.com','1990-11-16',1,1),('94106349','محمدعلی','زارعی‌متین','1234','mzareimatin@gmail.com','1300-01-15',NULL,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentID` varchar(8) COLLATE utf8_persian_ci NOT NULL,
  `departmentID` varchar(2) COLLATE utf8_persian_ci NOT NULL,
  `stepInstanceID` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_idx` (`studentID`),
  KEY `fk2_idx` (`stepInstanceID`),
  CONSTRAINT `fk1` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`stepInstanceID`) REFERENCES `step_instance` (`sInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'94102047','40',1,20000);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-09 22:04:16
