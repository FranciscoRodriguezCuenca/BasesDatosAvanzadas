USE practica1bda;
SELECT s.TeamName AS EquipoLocal,s.tgoals AS Goles,s.tshots AS Tiros,s.thits AS Golpes,s.date_time AS Fecha_Partido
FROM segundatabla s
WHERE year(date_time)='2013'
	AND s.team_id=s.home_team_id;