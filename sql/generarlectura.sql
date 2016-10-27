-- call generarlectura();
drop procedure if exists generarlectura;
DELIMITER $$
create PROCEDURE generarlectura()
begin
	-- Declaración de variables.
    DECLARE periodoanterior int default 0;
    DECLARE lecturaanterior int default 0;
    DECLARE lecturaid int default 0;
    DECLARE lecturacliente int default 0;
    DECLARE lecturaactual int default 0;
    DECLARE totalconsumo int default 0;
    DECLARE consumominimo int default 0;
    DECLARE consumoexceso int default 0;
    DECLARE hecho bool default false;
    DECLARE cursor_lectura CURSOR FOR SELECT lecturas.id, lecturas.cliente_id, lecturas.actual FROM lecturas WHERE lecturas.periodo_id = (select max(id) from periodos);
    
    -- Declaración de un manejador de error tipo NOT FOUND.
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET hecho = true;
	
    select max(id)-1 from periodos into periodoanterior;
    
    select m3 from servicios where id=1 into consumominimo;
    
    OPEN cursor_lectura;
		loop1: LOOP
			FETCH cursor_lectura INTO lecturaid, lecturacliente, lecturaactual;
            
            IF hecho THEN
				LEAVE loop1;
			END IF;
            
            select actual from lecturas where (lecturas.periodo_id=periodoanterior and lecturas.cliente_id=lecturacliente) into lecturaanterior;
            set totalconsumo = (lecturaactual - lecturaanterior);
            
            if totalconsumo > consumominimo then
				set consumoexceso = totalconsumo - consumominimo;
			else
				set consumoexceso = 0;
            end if;
            
            update lecturas set consumo=totalconsumo, exceso=consumoexceso where id=lecturaid;
			
		END LOOP loop1;
    CLOSE cursor_lectura;

end
$$