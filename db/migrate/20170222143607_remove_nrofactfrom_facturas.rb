class RemoveNrofactfromFacturas < ActiveRecord::Migration[5.0]
  def change
  	remove_column :facturas, :nrofact, :string
  end
end
