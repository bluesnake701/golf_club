class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :item_genre

  has_many :cart_items
  has_many :order_details

  def add_tax_price
    (self.price * 1.08).round
  end

end
