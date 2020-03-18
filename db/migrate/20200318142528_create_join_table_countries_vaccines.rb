class CreateJoinTableCountriesVaccines < ActiveRecord::Migration[6.0]
  def change
    create_join_table :countries, :vaccines do |t|
      # t.index [:country_id, :vaccine_id]
      # t.index [:vaccine_id, :country_id]
      t.integer :duration
    end
  end
end
