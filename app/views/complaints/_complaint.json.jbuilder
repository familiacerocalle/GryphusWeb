json.extract! complaint, :id, :descripcion, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
