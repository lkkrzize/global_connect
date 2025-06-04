class Event < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  include PgSearch::Model
  pg_search_scope :search_by_events_and_location,
  against: [ :name, :location],
  using: {
    tsearch: { prefix: true }
  }

  
end
