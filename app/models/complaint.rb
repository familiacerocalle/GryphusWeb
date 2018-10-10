class Complaint < ApplicationRecord
  
  # Relaciones entre las tablas
  has_many :complaint_users
  has_many :users, :through => :complaint_users

end
