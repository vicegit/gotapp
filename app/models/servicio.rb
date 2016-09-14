class Servicio < ApplicationRecord
	#Validaciones de concepto
	validates :concepto, :presence => {:message => "Debe ingresar un concepto"}, 
			:uniqueness => {:message => "El concepto ya está registrado"}, 
			length: {minimum: 6, maximum: 100, :message => "El concepto debe tener entre 6 y 100 caracteres"}
	#Validaciones de tarifa
	validates :tarifa, :presence => {:message => "Debe ingresar una tarifa"},  
			length: {minimum: 4, maximum: 7, :message => "La tarifa debe tener entre 4 y 7 caracteres"},
			:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}
end