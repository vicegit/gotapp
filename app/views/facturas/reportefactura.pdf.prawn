prawn_document do |pdf|

	@facturas.each do |factura|
        pdf.image "#{Rails.root}/app/assets/images/gota.jpg", :position => :center, :scale => 0.5
        pdf.move_down 5

		pdf.text "FACTURA GOTAPP", :color => "0000FF", :size => 20, :style => :bold, :align => :center
		pdf.stroke_horizontal_rule
        pdf.move_down 5

        pdf.text "PERIODO DE CONSUMO: #{factura.periodo.periodo} - FECHA DE VENCIMIENTO: #{factura.periodo.fecha_vencimiento}", :align => :center
        pdf.move_down 10

    	pdf.text "COD: #{factura.id} - USUARIO: #{factura.cliente.nombre} - CONDICIÓN: #{factura.condicion} - FECHA: #{factura.fecha}"
    	pdf.move_down 10

    	pdf.text "DETALLE FACTURA", :color => "008000", :size => 14, :style => :bold
    	pdf.move_down 5
        
        deta = Detallefactura.where(factura_id: factura.id)
    	deta.each do |detalle|
    		pdf.text "-----> #{detalle.servicio.concepto} - #{detalle.subtotal}"
    		pdf.move_down 5
    	end

        pdf.move_down 10
        pdf.stroke_horizontal_rule
        pdf.move_down 5
        pdf.text "IVA: #{factura.iva}", :align => :right
        pdf.move_down 5
        pdf.text "ERSSAN: #{factura.erssan}", :align => :right
        pdf.move_down 5
        pdf.text "TOTAL: #{factura.total}", :align => :right
    	pdf.start_new_page
  	end

end