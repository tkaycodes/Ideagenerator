class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :joineds
  has_many :users, through: :joineds
end
