class Course < ApplicationRecord
  has_one_attached :image

  validates :hole, presence: true
  validates :par, presence: true
  validates :yard, presence: true
end
