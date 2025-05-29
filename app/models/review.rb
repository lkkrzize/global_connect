class Review < ApplicationRecord
  has_one_attached :photo

  belongs_to :event
  belongs_to :user
end
