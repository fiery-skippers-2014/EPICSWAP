class AddReputationToUsers < ActiveRecord::Migration
    def change
    change_table :users do |t|
      t.integer :reputation, default: 0
    end
  end
end
