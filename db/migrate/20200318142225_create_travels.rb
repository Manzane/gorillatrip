class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.string :name
      t.date :travel_start_date
      t.date :travel_end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
