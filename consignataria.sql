SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `consignataria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `consignataria` ;

-- -----------------------------------------------------
-- Table `consignataria`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `idCategoria_UNIQUE` (`idCategoria` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `Departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  UNIQUE INDEX `idDepartamento_UNIQUE` (`idDepartamento` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`Ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `Ciudad` VARCHAR(45) NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idCiudad`),
  INDEX `fk_Ciudad_Departamento1_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Ciudad_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `consignataria`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`Marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE INDEX `idMarca_UNIQUE` (`idMarca` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `Documento` VARCHAR(45) NOT NULL,
  `Nombres` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Barrio` VARCHAR(45) NOT NULL,
  `Contrasena` VARCHAR(45) NULL,
  `Pregunta` VARCHAR(45) NULL,
  `Respuesta` VARCHAR(45) NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idPersona`),
  UNIQUE INDEX `idPersona_UNIQUE` (`idPersona` ASC),
  INDEX `fk_Persona_Ciudad1_idx` (`Ciudad_idCiudad` ASC),
  CONSTRAINT `fk_Persona_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `consignataria`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`Vehiculo` (
  `idVehiculo` INT NOT NULL AUTO_INCREMENT,
  `Codigo` VARCHAR(45) NOT NULL,
  `Placa` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Linea` VARCHAR(45) NOT NULL,
  `Cilindraje` VARCHAR(45) NOT NULL,
  `Seguro` VARCHAR(45) NOT NULL,
  `Precio` INT NOT NULL,
  `Resistencia` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Fotos` VARCHAR(45) NOT NULL,
  `Kilometraje` VARCHAR(45) NOT NULL,
  `Trasmicion` VARCHAR(45) NOT NULL,
  `Traccion` VARCHAR(45) NOT NULL,
  `TipoCombustible` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Categoria_idCategoria` INT NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  `Marca_idMarca` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  UNIQUE INDEX `idVehiculo_UNIQUE` (`idVehiculo` ASC),
  INDEX `fk_Vehiculo_Categoria_idx` (`Categoria_idCategoria` ASC),
  INDEX `fk_Vehiculo_Ciudad1_idx` (`Ciudad_idCiudad` ASC),
  INDEX `fk_Vehiculo_Marca1_idx` (`Marca_idMarca` ASC),
  INDEX `fk_Vehiculo_Persona1_idx` (`Persona_idPersona` ASC),
  UNIQUE INDEX `Codigo_UNIQUE` (`Codigo` ASC),
  CONSTRAINT `fk_Vehiculo_Categoria`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `consignataria`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `consignataria`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_Marca1`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `consignataria`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `consignataria`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`Inmueble` (
  `idInmueble` INT NOT NULL AUTO_INCREMENT,
  `Codigo` VARCHAR(45) NOT NULL,
  `Extension` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Estratificacion` VARCHAR(45) NOT NULL,
  `Precio` INT NOT NULL,
  `Ubicacion` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  `Fotos` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(250) NULL,
  `Persona_idPersona` INT NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idInmueble`),
  UNIQUE INDEX `idInmueble_UNIQUE` (`idInmueble` ASC),
  INDEX `fk_Inmueble_Persona1_idx` (`Persona_idPersona` ASC),
  INDEX `fk_Inmueble_Ciudad1_idx` (`Ciudad_idCiudad` ASC),
  INDEX `fk_Inmueble_Categoria1_idx` (`Categoria_idCategoria` ASC),
  CONSTRAINT `fk_Inmueble_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `consignataria`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inmueble_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `consignataria`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inmueble_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `consignataria`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`Transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`Transaccion` (
  `idTransaccion` INT NOT NULL AUTO_INCREMENT,
  `TipoTransaccion` VARCHAR(45) NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Permuta` VARCHAR(45) NOT NULL,
  `Valor` VARCHAR(45) NOT NULL,
  `CodigoPermuta` VARCHAR(45) NOT NULL,
  `Vehiculo_idVehiculo` INT NULL,
  `Inmueble_idInmueble` INT NULL,
  PRIMARY KEY (`idTransaccion`),
  UNIQUE INDEX `idTransaccion_UNIQUE` (`idTransaccion` ASC),
  INDEX `fk_Transaccion_Vehiculo1_idx` (`Vehiculo_idVehiculo` ASC),
  INDEX `fk_Transaccion_Inmueble1_idx` (`Inmueble_idInmueble` ASC),
  CONSTRAINT `fk_Transaccion_Vehiculo1`
    FOREIGN KEY (`Vehiculo_idVehiculo`)
    REFERENCES `consignataria`.`Vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaccion_Inmueble1`
    FOREIGN KEY (`Inmueble_idInmueble`)
    REFERENCES `consignataria`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`TipoPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`TipoPersona` (
  `idTipoPersona` INT NOT NULL AUTO_INCREMENT,
  `TipoPersona` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoPersona`),
  UNIQUE INDEX `idTipoPersona_UNIQUE` (`idTipoPersona` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consignataria`.`ProcesosPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consignataria`.`ProcesosPersona` (
  `idProcesosPersona` INT NOT NULL AUTO_INCREMENT,
  `Transaccion_idTransaccion` INT NOT NULL,
  `TipoPersona_idTipoPersona` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idProcesosPersona`),
  UNIQUE INDEX `idProcesosPersona_UNIQUE` (`idProcesosPersona` ASC),
  INDEX `fk_ProcesosPersona_Transaccion1_idx` (`Transaccion_idTransaccion` ASC),
  INDEX `fk_ProcesosPersona_TipoPersona1_idx` (`TipoPersona_idTipoPersona` ASC),
  INDEX `fk_ProcesosPersona_Persona1_idx` (`Persona_idPersona` ASC),
  CONSTRAINT `fk_ProcesosPersona_Transaccion1`
    FOREIGN KEY (`Transaccion_idTransaccion`)
    REFERENCES `consignataria`.`Transaccion` (`idTransaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProcesosPersona_TipoPersona1`
    FOREIGN KEY (`TipoPersona_idTipoPersona`)
    REFERENCES `consignataria`.`TipoPersona` (`idTipoPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProcesosPersona_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `consignataria`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;