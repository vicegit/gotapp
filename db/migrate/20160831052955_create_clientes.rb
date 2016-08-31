class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :cod
      t.string :ci
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.date :fecha_contrato
      t.date :fecha_conexion
      t.string :estado_cuenta
      t.string :observacion

      t.timestamps
    end
  end
end
