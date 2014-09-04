class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :land
      t.string :region
      t.string :hotel   , unique: true
      t.text :infos
      t.decimal :preis

      t.timestamps
    end
  end
end
