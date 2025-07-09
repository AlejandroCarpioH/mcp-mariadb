/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: c20_bluelab
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lab_campamento`
--

DROP TABLE IF EXISTS `lab_campamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_campamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `descripcion` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_cargo`
--

DROP TABLE IF EXISTS `lab_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fijo` tinyint(1) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_comprobante`
--

DROP TABLE IF EXISTS `lab_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_comprobante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `muestra` int(11) NOT NULL COMMENT 'muestra.id',
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `file_type` varchar(20) DEFAULT NULL,
  `full_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `raw_name` varchar(64) NOT NULL,
  `file_ext` varchar(10) DEFAULT NULL,
  `file_size` varchar(32) NOT NULL,
  `descarga` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `muestra` (`muestra`),
  CONSTRAINT `lab_comprobante_ibfk_1` FOREIGN KEY (`muestra`) REFERENCES `lab_muestra` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12320 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_comprobantecad`
--

DROP TABLE IF EXISTS `lab_comprobantecad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_comprobantecad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formulariocad` int(11) NOT NULL COMMENT 'formulariocad.id',
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `file_type` varchar(255) DEFAULT NULL,
  `full_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `raw_name` varchar(64) NOT NULL,
  `file_ext` varchar(4) DEFAULT NULL,
  `file_size` varchar(32) NOT NULL,
  `descarga` int(11) NOT NULL DEFAULT 0,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `formulariocad` (`formulariocad`) USING BTREE,
  CONSTRAINT `lab_comprobantecad_ibfk_1` FOREIGN KEY (`formulariocad`) REFERENCES `lab_formulariocad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29727 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_comuna`
--

DROP TABLE IF EXISTS `lab_comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_comuna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `provincia` smallint(3) NOT NULL COMMENT 'provincia.codigo',
  `nombre` varchar(64) NOT NULL,
  `codigo` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `provincia` (`provincia`),
  CONSTRAINT `lab_comuna_ibfk_1` FOREIGN KEY (`provincia`) REFERENCES `lab_provincia` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_contramuestracad`
--

DROP TABLE IF EXISTS `lab_contramuestracad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_contramuestracad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `resultadocad` int(11) NOT NULL,
  `resultado` int(11) NOT NULL,
  `validador` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resultadocad` (`id`),
  KEY `lab_contramuestracad_ibfk_1` (`resultadocad`),
  KEY `validador` (`id`),
  KEY `lab_contramuestracad_ibfk_2` (`validador`),
  CONSTRAINT `lab_contramuestracad_ibfk_1` FOREIGN KEY (`resultadocad`) REFERENCES `lab_resultadocad` (`id`),
  CONSTRAINT `lab_contramuestracad_ibfk_2` FOREIGN KEY (`validador`) REFERENCES `lab_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_convenio`
--

DROP TABLE IF EXISTS `lab_convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_convenio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_destino`
--

DROP TABLE IF EXISTS `lab_destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_destino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_emailqueue`
--

DROP TABLE IF EXISTS `lab_emailqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_emailqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ejecutado` datetime DEFAULT NULL,
  `email_to` varchar(64) NOT NULL,
  `email_cc` varchar(256) DEFAULT NULL,
  `email_subject` varchar(64) NOT NULL,
  `email_title` varchar(64) NOT NULL,
  `email_message` mediumtext NOT NULL,
  `email_href` varchar(128) DEFAULT NULL,
  `status` enum('queued','running','done','') NOT NULL DEFAULT 'queued',
  `email_attach` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51350 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_empresa`
--

DROP TABLE IF EXISTS `lab_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(5) NOT NULL,
  `razon` varchar(128) NOT NULL,
  `rut` int(11) NOT NULL,
  `dv` varchar(1) NOT NULL,
  `representante` varchar(64) NOT NULL,
  `representanteemail` varchar(64) NOT NULL,
  `coordinador` varchar(64) DEFAULT NULL,
  `coordinadoremail` varchar(64) DEFAULT NULL,
  `coordinador2` varchar(64) DEFAULT NULL,
  `coordinador2email` varchar(64) DEFAULT NULL,
  `direccion` varchar(64) DEFAULT NULL,
  `contratista` tinyint(1) NOT NULL DEFAULT 0,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abrev` (`abrev`),
  UNIQUE KEY `rut` (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_empresaconvenio`
--

DROP TABLE IF EXISTS `lab_empresaconvenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_empresaconvenio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `empresa` int(11) NOT NULL COMMENT 'empresa.id',
  `convenio` int(11) NOT NULL COMMENT 'convenio.id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `empresaconvenio` (`empresa`,`convenio`),
  KEY `empresa` (`empresa`),
  KEY `convenio` (`convenio`),
  CONSTRAINT `lab_empresaconvenio_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `lab_empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_empresaconvenio_ibfk_2` FOREIGN KEY (`convenio`) REFERENCES `lab_convenio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_empresadestino`
