class AddTypeToTgChats < ActiveRecord::Migration[7.1]
  def change
    add_column :tg_chats, :tg_type, :string
  end
end
