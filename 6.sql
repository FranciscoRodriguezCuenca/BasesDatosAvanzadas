USE practica1bda;

UPDATE segundatabla SET teamName='Wild Side'
		WHERE team_id in (SELECT s.team_id
							FROM segundatabla s
							WHERE s.teamname = 'Wild'
                            GROUP BY s.team_id)
			AND	month(date_time)>='02'
			AND year(date_time)>='2013'
            AND teamName='Wild';