class AddColumnsToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :estado_medidor, :boolean
    add_column :clientes, :numero_medidor, :string
  end
end
