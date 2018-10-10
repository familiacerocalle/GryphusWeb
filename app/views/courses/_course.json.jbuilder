json.extract! course, :id, :nombre, :contenido, :puntos, :created_at, :updated_at
json.url course_url(course, format: :json)
