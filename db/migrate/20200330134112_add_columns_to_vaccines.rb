class AddColumnsToVaccines < ActiveRecord::Migration[6.0]
  def change
    add_column :vaccines, :disease_description, :string
    add_column :vaccines, :risks, :string
    add_column :vaccines, :treatment_type, :string
    add_column :vaccines, :treatment, :string
    add_column :vaccines, :vaccine_schema, :string
    add_column :vaccines, :treatment_start, :integer
    add_column :vaccines, :treatment_end, :integer
    add_column :vaccines, :injection_max, :integer
    add_column :vaccines, :travel_advised, :boolean
  end
end
