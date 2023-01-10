-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libros` (
  `idlibro` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(70) NULL DEFAULT NULL,
  `autor` VARCHAR(70) NULL DEFAULT NULL,
  `editorial` VARCHAR(70) NULL DEFAULT NULL,
  `fechaPublicacion` DATE NULL DEFAULT NULL,
  `genero` VARCHAR(70) NULL DEFAULT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  `estado` TINYINT NULL DEFAULT NULL,
  `isbn` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idlibro`),
  UNIQUE INDEX `isbn` (`isbn` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`autores` (
  `idAutor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(70) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `pais` VARCHAR(35) NOT NULL,
  `genero` VARCHAR(1000) NOT NULL,
  `biografia` TEXT NOT NULL,
  `id_libro` INT NOT NULL,
  PRIMARY KEY (`idAutor`),
  INDEX `id_libro` (`id_libro` ASC) VISIBLE,
  CONSTRAINT `autores_ibfk_1`
    FOREIGN KEY (`id_libro`)
    REFERENCES `biblioteca`.`libros` (`idlibro`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`editoriales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`editoriales` (
  `idEditorial` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(70) NOT NULL,
  `direccion` VARCHAR(70) NOT NULL,
  `pais` VARCHAR(35) NOT NULL,
  `id_libro` INT NOT NULL,
  `id_autor` INT NOT NULL,
  PRIMARY KEY (`idEditorial`),
  INDEX `id_libro` (`id_libro` ASC) VISIBLE,
  INDEX `id_autor` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `editoriales_ibfk_1`
    FOREIGN KEY (`id_libro`)
    REFERENCES `biblioteca`.`libros` (`idlibro`),
  CONSTRAINT `editoriales_ibfk_2`
    FOREIGN KEY (`id_autor`)
    REFERENCES `biblioteca`.`autores` (`idAutor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`ejemplares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`ejemplares` (
  `idEjemplar` INT NOT NULL AUTO_INCREMENT,
  `id_libro` INT NOT NULL,
  `estado` VARCHAR(30) NULL DEFAULT NULL,
  `ubicacion` VARCHAR(50) NOT NULL,
  `fechaVencimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idEjemplar`),
  INDEX `id_libro` (`id_libro` ASC) VISIBLE,
  CONSTRAINT `ejemplares_ibfk_1`
    FOREIGN KEY (`id_libro`)
    REFERENCES `biblioteca`.`libros` (`idlibro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(70) NOT NULL,
  `direccion` VARCHAR(70) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `salt` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`prestamos` (
  `idPrestamo` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `id_ejemplar` INT NOT NULL,
  `fechaPrestamo` DATE NOT NULL,
  `fechaDevolucion` DATE NOT NULL,
  `estado` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idPrestamo`),
  INDEX `id_usuario` (`id_usuario` ASC) VISIBLE,
  INDEX `id_ejemplar` (`id_ejemplar` ASC) VISIBLE,
  CONSTRAINT `prestamos_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `biblioteca`.`usuarios` (`idUsuario`),
  CONSTRAINT `prestamos_ibfk_2`
    FOREIGN KEY (`id_ejemplar`)
    REFERENCES `biblioteca`.`ejemplares` (`idEjemplar`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
