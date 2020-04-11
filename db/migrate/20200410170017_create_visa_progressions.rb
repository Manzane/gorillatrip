class CreateVisaProgressions < ActiveRecord::Migration[6.0]
  def change
    create_table :visa_progressions do |t|
      t.boolean :done
      t.references :visa, null: false, foreign_key: true
      t.references :travel_country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
