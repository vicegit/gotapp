class AddDefaultValueToDetalleFactura < ActiveRecord::Migration[5.0]
  def change
  	reversible do |dir|
    	change_table :detallefacturas do |t|
        	dir.up   { t.change :subtotal, :integer, :default => 0 }
        	dir.down { t.change :subtotal, :integer, :default => nil }
    	end
    end
  end
end