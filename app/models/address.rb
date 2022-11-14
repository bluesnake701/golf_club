class Address < ApplicationRecord
  belongs_to :customer

  def address_display
  '〒' + postal_code + ' ' + destination + ' ' + name
  end

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :destination, presence: true
end
