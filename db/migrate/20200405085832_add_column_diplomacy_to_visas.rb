class AddColumnDiplomacyToVisas < ActiveRecord::Migration[6.0]
  def change
    add_column :visas, :fr_diplomacy, :string
  end
end
