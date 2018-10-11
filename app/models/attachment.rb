class Attachment < ApplicationRecord
  belongs_to :entity, polymorphic: true

  mount_uploader :file, FileUploader
end
