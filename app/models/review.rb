class Review < ApplicationRecord
  has_one_attached :photo

  belongs_to :event
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
