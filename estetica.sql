-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: estetica
-- ------------------------------------------------------
-- Server version	5.7.31-log

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
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cli` varchar(45) NOT NULL,
  `serv_cli` varchar(45) NOT NULL,
  `email_cli` varchar(45) NOT NULL,
  `zona_cli` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cita`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (1,'','','','Insurgentes'),(2,'juanito','manicure','juanito@hot.com','Zona Rosa'),(3,'julio','corte','julio@julio.com','Cuauhtemoc'),(4,'','','','Insurgentes'),(5,'carlos','manicure','carlos@gmail.com','Insurgentes');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_reg` int(11) NOT NULL AUTO_INCREMENT,
  `nom_reg` varchar(45) NOT NULL,
  `correo_reg` varchar(45) NOT NULL,
  `tel_reg` varchar(45) NOT NULL,
  `dire_reg` varchar(45) NOT NULL,
  `contra_reg` varchar(45) NOT NULL,
  `Cita_id_cita` int(11) NOT NULL,
  PRIMARY KEY (`id_reg`),
  KEY `fk_Cliente_Cita1_idx` (`Cita_id_cita`),
  CONSTRAINT `fk_Cliente_Cita1` FOREIGN KEY (`Cita_id_cita`) REFERENCES `cita` (`id_cita`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_emp` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emp` varchar(45) NOT NULL,
  `Sucursal_id_sucursal` int(11) NOT NULL,
  PRIMARY KEY (`id_emp`),
  KEY `fk_Empleado_Sucursal_idx` (`Sucursal_id_sucursal`),
  CONSTRAINT `fk_Empleado_Sucursal` FOREIGN KEY (`Sucursal_id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerente`
--

DROP TABLE IF EXISTS `gerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerente` (
  `id_ger` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ger` varchar(45) NOT NULL,
  `Sucursal_id_sucursal` int(11) NOT NULL,
  `Cita_id_cita` int(11) NOT NULL,
  PRIMARY KEY (`id_ger`),
  KEY `fk_Gerente_Sucursal1_idx` (`Sucursal_id_sucursal`),
  KEY `fk_Gerente_Cita1_idx` (`Cita_id_cita`),
  CONSTRAINT `fk_Gerente_Cita1` FOREIGN KEY (`Cita_id_cita`) REFERENCES `cita` (`id_cita`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Gerente_Sucursal1` FOREIGN KEY (`Sucursal_id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerente`
--

LOCK TABLES `gerente` WRITE;
/*!40000 ALTER TABLE `gerente` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `dir_sucursal` varchar(45) NOT NULL,
  `tel_sucursal` int(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'estetica'
--

--
-- Dumping routines for database 'estetica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19  4:08:34
