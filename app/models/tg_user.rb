class TgUser < ApplicationRecord
  self.primary_key = "tg_id"

  has_many :tg_messages
end
