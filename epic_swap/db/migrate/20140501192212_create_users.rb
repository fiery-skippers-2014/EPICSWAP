class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :tagline
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
