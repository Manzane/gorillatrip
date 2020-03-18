class CreateVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.date :treatment_start_date
      t.date :treatment_end_date
      t.date :injection_max_date
      t.string :contraindications
      t.integer :price

      t.timestamps
    end
  end
end