--

DROP TABLE IF EXISTS `lab_empresadestino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_empresadestino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `empresa` int(11) NOT NULL COMMENT 'empresa.id',
  `destino` int(11) NOT NULL COMMENT 'destino.id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `empresadestino` (`empresa`,`destino`),
  KEY `empresa` (`empresa`),
  KEY `destino` (`destino`),
  CONSTRAINT `lab_empresadestino_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `lab_empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_empresadestino_ibfk_2` FOREIGN KEY (`destino`) REFERENCES `lab_destino` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_ficha`
--

DROP TABLE IF EXISTS `lab_ficha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_ficha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `paterno` varchar(64) NOT NULL,
  `materno` varchar(64) NOT NULL,
  `nombres` varchar(64) NOT NULL,
  `nacionalidad` varchar(32) DEFAULT NULL,
  `nacimiento` date NOT NULL,
  `rut` int(11) DEFAULT NULL,
  `dv` varchar(1) DEFAULT NULL,
  `pasaporte` varchar(32) DEFAULT NULL,
  `sexo` tinyint(1) NOT NULL COMMENT 'sexo.codigo',
  `pueblooriginario` tinyint(1) DEFAULT NULL COMMENT 'prueblooriginario.codigo',
  `calle` varchar(32) DEFAULT NULL,
  `numero` varchar(16) DEFAULT NULL,
  `depto` varchar(16) DEFAULT NULL,
  `poblacion` varchar(64) DEFAULT NULL,
  `comuna` smallint(5) NOT NULL COMMENT 'comuna.codigo',
  `ocupacion` varchar(64) DEFAULT NULL,
  `ocupaciontipo` tinyint(1) NOT NULL COMMENT 'ocupaciontipo.codigo',
  `institucionsalud` tinyint(2) DEFAULT NULL COMMENT 'institucionsalud.codigo',
  `telefono` bigint(20) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `fumador` tinyint(1) NOT NULL DEFAULT 0,
  `bebedor` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut` (`rut`),
  UNIQUE KEY `pasaporte` (`pasaporte`),
  KEY `sexo` (`sexo`),
  KEY `pueblooriginario` (`pueblooriginario`),
  KEY `comuna` (`comuna`),
  KEY `ocupaciontipo` (`ocupaciontipo`),
  KEY `institucionsalud` (`institucionsalud`),
  CONSTRAINT `lab_ficha_ibfk_1` FOREIGN KEY (`sexo`) REFERENCES `lab_sexo` (`codigo`),
  CONSTRAINT `lab_ficha_ibfk_2` FOREIGN KEY (`pueblooriginario`) REFERENCES `lab_pueblooriginario` (`codigo`),
  CONSTRAINT `lab_ficha_ibfk_3` FOREIGN KEY (`comuna`) REFERENCES `lab_comuna` (`codigo`),
  CONSTRAINT `lab_ficha_ibfk_4` FOREIGN KEY (`ocupaciontipo`) REFERENCES `lab_ocupaciontipo` (`codigo`),
  CONSTRAINT `lab_ficha_ibfk_5` FOREIGN KEY (`institucionsalud`) REFERENCES `lab_institucionsalud` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=30280 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_formulario`
--

