class CreateTgUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :tg_users, id: false do |t|
      t.primary_key :tg_id
      t.string :name
      t.string :tg_name
      t.boolean :worker, default: false

      t.timestamps
    end
  end
end
