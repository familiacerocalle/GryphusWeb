json.extract! complaint_user, :id, :complaint_id, :user_id, :direccion, :comentarios, :created_at, :updated_at
json.url complaint_user_url(complaint_user, format: :json)
