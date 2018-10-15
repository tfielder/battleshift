class AddIdentityTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :identity_digest, :string
  end
end
