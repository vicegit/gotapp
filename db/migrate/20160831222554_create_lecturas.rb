class CreateLecturas < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturas do |t|
      t.string :estado_medidor
      t.string :numero_medidor
      t.date :fecha
      t.string :lector
      t.integer :anterior
      t.integer :actual
      t.integer :consumo
      t.integer :exceso

      t.timestamps
    end
  end
end
