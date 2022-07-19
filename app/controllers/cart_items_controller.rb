class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show destroy ]

  def destroy
    cart = @cart_item.cart
    @cart_item.destroy
    
    respond_to do |format|
      format.html { redirect_to cart , notice: "Elemento eliminado correctamente" }
      format.json { head :no_content }
    end
  end
    
  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

end
