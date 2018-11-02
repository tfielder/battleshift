class DropColumnsOnUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :activation_digest, :string
    remove_column :users, :identity_digest, :string
    remove_column :users, :identity_token, :string
  end
end
