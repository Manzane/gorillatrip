class AddAgeToVisa < ActiveRecord::Migration[6.0]
  def change
    add_column :visas, :age_max, :integer
  end
end
