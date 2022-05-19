
-- -----------------------------------------------------
-- Table `info_team01_schema`.`Joueur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `info_team01_schema`.`Joueur` (
  `idJoueurs` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `prenom` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL,
  `lieuNaissance` VARCHAR(100) NULL DEFAULT NULL,
  `taille` FLOAT NULL DEFAULT NULL,
  `poids` FLOAT NULL DEFAULT NULL,
  `nationnalite` VARCHAR(45) NULL DEFAULT NULL,
  `debutCarriere` YEAR NULL DEFAULT NULL,
  `main` ENUM('Droite', 'Gauche') NULL DEFAULT NULL,
  `classement` INT NULL DEFAULT NULL,
  `entraineur` VARCHAR(45) NULL DEFAULT NULL,
  `gain` INT NULL DEFAULT NULL,
  `victoire` INT NULL DEFAULT NULL,
  `defaites` INT NULL DEFAULT NULL,
  `categorie` ENUM('F', 'H') NULL DEFAULT NULL,
  PRIMARY KEY (`idJoueurs`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `info_team01_schema`.`Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `info_team01_schema`.`Match` (
  `idMatch` INT NOT NULL AUTO_INCREMENT,
  `dureeSecond` INT NULL DEFAULT '0',
  `court` INT NULL DEFAULT NULL,
  `etape` VARCHAR(45) NOT NULL,
  `idJ1` INT NOT NULL,
  `idJ2` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`idMatch`),
  INDEX `idJ1_fk_idx` (`idJ1` ASC) VISIBLE,
  INDEX `idJ2_fk_idx` (`idJ2` ASC) VISIBLE,
  CONSTRAINT `idJ1_fk`
    FOREIGN KEY (`idJ1`)
    REFERENCES `info_team01_schema`.`Joueur` (`idJoueurs`),
  CONSTRAINT `idJ2_fk`
    FOREIGN KEY (`idJ2`)
    REFERENCES `info_team01_schema`.`Joueur` (`idJoueurs`))
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `info_team01_schema`.`Set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `info_team01_schema`.`Set` (
  `idSet` INT NOT NULL AUTO_INCREMENT,
  `idMatch` INT NOT NULL,
  `scoreJ1` INT NULL DEFAULT NULL,
  `scoreJ2` INT NULL DEFAULT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`idSet`),
  UNIQUE INDEX `Game` (`idMatch` ASC, `numero` ASC) VISIBLE,
  CONSTRAINT `idMatch_fk`
    FOREIGN KEY (`idMatch`)
    REFERENCES `info_team01_schema`.`Match` (`idMatch`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8mb3;

