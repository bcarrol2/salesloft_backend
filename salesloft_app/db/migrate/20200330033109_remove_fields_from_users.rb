class RemoveFieldsFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :password, :string

    remove_column :users, :email_confirmed, :boolean

    remove_column :users, :password_confirmed, :boolean
  end
end
