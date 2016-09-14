class CreateServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :servicios do |t|
      t.string :concepto
      t.integer :tarifa

      t.timestamps
    end
  end
end
