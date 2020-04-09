class RemoveGenderInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :gender
  end
end
