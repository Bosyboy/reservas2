CREATE DATABASE `railway` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- -----------------------------------------------------
-- Table `railway`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `permisos` INT NULL,
  `idpersonas` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuarios`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `railway`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`reservas` (
  `idreservas` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `idpacientes` INT NOT NULL,
  `estado` INT NULL,
  `fechareserva` TIMESTAMP NULL,
  PRIMARY KEY (`idreservas`),
  CONSTRAINT `fk_rel_reservas_usuarios`
    FOREIGN KEY (`idusuario`)
    REFERENCES `railway`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_reservas_paciente`
    FOREIGN KEY (`idpacientes`)
    REFERENCES `railway`.`pacientes` (`idpacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_rel_reservas_usuarios_idx` ON `railway`.`reservas` (`idusuario` ASC) VISIBLE;

CREATE INDEX `fk_rel_reservas_paciente_idx` ON `railway`.`reservas` (`idpacientes` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `railway`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`pagos` (
  `idpagos` INT NOT NULL,
  `monto` VARCHAR(45) NULL,
  `idreserva` INT NOT NULL,
  `fecha` DATE NULL,
  `hora` TIME NULL,
  `observacion` TEXT NULL,
  PRIMARY KEY (`idpagos`),
  CONSTRAINT `rel_pago_reserva`
    FOREIGN KEY (`idreserva`)
    REFERENCES `railway`.`reservas` (`idreservas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `rel_pago_reserva_idx` ON `railway`.`pagos` (`idreserva` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `railway`.`atencion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`atencion` (
  `idatencion` INT NOT NULL AUTO_INCREMENT,
  `idpacientes` INT NOT NULL,
  `idempleados` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `hora` TIME NOT NULL,
  `idpago` INT NOT NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idatencion`),
  CONSTRAINT `fk_rel_atencionpacientes`
    FOREIGN KEY (`idpacientes`)
    REFERENCES `railway`.`pacientes` (`idpacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_atencion_pago`
    FOREIGN KEY (`idpago`)
    REFERENCES `railway`.`pagos` (`idpagos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																' /* comment truncated */ /*																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																°																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																										*/;

CREATE INDEX `fk_rel_atencionpacientes_idx` ON `railway`.`atencion` (`idpacientes` ASC) VISIBLE;

CREATE INDEX `fk_rel_atencion_pago_idx` ON `railway`.`atencion` (`idpago` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `railway`.`fichas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`fichas` (
  `idfichas` INT NOT NULL AUTO_INCREMENT,
  `idatencion` INT NULL,
  `observacion` TEXT NULL,
  PRIMARY KEY (`idfichas`),
  CONSTRAINT `fk_rel_ficha_aten`
    FOREIGN KEY (`idatencion`)
    REFERENCES `railway`.`atencion` (`idatencion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_rel_ficha_aten_idx` ON `railway`.`fichas` (`idatencion` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `railway`.`documentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`documentos` (
  `iddocumento` INT NOT NULL AUTO_INCREMENT,
  `idficha` INT NOT NULL,
  `documento` INT NULL,
  `observaciones` TEXT NULL,
  PRIMARY KEY (`iddocumento`, `idficha`),
  CONSTRAINT `fk_ficha_doc`
    FOREIGN KEY (`idficha`)
    REFERENCES `railway`.`fichas` (`idfichas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ficha_doc_idx` ON `railway`.`documentos` (`idficha` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `railway`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`servicios` (
  `idservicios` INT NOT NULL,
  `nombre` VARCHAR(256) NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`idservicios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `railway`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`empleados` (
  `idempleados` INT NOT NULL AUTO_INCREMENT,
  `idpersonas` INT NOT NULL,
  `idcargo` INT NOT NULL,
  `iduser` INT NOT NULL,
  `idservicios` INT NOT NULL,
  `estados` INT NULL,
  PRIMARY KEY (`idempleados`),
  CONSTRAINT `fk_rel_empleados_personas`
    FOREIGN KEY (`idpersonas`)
    REFERENCES `railway`.`personas` (`idpersonas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_empleados_servicios`
    FOREIGN KEY (`idservicios`)
    REFERENCES `railway`.`servicios` (`idservicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_rel_empleados_personas_idx` ON `railway`.`empleados` (`idpersonas` ASC) VISIBLE;

CREATE INDEX `fk_rel_empleados_servicios_idx` ON `railway`.`empleados` (`idservicios` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `railway`.`bloque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`bloque` (
  `idbloque` INT NOT NULL,
  `comienza` TIME NOT NULL,
  `termina` TIME NOT NULL,
  PRIMARY KEY (`idbloque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `railway`.`agenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`agenda` (
  `idagenda` INT NOT NULL,
  `idempleados` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `idbloque` INT NOT NULL,
  `agendacol` VARCHAR(45) NULL,
  PRIMARY KEY (`idagenda`),
  CONSTRAINT `fk_rel_agenda_empleados`
    FOREIGN KEY (`idempleados`)
    REFERENCES `railway`.`empleados` (`idempleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_agenda_bloque`
    FOREIGN KEY (`idbloque`)
    REFERENCES `railway`.`bloque` (`idbloque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_rel_agenda_empleados_idx` ON `railway`.`agenda` (`idempleados` ASC) VISIBLE;

CREATE INDEX `fk_rel_agenda_bloque_idx` ON `railway`.`agenda` (`idbloque` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
