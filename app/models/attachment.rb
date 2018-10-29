class Attachment < ApplicationRecord
  belongs_to :entity, polymorphic: true

  mount_base64_uploader :file, FileUploader
end
