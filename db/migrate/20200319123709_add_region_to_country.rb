class AddRegionToCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :region, :string
  end
end
