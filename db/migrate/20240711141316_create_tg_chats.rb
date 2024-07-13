class CreateTgChats < ActiveRecord::Migration[7.1]
  def change
    create_table :tg_chats, id: false do |t|
      t.primary_key :tg_id
      t.string :name

      t.timestamps
    end
  end
end
