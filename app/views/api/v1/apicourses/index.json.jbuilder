json.array! @apicourses do |apicourse|
  json.id apicourse.id
  json.nombre apicourse.nombre
  json.contenido apicourse.contenido
  json.puntos apicourse.puntos
end
