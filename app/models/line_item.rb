class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  def total_price
    product.price * quantity
  end
  def as_json(options={})
    super(:only => [:product_id, :cart_id,:created_at,:updated_at,:quantity,:order_id])
  end
  
end
