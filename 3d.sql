USE practica1bda;
SELECT p.date_time,p.play_id,p.event, s1.teamName As NombreAgainst, s2.teamName AS NombreFor
FROM primeratabla p
	INNER JOIN segundatabla s1 ON s1.team_id = p.team_id_against
    INNER JOIN segundatabla s2 ON s2.team_id = p.team_id_for
WHERE p.firstName='Adam'
	AND p.lastname = 'McQuaid'
GROUP BY p.team_id_for,p.team_id_against, p.event
ORDER BY p.date_time;

/*Hemos realizado dos copias de segundatabla (s1 y s2) para poder obtener
simultaneamente los nombres del equipo_for y el equipo_against, ya que
con una sola copia no podríamos realizarlo.*/
 