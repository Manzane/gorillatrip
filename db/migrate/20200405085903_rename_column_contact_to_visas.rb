class RenameColumnContactToVisas < ActiveRecord::Migration[6.0]
  def change
    rename_column :visas, :contact_number, :embassy
  end
end
