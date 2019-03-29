USE practica1bda;

/* Num partidos jugados por BLACKHAWKS en 2013*/ /*12.3a*/
SELECT COUNT(*) AS Num_Partidos_Jugados
FROM teamtable t 
	INNER JOIN teamgametable tg ON t.team_id=tg.team_id
    INNER JOIN gametable gt ON tg.game_id = gt.game_id
WHERE YEAR(gt.date_time)='2013' AND t.teamName='BlackHawks';

/* Por cada partido registrado en el mes de enero de 2013, mostrar el nombre de los equipos locales*/ /*12.3b*/
SELECT g.date_time AS Fecha_Partido, t.TeamName AS EquipoLocal
FROM gametable g INNER JOIN teamtable t ON g.home_team_id = t.team_id
WHERE YEAR(g.date_time) = '2013' AND MONTH(g.date_time)='01';

/* Por cada equipo, mostrar su identificador, nombre, y estadísticas (tgoals, tshots y thits) en los
partidos jugados en 2013 como equipos locales.*/ /* 12.3c*/

SELECT t.TeamName AS EquipoLocal,tg.tgoals AS Goles,tg.tshots AS Tiros,tg.thits AS Golpes,g.date_time AS Fecha_Partido
FROM teamgametable tg INNER JOIN teamtable t ON  t.team_id = tg.team_id
						INNER JOIN gametable g ON tg.game_id = g.game_id AND tg.team_id = g.home_team_id					  
WHERE YEAR(g.date_time) = '2013' ;

/* Obtener, para cada partido que haya jugado el o los equipo(s) en los que haya jugado el jugador
Adam McQuaid, el identificador del equipo, el nombre del equipo, el año, mes y día del partido y
el identificador de cada jugada realizada junto con su descripción (event) para cada una de las
jugadas que haya realizado el equipo en cada partido (event) ordenadas por la fecha del partido*/ /*12.3d*/

SELECT g.date_time,play.play_id,play.event, t1.teamName As NombreAgainst, t2.teamName AS NombreFor
FROM playertable p
	INNER JOIN playergametable pg ON p.player_id = pg.player_id
    INNER JOIN gametable g ON pg.game_id = g.game_id
    INNER JOIN playtable play ON play.game_id = g.game_id
    INNER JOIN teamtable t1 ON t1.team_id = play.team_id_against
    INNER JOIN teamtable t2 ON t2.team_id = play.team_id_against
WHERE p.firstName='Adam'
	AND p.lastname = 'McQuaid'
GROUP BY play.team_id_for,play.team_id_against, play.event
ORDER BY g.date_time;

/*Los datos del nuevo jugador que se llama Samuel Smithson y es canadiense (CAN) y al que se le ha
asignado el identificador 5554441.*/ /*12.4a*/

INSERT INTO playertable (firstname,lastname,nationality,player_id)
	VALUES ('Samuel','Smithson','CAN',5554441);
    
/* El partido de código 2012030999 entre los “Red Wings” (locales) y los “Penguins” que terminó 3 a
2 a favor de los locales.*/ /*12.4b*/

BEGIN WORK;

INSERT INTO gametable (game_id, home_team_id, away_team_id, home_goals, away_goals)
	VALUES(2012030999,
				(SELECT s.team_id
				FROM teamtable s
				WHERE s.teamName = 'Red Wings'
				GROUP BY s.team_id),
                (SELECT s.team_id
				FROM teamtable s
				WHERE s.teamName = 'Penguins'
				GROUP BY s.team_id),
			3,2);

ROLLBACK WORK;

/*Los datos de un nuevo equipo, denominado “Lasters” y cuyo código será 99.*/ /*12.4c*/
BEGIN WORK;

INSERT INTO teamtable(team_id, teamName)
	VALUES(99,'Lasters');
    
ROLLBACK WORK;

/*Actualizar el resultado del partido de código '2012020053' ya que el partido terminó realmente 5 a 3 en
vez de 6 a 4 como figura.Comentar problemas y anomalías si las hay*/ /*12.5*/
BEGIN WORK;

UPDATE  gametable SET home_goals = 5, away_goals = 3
WHERE game_id = '2012020053';

ROLLBACK WORK;

/* A partir de febrero de 2013, el equipo denominado “Wild” pasa a denominarse “Wild Side”. Reflejar este
hecho en las tablas, explicando problemas y anomalías. Comentar si surge algún problema entre datos en
las tablas y las dependencias funcionales.*/ /*12.6*/
BEGIN WORK;
UPDATE teamtable SET teamName='Wild Side'
WHERE teamname = 'Wild';
ROLLBACK WORK;

/*Esto cambia para todas las fechas ya que...*/