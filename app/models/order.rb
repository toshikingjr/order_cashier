class Order < ApplicationRecord
  has_many :menu_orders, dependent: :destroy
  has_many :menus, through: :menu_orders
  has_one :order_confirm
end
