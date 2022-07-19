class PagesController < ApplicationController
    before_action :authenticate_user!
      
    def home
        if current_user && current_user.admin
            redirect_to products_path
        else
            redirect_to "/shop"
        end
    end

    def view_product
        @product = Product.find(params[:id])
    end

    def shop
        @products = Product.all
        order_by_price = 'desc' if params[:order] == 'price-desc'
        order_by_price = 'asc' if params[:order] == 'price-asc'
        order_by_title = 'desc' if params[:order] == 'alph-desc'
        order_by_title = 'asc' if params[:order] == 'alph-asc'
        @products = @products.order(price: order_by_price) unless order_by_price.nil?
        @products = @products.order(price: order_by_price) unless order_by_price.nil?
        @products = @products.order(title: order_by_title) unless order_by_title.nil?
        @products = @products.order(title: order_by_title) unless order_by_title.nil?
    end
end
