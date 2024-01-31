class Guest < ApplicationRecord
  has_many :carts, as: :cartable

  after_create :create_cart

  def create_cart
    Cart.create!(cartable_id: id, cartable_type: 'Guest')
  end
end
