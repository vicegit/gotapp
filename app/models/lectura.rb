class Lectura < ApplicationRecord

	belongs_to :cliente
	belongs_to :periodo

	#before_save :campos_automatizados

	#def campos_automatizados
		#self.fecha = Date.today
		#self.lector = user.current_user.email
		#self.consumo = self.actual - self.anterior
	#end

end
