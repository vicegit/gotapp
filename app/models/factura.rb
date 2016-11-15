class Factura < ApplicationRecord

	belongs_to :cliente
	has_many :detallefacturas
  	has_many :servicios, through: :detallefacturas

end
