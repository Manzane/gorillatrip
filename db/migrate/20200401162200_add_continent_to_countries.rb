class AddContinentToCountries < ActiveRecord::Migration[6.0]
  def change
    add_reference :countries, :continent, foreign_key: true
  end
end
