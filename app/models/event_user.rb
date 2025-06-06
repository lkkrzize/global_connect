class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  validates :user_id, uniqueness: { scope: :event_id,
    message: "cannot attend event more than once" }
end
