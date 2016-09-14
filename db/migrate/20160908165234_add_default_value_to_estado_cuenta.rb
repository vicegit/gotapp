class AddDefaultValueToEstadoCuenta < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :clientes do |t|
        dir.up   { t.change :estado_cuenta, :boolean, :default => true }
        dir.down { t.change :estado_cuenta, :boolean, :default => nil }
      end
    end
  end
end
