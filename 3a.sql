USE practica1bda;

SELECT COUNT(*) AS Num_Partidos_Jugados
FROM segundatabla s
WHERE year(date_time)='2013'
AND teamName= 'BlackHawks'