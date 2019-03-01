CREATE DATABASE  IF NOT EXISTS `chatplus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `chatplus`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: chatplus
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mensajeadores`
--

DROP TABLE IF EXISTS `mensajeadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mensajeadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajeadores`
--

LOCK TABLES `mensajeadores` WRITE;
/*!40000 ALTER TABLE `mensajeadores` DISABLE KEYS */;
INSERT INTO `mensajeadores` VALUES (1,'Admin',_binary ''),(2,'user2',_binary ''),(6,'user3',_binary ''),(7,'user4',_binary ''),(8,'user5',_binary ''),(9,'usertest',_binary ''),(10,'saracatunga',_binary ''),(11,'Debon',_binary ''),(12,'sadkfjkasjfhjksdfkjh',_binary ''),(13,'ernest',_binary ''),(14,'jksadlhsad',_binary '');
/*!40000 ALTER TABLE `mensajeadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(280) NOT NULL,
  `id_mensajeador` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `puntaje` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (29,'hola',2,'2019-02-20 20:40:48',0.679898),(30,'hola',1,'2019-02-20 21:10:51',0.168006),(32,'hola',1,'2019-02-20 21:55:23',0.832604),(33,'hola',2,'2019-02-20 21:55:23',0.123328),(34,'hola',6,'2019-02-20 21:55:23',0.118828),(35,'hola',7,'2019-02-20 21:55:23',0.224154),(36,'hola',8,'2019-02-20 21:55:23',0.764285),(37,'hola',8,'2019-02-20 21:55:23',0.148966),(38,'asdlkj',6,'2019-02-25 20:25:22',0),(39,'asdkajdhsd',6,'2019-02-25 20:27:22',0),(40,'adsaksdjh',10,'2019-02-25 20:35:31',0),(41,'sdflkjhasfsfsafkjh',11,'2019-02-25 20:39:01',0),(42,'slfkjhsdf',12,'2019-02-25 20:44:37',0),(43,'askdjhasdd',11,'2019-02-25 20:44:45',0),(44,'kjsahdasd',14,'2019-02-28 15:41:02',0);
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-28 21:56:23
