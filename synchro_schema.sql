-- MySQL Workbench Synchronization
-- Generated: 2022-11-04 18:35
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Alejandro

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `cinema`.`film` 
DROP FOREIGN KEY `fk_film_language1`;

ALTER TABLE `cinema`.`inventory` 
DROP FOREIGN KEY `fk_inventory_film1`;

ALTER TABLE `cinema`.`old_HDD` 
DROP FOREIGN KEY `fk_old_HDD_category1`,
DROP FOREIGN KEY `fk_old_HDD_film1`;

ALTER TABLE `cinema`.`rental` 
CHANGE COLUMN `rental_id` `rental_id` INT(11) NOT NULL ,
CHANGE COLUMN `inventory_id` `inventory_id` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `customer_id` `customer_id` VARCHAR(45) NULL DEFAULT NULL ,
CHANGE COLUMN `staff_id` `staff_id` INT(11) NULL DEFAULT NULL ,
ADD PRIMARY KEY (`rental_id`),
ADD INDEX `fk_rental_inventory1_idx` (`inventory_id` ASC) VISIBLE;
;

ALTER TABLE `cinema`.`film` 
ADD CONSTRAINT `fk_film_language1`
  FOREIGN KEY (`language_id`)
  REFERENCES `cinema`.`language` (`language_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cinema`.`inventory` 
ADD CONSTRAINT `fk_inventory_film1`
  FOREIGN KEY (`film_id`)
  REFERENCES `cinema`.`film` (`film_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cinema`.`old_HDD` 
DROP FOREIGN KEY `fk_old_HDD_actor1`;

ALTER TABLE `cinema`.`old_HDD` ADD CONSTRAINT `fk_old_HDD_category1`
  FOREIGN KEY (`category_id`)
  REFERENCES `cinema`.`category` (`category_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_old_HDD_film1`
  FOREIGN KEY (`film_id`)
  REFERENCES `cinema`.`film` (`film_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_old_HDD_actor1`
  FOREIGN KEY (`actor_id`)
  REFERENCES `cinema`.`actor` (`actor_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `cinema`.`rental` 
ADD CONSTRAINT `fk_rental_inventory1`
  FOREIGN KEY (`inventory_id`)
  REFERENCES `cinema`.`inventory` (`inventory_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



