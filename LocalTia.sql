-- MySQL dump 10.13  Distrib 9.1.0, for Linux (aarch64)
--
-- Host: localhost    Database: LocalTia
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

CREATE DATABASE LocalTia;

Use LocalTia;

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) DEFAULT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo_cliente` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'juanpepito@example.com','2025-02-15 21:53:52.308291','Juan Pérez Pepito','09876543212','CORPORATIVO'),(2,'pepito@example.com','2025-02-15 21:54:09.679774','Pepito Pérez','09876543456','INDIVIDUAL'),(3,'pepito2@example.com','2025-02-16 14:08:59.659653','Pepito Pérez Segundo','098765434356','INDIVIDUAL');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(19,2) NOT NULL,
  `subtotal` decimal(19,2) NOT NULL,
  `producto_id` bigint NOT NULL,
  `venta_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmi06vmeg5th7wdow1mxcqg78e` (`producto_id`),
  KEY `FKhj0bf0515yg7equ11ab4xgq3f` (`venta_id`),
  CONSTRAINT `FKhj0bf0515yg7equ11ab4xgq3f` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`),
  CONSTRAINT `FKmi06vmeg5th7wdow1mxcqg78e` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) NOT NULL,
  `estado` bit(1) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo_local` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'Av. Principal 123',_binary '','2025-02-15 10:00:00.000000','Tienda Centro','0987654321','TIENDA'),(2,'Av. Principal 456',_binary '','2025-02-15 10:00:00.000000','Bodega Sur','0987654333','BODEGA'),(3,'Av. Principal 456',_binary '','2025-02-15 10:00:00.000000','Bodega Sur','0987654333','BODEGA'),(4,'Av. Principal 456',_binary '','2025-02-15 10:00:00.000000','Bodega Sur','0987654333','TIENDA'),(5,'Av. Principal 456',_binary '','2025-02-15 10:00:00.000000','Bodega Sur A','0987654333','TIENDA'),(8,'AV QUITO',_binary '\0','2025-02-16 11:42:16.318202','bodeguita','99238723','BODEGA');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio_base` decimal(19,2) NOT NULL,
  `sku` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_clpng6f2m2r9i1y5g2yxajyuq` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Accesorios','Teclado mecánico RGB',_binary '','2025-02-15 12:00:00.000000','Teclado Mecánico',89.99,'PROD-003'),(2,'Accesorios','Teclado Digital RGB',_binary '','2025-02-15 12:00:00.000000','Teclado Digital',99.89,'PROD-004'),(3,'Categoría A','Descripción del Producto A',_binary '','2025-02-16 10:00:00.000000','Producto A',150.00,'ABC123'),(4,'Accesorios','Teclado  AS RGB',_binary '','2025-02-15 12:00:00.000000','Teclado MAS',39.89,'PROD-005');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_proveedor`
--

