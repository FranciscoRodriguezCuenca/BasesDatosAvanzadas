USE practica1bda;

UPDATE segundatabla SET teamName='Wild Side'
		WHERE month(date_time)>'02'
			AND year(date_time)>='2013'
            AND teamname = 'Wild';