DROP TABLE IF EXISTS `lab_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_formulario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ficha` int(11) NOT NULL COMMENT 'ficha.id',
  `proceso` int(11) DEFAULT NULL COMMENT 'proceso.id',
  `qr` int(11) DEFAULT NULL COMMENT 'qr.id',
  `empresa` int(11) DEFAULT NULL COMMENT 'empresa.id',
  `convenio` int(11) DEFAULT NULL COMMENT 'convenio.id',
  `destino` int(11) DEFAULT NULL COMMENT 'destino.id',
  `contratista` int(11) DEFAULT NULL COMMENT 'empresa.id',
  `folio` varchar(32) NOT NULL,
  `formularioestado` varchar(16) NOT NULL DEFAULT 'EST_FORM_ING' COMMENT 'formularioestado.abrev',
  `formularioorigen` int(11) NOT NULL COMMENT 'formularioorigen.id',
  `enfaena` tinyint(1) NOT NULL DEFAULT 0,
  `paterno` varchar(64) NOT NULL,
  `materno` varchar(64) NOT NULL,
  `nombres` varchar(64) NOT NULL,
  `nacionalidad` varchar(32) DEFAULT NULL,
  `nacimiento` date NOT NULL,
  `rut` int(11) DEFAULT NULL,
  `dv` varchar(1) DEFAULT NULL,
  `pasaporte` varchar(32) DEFAULT NULL,
  `sexo` tinyint(1) NOT NULL COMMENT 'sexo.codigo',
  `pueblooriginario` tinyint(1) DEFAULT NULL COMMENT 'prueblooriginario.codigo',
  `calle` varchar(32) DEFAULT NULL,
  `numero` varchar(16) DEFAULT NULL,
  `depto` varchar(16) DEFAULT NULL,
  `poblacion` varchar(64) DEFAULT NULL,
  `comuna` smallint(5) NOT NULL COMMENT 'comuna.codigo',
  `ocupacion` varchar(64) DEFAULT NULL,
  `ocupaciontipo` tinyint(1) NOT NULL COMMENT 'ocupaciontipo.codigo',
  `institucionsalud` tinyint(2) DEFAULT NULL COMMENT 'institucionsalud.codigo',
  `telefono` bigint(20) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `fumador` tinyint(1) DEFAULT NULL,
  `bebedor` tinyint(1) DEFAULT NULL,
  `examenanterior` tinyint(1) DEFAULT NULL,
  `fechaexamenanterior` date DEFAULT NULL,
  `tienesintomas` tinyint(1) NOT NULL DEFAULT 0,
  `iniciosintomas` date DEFAULT NULL,
  `fechaprimeraconsulta` date DEFAULT NULL,
  `trabajadoravicolaganadero` tinyint(1) NOT NULL DEFAULT 0,
  `embarazo` tinyint(1) DEFAULT NULL,
  `semanasembarazo` tinyint(2) DEFAULT NULL,
  `viajoalextranjero` tinyint(1) NOT NULL DEFAULT 0,
  `paisorigen` varchar(64) DEFAULT NULL,
  `ciudadorigen` varchar(64) DEFAULT NULL,
  `sintomas` mediumtext DEFAULT NULL,
  `enfermedaddebase` varchar(255) DEFAULT NULL,
  `tienevacunainfluenza` tinyint(1) DEFAULT NULL,
  `fechavacunainfluenza` date DEFAULT NULL,
  `tienevacunacovid` tinyint(1) DEFAULT NULL,
  `fechavacunacovid` date DEFAULT NULL,
  `cantidadvacunacovid` tinyint(4) DEFAULT NULL,
  `vacunacovid` int(11) DEFAULT NULL COMMENT 'vacuna.id',
  `fechaturno` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folio` (`folio`),
  KEY `sexo` (`sexo`),
  KEY `ocupaciontipo` (`ocupaciontipo`),
  KEY `comuna` (`comuna`),
  KEY `prueblooriginario` (`pueblooriginario`),
  KEY `proceso` (`proceso`),
  KEY `formularioestado` (`formularioestado`),
  KEY `ficha` (`ficha`),
  KEY `institucionsalud` (`institucionsalud`),
  KEY `contratista` (`contratista`),
  KEY `empresa` (`empresa`),
  KEY `vacunacovid` (`vacunacovid`),
  KEY `formularioorigen` (`formularioorigen`),
  KEY `destino` (`destino`),
  KEY `convenio` (`convenio`),
  KEY `qr` (`qr`),
  CONSTRAINT `lab_formulario_ibfk_1` FOREIGN KEY (`proceso`) REFERENCES `lab_proceso` (`id`),
  CONSTRAINT `lab_formulario_ibfk_10` FOREIGN KEY (`contratista`) REFERENCES `lab_empresa` (`id`),
  CONSTRAINT `lab_formulario_ibfk_11` FOREIGN KEY (`empresa`) REFERENCES `lab_empresa` (`id`),
  CONSTRAINT `lab_formulario_ibfk_12` FOREIGN KEY (`vacunacovid`) REFERENCES `lab_vacunacovid` (`id`),
  CONSTRAINT `lab_formulario_ibfk_13` FOREIGN KEY (`formularioorigen`) REFERENCES `lab_formularioorigen` (`id`),
  CONSTRAINT `lab_formulario_ibfk_14` FOREIGN KEY (`convenio`) REFERENCES `lab_convenio` (`id`),
  CONSTRAINT `lab_formulario_ibfk_15` FOREIGN KEY (`destino`) REFERENCES `lab_destino` (`id`),
  CONSTRAINT `lab_formulario_ibfk_16` FOREIGN KEY (`qr`) REFERENCES `lab_qr` (`id`),
  CONSTRAINT `lab_formulario_ibfk_2` FOREIGN KEY (`formularioestado`) REFERENCES `lab_formularioestado` (`abrev`),
  CONSTRAINT `lab_formulario_ibfk_3` FOREIGN KEY (`sexo`) REFERENCES `lab_sexo` (`codigo`),
  CONSTRAINT `lab_formulario_ibfk_4` FOREIGN KEY (`pueblooriginario`) REFERENCES `lab_pueblooriginario` (`codigo`),
  CONSTRAINT `lab_formulario_ibfk_5` FOREIGN KEY (`comuna`) REFERENCES `lab_comuna` (`codigo`),
  CONSTRAINT `lab_formulario_ibfk_6` FOREIGN KEY (`ocupaciontipo`) REFERENCES `lab_ocupaciontipo` (`codigo`),
  CONSTRAINT `lab_formulario_ibfk_7` FOREIGN KEY (`ficha`) REFERENCES `lab_ficha` (`id`),
  CONSTRAINT `lab_formulario_ibfk_8` FOREIGN KEY (`institucionsalud`) REFERENCES `lab_institucionsalud` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12322 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_formulariocad`
