class Menu < ApplicationRecord
  has_one_attached :image

  belongs_to :menu_genre

  def add_tax_price
    (self.price * 1.08).round
  end
end
