class MenuGenre < ApplicationRecord
  has_many :menus

  validates :name, presence: true
end
