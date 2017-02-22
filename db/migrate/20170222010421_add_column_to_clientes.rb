class AddColumnToClientes < ActiveRecord::Migration[5.0]
  def change
  	add_column :clientes, :medidor_id, :integer
  end
end
