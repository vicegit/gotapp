json.extract! lectura, :id, :estado_medidor, :numero_medidor, :fecha, :lector, :anterior, :actual, :consumo, :exceso, :created_at, :updated_at
json.url lectura_url(lectura, format: :json)