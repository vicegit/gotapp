class CreateFacturas < ActiveRecord::Migration[5.0]
  def change
    create_table :facturas do |t|
      t.string :nrofact
      t.integer :cliente_id
      t.string :condicion
      t.date :fecha
      t.integer :iva
      t.integer :erssan
      t.integer :total

      t.timestamps
    end
  end
end
