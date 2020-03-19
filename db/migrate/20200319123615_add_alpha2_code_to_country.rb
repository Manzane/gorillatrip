class AddAlpha2CodeToCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :alpha2code, :string
  end
end
