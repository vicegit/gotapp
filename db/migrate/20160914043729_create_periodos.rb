class CreatePeriodos < ActiveRecord::Migration[5.0]
  def change
    create_table :periodos do |t|
      t.date :periodo
      t.date :fecha_vencimiento
      t.boolean :estado_periodo

      t.timestamps
    end
  end
end
