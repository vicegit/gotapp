class CreateDetallectacteclis < ActiveRecord::Migration[5.0]
  def change
    create_table :detallectacteclis do |t|
      t.integer :ctactecli_id
      t.date :fechadetalle
      t.string :tipodetalle
      t.integer :debe
      t.integer :haber

      t.timestamps
    end
  end
end
