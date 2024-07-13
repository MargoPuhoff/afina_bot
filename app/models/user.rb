class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable and :omniauthable :registerable, :rememberable
  devise :database_authenticatable, :lockable,
         :recoverable, :validatable
end
