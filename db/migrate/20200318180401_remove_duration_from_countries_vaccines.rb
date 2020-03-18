class RemoveDurationFromCountriesVaccines < ActiveRecord::Migration[6.0]
  def change

    remove_column :countries_vaccines, :duration, :integer
  end
end
