class User < ActiveRecord::Base
  has_many :idea
  has_many :comments

  has_many :joineds
  has_many :joined_ideas, through: :joineds, source: :idea

  has_secure_password

  validates :password, length: { minimum: 8 }
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
