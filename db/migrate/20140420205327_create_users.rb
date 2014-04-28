class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :device_token, uniqueness: true

      t.timestamps
    end

    add_index :users, :device_token, unique: true
  end
end
