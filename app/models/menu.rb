class Menu < ApplicationRecord
  has_one_attached :image
  has_many :menu_orders, dependent: :destroy
  validates :price, numericality: { only_integer: true }
  validates :name, presence: true
  has_many :order, through: :menu_orders
end