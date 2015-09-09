class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  # join tables
  has_many :joineds

  # joineds.map{|x|x.user} (users from joineds)
  has_many :users, through: :joineds

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
