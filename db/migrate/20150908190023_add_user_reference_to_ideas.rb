class AddUserReferenceToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :user_id, :integer
  end
end
