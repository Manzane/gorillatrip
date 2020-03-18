class DropJoinTableCountriesTravels < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :countries, :travels
  end
end
