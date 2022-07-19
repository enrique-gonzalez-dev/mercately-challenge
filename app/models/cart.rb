class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  enum status: { active: "active", archived: "archived" }

  def total_sale
    cart_items = CartItem.where(cart_id: self.id)
    total_sale = 0
    cart_items.each do |cart_item|
      total_sale += cart_item.total
    end
    total_sale
  end

  def total_products
    cart_items = CartItem.where(cart_id: self.id)
    total_items = 0
    cart_items.each do |cart_item|
      total_items += cart_item.quantity
    end
    total_items
  end

end
