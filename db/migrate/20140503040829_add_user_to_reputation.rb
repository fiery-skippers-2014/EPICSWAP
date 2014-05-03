class AddUserToReputation < ActiveRecord::Migration
  def change
    change_table :reputations do |t|
      t.belongs_to :user
    end
  end
end
