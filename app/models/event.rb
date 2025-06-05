class Event < ApplicationRecord
  belongs_to :user
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :people_limit, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :end_time_after_start_time
  validate :event_date_not_in_past

  # Add geocoding if you want automatic coordinate setting
  geocoded_by :location
  after_validation :geocode

  include PgSearch::Model
  pg_search_scope :search_by_events_and_location,
  against: [ :name, :location],
  using: {
    tsearch: { prefix: true }
  }

  # upcoming events Class Method
  def self.upcoming
    where(date: Date.today..).order(:date)
  end

  private

  def end_time_after_start_time
    return unless starts_at && ends_at
    errors.add(:ends_at, 'must be after start time') if ends_at <= starts_at
  end

  def event_date_not_in_past
    return unless date
    errors.add(:date, 'cannot be in the past') if date < Date.current
  end
end
