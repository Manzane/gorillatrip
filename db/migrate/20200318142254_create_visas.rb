class CreateVisas < ActiveRecord::Migration[6.0]
  def change
    create_table :visas do |t|
      t.string :name
      t.string :category
      t.date :deliverance_max_date
      t.integer :duration
      t.integer :price
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
