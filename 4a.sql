USE practica1bda;

INSERT INTO primeratabla (firstname,lastname,nationality,player_id)
	VALUES ('Samuel','Smithson','CAN',5554441);
    
/* Al ser una clave compuesta por Player_id(H) y Play_id(L) y tener solo
valor para player_id(H) nos da una ANOMALIA DE INSERCIÓN por falta
de valor en clave principal(HL) */