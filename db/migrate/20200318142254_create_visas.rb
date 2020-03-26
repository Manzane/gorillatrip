class CreateVisas < ActiveRecord::Migration[6.0]
  def change
    create_table :visas do |t|
      t.string :name
      t.string :category
      t.date :deliverance_max_date
      t.string :duration
      t.string :price
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
