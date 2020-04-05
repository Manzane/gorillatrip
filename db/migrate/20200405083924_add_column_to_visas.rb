class AddColumnToVisas < ActiveRecord::Migration[6.0]
  def change
    add_column :visas, :validity, :string
  end
end
