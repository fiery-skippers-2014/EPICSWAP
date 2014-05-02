class AddUserIdToSkills < ActiveRecord::Migration
  def change
    change_table :skills do |t|
      t.belongs_to :user
    end
  end
end
