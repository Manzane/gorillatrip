class CreateVaccineProgressions < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccine_progressions do |t|
      t.boolean :done
      t.references :vaccine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
