class AddColumnToFacturas < ActiveRecord::Migration[5.0]
  def change
  	add_column :facturas, :periodo_id, :integer
  end
end
