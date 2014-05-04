class RemoveIdFromInterests < ActiveRecord::Migration
  def change
    remove_column :interests, :user_id
  end
end
