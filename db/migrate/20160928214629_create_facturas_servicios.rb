class CreateFacturasServicios < ActiveRecord::Migration[5.0]
  def change
	create_table :facturas_servicios, id: false do |t|
      t.belongs_to :factura, index: true
      t.belongs_to :servicio, index: true
    end
  end
end
