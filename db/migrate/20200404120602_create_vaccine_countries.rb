class CreateVaccineCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccine_countries do |t|
      t.references :vaccine, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.boolean :systematic

      t.timestamps
    end
  end
end
