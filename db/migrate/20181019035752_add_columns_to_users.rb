class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean, default: false
    add_column :users, :activated_at, :datetime
    add_column :users, :identity_digest, :string
    add_column :users, :identity_token, :string
    add_column :users, :api_key, :string
  end
end
