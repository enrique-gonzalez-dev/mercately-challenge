class CartItem < ApplicationRecord
    belongs_to :cart, dependent: :destroy
    belongs_to :product, dependent: :destroy

    def total
        self.product.price * self.quantity
    end

end
