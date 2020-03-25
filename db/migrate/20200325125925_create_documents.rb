class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :type
      t.date :expiration_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
