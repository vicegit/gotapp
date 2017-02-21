class RemoveNumeroMedidorFromClientes < ActiveRecord::Migration[5.0]
  def change
    remove_column :clientes, :numero_medidor, :string
  end
end
