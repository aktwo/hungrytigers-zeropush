class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :building
      t.decimal :status
      t.text :body
      t.decimal :longitude
      t.decimal :latitude
      t.datetime :timestamp

      t.timestamps
    end
  end
end
