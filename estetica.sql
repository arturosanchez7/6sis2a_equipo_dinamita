-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: estetica
-- ------------------------------------------------------
-- Server version	8.0.21

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
  `id_cita` int NOT NULL AUTO_INCREMENT,
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
  `id_reg` int NOT NULL AUTO_INCREMENT,
  `nom_reg` varchar(45) NOT NULL,
  `correo_reg` varchar(45) NOT NULL,
  `tel_reg` varchar(45) NOT NULL,
  `dire_reg` varchar(45) NOT NULL,
  `contra_reg` varchar(45) NOT NULL,
  `Cita_id_cita` int NOT NULL,
  PRIMARY KEY (`id_reg`),
  KEY `fk_Cliente_Cita1_idx` (`Cita_id_cita`),
  CONSTRAINT `fk_Cliente_Cita1` FOREIGN KEY (`Cita_id_cita`) REFERENCES `cita` (`id_cita`) ON UPDATE CASCADE
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
  `id_emp` int NOT NULL AUTO_INCREMENT,
  `nom_emp` varchar(45) NOT NULL,
  `Sucursal_id_sucursal` int NOT NULL,
  PRIMARY KEY (`id_emp`),
  KEY `fk_Empleado_Sucursal_idx` (`Sucursal_id_sucursal`),
  CONSTRAINT `fk_Empleado_Sucursal` FOREIGN KEY (`Sucursal_id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON UPDATE CASCADE
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
  `id_ger` int NOT NULL AUTO_INCREMENT,
  `nom_ger` varchar(45) NOT NULL,
  `Sucursal_id_sucursal` int NOT NULL,
  `Cita_id_cita` int NOT NULL,
  PRIMARY KEY (`id_ger`),
  KEY `fk_Gerente_Sucursal1_idx` (`Sucursal_id_sucursal`),
  KEY `fk_Gerente_Cita1_idx` (`Cita_id_cita`),
  CONSTRAINT `fk_Gerente_Cita1` FOREIGN KEY (`Cita_id_cita`) REFERENCES `cita` (`id_cita`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Gerente_Sucursal1` FOREIGN KEY (`Sucursal_id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON UPDATE CASCADE
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
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `id_cita`,
 1 AS `nom_cli`,
 1 AS `serv_cli`,
 1 AS `email_cli`,
 1 AS `zona_cli`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `dir_sucursal` varchar(45) NOT NULL,
  `tel_sucursal` int NOT NULL,
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
-- Temporary view structure for view `vistacliente`
--

DROP TABLE IF EXISTS `vistacliente`;
/*!50001 DROP VIEW IF EXISTS `vistacliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistacliente` AS SELECT 
 1 AS `id_reg`,
 1 AS `nom_reg`,
 1 AS `correo_reg`,
 1 AS `tel_reg`,
 1 AS `dire_reg`,
 1 AS `contra_reg`,
 1 AS `Cita_id_cita`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaempleado`
--

DROP TABLE IF EXISTS `vistaempleado`;
/*!50001 DROP VIEW IF EXISTS `vistaempleado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaempleado` AS SELECT 
 1 AS `id_emp`,
 1 AS `nom_emp`,
 1 AS `Sucursal_id_sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistagerente`
--

DROP TABLE IF EXISTS `vistagerente`;
/*!50001 DROP VIEW IF EXISTS `vistagerente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistagerente` AS SELECT 
 1 AS `id_ger`,
 1 AS `nom_ger`,
 1 AS `Sucursal_id_sucursal`,
 1 AS `Cita_id_cita`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistasucursal`
--

DROP TABLE IF EXISTS `vistasucursal`;
/*!50001 DROP VIEW IF EXISTS `vistasucursal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistasucursal` AS SELECT 
 1 AS `id_sucursal`,
 1 AS `dir_sucursal`,
 1 AS `tel_sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `cita`.`id_cita` AS `id_cita`,`cita`.`nom_cli` AS `nom_cli`,`cita`.`serv_cli` AS `serv_cli`,`cita`.`email_cli` AS `email_cli`,`cita`.`zona_cli` AS `zona_cli` from `cita` where (`cita`.`id_cita` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistacliente`
--

/*!50001 DROP VIEW IF EXISTS `vistacliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistacliente` AS select `cliente`.`id_reg` AS `id_reg`,`cliente`.`nom_reg` AS `nom_reg`,`cliente`.`correo_reg` AS `correo_reg`,`cliente`.`tel_reg` AS `tel_reg`,`cliente`.`dire_reg` AS `dire_reg`,`cliente`.`contra_reg` AS `contra_reg`,`cliente`.`Cita_id_cita` AS `Cita_id_cita` from `cliente` where (`cliente`.`id_reg` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaempleado`
--

/*!50001 DROP VIEW IF EXISTS `vistaempleado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaempleado` AS select `empleado`.`id_emp` AS `id_emp`,`empleado`.`nom_emp` AS `nom_emp`,`empleado`.`Sucursal_id_sucursal` AS `Sucursal_id_sucursal` from `empleado` where (`empleado`.`id_emp` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistagerente`
--

/*!50001 DROP VIEW IF EXISTS `vistagerente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistagerente` AS select `gerente`.`id_ger` AS `id_ger`,`gerente`.`nom_ger` AS `nom_ger`,`gerente`.`Sucursal_id_sucursal` AS `Sucursal_id_sucursal`,`gerente`.`Cita_id_cita` AS `Cita_id_cita` from `gerente` where (`gerente`.`id_ger` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistasucursal`
--

/*!50001 DROP VIEW IF EXISTS `vistasucursal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistasucursal` AS select `sucursal`.`id_sucursal` AS `id_sucursal`,`sucursal`.`dir_sucursal` AS `dir_sucursal`,`sucursal`.`tel_sucursal` AS `tel_sucursal` from `sucursal` where (`sucursal`.`id_sucursal` = 1) */;
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

-- Dump completed on 2020-08-24 23:41:38
