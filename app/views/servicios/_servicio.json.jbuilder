json.extract! servicio, :id, :concepto, :tarifa, :created_at, :updated_at
json.url servicio_url(servicio, format: :json)