class Factura < ApplicationRecord

	belongs_to :cliente
	belongs_to :periodo
	has_many :detallefacturas
  	has_many :servicios, through: :detallefacturas

end
