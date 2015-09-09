class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  validates :user_id, uniquess: {scope: :idea_id}
end
