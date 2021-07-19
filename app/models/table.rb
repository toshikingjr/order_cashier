class Table < ApplicationRecord
  has_many :order_confirms, dependent: :destroy

end
