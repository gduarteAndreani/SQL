-- MySQL Workbench Synchronization
-- Generated: 2023-01-19 12:26
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: gduarte

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`Amigos` (
  `codigo_amigo` INT(11) NULL DEFAULT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` INT(11) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo_amigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Peliculas` (
  `codigo_pelicula` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `anio` INT(11) NOT NULL,
  `duracion` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_pelicula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Prestamos` (
  `numero_alquiler` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_fin` TEXT NULL DEFAULT NULL,
  `fecha_inicio` TEXT NOT NULL,
  `Codigo_pelicula` INT(11) NOT NULL,
  `Codigo_amigo` INT(11) NOT NULL,
  PRIMARY KEY (`numero_alquiler`, `Codigo_pelicula`, `Codigo_amigo`),
  INDEX `fk_Prestamos_Peliculas_idx` (`Codigo_pelicula` ASC),
  INDEX `fk_Prestamos_Amigos1_idx` (`Codigo_amigo` ASC),
  CONSTRAINT `fk_Prestamos_Peliculas`
    FOREIGN KEY (`Codigo_pelicula`)
    REFERENCES `mydb`.`Peliculas` (`codigo_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamos_Amigos1`
    FOREIGN KEY (`Codigo_amigo`)
    REFERENCES `mydb`.`Amigos` (`codigo_amigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
