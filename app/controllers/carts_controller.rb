class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :add_item
  before_action :set_cart, only: %i[ show destroy ]


  def index
    @active_carts = Cart.where(status: :active)
    unless current_user.admin?
      @active_carts = @active_carts.where(status: :active, user_id: current_user.id)
    end
    @archived_carts = Cart.where(status: :archived)
    unless current_user.admin?
      @archived_carts = @archived_carts.where(status: :archived, user_id: current_user.id)
    end
  end

  def show
  end

  def update_status
    cart = Cart.find(params[:id])
    cart.update(status: :archived)
    redirect_to "/carts", notice: "Carrito guardado correctamente"
  end
  
  def show_cart
    @products = Array.new
    if session[:product_ids].present?
      @product_ids = session[:product_ids].sort
      @product_ids= @product_ids.group_by{ |x| x }.values
      @product_ids.each do |product_id|
        @products << [Product.find(product_id[0]), product_id.length ]
      end
    end
  end

  def delete
      
  end
  
  def add_item
    qty =  params[:qty].to_i
    product_id = params[:product_id]
    carts = Cart.where(user_id: current_user.id, status: :active)
    if carts.present?
      cart = carts.last
    else
      cart = Cart.create!(user_id: current_user.id)
    end

    cart_item = CartItem.find_or_create_by(product_id: product_id, cart_id: cart.id)
    cart_item.quantity += qty
    cart_item.save

    respond_to do |f|
        f.json { render json: { total_products: cart.total_products }, status: :ok }
    end
  end

  def update
      
  end

  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Carrito eliminado correctamente" }
      format.json { head :no_content }
    end
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

end