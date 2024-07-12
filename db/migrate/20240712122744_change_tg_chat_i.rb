class ChangeTgChatI < ActiveRecord::Migration[7.1]
  def change
    change_column :tg_messages, :tg_chat_id, :bigint
    change_column :tg_chats, :tg_id, :bigint
  end
end
