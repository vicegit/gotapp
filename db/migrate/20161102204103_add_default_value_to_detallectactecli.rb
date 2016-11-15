class AddDefaultValueToDetallectactecli < ActiveRecord::Migration[5.0]
  def change
  	reversible do |dir|
    	change_table :detallectacteclis do |t|
        	dir.up   { t.change :debe, :integer, :default => 0 }
        	dir.up   { t.change :haber, :integer, :default => 0 }
        	dir.down { t.change :debe, :integer, :default => nil }
        	dir.down { t.change :haber, :integer, :default => nil }
    	end
    end
  end
end
