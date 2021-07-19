class Tag < ApplicationRecord
  has_many :menu_tag_relations
  has_many :menu, through: :menu_tag_relations

  validates :tag_name, uniqueness: true, presence: true
end
