class AddAgeToVisa < ActiveRecord::Migration[6.0]
  def change
    add_column :visas, :age_min, :integer
  end
end
