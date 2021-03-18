SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Genitores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Genitores` (
  `nome` VARCHAR(100) NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `dt_nasc` DATE NOT NULL,
  `telefone` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`RG`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tipo_parto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tipo_parto` (
  `idTipo_parto` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo_parto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bebe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bebe` (
  `RG_mae` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `dt_hr_nasc` DATETIME NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `peso` VARCHAR(45) NOT NULL,
  `altura` VARCHAR(45) NOT NULL,
  `RG_pai` VARCHAR(45) NULL,
  `Tipo_parto_idTipo_parto` INT NOT NULL,
  INDEX `fk_Bebe_Genitor_idx` (`RG_pai` ASC) VISIBLE,
  INDEX `fk_Bebe_Genitor1_idx` (`RG_mae` ASC) VISIBLE,
  INDEX `fk_Bebe_Tipo_parto1_idx` (`Tipo_parto_idTipo_parto` ASC) VISIBLE,
  PRIMARY KEY (`RG_mae`, `nome`),
  CONSTRAINT `fk_Bebe_Genitor`
    FOREIGN KEY (`RG_pai`)
    REFERENCES `Genitores` (`RG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bebe_Genitor1`
    FOREIGN KEY (`RG_mae`)
    REFERENCES `Genitores` (`RG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bebe_Tipo_parto1`
    FOREIGN KEY (`Tipo_parto_idTipo_parto`)
    REFERENCES `Tipo_parto` (`idTipo_parto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cargos` (
  `cod` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao`  NOT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Profissional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Profissional` (
  `nome` VARCHAR(100) NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `dt_nasc` DATE NOT NULL,
  `registro_ordem` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `Cargos_cod` INT NOT NULL,
  PRIMARY KEY (`RG`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  INDEX `fk_Profissional_Cargos1_idx` (`Cargos_cod` ASC) VISIBLE,
  CONSTRAINT `fk_Profissional_Cargos1`
    FOREIGN KEY (`Cargos_cod`)
    REFERENCES `Cargos` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Profissional_has_Bebe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Profissional_has_Bebe` (
  `Profissional_RG` VARCHAR(45) NOT NULL,
  `Bebe_RG_mae` VARCHAR(45) NOT NULL,
  `Bebe_nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Profissional_RG`, `Bebe_RG_mae`, `Bebe_nome`),
  INDEX `fk_Profissional_has_Bebe_Bebe1_idx` (`Bebe_RG_mae` ASC, `Bebe_nome` ASC) VISIBLE,
  INDEX `fk_Profissional_has_Bebe_Profissional1_idx` (`Profissional_RG` ASC) VISIBLE,
  CONSTRAINT `fk_Profissional_has_Bebe_Profissional1`
    FOREIGN KEY (`Profissional_RG`)
    REFERENCES `Profissional` (`RG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profissional_has_Bebe_Bebe1`
    FOREIGN KEY (`Bebe_RG_mae` , `Bebe_nome`)
    REFERENCES `Bebe` (`RG_mae` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
