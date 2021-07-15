class Menu < ApplicationRecord
  has_one_attached :image
  has_many :menu_orders, dependent: :destroy
  has_many :order, through: :menu_orders
  has_many :menu_tag_relations
  has_many :tags, through: :menu_tag_relations
end