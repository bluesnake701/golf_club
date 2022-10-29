class OrderDetail < ApplicationRecord
  enum shipping_status: { impossible:0, waiting:1, packing:2, completion:3 }

  belongs_to :order
  belongs_to :item
end
