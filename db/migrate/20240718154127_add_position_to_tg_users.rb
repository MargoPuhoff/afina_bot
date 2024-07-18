class AddPositionToTgUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :tg_users, :position, :string
  end
end
