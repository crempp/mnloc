-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mnloc
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.10.2-log

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
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `content` text,
  `content_abstract` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry`
--

LOCK TABLES `entry` WRITE;
/*!40000 ALTER TABLE `entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry_has_location`
--

DROP TABLE IF EXISTS `entry_has_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_has_location` (
  `entry_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`entry_id`,`location_id`),
  KEY `fk_entry_has_location_location1` (`location_id`),
  KEY `fk_entry_has_location_entry1` (`entry_id`),
  CONSTRAINT `fk_entry_has_location_entry1` FOREIGN KEY (`entry_id`) REFERENCES `entry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_has_location_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_has_location`
--

LOCK TABLES `entry_has_location` WRITE;
/*!40000 ALTER TABLE `entry_has_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry_has_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry_has_media`
--

DROP TABLE IF EXISTS `entry_has_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_has_media` (
  `entry_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`entry_id`,`media_id`),
  KEY `fk_entry_has_media_media1` (`media_id`),
  KEY `fk_entry_has_media_entry1` (`entry_id`),
  CONSTRAINT `fk_entry_has_media_entry1` FOREIGN KEY (`entry_id`) REFERENCES `entry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_has_media_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_has_media`
--

LOCK TABLES `entry_has_media` WRITE;
/*!40000 ALTER TABLE `entry_has_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry_has_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry_has_reference`
--

DROP TABLE IF EXISTS `entry_has_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_has_reference` (
  `entry_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  PRIMARY KEY (`entry_id`,`reference_id`),
  KEY `fk_entry_has_reference_reference1` (`reference_id`),
  KEY `fk_entry_has_reference_entry1` (`entry_id`),
  CONSTRAINT `fk_entry_has_reference_entry1` FOREIGN KEY (`entry_id`) REFERENCES `entry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entry_has_reference_reference1` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_has_reference`
--

LOCK TABLES `entry_has_reference` WRITE;
/*!40000 ALTER TABLE `entry_has_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry_has_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `lat` varchar(32) DEFAULT NULL,
  `lon` varchar(32) DEFAULT NULL,
  `bounding_poly` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `asset_id` varchar(32) NOT NULL,
  `type` enum('image','video') DEFAULT NULL,
  `mimetype` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `filename` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('book','newspaper','journal','website') NOT NULL DEFAULT 'book',
  `year_published` varchar(4) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `pages_used` varchar(32) DEFAULT NULL,
  `book_edition` varchar(4) DEFAULT NULL,
  `book_city_published` varchar(64) DEFAULT NULL,
  `book_publisher` varchar(64) DEFAULT NULL,
  `newspaper_daymonth` varchar(64) DEFAULT NULL,
  `journal_name` varchar(64) DEFAULT NULL,
  `journal_volnum` varchar(4) DEFAULT NULL,
  `journal_issnum` varchar(4) DEFAULT NULL,
  `journal_url` varchar(256) DEFAULT NULL,
  `journal_accessdate` varchar(32) DEFAULT NULL,
  `website_yearpub` varchar(4) DEFAULT NULL,
  `website_url` varchar(256) DEFAULT NULL,
  `website_accessdate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference`
--

LOCK TABLES `reference` WRITE;
/*!40000 ALTER TABLE `reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_author`
--

DROP TABLE IF EXISTS `reference_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_author`
--

LOCK TABLES `reference_author` WRITE;
/*!40000 ALTER TABLE `reference_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_has_reference_author`
--

DROP TABLE IF EXISTS `reference_has_reference_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_has_reference_author` (
  `reference_id` int(11) NOT NULL,
  `reference_author_id` int(11) NOT NULL,
  PRIMARY KEY (`reference_id`,`reference_author_id`),
  KEY `fk_reference_has_reference_author_reference_author1` (`reference_author_id`),
  KEY `fk_reference_has_reference_author_reference` (`reference_id`),
  CONSTRAINT `fk_reference_has_reference_author_reference` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reference_has_reference_author_reference_author1` FOREIGN KEY (`reference_author_id`) REFERENCES `reference_author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_has_reference_author`
--

LOCK TABLES `reference_has_reference_author` WRITE;
/*!40000 ALTER TABLE `reference_has_reference_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_has_reference_author` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-01 13:06:15
