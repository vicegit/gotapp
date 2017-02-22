class RemoveAnteriorFromLecturas < ActiveRecord::Migration[5.0]
  def change
  	remove_column :lecturas, :anterior, :integer
  end
end
