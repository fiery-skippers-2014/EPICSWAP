class AddRepGiverToReputation < ActiveRecord::Migration
  def change
    change_table :reputations do |t|
      t.integer :giver
    end
  end
end