--

DROP TABLE IF EXISTS `lab_formulariocad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_formulariocad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ficha` int(11) NOT NULL COMMENT 'ficha.id',
  `empresa` int(11) NOT NULL COMMENT 'empresa.id',
  `formulario_estado` int(11) NOT NULL COMMENT 'formularioestado.id',
  `cargo` int(11) NOT NULL COMMENT 'cargo.id',
  `tiempo_cargo` int(11) NOT NULL COMMENT 'tiempo.id',
  `tiempo_cmdic` int(11) NOT NULL COMMENT 'tiempo.id',
  `turno` int(11) NOT NULL COMMENT 'turno.id',
  `dia_turno` int(11) NOT NULL,
  `rotativo` int(11) NOT NULL,
  `jornada` int(11) NOT NULL,
  `solo_dia` int(11) NOT NULL,
  `uso_medicamento` int(11) NOT NULL,
  `obs_medicamento` varchar(350) DEFAULT NULL,
  `campamento` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ficha` (`ficha`),
  KEY `cargo` (`cargo`),
  KEY `empresa` (`empresa`),
  KEY `formulario_estado` (`formulario_estado`),
  KEY `tiempo_cargo` (`tiempo_cargo`),
  KEY `tiempo_cmdic` (`tiempo_cmdic`),
  KEY `turno` (`turno`),
  KEY `campamento` (`campamento`),
  CONSTRAINT `lab_formulariocad_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `lab_cargo` (`id`),
  CONSTRAINT `lab_formulariocad_ibfk_2` FOREIGN KEY (`ficha`) REFERENCES `lab_ficha` (`id`),
  CONSTRAINT `lab_formulariocad_ibfk_3` FOREIGN KEY (`formulario_estado`) REFERENCES `lab_formularioestado` (`id`),
  CONSTRAINT `lab_formulariocad_ibfk_4` FOREIGN KEY (`empresa`) REFERENCES `lab_empresa` (`id`),
  CONSTRAINT `lab_formulariocad_ibfk_5` FOREIGN KEY (`tiempo_cargo`) REFERENCES `lab_tiempo` (`id`),
  CONSTRAINT `lab_formulariocad_ibfk_6` FOREIGN KEY (`tiempo_cmdic`) REFERENCES `lab_tiempo` (`id`),
  CONSTRAINT `lab_formulariocad_ibfk_7` FOREIGN KEY (`turno`) REFERENCES `lab_turno` (`id`),
  CONSTRAINT `lab_formulariocad_ibfk_8` FOREIGN KEY (`campamento`) REFERENCES `lab_campamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15177 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_formularioestado`
--

