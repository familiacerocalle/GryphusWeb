json.extract! complaintfile, :id, :complaint_user_id, :descripcion, :archivo, :created_at, :updated_at
json.url complaintfile_url(complaintfile, format: :json)
