class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable and :omniauthable :registerable, :rememberable
  devise :database_authenticatable, :lockable,
         :recoverable, :validatable, authentication_keys: [:login]

  validates :login, presence: true, uniqueness: true
  validates :tg_user_id, presence: true, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
