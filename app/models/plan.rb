class Plan < ApplicationRecord
  has_many :reserves
  enum round: {round_one:0, round1_5:1, round_two:2, half_play:3}
  enum lunch: {with_lunch:0, no_lunch:1}
  enum cart: {with_cart:0, no_cart:1}
  enum caddy: {with_caddy:0, no_caddy:1}
  enum lodging: {with_lodging:0, no_lodging:1}

  validates :plan_name, presence: true
  validates :player, presence: true
  validates :price, presence: true
end
