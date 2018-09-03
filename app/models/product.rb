class Product < ApplicationRecord
  discount_message = 

  def is_discounted?
    price < 1000000
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