DROP TABLE IF EXISTS `lab_formularioestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_formularioestado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(16) NOT NULL,
  `nombre` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abrev` (`abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_formularioorigen`
--

DROP TABLE IF EXISTS `lab_formularioorigen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_formularioorigen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_formulariopcrtipo`
--

DROP TABLE IF EXISTS `lab_formulariopcrtipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_formulariopcrtipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `formulario` int(11) NOT NULL COMMENT 'formulario.id',
  `pcrtipo` int(11) NOT NULL COMMENT 'pcrtipo.id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `formulariopcrtipo` (`formulario`,`pcrtipo`) USING BTREE,
  KEY `formulario` (`formulario`),
  KEY `pcrtipo` (`pcrtipo`),
  CONSTRAINT `lab_formulariopcrtipo_ibfk_1` FOREIGN KEY (`pcrtipo`) REFERENCES `lab_pcrtipo` (`id`),
  CONSTRAINT `lab_formulariopcrtipo_ibfk_2` FOREIGN KEY (`formulario`) REFERENCES `lab_formulario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12322 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_institucionsalud`
--

DROP TABLE IF EXISTS `lab_institucionsalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_institucionsalud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` date DEFAULT NULL,
  `codigo` tinyint(2) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_labo_nacionales`
--

DROP TABLE IF EXISTS `lab_labo_nacionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_labo_nacionales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(350) NOT NULL,
  `comuna` int(11) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `comuna` (`id`),
  KEY `lab_labo_nacionales_ibfk_1` (`comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_laboratorio`
--

DROP TABLE IF EXISTS `lab_laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_laboratorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_lote`
--

DROP TABLE IF EXISTS `lab_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_lote` (
  `lote_repositorio` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_modulo`
--

DROP TABLE IF EXISTS `lab_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `modulo` varchar(32) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `privilegios` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modelo` (`modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_motivocontrolcad`
--

DROP TABLE IF EXISTS `lab_motivocontrolcad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_motivocontrolcad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_muestra`
--

DROP TABLE IF EXISTS `lab_muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_muestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ficha` int(11) NOT NULL COMMENT 'ficha.id',
  `folio` varchar(32) NOT NULL COMMENT 'formulario.folio',
  `formulario` int(11) NOT NULL COMMENT 'formulario.id',
  `muestraestado` varchar(16) NOT NULL DEFAULT 'EST_MUES_ING' COMMENT 'muestraestado.abrev',
  `autor` varchar(64) NOT NULL,
  `fechahoraobtencion` datetime NOT NULL,
  `profesional` varchar(128) NOT NULL,
  `establecimiento` varchar(64) NOT NULL,
  `observaciones` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folio` (`folio`) USING BTREE,
  UNIQUE KEY `formulario` (`formulario`) USING BTREE,
  KEY `ficha` (`ficha`),
  KEY `muestraestado` (`muestraestado`),
  CONSTRAINT `lab_muestra_ibfk_1` FOREIGN KEY (`ficha`) REFERENCES `lab_ficha` (`id`),
  CONSTRAINT `lab_muestra_ibfk_2` FOREIGN KEY (`formulario`) REFERENCES `lab_formulario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_muestra_ibfk_3` FOREIGN KEY (`folio`) REFERENCES `lab_formulario` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_muestra_ibfk_4` FOREIGN KEY (`muestraestado`) REFERENCES `lab_muestraestado` (`abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=12322 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_muestraestado`
--

DROP TABLE IF EXISTS `lab_muestraestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_muestraestado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(16) NOT NULL,
  `nombre` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abrev` (`abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_muestramuestratipo`
--

DROP TABLE IF EXISTS `lab_muestramuestratipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_muestramuestratipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `muestra` int(11) NOT NULL COMMENT 'muestra.id',
  `muestratipo` int(11) NOT NULL COMMENT 'muestratipo.id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `muestramuestratipo` (`muestra`,`muestratipo`),
  KEY `muestra` (`muestra`),
  KEY `muestratipo` (`muestratipo`),
  CONSTRAINT `lab_muestramuestratipo_ibfk_1` FOREIGN KEY (`muestra`) REFERENCES `lab_muestra` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lab_muestramuestratipo_ibfk_2` FOREIGN KEY (`muestratipo`) REFERENCES `lab_muestratipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24643 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_muestratipo`
--

DROP TABLE IF EXISTS `lab_muestratipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_muestratipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(32) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_nacionales`
--

DROP TABLE IF EXISTS `lab_nacionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_nacionales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ficha` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `folio` varchar(250) DEFAULT NULL,
  `convenio` int(11) NOT NULL,
  `empresa` varchar(350) NOT NULL,
  `laboratorio` int(11) DEFAULT NULL,
  `examen` int(11) NOT NULL,
  `resultado` int(11) DEFAULT NULL,
  `fecha_resultado` date DEFAULT NULL,
  `asistencia` int(11) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `faena` int(11) DEFAULT NULL,
  `usu_creacion` int(11) NOT NULL,
  `usu_resultado` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_obsinvalido`
--

DROP TABLE IF EXISTS `lab_obsinvalido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_obsinvalido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `descripcion` varchar(350) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_ocupaciontipo`
--

DROP TABLE IF EXISTS `lab_ocupaciontipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_ocupaciontipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(32) NOT NULL,
  `codigo` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_pais`
--

DROP TABLE IF EXISTS `lab_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `codigo` int(3) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_parametro`
--

DROP TABLE IF EXISTS `lab_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_parametro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `horaslimiteformulario` int(11) NOT NULL DEFAULT 0,
  `horasvigenciaformulario` int(11) NOT NULL DEFAULT 0,
  `emailcontactotecnico` varchar(64) NOT NULL,
  `emailremitentemensajeria` varchar(64) NOT NULL,
  `emailsnotificacionformularios` varchar(256) DEFAULT NULL,
  `emailsnotificacionmuestras` varchar(256) DEFAULT NULL,
  `emailsnotificacionresultados` varchar(256) DEFAULT NULL,
  `emailsnotificaciontestrapido` varchar(256) DEFAULT NULL,
  `horaaperturalunes` time NOT NULL,
  `horacierrelunes` time NOT NULL,
  `horaaperturamartes` time NOT NULL,
  `horacierremartes` time NOT NULL,
  `horaaperturamiercoles` time NOT NULL,
  `horacierremiercoles` time NOT NULL,
  `horaaperturajueves` time NOT NULL,
  `horacierrejueves` time NOT NULL,
  `horaaperturaviernes` time NOT NULL,
  `horacierreviernes` time NOT NULL,
  `horaaperturasabado` time NOT NULL,
  `horacierresabado` time NOT NULL,
  `horaaperturadomingo` time NOT NULL,
  `horacierredomingo` time NOT NULL,
  `textocierrepagina` mediumtext NOT NULL,
  `requiereqr` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_pcrtipo`
--

DROP TABLE IF EXISTS `lab_pcrtipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_pcrtipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(32) NOT NULL,
  `detalle` varchar(256) DEFAULT NULL,
  `metodo` varchar(256) DEFAULT NULL,
  `consultarenformulario` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_persona`
--

DROP TABLE IF EXISTS `lab_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ficha` int(11) NOT NULL COMMENT 'ficha.id',
  `email` varchar(64) NOT NULL,
  `rut` int(11) DEFAULT NULL,
  `pasaporte` varchar(32) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ficha` (`ficha`),
  UNIQUE KEY `rut` (`rut`),
  UNIQUE KEY `pasaporte` (`pasaporte`),
  CONSTRAINT `lab_persona_ibfk_1` FOREIGN KEY (`ficha`) REFERENCES `lab_ficha` (`id`),
  CONSTRAINT `lab_persona_ibfk_2` FOREIGN KEY (`rut`) REFERENCES `lab_ficha` (`rut`),
  CONSTRAINT `lab_persona_ibfk_3` FOREIGN KEY (`pasaporte`) REFERENCES `lab_ficha` (`pasaporte`)
) ENGINE=InnoDB AUTO_INCREMENT=6239 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_privilegio`
--

DROP TABLE IF EXISTS `lab_privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_privilegio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(16) NOT NULL,
  `nombre` varchar(16) NOT NULL,
  `descripcion` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abrev` (`abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_proceso`
--

DROP TABLE IF EXISTS `lab_proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_proceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `laboratorio` int(11) NOT NULL COMMENT 'laboratorio.id',
  `empresa` int(11) NOT NULL COMMENT 'empresa.id',
  `procesoestado` varchar(16) NOT NULL COMMENT 'procesoestado.abrev',
  `codigo` varchar(16) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime DEFAULT NULL,
  `agendamientoinicio` datetime DEFAULT NULL,
  `agendamientofin` datetime DEFAULT NULL,
  `agendamientotolerancia` int(11) NOT NULL DEFAULT 0,
  `valorizacionafecto` int(11) NOT NULL DEFAULT 0,
  `valorizacionexento` int(11) NOT NULL DEFAULT 0,
  `valorizacioniva` int(11) NOT NULL DEFAULT 0,
  `valorizaciontotal` int(11) NOT NULL DEFAULT 0,
  `valorizacionsabadoafecto` int(11) NOT NULL DEFAULT 0,
  `valorizacionsabadoexento` int(11) NOT NULL DEFAULT 0,
  `valorizacionsabadoiva` int(11) NOT NULL DEFAULT 0,
  `valorizacionsabadototal` int(11) NOT NULL DEFAULT 0,
  `valorizaciondomingoafecto` int(11) NOT NULL DEFAULT 0,
  `valorizaciondomingoexento` int(11) NOT NULL DEFAULT 0,
  `valorizaciondomingoiva` int(11) NOT NULL DEFAULT 0,
  `valorizaciondomingototal` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `empresa` (`empresa`),
  KEY `procesoestado` (`procesoestado`),
  KEY `laboratorio` (`laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=2235 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_procesocontratista`
--

DROP TABLE IF EXISTS `lab_procesocontratista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_procesocontratista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` date DEFAULT NULL,
  `proceso` int(11) NOT NULL COMMENT 'proceso.id',
  `empresa` int(11) NOT NULL COMMENT 'empresa.id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `procesocontratista` (`proceso`,`empresa`) USING BTREE,
  KEY `proceso` (`proceso`),
  KEY `empresa` (`empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_procesoestado`
--

DROP TABLE IF EXISTS `lab_procesoestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_procesoestado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(16) NOT NULL,
  `nombre` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abrev` (`abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_provincia`
--

DROP TABLE IF EXISTS `lab_provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `region` tinyint(2) NOT NULL COMMENT 'region.codigo',
  `nombre` varchar(64) NOT NULL,
  `codigo` smallint(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `region` (`region`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_pueblooriginario`
--

DROP TABLE IF EXISTS `lab_pueblooriginario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_pueblooriginario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(32) NOT NULL,
  `codigo` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_puntovacunacion`
--

DROP TABLE IF EXISTS `lab_puntovacunacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_puntovacunacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_qr`
--

DROP TABLE IF EXISTS `lab_qr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_qr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `qrlote` int(11) NOT NULL COMMENT 'qrlote.id',
  `qrestado` varchar(16) NOT NULL DEFAULT 'EST_QR_GEN' COMMENT 'qrestado.abrev',
  `data` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data` (`data`),
  KEY `qrlote` (`qrlote`),
  KEY `qrestado` (`qrestado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_qrestado`
--

DROP TABLE IF EXISTS `lab_qrestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_qrestado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(16) NOT NULL,
  `nombre` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abrev` (`abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_qrlote`
--

DROP TABLE IF EXISTS `lab_qrlote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_qrlote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_random`
--

DROP TABLE IF EXISTS `lab_random`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_random` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `rut` int(11) DEFAULT NULL,
  `dv` varchar(1) DEFAULT NULL,
  `pasaporte` varchar(150) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `cargo` int(11) NOT NULL,
  `telefono` varchar(150) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cargo` (`cargo`),
  CONSTRAINT `lab_frandom_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `lab_cargo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14097 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_region`
--

DROP TABLE IF EXISTS `lab_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `numeracion` varchar(4) NOT NULL,
  `codigo` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numeracion` (`numeracion`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_repositorio`
--

DROP TABLE IF EXISTS `lab_repositorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_repositorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ficha` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `lote` int(11) NOT NULL,
  `pdf` varchar(500) NOT NULL,
  `empresa` int(11) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL,
  `alcotest` int(11) NOT NULL,
  `narcotest` int(11) NOT NULL,
  `metanfetaminas` tinyint(4) DEFAULT NULL,
  `thc` tinyint(4) DEFAULT NULL,
  `benzodiazepinas` tinyint(4) DEFAULT NULL,
  `anfetaminas` tinyint(4) DEFAULT NULL,
  `opioides` tinyint(4) DEFAULT NULL,
  `cocaina` tinyint(4) DEFAULT NULL,
  `revisado` tinyint(4) DEFAULT NULL,
  `usuario_rev` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ficha` (`id`),
  KEY `usuario` (`id`),
  KEY `lab_repositorio_ibfk_1` (`ficha`),
  KEY `lab_repositorio_ibfk_2` (`usuario`),
  CONSTRAINT `lab_repositorio_ibfk_1` FOREIGN KEY (`ficha`) REFERENCES `lab_ficha` (`id`),
  CONSTRAINT `lab_repositorio_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `lab_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25735 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_resultado`
--

DROP TABLE IF EXISTS `lab_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_resultado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ficha` int(11) NOT NULL COMMENT 'ficha.id',
  `folio` varchar(32) NOT NULL COMMENT 'formulario.folio',
  `muestra` int(11) NOT NULL COMMENT 'muestra.id',
  `resultadoestado` varchar(16) NOT NULL DEFAULT 'EST_RESU_ING' COMMENT 'resultadoestado.abrev',
  `autor` varchar(64) NOT NULL,
  `pcrfechahoraobtencion` datetime DEFAULT NULL,
  `pcrprofesional` varchar(128) DEFAULT NULL,
  `pcrestablecimiento` varchar(64) DEFAULT NULL,
  `pcrpositividad` tinyint(1) DEFAULT 0,
  `pcrsintomatico` tinyint(1) NOT NULL DEFAULT 0,
  `imsfechahoraobtencion` datetime DEFAULT NULL,
  `imsprofesional` varchar(128) DEFAULT NULL,
  `imsestablecimiento` varchar(64) DEFAULT NULL,
  `imspositividad` tinyint(1) DEFAULT 0,
  `imssintomatico` tinyint(1) NOT NULL DEFAULT 0,
  `iggfechahoraobtencion` datetime DEFAULT NULL,
  `iggprofesional` varchar(128) DEFAULT NULL,
  `iggestablecimiento` varchar(64) DEFAULT NULL,
  `iggpositividad` tinyint(1) DEFAULT 0,
  `iggsintomatico` tinyint(1) NOT NULL DEFAULT 0,
  `igmpositividad` tinyint(1) DEFAULT 0,
  `testrapidofechahoraobtencion` datetime DEFAULT NULL,
  `testrapidoprofesional` varchar(128) DEFAULT NULL,
  `testrapidopositividad` tinyint(1) DEFAULT 0,
  `positividad` tinyint(1) DEFAULT 0,
  `influenza_a` tinyint(1) DEFAULT 0,
  `influenza_b` tinyint(1) DEFAULT 0,
  `sintomatico` tinyint(1) NOT NULL DEFAULT 0,
  `diagnostico` varchar(256) DEFAULT NULL,
  `observaciones` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folio` (`folio`),
  UNIQUE KEY `muestra` (`muestra`),
  KEY `ficha` (`ficha`),
  KEY `resultadoestado` (`resultadoestado`)
) ENGINE=InnoDB AUTO_INCREMENT=12220 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_resultadocad`
--

DROP TABLE IF EXISTS `lab_resultadocad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_resultadocad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `formulariocad` int(11) NOT NULL,
  `alcotest` int(11) NOT NULL,
  `narcotest` int(11) NOT NULL,
  `metanfetaminas` tinyint(1) DEFAULT NULL,
  `thc` tinyint(1) DEFAULT NULL,
  `benzodiazepinas` tinyint(1) DEFAULT NULL,
  `anfetaminas` tinyint(1) DEFAULT NULL,
  `opioides` tinyint(1) DEFAULT NULL,
  `cocaina` tinyint(1) DEFAULT NULL,
  `obs` varchar(350) NOT NULL,
  `validador` int(11) NOT NULL,
  `resultado_estado` int(11) NOT NULL,
  `tipo_verificacion` int(11) NOT NULL,
  `motivo_control` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `formulariocad` (`formulariocad`),
  KEY `validador` (`validador`),
  KEY `estado_resultado` (`resultado_estado`),
  CONSTRAINT `lab_resultadocad_ibfk_1` FOREIGN KEY (`formulariocad`) REFERENCES `lab_formulariocad` (`id`),
  CONSTRAINT `lab_resultadocad_ibfk_2` FOREIGN KEY (`validador`) REFERENCES `lab_usuario` (`id`),
  CONSTRAINT `lab_resultadocad_ibfk_3` FOREIGN KEY (`resultado_estado`) REFERENCES `lab_resultadoestado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14702 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_resultadoestado`
--

DROP TABLE IF EXISTS `lab_resultadoestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_resultadoestado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(16) NOT NULL,
  `nombre` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abrev` (`abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_rol`
--

DROP TABLE IF EXISTS `lab_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(16) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `reportarempresa` int(11) DEFAULT NULL COMMENT 'empresa.id',
  `laboratorio` int(11) DEFAULT NULL COMMENT 'laboratorio.id',
  `convenio` int(11) DEFAULT NULL COMMENT 'convenio.id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `abrev` (`abrev`),
  KEY `empresa` (`reportarempresa`),
  KEY `laboratorio` (`laboratorio`),
  KEY `convenio` (`convenio`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_roldetalle`
--

DROP TABLE IF EXISTS `lab_roldetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_roldetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime NOT NULL DEFAULT current_timestamp(),
  `rol` varchar(16) NOT NULL COMMENT 'rol.abrev',
  `modulo` varchar(32) NOT NULL COMMENT 'modulo.modulo',
  `privilegio` varchar(16) NOT NULL COMMENT 'privilegio.abrev',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roldetalle` (`rol`,`modulo`,`privilegio`) USING BTREE,
  KEY `rol` (`rol`),
  KEY `privilegio` (`privilegio`),
  KEY `modulo` (`modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=3290 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_sesion`
--

DROP TABLE IF EXISTS `lab_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_sesion` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT 0,
  `user_data` text NOT NULL,
  `public_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_sexo`
--

DROP TABLE IF EXISTS `lab_sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `abrev` varchar(1) NOT NULL,
  `codigo` tinyint(1) NOT NULL,
  `nombre` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abrev` (`abrev`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_sintoma`
--

DROP TABLE IF EXISTS `lab_sintoma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_sintoma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` date DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_tiempo`
--

DROP TABLE IF EXISTS `lab_tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_tiempo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `descripcion` varchar(150) NOT NULL,
  `orden` int(11) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_turno`
--

DROP TABLE IF EXISTS `lab_turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_turno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `descripcion` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_usuario`
--

DROP TABLE IF EXISTS `lab_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `usuario` varchar(32) NOT NULL,
  `rut` varchar(10) DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `sexo` varchar(1) NOT NULL COMMENT 'sexo.abrev',
  `rol` varchar(16) DEFAULT NULL COMMENT 'rol.abrev',
  `sistema` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `empresa` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `hash_login` varchar(255) DEFAULT NULL,
  `hash_usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `rol` (`rol`),
  KEY `sexo` (`sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_vacuna_influenza`
--

DROP TABLE IF EXISTS `lab_vacuna_influenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_vacuna_influenza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `ficha` int(11) NOT NULL,
  `empresa` int(11) NOT NULL,
  `puntovacunacion` int(11) DEFAULT NULL,
  `fecha_vacuna` date NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `ficha` (`ficha`),
  KEY `empresa` (`empresa`),
  KEY `puntovacunacion` (`puntovacunacion`),
  CONSTRAINT `lab_vacuna_influenza_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `lab_empresa` (`id`),
  CONSTRAINT `lab_vacuna_influenza_ibfk_2` FOREIGN KEY (`ficha`) REFERENCES `lab_ficha` (`id`),
  CONSTRAINT `lab_vacuna_influenza_ibfk_3` FOREIGN KEY (`puntovacunacion`) REFERENCES `lab_puntovacunacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2502 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_vacunacovid`
--

DROP TABLE IF EXISTS `lab_vacunacovid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_vacunacovid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_valorizacion`
--

DROP TABLE IF EXISTS `lab_valorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_valorizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `modificado` datetime DEFAULT NULL,
  `proceso` int(11) NOT NULL COMMENT 'proceso.id',
  `muestra` int(11) NOT NULL COMMENT 'muestra.id',
  `afecto` int(11) NOT NULL DEFAULT 0,
  `exento` int(11) NOT NULL DEFAULT 0,
  `iva` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valorizacion` (`proceso`,`muestra`),
  KEY `proceso` (`proceso`),
  KEY `muestra` (`muestra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09  4:06:04