DROP TABLE IF EXISTS `producto_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_proveedor` (
  `producto_id` bigint NOT NULL,
  `proveedor_id` bigint NOT NULL,
  PRIMARY KEY (`producto_id`,`proveedor_id`),
  KEY `FKghg3oq7cjlax3u2hr36oicao1` (`proveedor_id`),
  CONSTRAINT `FK9aa883o9f6pal6n3w15kk5yyy` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `FKghg3oq7cjlax3u2hr36oicao1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_proveedor`
--

LOCK TABLES `producto_proveedor` WRITE;
/*!40000 ALTER TABLE `producto_proveedor` DISABLE KEYS */;
INSERT INTO `producto_proveedor` VALUES (3,1),(3,2);
/*!40000 ALTER TABLE `producto_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'proveedorC@email.com','Plaza Central','Proveedor C','555123456'),(2,'proveedorX@email.com','Plaza Central X','Proveedor X','555123456'),(3,'proveedorA@email.com','Plaza Central A','Proveedor A','555123456');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(2,'CLIENTE');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_disponible` int NOT NULL,
  `fecha_actualizacion` datetime(6) NOT NULL,
  `umbral_minimo` int NOT NULL,
  `local_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmteaiv8alkvidnj3rca5r110h` (`local_id`),
  KEY `FK1hx9o107cpb0o8hppaicd7af9` (`producto_id`),
  CONSTRAINT `FK1hx9o107cpb0o8hppaicd7af9` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `FKmteaiv8alkvidnj3rca5r110h` FOREIGN KEY (`local_id`) REFERENCES `local` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (3,56,'2025-02-16 12:21:38.680973',10,1,1),(4,34,'2025-02-16 15:30:03.088575',4,1,2),(5,10,'2025-02-16 13:16:27.107099',4,2,2),(6,11,'2025-02-16 13:37:19.509862',2,8,1);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_code` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Pérez','juan.perez@ejemplo.com',_binary '','Juan','$2a$10$i0AGnQgNm.qzBX5OrrBJrOUdDi1rnQ1FfoO2vgtjAW/dvU72VmRZC','','usuarioEjemplo'),(2,'PérezX','juan.perezD@ejemplo.com',_binary '','JuanN','$2a$10$VGVzmnkwCPwSuVLUQLxlvuAUJh3MRD61FdsEkn1Z2Sa1MS6A7Qq9S','','usuarioEjemplo1'),(3,'PérezX','juan.perezD@ejemplo.com',_binary '','JuanN','$2a$10$nbaPVhhf9G.9cUIFvQ90rOejfy2e1LpFwAgxIXj.UEGTtTrpBPm3S','','usuarioEjemplo13'),(4,'PérezX','juan.perezD@ejemplo.com',_binary '','JuanN','$2a$10$jGCdyqOz0fYyQF1Wkk2hFuLHSU.JErn/.Khw/pFYKgMckrF0K.Tcq','','usuarioEjemplo14'),(5,'ronaldo','ronaldo@hola.com',_binary '','ronaldo','$2a$10$uYiEHyGDdF49w00OlAAeDux6yljRmT.O0nvfeO3iIrY/rc442KaaC',NULL,'prueba1'),(6,'ronaldoa','ronaldoa@hola.com',_binary '','ronaldoa','$2a$10$2zil3TC3KO5q01PQRjhKg.QgjEfy8OzjQ2wOnPtBcshO7SErwBVkS',NULL,'prueba2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrol`
--

DROP TABLE IF EXISTS `userrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrol` (
  `usuario_rol_id` bigint NOT NULL AUTO_INCREMENT,
  `rol_id_rol` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`usuario_rol_id`),
  KEY `FK5ajy9730j8duie0ts23kbqxu4` (`rol_id_rol`),
  KEY `FK4jqs0evom7kylnt7b0bxwjj2j` (`usuario_id`),
  CONSTRAINT `FK4jqs0evom7kylnt7b0bxwjj2j` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK5ajy9730j8duie0ts23kbqxu4` FOREIGN KEY (`rol_id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrol`
--

LOCK TABLES `userrol` WRITE;
/*!40000 ALTER TABLE `userrol` DISABLE KEYS */;
INSERT INTO `userrol` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6);
/*!40000 ALTER TABLE `userrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_venta` datetime(6) NOT NULL,
  `total` decimal(19,2) NOT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `local_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa7yaj59nfh3gft0h38o5bv472` (`cliente_id`),
  KEY `FKkp7k0urkkge6n0pbgqac7h15g` (`local_id`),
  CONSTRAINT `FKa7yaj59nfh3gft0h38o5bv472` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FKkp7k0urkkge6n0pbgqac7h15g` FOREIGN KEY (`local_id`) REFERENCES `local` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (4,'2025-02-15 10:30:00.000000',459.85,1,1),(7,'2025-02-15 10:30:00.000000',279.87,1,1),(8,'2025-02-15 10:30:00.000000',279.87,1,1),(9,'2025-02-15 10:30:00.000000',279.87,1,1),(10,'2025-02-15 10:30:00.000000',279.87,1,1),(11,'2025-02-15 10:30:00.000000',459.85,1,1),(15,'2025-02-16 20:26:00.000000',399.56,2,1),(17,'2025-02-22 01:34:00.000000',199.78,3,1),(18,'2025-02-16 20:30:00.000000',99.89,1,5),(19,'2025-02-16 20:51:00.000000',89.99,3,2),(23,'2025-02-16 20:57:00.000000',150.00,2,4),(24,'2025-02-16 21:05:00.000000',150.00,3,2);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_detalle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(19,2) NOT NULL,
  `subtotal` decimal(19,2) NOT NULL,
  `producto_id` bigint NOT NULL,
  `venta_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9xigtgxpuxtk73l37ch7j61al` (`producto_id`),
  KEY `FK49gsk3vfonl3vtivw0xs2w8yt` (`venta_id`),
  CONSTRAINT `FK49gsk3vfonl3vtivw0xs2w8yt` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`),
  CONSTRAINT `FK9xigtgxpuxtk73l37ch7j61al` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_detalle`
--

LOCK TABLES `venta_detalle` WRITE;
/*!40000 ALTER TABLE `venta_detalle` DISABLE KEYS */;
INSERT INTO `venta_detalle` VALUES (1,1,99.89,99.89,2,7),(2,2,179.98,359.96,1,7),(3,1,99.89,99.89,2,8),(4,2,179.98,359.96,1,8),(5,1,99.89,99.89,2,9),(6,2,179.98,359.96,1,9),(7,2,179.98,359.96,1,10),(8,1,99.89,99.89,2,10),(9,1,99.89,99.89,2,11),(10,4,179.98,359.96,1,11),(11,2,99.89,199.78,2,15),(12,2,99.89,199.78,2,15),(13,2,99.89,199.78,2,17),(14,1,99.89,99.89,2,18),(15,1,89.99,89.99,1,19),(16,1,150.00,150.00,3,23),(17,1,150.00,150.00,3,24);
/*!40000 ALTER TABLE `venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-16 21:43:27
