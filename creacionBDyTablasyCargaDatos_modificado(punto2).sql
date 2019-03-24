CREATE DATABASE  IF NOT EXISTS `practica1bda`;
USE `practica1bda`;

-- Creación de la BD de la primera práctica de la asignatura de Bases de Datos Avanzadas
--
-- Host: 127.0.0.1    Database: practica1bda
-- ------------------------------------------------------
-- Server version	5.7.20-log


-- ATENCIÓN: Los ficheros csv deben estar en C:\EUI_PORTABLES\MySQL\Uploads

DROP TABLE IF EXISTS `primeratabla`;

CREATE TABLE `primeratabla` (
  `game_id` int,
  `season` int,
  `date_time` DATETIME,
  `home_team_id` int,  
  `away_team_id` int,
  `home_goals` int,  
  `away_goals` int,
  `player_id` int,
  `firstName` varchar(25),
  `lastName` varchar(25),
  `nationality` varchar(25),
  `assists` int,
  `goals` int,
  `shots` int,  
  `play_id` varchar(25),
  `team_id_for` int,
  `team_id_against` int,
  `event` varchar(25)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE primeratabla ADD CONSTRAINT pk_primeratabla PRIMARY KEY(player_id,play_id);
-- Carga de datos

LOAD DATA LOCAL INFILE '/EUI_PORTABLES/MySQL/Uploads/primeratabla.csv'
INTO TABLE primeratabla 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

--
-- Table structure for table `segundatabla`
--

DROP TABLE IF EXISTS `segundatabla`;

CREATE TABLE `segundatabla` (
  `game_id` int,
  `season` int,
  `date_time` DATETIME,
  `home_team_id` int,  
  `away_team_id` int,
  `home_goals` int,  
  `away_goals` int,
  `team_id` int,
  `teamName` varchar(25),
  `tgoals` int,
  `tshots` int,
  `thits` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE segundatabla ADD CONSTRAINT pk_segundtabla PRIMARY KEY(game_id,team_id);

LOAD DATA LOCAL INFILE '/EUI_PORTABLES/MySQL/Uploads/segundatabla.csv'
INTO TABLE segundatabla 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';