class MenuOrder < ApplicationRecord
  belongs_to :menu
  belongs_to :order

  def sum_of_price
    menu.price * quantity
  end
end
