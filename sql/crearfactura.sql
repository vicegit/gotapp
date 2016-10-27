-- call crearfactura(45);
drop procedure if exists crearfactura;
DELIMITER $$
create PROCEDURE crearfactura(in numero int)
begin
	-- Declaración de variables.
    DECLARE cliente int default 0;
    DECLARE fact int default 0;
    DECLARE tarifaminima int default 0;
    DECLARE tarifaexceso int default 0;
    DECLARE cantidadexceso int default 0;
    DECLARE totaltarifaexceso int default 0;
    DECLARE periodoactual int default 0;
    DECLARE totalfacturacion int default 0;
    DECLARE hecho bool default false;
    DECLARE cursor_cliente CURSOR FOR SELECT id FROM clientes WHERE estado_cuenta = 1;
    
    -- Declaración de un manejador de error tipo NOT FOUND.
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET hecho = true;
    
    select tarifa from servicios where id=1 into tarifaminima;
    
    select tarifa from servicios where id=2 into tarifaexceso;
    
    select max(id) from periodos into periodoactual;
	
    OPEN cursor_cliente;
		loop1: LOOP
			FETCH cursor_cliente INTO cliente;
			
            IF hecho THEN
				LEAVE loop1;
			END IF;
            
            insert into facturas(nrofact, cliente_id, condicion, fecha) values(numero, cliente, "CRÉDITO", current_date());
            
            select max(id) from facturas into fact;
            
            insert into facturas_servicios(factura_id, servicio_id, subtotal) values(fact, 1, tarifaminima);
            
            select exceso from lecturas where lecturas.periodo_id = periodoactual and lecturas.cliente_id = cliente into cantidadexceso;
			
            set totaltarifaexceso = cantidadexceso * tarifaexceso;
            
            insert into facturas_servicios(factura_id, servicio_id, subtotal) values(fact, 2, totaltarifaexceso);
            
            set totalfacturacion = tarifaminima + totaltarifaexceso;
            
            update facturas set iva = (totalfacturacion/11), erssan = (totalfacturacion * 0.02), total = totalfacturacion where id=fact;
            
            set numero = numero+1;
			
		END LOOP loop1;
    CLOSE cursor_cliente;

end
$$