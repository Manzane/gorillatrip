class CreateStayVaccineProgressions < ActiveRecord::Migration[6.0]
  def change
    create_table :stay_vaccine_progressions do |t|
      t.references :vaccine_progression, null: false, foreign_key: true
      t.references :travel_country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
