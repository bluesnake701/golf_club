class Reserf < ApplicationRecord
  belongs_to :plan
  belongs_to :customer
  enum reserves_status: { complete: 0, cancel: 1 }
end
