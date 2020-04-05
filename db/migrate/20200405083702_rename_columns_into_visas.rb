class RenameColumnsIntoVisas < ActiveRecord::Migration[6.0]
  def change
    rename_column :visas, :category, :extra_info
  end
end
