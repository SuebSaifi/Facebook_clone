class AddUserIdToFaceposts < ActiveRecord::Migration[6.1]
  def change
    add_column :faceposts, :user_id, :integer
  end
end
