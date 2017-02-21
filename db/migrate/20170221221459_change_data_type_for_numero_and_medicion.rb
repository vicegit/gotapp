class ChangeDataTypeForNumeroAndMedicion < ActiveRecord::Migration[5.0]
  def change
  	change_column(:medidors, :numero, :string)
  	change_column(:medidors, :medicion, :integer)
  end
end
