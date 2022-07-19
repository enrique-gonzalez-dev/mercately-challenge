class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  has_many :products
  has_many :carts

  def last_cart
    last_cart = Cart.where(status: :active).last
    return nil unless last_cart.present?
    last_cart
  end

  def label
    "#{name} #{last_name}"
  end

end
