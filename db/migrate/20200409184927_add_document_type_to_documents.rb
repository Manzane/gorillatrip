class AddDocumentTypeToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :document_type, :integer
  end
end
