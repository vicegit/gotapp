class AddDefaultValueToFacturas < ActiveRecord::Migration[5.0]
  def change
  	reversible do |dir|
    	change_table :facturas do |t|
        	dir.up   { t.change :iva, :integer, :default => 0 }
        	dir.up   { t.change :erssan, :integer, :default => 0 }
        	dir.up   { t.change :total, :integer, :default => 0 }
        	dir.down { t.change :iva, :integer, :default => nil }
        	dir.down { t.change :erssan, :integer, :default => nil }
        	dir.down { t.change :total, :integer, :default => nil }
    	end
    end
  end
end
