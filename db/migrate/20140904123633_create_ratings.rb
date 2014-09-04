class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating , default: 0
      t.references :user
      t.references :trip

      t.timestamps
    end
    add_index :ratings, [:user_id, :trip_id], unique: true
  end
end
