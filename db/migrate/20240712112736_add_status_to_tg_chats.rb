class AddStatusToTgChats < ActiveRecord::Migration[7.1]
  def change
    add_column :tg_chats, :status, :boolean
  end
end
