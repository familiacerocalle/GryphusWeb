class Challenge < ApplicationRecord
  belongs_to :challengelevel

  # Relaciones entre las tablas
  has_many :challenge_users
  has_many :users, :through => :challenge_users

  has_many :attachments, as: :entity
end
