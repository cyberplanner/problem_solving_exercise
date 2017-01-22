class Product < ActiveRecord::Base

  def a_match?(another_product)
    if self.id != another_product.id && self.product == another_product.product && self.customer == another_product.customer && self.measure == another_product.measure && (self.valid_from_day..self.valid_to_day).overlaps?(another_product.valid_from_day..another_product.valid_to_day)
      true
    else
      false
    end
  end

end
