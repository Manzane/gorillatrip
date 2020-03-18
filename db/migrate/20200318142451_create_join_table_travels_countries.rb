class CreateJoinTableTravelsCountries < ActiveRecord::Migration[6.0]
  def change
    create_join_table :travels, :countries do |t|
      # t.index [:travel_id, :country_id]
      # t.index [:country_id, :travel_id]
    end
  end
end
