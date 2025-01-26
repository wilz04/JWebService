-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.11-beta-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cuc
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ cuc;
USE cuc;

--
-- Table structure for table `cuc`.`carreras`
--

DROP TABLE IF EXISTS `carreras`;
CREATE TABLE `carreras` (
  `IdCarrera` varchar(10) NOT NULL,
  `Descirpcion` varchar(45) NOT NULL,
  PRIMARY KEY  (`IdCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuc`.`carreras`
--

/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` (`IdCarrera`,`Descirpcion`) VALUES 
 ('1','progra');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;


--
-- Table structure for table `cuc`.`estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante` (
  `Carnet` varchar(10) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `PrimerApellido` varchar(45) NOT NULL,
  `SegundoApellido` varchar(45) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `IdCarrera` varchar(10) NOT NULL,
  `EMail` varchar(45) NOT NULL,
  `Telefono` varchar(45) default NULL,
  PRIMARY KEY  (`Carnet`),
  KEY `FK_estudiante_1` (`IdCarrera`),
  CONSTRAINT `FK_estudiante_1` FOREIGN KEY (`IdCarrera`) REFERENCES `carreras` (`IdCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuc`.`estudiante`
--

/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` (`Carnet`,`Nombre`,`PrimerApellido`,`SegundoApellido`,`Direccion`,`IdCarrera`,`EMail`,`Telefono`) VALUES 
 ('05','no se ','menos','tmpoo','rre','1','rrty','sertre');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;


--
-- Table structure for table `cuc`.`materias`
--

DROP TABLE IF EXISTS `materias`;
CREATE TABLE `materias` (
  `IdMateria` varchar(14) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `IdCarrera` varchar(45) NOT NULL,
  `Creditos` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`IdMateria`),
  KEY `FK_Materias_1` (`IdCarrera`),
  CONSTRAINT `FK_Materias_1` FOREIGN KEY (`IdCarrera`) REFERENCES `carreras` (`IdCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuc`.`materias`
--

/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` (`IdMateria`,`Nombre`,`IdCarrera`,`Creditos`) VALUES 
 ('1','no se ','1',10),
 ('2','yo fhsf','1',30);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;


--
-- Table structure for table `cuc`.`materiasaprobadas`
--

DROP TABLE IF EXISTS `materiasaprobadas`;
CREATE TABLE `materiasaprobadas` (
  `Carnet` varchar(10) NOT NULL,
  `IdMateria` varchar(10) NOT NULL,
  `Nota` double NOT NULL,
  `Fecha` varchar(20) NOT NULL,
  KEY `FK_materiasAprobadas_1` (`Carnet`),
  KEY `FK_materiasaprobadas_2` (`IdMateria`),
  CONSTRAINT `FK_materiasaprobadas_2` FOREIGN KEY (`IdMateria`) REFERENCES `materias` (`IdMateria`),
  CONSTRAINT `FK_materiasAprobadas_1` FOREIGN KEY (`Carnet`) REFERENCES `estudiante` (`Carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuc`.`materiasaprobadas`
--

/*!40000 ALTER TABLE `materiasaprobadas` DISABLE KEYS */;
INSERT INTO `materiasaprobadas` (`Carnet`,`IdMateria`,`Nota`,`Fecha`) VALUES 
 ('05','1',3.5,'rtyr'),
 ('05','1',2,'Q'),
 ('05','1',0,'Mon Oct 16 00:00:00 '),
 ('05','1',0,'Tue Oct 3 00:00:00 G'),
 ('05','1',0,'Tue Oct 17 00:00:00 '),
 ('05','1',33,'Mon Oct 2 00:00:00 G'),
 ('05','1',33,'Sun Oct 1 00:00:00 G'),
 ('05','1',33,'Sun Oct 1 00:00:00 G');
/*!40000 ALTER TABLE `materiasaprobadas` ENABLE KEYS */;


--
-- Table structure for table `cuc`.`requisitos`
--

DROP TABLE IF EXISTS `requisitos`;
CREATE TABLE `requisitos` (
  `IdMateria` varchar(10) NOT NULL,
  `IdRequisito` varchar(10) NOT NULL,
  KEY `FK_Requisitos_1` (`IdMateria`),
  KEY `FK_Requisitos_2` (`IdRequisito`),
  CONSTRAINT `FK_Requisitos_1` FOREIGN KEY (`IdMateria`) REFERENCES `carreras` (`IdCarrera`),
  CONSTRAINT `FK_Requisitos_2` FOREIGN KEY (`IdRequisito`) REFERENCES `materias` (`IdMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuc`.`requisitos`
--

/*!40000 ALTER TABLE `requisitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisitos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
