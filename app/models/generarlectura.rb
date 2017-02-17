class Generarlectura < ApplicationRecord
	def self.generar
		puts 'hola mundo'
		ActiveRecord::Base.connection.execute("CALL Generarlectura")
	end
end