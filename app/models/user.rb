class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :event_users
  # has_many :events         looks unccessary
  has_many :events, through: :event_users
  has_many :messages
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def next_event
    user_events.upcoming.first
  end

  def upcoming_events
    user_events.upcoming
  end

  def past_events
    user_events.where('date < ?', Date.current).order(date: :desc)
  end

  private

  def user_events
    Event.joins(:event_users) # returns all events where user is either attendee or the creator
        .where(event_users: { user_id: id }) # checks if user is attendee
        .or(Event.where(user_id: id)) # checks if user is creator of the event
        .distinct # removes duplicates
  end
end
