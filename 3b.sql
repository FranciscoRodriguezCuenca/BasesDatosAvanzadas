USE practica1bda;
SELECT date_time AS Fecha_Partido, s.TeamName AS EquipoLocal
FROM segundatabla s
WHERE year(date_time)='2013'
	AND month(date_time)='01'
	AND s.team_id=s.home_team_id;
