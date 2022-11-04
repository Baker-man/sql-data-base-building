-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cinema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cinema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cinema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cinema` ;

-- -----------------------------------------------------
-- Table `cinema`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `full_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`language` (
  `language_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(500) NULL,
  `language_id` INT NULL,
  `rental_duration` INT NULL,
  `rental_rate` FLOAT NULL,
  `length` INT NULL,
  `replacement_cost` FLOAT NULL,
  `rating` VARCHAR(45) NULL,
  `special_features` VARCHAR(200) NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_film_language1_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `cinema`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL,
  `store_id` INT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventory_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `cinema`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`old_HDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`old_HDD` (
  `first_name` INT NULL,
  `last_name` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `category_id` INT NULL,
  `full_name` VARCHAR(45) NOT NULL,
  `film_id` INT NULL,
  `actor_id` INT NULL,
  INDEX `fk_old_HDD_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_old_HDD_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_old_HDD_actor1_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_old_HDD_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `cinema`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `cinema`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `cinema`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL,
  `inventory_id` INT NULL,
  `customer_id` VARCHAR(45) NULL,
  `return_date` DATETIME NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rental_inventory1_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `cinema`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
