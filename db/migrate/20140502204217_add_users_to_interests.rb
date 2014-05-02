class AddUsersToInterests < ActiveRecord::Migration
  def up
    add_column :interests, :user_id, :integer
  end

  def down
    remove_column :interests, :category_id
  end
end
