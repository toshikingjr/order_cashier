class MenuTag

  include ActiveModel::Model
  attr_accessor :name, :tag_ids, :image, :price

  with_options presence: true do
    validates :tag_ids
    validates :name
  end
  validates :price, numericality: { only_integer: true }

  def save
    menu = Menu.create(name: name, price: price, image: image)

    MenuTagRelation.create(menu_id: menu.id, tag_id: tag_ids)
  end

end