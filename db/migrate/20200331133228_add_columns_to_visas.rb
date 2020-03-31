class AddColumnsToVisas < ActiveRecord::Migration[6.0]
  def change
    add_column :visas, :duration_int, :integer
  end
end
