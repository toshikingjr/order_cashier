class MenuOrder < ApplicationRecord
  belongs_to :menu
  belongs_to :order
end
