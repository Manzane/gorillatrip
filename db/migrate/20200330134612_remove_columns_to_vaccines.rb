class RemoveColumnsToVaccines < ActiveRecord::Migration[6.0]
  def change
    remove_column :vaccines, :description
    remove_column :vaccines, :treatment_start_date
    remove_column :vaccines, :treatment_end_date
    remove_column :vaccines, :injection_max_date
    remove_column :vaccines, :mandatory
  end
end
