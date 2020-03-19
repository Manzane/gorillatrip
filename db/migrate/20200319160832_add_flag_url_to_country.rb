class AddFlagUrlToCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :flag_url, :string
  end
end
