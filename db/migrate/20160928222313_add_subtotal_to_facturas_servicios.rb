class AddSubtotalToFacturasServicios < ActiveRecord::Migration[5.0]
  def change
    add_column :facturas_servicios, :subtotal, :integer
  end
end
