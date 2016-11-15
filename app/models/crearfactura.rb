class Crearfactura < ApplicationRecord
	def self.crear
		puts 'hola mundo'
		ActiveRecord::Base.connection.execute("CALL Crearfactura")
	end
end