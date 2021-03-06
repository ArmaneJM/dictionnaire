-- MySQL Script generated by MySQL Workbench
-- mar. 30 janv. 2018 09:14:08 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sortiaria
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sortiaria` ;

-- -----------------------------------------------------
-- Schema sortiaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sortiaria` DEFAULT CHARACTER SET utf8 ;
USE `sortiaria` ;

-- -----------------------------------------------------
-- Table `sortiaria`.`mot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sortiaria`.`mot` ;

CREATE TABLE IF NOT EXISTS `sortiaria`.`mot` (
  `mot_id` INT NOT NULL AUTO_INCREMENT,
  `mot_terme` VARCHAR(45) NOT NULL,
  `mot_phon` VARCHAR(45),
  `mot_gram` VARCHAR(45) NOT NULL,
  `mot_genre` VARCHAR(45),
  `mot_def` TEXT NOT NULL,
  `mot_commentaire` TEXT,
  PRIMARY KEY (`mot_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sortiaria`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sortiaria`.`user` ;

CREATE TABLE IF NOT EXISTS `sortiaria`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_nom` TINYTEXT NOT NULL,
  `user_login` VARCHAR(45) NOT NULL,
  `user_email` TINYTEXT NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_login_UNIQUE` (`user_login` ASC))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `sortiaria`.`authorship` ;

CREATE TABLE IF NOT EXISTS `sortiaria`.`authorship` (
  `authorship_id` INT NOT NULL AUTO_INCREMENT,
  `authorship_user_id` INT NOT NULL,
  `authorship_mot_id` INT NOT NULL,
  `authorship_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `commentaire_id` INT NOT NULL,
  PRIMARY KEY (`authorship_id`),

  INDEX `fk_authorship_1_idx` (`authorship_mot_id` ASC),
  CONSTRAINT `fk_authorship_1`
    FOREIGN KEY (`authorship_mot_id`)
    REFERENCES `sortiaria`.`mot` (`mot_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_authorship_2`
    FOREIGN KEY (`commentaire_id`)
    REFERENCES `sortiaria`.`commentaire` (`commentaire_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_authorship_3`
    FOREIGN KEY (`authorship_user_id`)
    REFERENCES `sortiaria`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sortiaria`.`commentaire`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sortiaria`.`commentaire` ;

CREATE TABLE IF NOT EXISTS `sortiaria`.`commentaire` (
  `commentaire_id` INT NOT NULL AUTO_INCREMENT,
  `commentaire_titre` TINYTEXT NOT NULL,
  `commentaire_source` TEXT NOT NULL,
  `commentaire_texte` TEXT NOT NULL,
  PRIMARY KEY (`commentaire_id`),
  INDEX `fk_commentaire_1_idx` (`commentaire_id` ASC),
  CONSTRAINT `fk_commentaire_1`
    FOREIGN KEY (`commentaire_id`)
    REFERENCES `sortiaria`.`mot` (`mot_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP USER IF EXISTS 'sortiaria_user';
CREATE USER 'sortiaria_user' IDENTIFIED BY 'password';

GRANT USAGE ON *.* TO sortiaria_user;
GRANT ALL ON `sortiaria`.* TO 'sortiaria_user';
GRANT SELECT ON TABLE `sortiaria`.* TO 'sortiaria_user';
GRANT SELECT, INSERT, TRIGGER ON TABLE `sortiaria`.* TO 'sortiaria_user';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `sortiaria`.* TO 'sortiaria_user';
GRANT CREATE ROUTINE ON `sortiaria`.* TO 'sortiaria_user';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sortiaria`.`mot`
-- -----------------------------------------------------
START TRANSACTION;
USE `sortiaria`;
INSERT INTO `sortiaria`.`mot` (`mot_id`, `mot_terme`, `mot_phon`, `mot_gram`, `mot_genre`, `mot_def`, `mot_commentaire`) VALUES (1, 'Alchimiste', 'alʃimist', 'nom commun', 'masculin', 'Celui qui s’occupait d’alchimie.', 'Comme dans Fullmetal Alchemist.');
INSERT INTO `sortiaria`.`mot` (`mot_id`, `mot_terme`, `mot_phon`, `mot_gram`, `mot_genre`, `mot_def`, `mot_commentaire`) VALUES (2, 'Familier', 'familje', 'nom commun', 'masculin', 'Créature supposée entretenir un rapport mystique avec un·e magicien·ne ou sorcier·e.', 'Genre un chat.');
INSERT INTO `sortiaria`.`mot` (`mot_id`, `mot_terme`, `mot_phon`, `mot_gram`, `mot_genre`, `mot_def`, `mot_commentaire`) VALUES (3, 'Balais', '', 'nom commun', 'masculin', 'Mode de locomotion, héritage des balais de druide en genêt, bois auquel on prête des vertus magiques.', '');
INSERT INTO `sortiaria`.`mot` (`mot_id`, `mot_terme`, `mot_phon`, `mot_gram`, `mot_genre`, `mot_def`, `mot_commentaire`) VALUES (4, 'Walpurgis, nuit de', 'walpyʁʒi', 'nom propre', '', 'Fête néo-païenne qui a lieu dans la nuit du 30 avril au 1er mai. Célébrée clandestinement dans toute l\'Europe depuis des temps reculés, malgré les interdits et les excommunications de l\'Église, elle a été identifiée au sabbat des sorcières.', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sortiaria`.`user`
-- -----------------------------------------------------

START TRANSACTION;
USE `sortiaria`;
INSERT INTO `sortiaria`.`user` (`user_id`, `user_nom`, `user_login`, `user_email`, `user_password`) VALUES (1, 'Administrator', 'admin', 'admin@supersite.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8');

COMMIT;
