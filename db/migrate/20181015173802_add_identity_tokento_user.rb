class AddIdentityTokentoUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :identity_token, :string
  end
end
