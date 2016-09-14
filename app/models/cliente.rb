class Cliente < ApplicationRecord

	has_many :lecturas

	#Validaciones de ci
	validates :ci, :presence => {:message => "Debe ingresar una C. I. Nº"}, 
			:uniqueness => {:message => "La C. I. Nº ya está registrada"}, 
			length: {minimum: 6, maximum: 8, :message => "La C. I. Nº debe tener entre 6 y 8 caracteres"}, 
			:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}
	
	#Validaciones de nombre
	validates :nombre, :presence => {:message => "Debe ingresar un nombre"}, 
		length: {minimum: 6, maximum: 100, :message => "El nombre debe tener entre 6 y 100 caracteres"}
	
	#Validaciones de direccion
	validates :direccion, :presence => {:message => "Debe ingresar una dirección"}, 
		length: {minimum: 6, maximum: 100, :message => "La C. I. Nº debe tener entre 6 y 100 caracteres"}
end