class AddMessagesToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :message, :text
  end
end
