class Menu < ApplicationRecord
  has_one_attached :image

  validates :price, numericality: { only_integer: true }
  validates :name, presence: true
end