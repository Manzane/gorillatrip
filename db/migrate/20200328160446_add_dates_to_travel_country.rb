class AddDatesToTravelCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :travel_countries, :start_date, :date
    add_column :travel_countries, :end_date, :date
  end
end
