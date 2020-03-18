class CreateTravelCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_countries do |t|
      t.references :travel, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end
