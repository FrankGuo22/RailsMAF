class StoreController < ApplicationController
  before_action :set_current_page
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 5)
    @carts = Cart.all
  end

  
  private
  def set_current_page
    @current_page = params[:page] || 1
  end
end
