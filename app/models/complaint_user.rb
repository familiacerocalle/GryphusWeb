class ComplaintUser < ApplicationRecord
  belongs_to :complaint
  belongs_to :user

  # Relaciones entre las tablas
  has_many :complaintfiles

end
