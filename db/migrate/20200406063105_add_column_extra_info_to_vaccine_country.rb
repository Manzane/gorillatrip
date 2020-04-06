class AddColumnExtraInfoToVaccineCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :vaccine_countries, :extra_info, :string
  end
end
