class AddColumnsToVisasTable < ActiveRecord::Migration[6.0]
  def change
    add_column :visas, :contact_number, :string
    add_column :visas, :application, :string
  end
end
