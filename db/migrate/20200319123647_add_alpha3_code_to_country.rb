class AddAlpha3CodeToCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :alpha3code, :string
  end
end
