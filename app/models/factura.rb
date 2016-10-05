class Factura < ApplicationRecord

	belongs_to :cliente
	has_and_belongs_to_many :servicios

end
