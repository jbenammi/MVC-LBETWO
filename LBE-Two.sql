-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema LBE2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LBE2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LBE2` DEFAULT CHARACTER SET utf8 ;
USE `LBE2` ;

-- -----------------------------------------------------
-- Table `LBE2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LBE2`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `alias` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(100) NULL,
  `birthdate` DATETIME NULL,
  `created_on` DATETIME NULL,
  `updated_on` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LBE2`.`quotes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LBE2`.`quotes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quoted_by` VARCHAR(100) NULL,
  `quote` VARCHAR(255) NULL,
  `posted_by_id` INT NOT NULL,
  `created_on` DATETIME NULL,
  `updated_on` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quotes_users1_idx` (`posted_by_id` ASC),
  CONSTRAINT `fk_quotes_users1`
    FOREIGN KEY (`posted_by_id`)
    REFERENCES `LBE2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LBE2`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LBE2`.`favorites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `quote_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_favorites_users_idx` (`user_id` ASC),
  INDEX `fk_favorites_quotes1_idx` (`quote_id` ASC),
  CONSTRAINT `fk_favorites_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `LBE2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorites_quotes1`
    FOREIGN KEY (`quote_id`)
    REFERENCES `LBE2`.`quotes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
