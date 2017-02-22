class Medidor < ApplicationRecord
	has_one :cliente

	#Validaciones de numero
	validates :numero, :presence => {:message => "Debe ingresar un número de medidor"}, 
			:uniqueness => {:message => "El número de medidor ya está registrado"}, 
			length: {minimum: 3, maximum: 8, :message => "El número de medidor debe tener entre 3 y 8 caracteres"}

	#Validaciones de numero
	validates :medicion, :presence => {:message => "Debe ingresar una medición"},  
			length: {minimum: 1, maximum: 8, :message => "El número de medidor debe tener entre 1 y 8 caracteres"}, 
			:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}
end