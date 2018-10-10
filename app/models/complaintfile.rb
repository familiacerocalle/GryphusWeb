class Complaintfile < ApplicationRecord
  belongs_to :complaint_user
  
  mount_uploader :archivo, ArchivoUploader
end
