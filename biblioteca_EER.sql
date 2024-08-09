
-- -----------------------------------------------------
-- Schema biblioteca_EER
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca_EER`;
USE `biblioteca_EER` ;

-- -----------------------------------------------------
-- Table `biblioteca_EER`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_EER`.`autor` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nomel` VARCHAR(250) NOT NULL,
  `nacionalidade` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
;


-- -----------------------------------------------------
-- Table `biblioteca_EER`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_EER`.`livros` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `titulos` VARCHAR(200) NOT NULL,
  `genero` VARCHAR(200) NOT NULL,
  `autorID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `autorID_idx` (`autorID` ASC) ,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) ,
  CONSTRAINT `autorID`
    FOREIGN KEY (`autorID`)
    REFERENCES `biblioteca_EER`.`autor` (`ID`)
    ON DELETE cascade
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `biblioteca_EER`.`imprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_EER`.`imprestimos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `data_emprestimo` DATE NOT NULL,
  `data_devolucao` DATE NOT NULL,
  `livroID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `livroID_idx` (`livroID` ASC) ,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) ,
  CONSTRAINT `livroID`
    FOREIGN KEY (`livroID`)
    REFERENCES `biblioteca_EER`.`livros` (`ID`)
    ON DELETE cascade
    ON UPDATE NO ACTION)
;
 
