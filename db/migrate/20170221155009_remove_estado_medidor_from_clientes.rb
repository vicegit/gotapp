class RemoveEstadoMedidorFromClientes < ActiveRecord::Migration[5.0]
  def change
    remove_column :clientes, :estado_medidor, :boolean
  end
end
