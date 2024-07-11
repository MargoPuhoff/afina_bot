class TgMessage < ApplicationRecord
  self.primary_key = "tg_id"

  belongs_to :tg_chat
  belongs_to :tg_user
end
