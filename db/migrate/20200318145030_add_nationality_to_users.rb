class AddNationalityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nationality, :string
  end
end
