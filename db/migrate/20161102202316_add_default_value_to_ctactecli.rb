class AddDefaultValueToCtactecli < ActiveRecord::Migration[5.0]
  def change
  	reversible do |dir|
    	change_table :ctacteclis do |t|
        	dir.up   { t.change :saldo, :integer, :default => 0 }
        	dir.down { t.change :saldo, :integer, :default => nil }
    	end
    end
  end
end
