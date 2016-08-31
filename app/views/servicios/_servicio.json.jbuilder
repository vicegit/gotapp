json.extract! servicio, :id, :cod, :concepto, :tarifa, :created_at, :updated_at
json.url servicio_url(servicio, format: :json)