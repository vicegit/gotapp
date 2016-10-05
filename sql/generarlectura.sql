-- call generarlectura();
drop procedure if exists generarlectura;
DELIMITER $$
create PROCEDURE generarlectura()
begin
	-- Declaración de variables.
    DECLARE periodoanterior int default 0;
    DECLARE lecturaanterior int default 0;
    DECLARE totalconsumo int default 0;
    DECLARE hecho bool default false;
    DECLARE cursor_lectura CURSOR FOR SELECT lecturas.periodo_id, lecturas.cliente_id, lecturas.actual FROM lecturas WHERE lecturas.periodo_id = (select max(id) from periodos);
    
    -- Declaración de un manejador de error tipo NOT FOUND.
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET hecho = true;
	
    select max(id)-1 from lecturas into periodoanterior;
    
    OPEN cursor_lectura;
		loop1: LOOP
			FETCH cursor_lectura INTO periodo, cliente, actual;
			
            IF hecho THEN
				LEAVE loop1;
			END IF;
            
            select actual from lecturas where lecturas.periodo.id=periodoanterior and cliente.id=cliente into lecturaanterior;
            set totalconsumo = (actual - lecturaanterior);
            update lecturas set consumo=totalconsumo where periodo_id=periodo and cliente_id=cliente;
			
		END LOOP loop1;
    CLOSE cursor_lectura;

end
$$