class EventCategory < ApplicationRecord
  belongs_to :category
  belongs_to :event

  has_one_attached :image
end
