-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sklep_internetowy
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sklep_internetowy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sklep_internetowy` DEFAULT CHARACTER SET utf8 ;
USE `sklep_internetowy` ;

-- -----------------------------------------------------
-- Table `sklep_internetowy`.`Pracownicy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sklep_internetowy`.`Pracownicy` ;

CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Pracownicy` (
  `id` INT NOT NULL,
  `Imię` CHAR(20) NOT NULL,
  `Nazwisko` CHAR(25) NOT NULL,
  `Urlop` CHAR(3) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sklep_internetowy`.`Klienci`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sklep_internetowy`.`Klienci` ;

CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Klienci` (
  `Id_k` INT NOT NULL,
  `Imię` CHAR(20) NOT NULL,
  `Nazwisko` CHAR(25) NOT NULL,
  `Numer_telefonu` CHAR(13) NOT NULL,
  `Adres_e-mail` CHAR(40) NOT NULL,
  `Miejscowość` CHAR(30) NOT NULL,
  `Ulica` CHAR(30) NOT NULL,
  `Numer_budynku` CHAR(5) NOT NULL,
  PRIMARY KEY (`Id_k`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sklep_internetowy`.`Zamówienia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sklep_internetowy`.`Zamówienia` ;

CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Zamówienia` (
  `id_Zamówienie` INT NOT NULL AUTO_INCREMENT,
  `Id_prac` INT NOT NULL,
  `Data_przyjęcia` DATETIME NOT NULL,
  `Data_realizacji` DATETIME NULL,
  `Metoda_wysyłki` CHAR(15) NOT NULL,
  `Koszt_wysyłki` INT NOT NULL,
  `id_klienta` INT NOT NULL,
  PRIMARY KEY (`id_Zamówienie`),
  INDEX `fk_prac_idx` (`Id_prac` ASC),
  INDEX `fk_klient_idx` (`id_klienta` ASC),
  CONSTRAINT `fk_prac`
    FOREIGN KEY (`Id_prac`)
    REFERENCES `sklep_internetowy`.`Pracownicy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_klient`
    FOREIGN KEY (`id_klienta`)
    REFERENCES `sklep_internetowy`.`Klienci` (`Id_k`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sklep_internetowy`.`Kategorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sklep_internetowy`.`Kategorie` ;

CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Kategorie` (
  `Id_kat` INT NOT NULL,
  `Nazwa_kategorii` CHAR(30) NOT NULL,
  PRIMARY KEY (`Id_kat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5;


-- -----------------------------------------------------
-- Table `sklep_internetowy`.`Magazyn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sklep_internetowy`.`Magazyn` ;

CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Magazyn` (
  `id_Magazynu` INT NOT NULL,
  `Miasto` CHAR(20) NOT NULL,
  `Ulica` CHAR(30) NOT NULL,
  `Nr_budynku` CHAR(4) NOT NULL,
  `Kod_pocztowy` CHAR(6) NOT NULL,
  `Numer_telefonu` CHAR(13) NOT NULL,
  PRIMARY KEY (`id_Magazynu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sklep_internetowy`.`Towary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sklep_internetowy`.`Towary` ;

CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Towary` (
  `Pozycja towaru` INT NOT NULL,
  `Nazwa` CHAR(70) NOT NULL,
  `Ilość_w_magazynie` INT NULL,
  `Cena_sprzedaży` FLOAT NOT NULL,
  `id_kat` INT NOT NULL,
  `id_mag` INT NOT NULL,
  PRIMARY KEY (`Pozycja towaru`),
  INDEX `fk_kat_idx` (`id_kat` ASC),
  INDEX `fk_mag_idx` (`id_mag` ASC),
  CONSTRAINT `fk_kat`
    FOREIGN KEY (`id_kat`)
    REFERENCES `sklep_internetowy`.`Kategorie` (`Id_kat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mag`
    FOREIGN KEY (`id_mag`)
    REFERENCES `sklep_internetowy`.`Magazyn` (`id_Magazynu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sklep_internetowy`.`Zamówiona_pozycja`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sklep_internetowy`.`Zamówiona_pozycja` ;

CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Zamówiona_pozycja` (
  `Pozycja` INT NOT NULL,
  `Ilość` INT NOT NULL,
  `id_zam` INT NOT NULL,
  `id_tow` INT NOT NULL,
  INDEX `ID_ZAM_idx` (`id_zam` ASC),
  PRIMARY KEY (`Pozycja`),
  INDEX `fk_tow_idx` (`id_tow` ASC),
  CONSTRAINT `ID_ZAM`
    FOREIGN KEY (`id_zam`)
    REFERENCES `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tow`
    FOREIGN KEY (`id_tow`)
    REFERENCES `sklep_internetowy`.`Towary` (`Pozycja towaru`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `sklep_internetowy` ;

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Pracujący_obecnie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Pracujący_obecnie` (`Imię` INT, `Nazwisko` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`view2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`view2` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Towary_droższe_niż_1000zł`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Towary_droższe_niż_1000zł` (`Nazwa` INT, `Ilość_w_magazynie` INT, `Cena_sprzedaży` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Telefony_tablety`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Telefony_tablety` (`Nazwa` INT, `Nazwa_kategorii` INT, `Cena_sprzedaży` INT, `Ilość_w_magazynie` INT, `Miasto` INT, `Ulica` INT, `Nr_budynku` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Zamówienia_29_listopada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Zamówienia_29_listopada` (`id_Zamówienie` INT, `Data_przyjęcia` INT, `Data_realizacji` INT, `Metoda_wysyłki` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Kontakt_L`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Kontakt_L` (`Imię` INT, `Nazwisko` INT, `Numer_telefonu` INT, `Adres_e-mail` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Elementy_zamówienia_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Elementy_zamówienia_2` (`Nazwa` INT, `Cena_sprzedaży` INT, `Ilość` INT, `Łączna_kwota` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Towary_poza_Krakowem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Towary_poza_Krakowem` (`Nazwa` INT, `Ilość_w_magazynie` INT, `Miasto` INT, `Ulica` INT, `Nr_budynku` INT, `Kod_pocztowy` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Zamówienia_ogólnie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Zamówienia_ogólnie` (`id_Zamówienie` INT, `Data_przyjęcia` INT, `Data_realizacji` INT, `Łączna_kwota_zamówienia` INT, `Metoda_wysyłki` INT, `Koszt_wysyłki` INT, `Kwota_z_przesyłką` INT, `Imię_pracownika` INT, `Nazwisko_pracownika` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Przesyłki_popularność_czas_realizacji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Przesyłki_popularność_czas_realizacji` (`Metoda` INT, `Ile_razy` INT, `Średni_czas_realizacji(godziny)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Średni_czas_realizacji_wg_klienta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Średni_czas_realizacji_wg_klienta` (`Średni_czas_realizacji(godziny)` INT, `Imię` INT, `Nazwisko` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sklep_internetowy`.`Najbardziej_efektywni_pracownicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sklep_internetowy`.`Najbardziej_efektywni_pracownicy` (`Średni_czas_realizacji(godziny)` INT, `Imię_pracownika` INT, `Nazwisko_pracownika` INT);

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Pracujący_obecnie`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Pracujący_obecnie` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Pracujący_obecnie`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Pracujący_obecnie` AS
    SELECT 
        Imię, Nazwisko
    FROM
        Pracownicy
    WHERE
        Urlop = 'NIE'
    ORDER BY Nazwisko;

-- -----------------------------------------------------
-- View `sklep_internetowy`.`view2`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`view2` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`view2`;
USE `sklep_internetowy`;


-- -----------------------------------------------------
-- View `sklep_internetowy`.`Towary_droższe_niż_1000zł`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Towary_droższe_niż_1000zł` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Towary_droższe_niż_1000zł`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Towary_droższe_niż_1000zł` AS
    SELECT 
        Nazwa, Ilość_w_magazynie, Cena_sprzedaży
    FROM
        Towary
    WHERE
        Cena_Sprzedaży > 1000
    ORDER BY Cena_Sprzedaży DESC;

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Telefony_tablety`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Telefony_tablety` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Telefony_tablety`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Telefony_tablety` AS
    SELECT 
        Nazwa,
        Kategorie.Nazwa_kategorii,
        Cena_sprzedaży,
        Ilość_w_magazynie,
        (SELECT 
                Miasto
            FROM
                Magazyn
            WHERE
                Towary.id_kat = Magazyn.id_Magazynu) AS Miasto,
        (SELECT 
                Ulica
            FROM
                Magazyn
            WHERE
                Towary.id_kat = Magazyn.id_Magazynu) AS Ulica,
        (SELECT 
                Nr_budynku
            FROM
                Magazyn
            WHERE
                Towary.id_kat = Magazyn.id_Magazynu) AS Nr_budynku
    FROM
        Towary
            INNER JOIN
        Kategorie ON Towary.id_kat = Kategorie.Id_kat
    WHERE
        Towary.id_kat IN (1 , 9);

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Zamówienia_29_listopada`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Zamówienia_29_listopada` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Zamówienia_29_listopada`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Zamówienia_29_listopada` AS
    SELECT 
        id_Zamówienie, Data_przyjęcia, Data_realizacji, Metoda_wysyłki
    FROM
        Zamówienia
    WHERE
        Data_przyjęcia >= '2017-11-29 00:00'
            AND Data_przyjęcia <= '2017-11-29 23:59'
	ORDER BY id_Zamówienie;

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Kontakt_L`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Kontakt_L` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Kontakt_L`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Kontakt_L` AS
    SELECT 
        Imię, Nazwisko, Numer_telefonu, `Adres_e-mail`
    FROM
        Klienci
    WHERE
        Nazwisko LIKE 'L%';

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Elementy_zamówienia_2`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Elementy_zamówienia_2` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Elementy_zamówienia_2`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Elementy_zamówienia_2` AS
    SELECT 
        Nazwa, Cena_sprzedaży, Ilość, Cena_sprzedaży*Ilość AS Łączna_kwota
    FROM
        Towary
            INNER JOIN
        Zamówiona_pozycja ON Towary.`Pozycja Towaru` = Zamówiona_pozycja.id_tow
    WHERE
        id_zam = '2';

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Towary_poza_Krakowem`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Towary_poza_Krakowem` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Towary_poza_Krakowem`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Towary_poza_Krakowem` AS
    SELECT 
        Towary.Nazwa,
        Towary.Ilość_w_magazynie,
        Miasto,
        Ulica,
        Nr_budynku,
        Kod_pocztowy
    FROM
        Magazyn
            INNER JOIN
        Towary ON Magazyn.id_Magazynu = Towary.id_mag
    WHERE
        Miasto != 'Kraków'
    ORDER BY Towary.Ilość_w_magazynie DESC;

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Zamówienia_ogólnie`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Zamówienia_ogólnie` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Zamówienia_ogólnie`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Zamówienia_ogólnie` AS
    SELECT 
        id_Zamówienie,
        Data_przyjęcia,
        Data_realizacji,
        (SELECT 
                SUM(Ilość * (SELECT 
                            Cena_Sprzedaży
                        FROM
                            Towary
                        WHERE
                            id_tow = `Pozycja towaru`))
            FROM
                Zamówiona_pozycja
            WHERE
                id_Zamówienie = id_zam) AS Łączna_kwota_zamówienia,
        Metoda_wysyłki,
        Koszt_wysyłki,
        (SELECT 
                SUM(Ilość * (SELECT 
                            Cena_Sprzedaży
                        FROM
                            Towary
                        WHERE
                            id_tow = `Pozycja towaru`)) + Koszt_wysyłki
            FROM
                Zamówiona_pozycja
            WHERE
                id_Zamówienie = id_zam) AS Kwota_z_przesyłką,
        Pracownicy.Imię AS Imię_pracownika,
        Pracownicy.Nazwisko AS Nazwisko_pracownika
    FROM
        Zamówienia
            INNER JOIN
        Pracownicy ON Zamówienia.Id_prac = Pracownicy.id
    ORDER BY Data_przyjęcia;

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Przesyłki_popularność_czas_realizacji`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Przesyłki_popularność_czas_realizacji` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Przesyłki_popularność_czas_realizacji`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Przesyłki_popularność_czas_realizacji` AS
    SELECT 
        Metoda_wysyłki AS Metoda,
		COUNT(Metoda_wysyłki) as Ile_razy,
		MAX(ROUND(TIMESTAMPDIFF(HOUR,
                    Zamówienia.Data_przyjęcia,
                    Zamówienia.Data_realizacji)
                )) AS `Średni_czas_realizacji(godziny)`	
    FROM
        Zamówienia
	GROUP BY Metoda_wysyłki
    ORDER BY Ile_razy DESC;

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Średni_czas_realizacji_wg_klienta`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Średni_czas_realizacji_wg_klienta` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Średni_czas_realizacji_wg_klienta`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Średni_czas_realizacji_wg_klienta` AS
    SELECT 
        ROUND(AVG(TIMESTAMPDIFF(HOUR,
                    Zamówienia.Data_przyjęcia,
                    Zamówienia.Data_realizacji)),
                0) AS `Średni_czas_realizacji(godziny)`,
        Imię,
        Nazwisko
    FROM
        Klienci
            INNER JOIN
        Zamówienia ON Klienci.id_k = Zamówienia.id_klienta
    GROUP BY Klienci.Nazwisko , Klienci.Imię
    ORDER BY `Średni_czas_realizacji(godziny)` DESC;

-- -----------------------------------------------------
-- View `sklep_internetowy`.`Najbardziej_efektywni_pracownicy`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sklep_internetowy`.`Najbardziej_efektywni_pracownicy` ;
DROP TABLE IF EXISTS `sklep_internetowy`.`Najbardziej_efektywni_pracownicy`;
USE `sklep_internetowy`;
CREATE  OR REPLACE VIEW `Najbardziej_efektywni_pracownicy` AS
    SELECT 
        ROUND(AVG(TIMESTAMPDIFF(HOUR,
                    Zamówienia.Data_przyjęcia,
                    Zamówienia.Data_realizacji)),
                0) AS `Średni_czas_realizacji(godziny)`,
        (SELECT 
                Imię
            FROM
                Pracownicy
            WHERE
                id_Zamówienie = id) AS Imię_pracownika,
        (SELECT 
                Nazwisko
            FROM
                Pracownicy
            WHERE
                id_Zamówienie = id) AS Nazwisko_pracownika
    FROM
        Zamówienia
    GROUP BY Imię_pracownika , Nazwisko_pracownika
    HAVING `Średni_czas_realizacji(godziny)` < 140
    ORDER BY `Średni_czas_realizacji(godziny)` DESC;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sklep_internetowy`.`Pracownicy`
-- -----------------------------------------------------
START TRANSACTION;
USE `sklep_internetowy`;
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (1, 'Sebastian', 'Bolkowski', 'TAK');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (2, 'Marcin', 'Lolkowski', 'NIE');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (3, 'Andrzej', 'Wiśniewski', 'NIE');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (4, 'Jakub', 'Kwiatkowski', 'NIE');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (5, 'Ewelina', 'Kraśnik', 'NIE');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (6, 'Roman', 'Nowak', 'NIE');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (7, 'Mateusz', 'Zieliński', 'NIE');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (8, 'Anna', 'Kantor', 'TAK');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (9, 'Hubert', 'Kopacz', 'NIE');
INSERT INTO `sklep_internetowy`.`Pracownicy` (`id`, `Imię`, `Nazwisko`, `Urlop`) VALUES (10, 'Katarzyna', 'Tomasik', 'TAK');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sklep_internetowy`.`Klienci`
-- -----------------------------------------------------
START TRANSACTION;
USE `sklep_internetowy`;
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (1, 'Stefan', 'Lubański', '+48678934578', 'luban@wp.pl', 'Warszawa', 'KEN', '123');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (2, 'Marian', 'Kowal', '+48762345890', 'orzelwaleczny@op.pl', 'Lublin', 'Rynek', '1');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (3, 'Marek', 'Greguta', '+48908345782', 'dniktorychnieznamy@interia.pl', 'Częstochowa', 'Klasztorna', '13');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (4, 'Ozjasz', 'Goldberg', '+972867902376', 'trzeciagestosc@gmail.com', 'Katowice', 'Mariacka', '6a');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (5, 'Michał', 'Białek', '+48782576901', 'zepsutytag@wp.pl', 'Kraków', 'Kawiory', '6');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (6, 'Mariusz', 'Pudziankowski', '+48762378901', 'szybkietiry@onet.eu', 'Łódź', 'Piotrkowska', '256');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (7, 'Mateusz', 'Upiec', '+48595872711', 'hackerbonzo@wp.pl', 'Gdańsk', 'Długa', '32');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (8, 'Adolf', 'Kuldiński', '+48678124567', 'armiaslowian@interia.pl', 'Kielce', 'Żytnia', '12');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (9, 'Tomasz', 'Liść', '+49609876234', 'liśćmaszto@wp.pl', 'Zakopane', 'Kościeliska', '56');
INSERT INTO `sklep_internetowy`.`Klienci` (`Id_k`, `Imię`, `Nazwisko`, `Numer_telefonu`, `Adres_e-mail`, `Miejscowość`, `Ulica`, `Numer_budynku`) VALUES (10 , 'Emmanuel', 'Olisabebe', '+48782376891', 'olinek@wp.pl', 'Zamość', 'Królewska', '22');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sklep_internetowy`.`Zamówienia`
-- -----------------------------------------------------
START TRANSACTION;
USE `sklep_internetowy`;
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (1, 1, '2017-11-28 11:45:45', '2017-12-03 10:56:11', 'DHL', 25, 1);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (2, 2, '2017-11-28 12:12:56', '2017-12-03 14:14:45', 'DHL', 25, 3);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (3, 3, '2017-11-28 21:55:02', '2017-12-04 13:41:32', 'Paczkomaty', 10, 4);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (4, 4, '2017-11-29 20:13:11', '2017-12-04 16:55:34', 'PP', 15, 7);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (5, 1, '2017-11-29 19:47:07', '2017-12-05 15:28:44', 'PP', 15, 6);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (6, 2, '2017-11-29 20:01:34', '2017-12-05 16:11:51', 'DHL', 25, 5);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (7, 1, '2017-11-29 21:34:00', '2017-12-05 17:44:19', 'DHL', 25, 10);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (8, 3, '2017-11-29 20:14:41', '2017-12-06 08:03:39', 'Paczkomaty', 10, 2);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (9, 4, '2017-11-30 04:07:02', '2017-12-06 09:56:49', 'DHL', 25, 8);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (10, 2, '2017-11-30 14:14:31', '2017-12-07 12:12:30', 'Paczkomaty', 10, 2);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (11, 5, '2017-11-30 16:33:44', '2017-12-07 15:55:00', 'PP', 15, 5);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (12, 7, '2017-12-01 07:56:31', '2017-12-09 12:45:34', 'PP', 15, 8);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (13, 9, '2017-12-01 12:56:11', '2017-12-09 14:11:11', 'Paczkomaty', 10, 8);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (14, 8, '2017-12-01 16:33:44', '2017-12-09 14:41:41', 'DHL', 25, 3);
INSERT INTO `sklep_internetowy`.`Zamówienia` (`id_Zamówienie`, `Id_prac`, `Data_przyjęcia`, `Data_realizacji`, `Metoda_wysyłki`, `Koszt_wysyłki`, `id_klienta`) VALUES (15, 8, '2017-12-02 13:33', '2017-12-10 19:48:00', 'DHL', 25, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sklep_internetowy`.`Kategorie`
-- -----------------------------------------------------
START TRANSACTION;
USE `sklep_internetowy`;
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (1, 'Telefony');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (2, 'Gry');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (3, 'Drukarki');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (4, 'Dyski');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (5, 'Monitory');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (6, 'Drony');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (7, 'Kable');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (8, 'Mysze');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (9, 'Tablety');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (10, 'Klawiatury');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (11, 'Komputery');
INSERT INTO `sklep_internetowy`.`Kategorie` (`Id_kat`, `Nazwa_kategorii`) VALUES (12, 'Nawigacje');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sklep_internetowy`.`Magazyn`
-- -----------------------------------------------------
START TRANSACTION;
USE `sklep_internetowy`;
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (1, 'Kraków', 'Wielicka', '33a', '30-067', '126483234');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (2, 'Kraków', 'Mogilska', '143', '30-789', '127834561');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (3, 'Wieliczka', 'Klasztorna', '1', '31-346', '127896783');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (4, 'Kraków', 'Jasnogórska', '78', '30-567', '123895784');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (5, 'Kraków', 'Starowiślna', '48a', '30-645', '127482635');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (6, 'Skawina', 'Rynek', '5', '32-098', '127483645');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (7, 'Kraków', 'Nowohucka', '144', '30-881', '122059734');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (8, 'Kraków', 'Królewska', '21', '30-006', '125405937');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (9, 'Kraków', 'Basztowa', '13', '30-002', '127483692');
INSERT INTO `sklep_internetowy`.`Magazyn` (`id_Magazynu`, `Miasto`, `Ulica`, `Nr_budynku`, `Kod_pocztowy`, `Numer_telefonu`) VALUES (10, 'Kraków', 'Igołomska', '99', '30-778', '129479437');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sklep_internetowy`.`Towary`
-- -----------------------------------------------------
START TRANSACTION;
USE `sklep_internetowy`;
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (1, 'Telefon Samsung S8+/64GB/Czarny', 4, 2900, 1, 1);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (2, 'Telefon LG G6/32GB/Szary', 12, 2300, 1, 1);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (3, 'Gra Fifa18', 32, 219, 2, 2);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (4, 'HP Sprocket Mobile Photo Printer', 17, 650, 3, 5);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (5, 'Samsung 250GB 2,5\'\' SATA SSD Seria 850 EVO', 3, 430, 4, 8);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (6, 'Xiaomi Redmi 4X 32GB Dual SIM LTE Black', 1, 1050, 1, 4);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (7, 'LG 24MP58VQ-P czarny', 2, 650, 5, 7);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (8, 'ASUS VS207DF czarny', 12, 400, 5, 7);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (9, 'DJI Spark Combo biały', 32, 3200, 6, 1);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (10, 'Delock KABEL SATA ZASILAJĄCY(M)->PCI EXPRESS 6-PIN 21CM', 19, 15, 7, 10);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (11, 'SteelSeries Rival 100 Alchemy Gold ', 8, 155, 8, 3);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (12, 'Samsung Galaxy Tab A7', 1, 580, 9, 2);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (13, 'ASUS Cerberus Gaming Keyboard', NULL, 249, 10, 10);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (14, 'ASUS ROG Strix GL702ZC', 6, 6100, 11, 9);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (15, 'x-kom Tesla GS-300 ', 17, 2199, 11, 9);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (16, 'Dell U2518D', 4, 1349, 5, 3);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (17, 'STAR WARS BATTLEFRONT II', 23, 181, 2, 2);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (18, 'Overwatch GOTY', 3, 139, 2, 2);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (19, 'Grand Theft Auto V', 21, 159, 2, 2);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (20, 'Blizzard World of Warcraft 5.0', 1, 29, 2, 2);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (21, 'Navman 5000', 2, 299, 12, 6);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (22, 'TomTom GO PROFESSIONAL 6250', 5, 1920, 12, 9);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (23, 'Navitel T700', 9, 449, 12, 3);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (24, 'Huawei MediaPad T3 8 ', 1, 498, 9, 4);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (25, 'Huawei MediaPad T3 10 ', NULL, 698, 9, 4);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (26, 'Acer Iconia One 10 MT8167', 17, 599, 9, 4);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (27, 'Overmax OV-X-Bee Drone ', 21, 596, 6, 5);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (28, 'DJI Mavic Pro Fly More Combo ', NULL, 5399, 6, 5);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (29, 'iiyama G-Master G2530HSU', 20, 699, 5, 8);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (30, 'Eizo EV2455-BK czarny', 12, 1889, 5, 8);
INSERT INTO `sklep_internetowy`.`Towary` (`Pozycja towaru`, `Nazwa`, `Ilość_w_magazynie`, `Cena_sprzedaży`, `id_kat`, `id_mag`) VALUES (31, 'Apple iPhone 8 64GB Space Gray', 23, 3299, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sklep_internetowy`.`Zamówiona_pozycja`
-- -----------------------------------------------------
START TRANSACTION;
USE `sklep_internetowy`;
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (1, 2, 1, 1);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (2, 2, 2, 3);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (3, 1, 2, 5);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (4, 3, 3, 10);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (5, 1, 4, 3);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (6, 4, 5, 5);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (7, 1, 6, 6);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (8, 2, 7, 28);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (9, 1, 8, 13);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (10, 2, 9, 12);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (11, 2, 7, 30);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (12, 2, 10, 23);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (13, 1, 10, 19);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (14, 2, 10, 30);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (15, 1, 11, 13);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (16, 2, 12, 1);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (17, 3, 12, 18);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (18, 4, 12, 22);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (19, 2, 13, 30);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (20, 1, 14, 22);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (21, 1, 15, 21);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (22, 3, 15, 27);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (23, 1, 15, 20);
INSERT INTO `sklep_internetowy`.`Zamówiona_pozycja` (`Pozycja`, `Ilość`, `id_zam`, `id_tow`) VALUES (24, 1, 15, 3);

COMMIT;


