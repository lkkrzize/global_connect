class Event < ApplicationRecord
  has_one_attached :photos

  belongs_to :user
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy


end
