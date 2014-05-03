class CreateReputations < ActiveRecord::Migration

  def change
    create_table :reputations do |t|
      t.integer :score
    end
  end
end
