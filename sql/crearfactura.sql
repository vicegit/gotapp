-- call crearfactura();
drop procedure if exists crearfactura;
DELIMITER $$
create PROCEDURE crearfactura( )
begin
	-- Declaración de variables.
    DECLARE cliente int default 0;
    DECLARE fact int default 0;
    DECLARE tarifaminima int default 0;
    DECLARE tarifaexceso int default 0;
    DECLARE cantidadexceso int default 0;
    DECLARE totaltarifaexceso int default 0;
    DECLARE periodoactual int default 0;
    DECLARE totalerssan int default 0;
    DECLARE totalfacturacion int default 0;
    DECLARE cuenta int default 0;
    DECLARE hecho bool default false;
    DECLARE cursor_cliente CURSOR FOR SELECT id FROM clientes WHERE estado_cuenta = 1;
    
    -- Declaración de un manejador de error tipo NOT FOUND.
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET hecho = true;
    
    select tarifa from servicios where id=1 into tarifaminima;
    
    select tarifa from servicios where id=2 into tarifaexceso;
    
    select max(id) from periodos into periodoactual;
	
    -- Cursor
    OPEN cursor_cliente;
		loop1: LOOP
			FETCH cursor_cliente INTO cliente;
			
            IF hecho THEN
				LEAVE loop1;
			END IF;
            
            -- Inserción en la cabecera de factura
            insert into facturas(cliente_id, condicion, fecha) values(cliente, "CRÉDITO", current_date());
            
            select max(id) from facturas into fact;
            
            -- Inserción en el detalle de factura
            insert into detallefacturas(factura_id, servicio_id, subtotal) values(fact, 1, tarifaminima);
            
            select exceso from lecturas where lecturas.periodo_id = periodoactual and lecturas.cliente_id = cliente into cantidadexceso;
			
            set totaltarifaexceso = cantidadexceso * tarifaexceso;
            
            insert into detallefacturas(factura_id, servicio_id, subtotal) values(fact, 2, totaltarifaexceso);
            
            set totalerssan = ((tarifaminima + totaltarifaexceso) * 0.02);
            
            set totalfacturacion = tarifaminima + totaltarifaexceso + totalerssan;
            
            
            -- Actualización de cabecera de factura
            update facturas set iva = ((tarifaminima + totaltarifaexceso)/11), erssan = totalerssan, total = totalfacturacion where id=fact;
			
            -- Inserción o actualización en la cuenta corriente cliente por el debe
			if not exists(select * from ctacteclis where cliente_id=cliente) then
				insert into ctacteclis(cliente_id) values(cliente);
                
                select max(id) from ctacteclis into cuenta;
                
                insert into detallectacteclis(ctactecli_id, fechadetalle, tipodetalle, debe) values(cuenta, current_date(), 'Débito por factura', totalfacturacion);
				
                update ctacteclis set saldo = saldo + totalfacturacion where id=cuenta;
			else
				select id from ctacteclis where cliente_id=cliente into cuenta;
                
                insert into detallectacteclis(ctactecli_id, fechadetalle, tipodetalle, debe) values(cuenta, current_date(), 'Débito por factura', totalfacturacion);
				
                update ctacteclis set saldo = saldo + totalfacturacion where id=cuenta;
                
            end if;

            
		END LOOP loop1;
    CLOSE cursor_cliente;

end
$$