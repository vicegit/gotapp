json.extract! lectura, :id, :cliente_id, :periodo_id, :fecha, :lector, :anterior, :actual, :consumo, :exceso, :created_at, :updated_at
json.url lectura_url(lectura, format: :json)