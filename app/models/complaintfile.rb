class Complaintfile < ApplicationRecord
  belongs_to :user
  belongs_to :complaint

  mount_uploader :archivo, ArchivoUploader
end
