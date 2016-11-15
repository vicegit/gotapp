class CreateDetallefacturas < ActiveRecord::Migration[5.0]
  def change
    create_table :detallefacturas do |t|
      t.integer :factura_id
      t.integer :servicio_id
      t.integer :subtotal

      t.timestamps
    end
    
    add_index :detallefacturas, [:factura_id, :servicio_id]
  end
end