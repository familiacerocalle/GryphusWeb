class Complaint < ApplicationRecord

  # Relaciones entre las tablas
  belongs_to :user
  belongs_to :complaint_type

  has_many :complaintfiles

  has_many :attachments, as: :entity
end
