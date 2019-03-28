CREATE DATABASE  IF NOT EXISTS `practica1bda`;
USE `practica1bda`;


DROP TABLE IF EXISTS `playplayertable`;
DROP TABLE IF EXISTS `playtable`;
DROP TABLE IF EXISTS `playergametable`;
DROP TABLE IF EXISTS `teamgametable`;
DROP TABLE IF EXISTS `gametable`;
DROP TABLE IF EXISTS `teamtable`;
DROP TABLE IF EXISTS `timetable`;
DROP TABLE IF EXISTS `playertable`;

/*Previa creación de tablas incial*/
CREATE TABLE `playertable` (
  `player_id` int,
  `firstName` varchar(25),
  `lastName` varchar(25),
  `nationality` varchar(25),
  CONSTRAINT pk_playertable PRIMARY KEY(player_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `timetable` (
  `season` int,
  `date_time` DATETIME,
  CONSTRAINT pk_timetable PRIMARY KEY(date_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `teamtable` (
  `team_id` int,
  `teamName` varchar(25),
  CONSTRAINT pk_teamtable PRIMARY KEY(team_id)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `gametable` (
  `game_id` int,
  `date_time` DATETIME,
  `home_team_id` int,  
  `away_team_id` int,
  `home_goals` int,  
  `away_goals` int,
  CONSTRAINT pk_gametable PRIMARY KEY(game_id),
  CONSTRAINT fk_date_time_gametable FOREIGN KEY (date_time) REFERENCES timetable(date_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `teamgametable` (
  `game_id` int,
  `team_id` int,
  `tgoals` int,
  `tshots` int,
  `thits` int,
  CONSTRAINT pk_teamgametable PRIMARY KEY(game_id,team_id),
  CONSTRAINT fk_game_id_teamgametable FOREIGN KEY (game_id) REFERENCES gametable(game_id),
  CONSTRAINT fk_team_id_teamgametable FOREIGN KEY (team_id) REFERENCES teamtable(team_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `playergametable` (
  `game_id` int,
  `player_id` int,
  `assists` int,
  `goals` int,
  `shots` int,
  CONSTRAINT pk_playergametable PRIMARY KEY(game_id,player_id),
  CONSTRAINT fk_game_id_playergametable FOREIGN KEY (game_id) REFERENCES gametable(game_id),
  CONSTRAINT fk_player_id_playergametable FOREIGN KEY (player_id) REFERENCES playertable(player_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `playtable` (
  `game_id` int,
  `play_id` varchar(25),
  `team_id_for` int,
  `team_id_against` int,
  `event` varchar(25),
  CONSTRAINT pk_playtable PRIMARY KEY(play_id),
  CONSTRAINT fk_game_id_playtable FOREIGN KEY (game_id) REFERENCES gametable(game_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/**Carga de datos*/
INSERT INTO playertable
    (SELECT player_id,firstName,lastName,nationality
	FROM primeratabla
	GROUP BY player_id,firstName,lastName,nationality);


INSERT INTO timetable
	(SELECT p.date_time,p.season
	FROM primeratabla p
    WHERE p.date_time IS NOT null
    AND p.season IS NOT NULL
    GROUP BY p.date_time,p.season)
	UNION DISTINCT
    (SELECT s.date_time,s.season
	FROM segundatabla s
    WHERE s.date_time IS NOT null
    AND s.season IS NOT NULL
    GROUP BY s.date_time,s.season);
    
    
INSERT INTO teamtable
	(SELECT team_id,teamName
	FROM segundatabla
	GROUP BY team_id,teamName);

INSERT INTO gametable
	(SELECT s.game_id,s.date_time,s.home_team_id,s.away_team_id,s.home_goals,s.away_goals
	FROM segundatabla s
    GROUP BY s.game_id,s.date_time,s.home_team_id,s.away_team_id,s.home_goals,s.away_goals)
	UNION DISTINCT
	(SELECT p.game_id,p.date_time,p.home_team_id,p.away_team_id,p.home_goals,p.away_goals
	FROM primeratabla p
    GROUP BY p.game_id,p.date_time,p.home_team_id,p.away_team_id,p.home_goals,p.away_goals);
    

INSERT INTO teamgametable
	(SELECT game_id,team_id,tgoals,tshots,thits
	FROM segundatabla
	GROUP BY game_id,team_id,tgoals,tshots,thits);
    
    
INSERT INTO playergametable
    (SELECT game_id,player_id,assists,goals,shots
	FROM primeratabla
	GROUP BY game_id,player_id,assists,goals,shots);


INSERT INTO playtable
	(SELECT game_id,play_id,team_id_for,team_id_against,event
	FROM  primeratabla
	GROUP BY game_id,play_id,team_id_for,team_id_against,event);
    
/*Falta insert de la ultima tabla, duda*/