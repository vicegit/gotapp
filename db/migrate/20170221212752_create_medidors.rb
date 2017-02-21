class CreateMedidors < ActiveRecord::Migration[5.0]
  def change
    create_table :medidors do |t|
      t.integer :numero
      t.string :medicion
      t.boolean :estado_medidor

      t.timestamps
    end
  end
end
