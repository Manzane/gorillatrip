class AddColumnsToContinents < ActiveRecord::Migration[6.0]
  def change
    add_column :continents, :fr_name, :string
  end
end
