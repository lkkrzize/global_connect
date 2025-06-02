class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :event_users
  has_many :events, through: :event_users
  has_many :messages
  has_one_attached :photo
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
