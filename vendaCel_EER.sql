
CREATE SCHEMA IF NOT EXISTS `atividades_EER`  ;
USE `atividades_EER` ;

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividades_EER`.`clientes` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) );



-- -----------------------------------------------------
-- Table `atividades_EER`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividades_EER`.`produtos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `preco` DECIMAL(10,2) NOT NULL,
  `modelo` VARCHAR(105) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `vesao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) );



-- -----------------------------------------------------
-- Table `atividades_EER`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividades_EER`.`pedidos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `data_pedido` DATE NOT NULL,
  `valor_total` DECIMAL(10,2) NOT NULL,
  `valor_desconto` DECIMAL(10,2) NOT NULL,
  `quantidade` INT NOT NULL,
  `produtoID` INT NOT NULL,
  `clienteID` INT NOT NULL,
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
    ON UPDATE NO ACTION);