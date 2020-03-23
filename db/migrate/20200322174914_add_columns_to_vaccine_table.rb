class AddColumnsToVaccineTable < ActiveRecord::Migration[6.0]
  def change
    add_column :vaccines, :description, :string
    add_column :vaccines, :mandatory, :boolean
  end
end
