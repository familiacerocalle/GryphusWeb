class Course < ApplicationRecord

  # Relaciones entre las tablas
  has_many :course_users
  has_many :users, :through => :course_users

end
