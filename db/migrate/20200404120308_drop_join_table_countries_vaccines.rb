class DropJoinTableCountriesVaccines < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :countries, :vaccines
  end
end
