-- MySQL Script generated by MySQL Workbench
-- Fri Oct 26 15:14:21 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema petchoppbase
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `petchoppbase` ;

-- -----------------------------------------------------
-- Schema petchoppbase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petchoppbase` DEFAULT CHARACTER SET utf8 ;
USE `petchoppbase` ;

-- -----------------------------------------------------
-- Table `petchoppbase`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`Produto` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`Produto` (
  `idProduto` BIGINT NOT NULL AUTO_INCREMENT,
  `Codigo` VARCHAR(25) NOT NULL,
  `Nome` VARCHAR(150) NOT NULL,
  `Preco` DOUBLE NOT NULL,
  `Custo` DOUBLE NOT NULL,
  `dtCompra` DATE NOT NULL,
  `dtValidade` DATE NULL,
  `urlImagem` VARCHAR(150) NULL,
  `emEstoque` BIT NOT NULL,
  `Disable` BIT NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`Cliente` (
  `idCliente` BIGINT NOT NULL AUTO_INCREMENT,
  `dtCadastro` DATE NULL,
  `Nome` VARCHAR(100) NULL,
  `dtNasc` DATE NULL,
  `RG` VARCHAR(10) NULL,
  `CPF` VARCHAR(11) NULL,
  `Email` VARCHAR(100) NULL,
  `Senha` VARCHAR(100) NULL,
  `Ativo` BIT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`Endereco` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`Endereco` (
  `idEndereco` BIGINT NOT NULL AUTO_INCREMENT,
  `CEP` VARCHAR(10) NOT NULL,
  `Logradouro` VARCHAR(150) NOT NULL,
  `Numero` VARCHAR(20) NULL,
  `Complemento` VARCHAR(45) NULL,
  `Bairro` VARCHAR(150) NOT NULL,
  `Cidade` VARCHAR(150) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `idCliente` BIGINT NOT NULL,
  `TipoEndereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `petchoppbase`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`Venda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`Venda` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`Venda` (
  `idVenda` BIGINT NOT NULL AUTO_INCREMENT,
  `Data` DATETIME NOT NULL,
  `ValorTotal` DOUBLE NOT NULL,
  PRIMARY KEY (`idVenda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`ItemVenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`ItemVenda` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`ItemVenda` (
  `idVenda` BIGINT NOT NULL,
  `idProduto` BIGINT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Valor` DOUBLE NOT NULL,
  CONSTRAINT `fk_ItemVendas_1`
    FOREIGN KEY (`idVenda`)
    REFERENCES `petchoppbase`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemVendas_2`
    FOREIGN KEY (`idProduto`)
    REFERENCES `petchoppbase`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`Tipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`Tipo` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`Tipo` (
  `idTipo` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`Categoria` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `idTipo` INT NOT NULL,
  PRIMARY KEY (`idCategoria`),
  INDEX `fk_Categoria_1_idx` (`idTipo` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_1`
    FOREIGN KEY (`idTipo`)
    REFERENCES `petchoppbase`.`Tipo` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`Tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`Tags` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`Tags` (
  `idTags` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `idCategoria` INT NOT NULL,
  PRIMARY KEY (`idTags`),
  INDEX `fk_Tags_1_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Tags_1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `petchoppbase`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`ProdutoTags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`ProdutoTags` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`ProdutoTags` (
  `idProduto` BIGINT NOT NULL,
  `idTags` INT NOT NULL,
  INDEX `fk_ProdutoTags_1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_ProdutoTags_2_idx` (`idTags` ASC) VISIBLE,
  CONSTRAINT `fk_ProdutoTags_1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `petchoppbase`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProdutoTags_2`
    FOREIGN KEY (`idTags`)
    REFERENCES `petchoppbase`.`Tags` (`idTags`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`StatusPedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`StatusPedido` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`StatusPedido` (
  `idStatusPedido` BIGINT NOT NULL AUTO_INCREMENT,
  `idVenda` BIGINT NOT NULL,
  `idTipo` INT NOT NULL,
  `dtStatus` DATE NOT NULL,
  `Ativo` BIT NOT NULL,
  PRIMARY KEY (`idStatusPedido`),
  INDEX `fk_StatusPedido_1_idx` (`idVenda` ASC) VISIBLE,
  CONSTRAINT `fk_StatusPedido_1`
    FOREIGN KEY (`idVenda`)
    REFERENCES `petchoppbase`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`Estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`Estoque` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`Estoque` (
  `idProduto` BIGINT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  CONSTRAINT `fk_Estoque_1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `petchoppbase`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petchoppbase`.`MovimentoEstoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `petchoppbase`.`MovimentoEstoque` ;

CREATE TABLE IF NOT EXISTS `petchoppbase`.`MovimentoEstoque` (
  `idMovimento` BIGINT NOT NULL AUTO_INCREMENT,
  `idProduto` BIGINT NOT NULL,
  `idTipo` INT NOT NULL,
  `dtMovimento` DATE NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`idMovimento`),
  INDEX `fk_MovimentoEstoque_1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_MovimentoEstoque_2_idx` (`idTipo` ASC) VISIBLE,
  CONSTRAINT `fk_MovimentoEstoque_1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `petchoppbase`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MovimentoEstoque_2`
    FOREIGN KEY (`idTipo`)
    REFERENCES `petchoppbase`.`Tipo` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
