class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relaciones entre las tablas
  has_many :course_users
  has_many :courses, :through => :course_users

  # Relaciones entre las tablas
  has_many :challenge_users
  has_many :challenges, :through => :challenge_users

  # Relaciones entre las tablas
  has_many :complaint_users
  has_many :complaints, :through => :complaint_users

  before_create -> {self.token = generate_token}

  def is_admin?
    %(dilkhushsoni2010@gmail.com).include?(email)
  end

  private
  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless User.exists?({token: token})
    end
  end
end
