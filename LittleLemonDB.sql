-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customers` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NULL,
  `NumberOfGuests` INT NOT NULL DEFAULT 1,
  `CreatedAT` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`BookingID`),
  INDEX `Bookings_CustomerID_FK_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `Bookings_CustomerID_FK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Tables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Tables` (
  `TableID` INT NOT NULL,
  `Number` INT NULL,
  `Status` VARCHAR(45) NULL,
  `Location` ENUM('INDOOR', 'OUTDOOR') NULL,
  PRIMARY KEY (`TableID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL(8,2) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `OrderID` INT NOT NULL,
  `StaffID` INT NULL,
  `TableID` INT NULL,
  `CustomerID` INT NULL,
  `Number` VARCHAR(45) NOT NULL,
  `Type` ENUM('OFFLINE', 'ONLINE') NOT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `Orders_StaffID_FK_idx` (`StaffID` ASC) VISIBLE,
  INDEX `Orders_TableID_FK_idx` (`TableID` ASC) VISIBLE,
  INDEX `Orders_CustomerID_FK_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `Orders_StaffID_FK`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDM`.`Staff` (`StaffID`)
    ON DELETE SET NULL
    ON UPDATE SET NULL,
  CONSTRAINT `Orders_TableID_FK`
    FOREIGN KEY (`TableID`)
    REFERENCES `LittleLemonDM`.`Tables` (`TableID`)
    ON DELETE SET NULL
    ON UPDATE SET NULL,
  CONSTRAINT `Orders_CustomerID_FK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NULL,
  `Category` VARCHAR(45) NULL,
  `Vegetarian` TINYINT NULL DEFAULT NULL,
  `GlutenFree` TINYINT NULL DEFAULT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL,
  `Price` DECIMAL(8,2) NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`OrderStatus` (
  `RowID` INT NOT NULL,
  `OrderID` INT NULL,
  `Status` VARCHAR(45) NULL,
  `Remarks` VARCHAR(255) NULL,
  `DateAndTime` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`RowID`),
  INDEX `OrderStatus_OrderID_FK_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `OrderStatus_OrderID_FK`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDM`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`OrdersItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`OrdersItems` (
  `OrderID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Quantity` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`OrderID`, `ItemID`),
  INDEX `OrderItems_ItemID_FK_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `OrderItems_OrderID_FK`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDM`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_ItemID_FK`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemonDM`.`Menu` (`ItemID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
