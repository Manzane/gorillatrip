class RenameColumnTypeIntoDocument < ActiveRecord::Migration[6.0]
  def change
    rename_column :documents, :type, :doc_type
  end
end
