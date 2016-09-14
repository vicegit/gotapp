class AddDefaultValueToEstadoPeriodo < ActiveRecord::Migration[5.0]
  def change
  	reversible do |dir|
    	change_table :periodos do |t|
        	dir.up   { t.change :estado_periodo, :boolean, :default => true }
        	dir.down { t.change :estado_periodo, :boolean, :default => nil }
    	end
    end
  end
end