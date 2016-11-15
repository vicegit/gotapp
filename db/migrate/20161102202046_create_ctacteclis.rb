class CreateCtacteclis < ActiveRecord::Migration[5.0]
  def change
    create_table :ctacteclis do |t|
      t.integer :cliente_id
      t.integer :saldo

      t.timestamps
    end
  end
end
