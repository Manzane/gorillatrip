class AddFrenchNameToCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :french_name, :string
  end
end
