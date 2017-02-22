-- call generarlectura();
drop procedure if exists generarlectura;
DELIMITER $$
create PROCEDURE generarlectura()
begin
	-- Declaración de variables.
    DECLARE lecturaanterior int default 0;
    DECLARE lecturaid int default 0;
    DECLARE lecturacliente int default 0;
    DECLARE lecturaactual int default 0;
    DECLARE totalconsumo int default 0;
    DECLARE consumominimo int default 0;
    DECLARE consumoexceso int default 0;
    DECLARE medidor int default 0;
    DECLARE hecho bool default false;
    DECLARE cursor_lectura CURSOR FOR SELECT lecturas.id, lecturas.cliente_id, lecturas.actual FROM lecturas WHERE lecturas.periodo_id = (select max(id) from periodos);
    
    -- Declaración de un manejador de error tipo NOT FOUND.
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET hecho = true;
    
    select m3 from servicios where id=1 into consumominimo;
    
    OPEN cursor_lectura;
		loop1: LOOP
			FETCH cursor_lectura INTO lecturaid, lecturacliente, lecturaactual;
            
            IF hecho THEN
				LEAVE loop1;
			END IF;
            
            select medidors.id, medidors.medicion from medidors, clientes where (medidors.id=clientes.medidor_id and clientes.id=lecturacliente) into medidor, lecturaanterior;
            set totalconsumo = (lecturaactual - lecturaanterior);
            
            if totalconsumo > consumominimo then
				set consumoexceso = totalconsumo - consumominimo;
			else
				set consumoexceso = 0;
            end if;
            
            update lecturas set consumo=totalconsumo, exceso=consumoexceso where id=lecturaid;
            update medidors set medicion=lecturaactual where (medidors.id=medidor);
			
		END LOOP loop1;
    CLOSE cursor_lectura;

end
$$