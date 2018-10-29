class Complaintfile < ApplicationRecord
  belongs_to :user
  belongs_to :complaint

  mount_base64_uploader :archivo, ArchivoUploader
end
