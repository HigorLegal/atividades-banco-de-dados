-
CREATE SCHEMA IF NOT EXISTS `atividades_EER`  ;
USE `atividades_EER` ;


-- -----------------------------------------------------
-- Table `atividades_EER`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividades_EER`.`clientes` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )



-- -----------------------------------------------------
-- Table `atividades_EER`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividades_EER`.`produtos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `estoque` INT NULL,   
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )



-- -----------------------------------------------------
-- Table `atividades_EER`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividades_EER`.`pedidos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `data_pedido` DATE NOT NULL,
  `clienteID` INT NOT NULL,
  `produtoID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) ,
  INDEX `clienteID_idx` (`clienteID` ASC) ,
  INDEX `produtoID_idx` (`produtoID` ASC) ,
  CONSTRAINT `clienteID`
    FOREIGN KEY (`clienteID`)
    REFERENCES `atividades_EER`.`clientes` (`ID`)
    ON DELETE cascade
    ON UPDATE NO ACTION,
  CONSTRAINT `produtoID`
    FOREIGN KEY (`produtoID`)
    REFERENCES `atividades_EER`.`produtos` (`ID`)
    ON DELETE cascade 
       ON UPDATE NO ACTION)


