class AddColumnsToServicios < ActiveRecord::Migration[5.0]
  def change
  	add_column :servicios, :m3, :integer
  end
end
