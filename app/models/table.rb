class Table < ApplicationRecord
  has_many :order_confirms, dependent: :destroy
  has_one :customer_info
end
