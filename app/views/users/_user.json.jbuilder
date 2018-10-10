json.extract! user, :id, :nombre, :primerApellido, :segundoApellido, :puntosAcumulados, :created_at, :updated_at
json.url user_url(user, format: :json)
