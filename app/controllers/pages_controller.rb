class PagesController < ApplicationController
    
    def home    
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
