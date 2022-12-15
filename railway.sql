-- --------------------------------------------------------
-- Host:                         containers-us-west-128.railway.app
-- Versión del servidor:         8.0.31 - MySQL Community Server - GPL
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para railway
CREATE DATABASE IF NOT EXISTS `railway` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `railway`;

-- Volcando estructura para tabla railway.agenda
CREATE TABLE IF NOT EXISTS `agenda` (
  `idagenda` int NOT NULL AUTO_INCREMENT,
  `idempleados` int NOT NULL,
  `fecha` date NOT NULL,
  `idbloque` int NOT NULL,
  PRIMARY KEY (`idagenda`),
  KEY `fk_rel_agenda_empleados_idx` (`idempleados`),
  KEY `fk_rel_agenda_bloque_idx` (`idbloque`),
  CONSTRAINT `fk_rel_agenda_bloque` FOREIGN KEY (`idbloque`) REFERENCES `bloque` (`idbloque`),
  CONSTRAINT `fk_rel_agenda_empleados` FOREIGN KEY (`idempleados`) REFERENCES `empleados` (`idempleados`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.atencion
CREATE TABLE IF NOT EXISTS `atencion` (
  `idatencion` int NOT NULL AUTO_INCREMENT,
  `idpacientes` int NOT NULL,
  `idempleados` int NOT NULL,
  `fecha` datetime NOT NULL,
  `hora` time NOT NULL,
  `idpago` int NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idatencion`),
  KEY `fk_rel_atencionpacientes_idx` (`idpacientes`),
  KEY `fk_rel_atencion_pago_idx` (`idpago`),
  CONSTRAINT `fk_rel_atencion_pago` FOREIGN KEY (`idpago`) REFERENCES `pagos` (`idpagos`),
  CONSTRAINT `fk_rel_atencionpacientes` FOREIGN KEY (`idpacientes`) REFERENCES `pacientes` (`idpacientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.bloque
CREATE TABLE IF NOT EXISTS `bloque` (
  `idbloque` int NOT NULL AUTO_INCREMENT,
  `comienza` time NOT NULL,
  `termina` time NOT NULL,
  PRIMARY KEY (`idbloque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `iddocumento` int NOT NULL AUTO_INCREMENT,
  `idficha` int NOT NULL,
  `documento` int DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`iddocumento`,`idficha`),
  KEY `fk_ficha_doc_idx` (`idficha`),
  CONSTRAINT `fk_ficha_doc` FOREIGN KEY (`idficha`) REFERENCES `fichas` (`idfichas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `idempleados` int NOT NULL AUTO_INCREMENT,
  `idpersonas` int NOT NULL,
  `idservicios` int NOT NULL,
  `estados` int DEFAULT NULL,
  PRIMARY KEY (`idempleados`),
  KEY `fk_rel_empleados_personas_idx` (`idpersonas`),
  KEY `fk_rel_empleados_servicios_idx` (`idservicios`),
  CONSTRAINT `FK1_rel_empleados_personas` FOREIGN KEY (`idpersonas`) REFERENCES `personas` (`idpersonas`),
  CONSTRAINT `FK2_rel_empleados_servicios` FOREIGN KEY (`idservicios`) REFERENCES `servicios` (`idservicios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.fichas
CREATE TABLE IF NOT EXISTS `fichas` (
  `idfichas` int NOT NULL AUTO_INCREMENT,
  `idatencion` int DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`idfichas`),
  KEY `fk_rel_ficha_aten_idx` (`idatencion`),
  CONSTRAINT `fk_rel_ficha_aten` FOREIGN KEY (`idatencion`) REFERENCES `atencion` (`idatencion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `idpacientes` int NOT NULL AUTO_INCREMENT,
  `prevision` varchar(128) DEFAULT NULL,
  `idpersonas` int NOT NULL,
  PRIMARY KEY (`idpacientes`,`idpersonas`),
  KEY `fk_pac_pec_idx` (`idpersonas`),
  CONSTRAINT `fk_pac_pec` FOREIGN KEY (`idpersonas`) REFERENCES `personas` (`idpersonas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.pagos
CREATE TABLE IF NOT EXISTS `pagos` (
  `idpagos` int NOT NULL,
  `monto` varchar(45) DEFAULT NULL,
  `idreserva` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`idpagos`),
  KEY `rel_pago_reserva_idx` (`idreserva`),
  CONSTRAINT `rel_pago_reserva` FOREIGN KEY (`idreserva`) REFERENCES `reservas` (`idreservas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `idpersonas` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombres` varchar(256) DEFAULT NULL,
  `apepat` varchar(128) DEFAULT NULL,
  `apemat` varchar(128) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `correo` varchar(256) DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  PRIMARY KEY (`idpersonas`),
  KEY `FK_personas_users` (`idusuario`),
  CONSTRAINT `FK_personas_users` FOREIGN KEY (`idusuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.reservas
CREATE TABLE IF NOT EXISTS `reservas` (
  `idreservas` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `idpacientes` int DEFAULT NULL,
  `idagenda` int NOT NULL,
  `estado` int DEFAULT NULL,
  `fechareserva` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idreservas`),
  KEY `fk_rel_reservas_usuarios_idx` (`idusuario`),
  KEY `fk_rel_reservas_paciente_idx` (`idpacientes`),
  KEY `fk_rel_reservas_agenda` (`idagenda`),
  CONSTRAINT `fk_rel_reservas_agenda` FOREIGN KEY (`idagenda`) REFERENCES `agenda` (`idagenda`),
  CONSTRAINT `FK_reservas_pacientes` FOREIGN KEY (`idpacientes`) REFERENCES `pacientes` (`idpacientes`),
  CONSTRAINT `FK_reservas_users` FOREIGN KEY (`idusuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `idservicios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(256) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`idservicios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla railway.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
