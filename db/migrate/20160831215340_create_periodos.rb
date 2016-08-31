class CreatePeriodos < ActiveRecord::Migration[5.0]
  def change
    create_table :periodos do |t|
      t.integer :cod
      t.string :mes_ano
      t.date :fecha_vencimiento
      t.string :estado_periodo
      t.date :fecha_inicio
      t.date :fecha_fin
      t.integer :cantidad_dias

      t.timestamps
    end
  end
end
