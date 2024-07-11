class CreateTgMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :tg_messages, id: false do |t|
      t.primary_key :tg_id
      t.integer :tg_chat_id
      t.integer :tg_user_id

      t.timestamps
    end
  end
end
