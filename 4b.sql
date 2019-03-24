USE practica1bda;

INSERT INTO segundatabla (game_id,team_id,home_goals,away_goals,teamName,home_team_id,away_team_id)
	VALUES (2012030999,
					 (SELECT s.team_id
					FROM segundatabla s
					WHERE s.teamName = 'Red Wings'
                    GROUP BY s.team_id)
				,3,2,'Red Wings',
                    (SELECT s.team_id
					FROM segundatabla s
					WHERE s.teamName = 'Red Wings'
                    GROUP BY s.team_id)
				,(SELECT s.team_id
					FROM segundatabla s
					WHERE s.teamName = 'Penguins'
                    GROUP BY s.team_id));
INSERT INTO segundatabla (game_id,team_id,home_goals,away_goals,teamName,home_team_id,away_team_id)
	VALUES (2012030999,
					 (SELECT s.team_id
					FROM segundatabla s
					WHERE s.teamName = 'Penguins'
                    GROUP BY s.team_id)
				,3,2,'Red Wings',
                    (SELECT s.team_id
					FROM segundatabla s
					WHERE s.teamName = 'Red Wings'
                    GROUP BY s.team_id)
				,(SELECT s.team_id
					FROM segundatabla s
					WHERE s.teamName = 'Penguins'
                    GROUP BY s.team_id));
                    
/*En este caso al tener valores para la clave compuesta no nos da
ningún error al insertar, sin embargo,los datos identificativos los 
hemos tenido que obtener a partir de consultas. */