class MenuTag

  include ActiveModel::Model
  attr_accessor :name, :tag_name, :image, :price

  with_options presence: true do
    validates :tag_name 
    validates :name
  end
  validates :price, numericality: { only_integer: true }

  def save
    menu = Menu.create(name: name, price: price, image: image)
    tag = Tag.where(name: tag_name).first_or_initialize
    tag.save

    MenuTagRelation.create(menu_id: menu.id, tag_id: tag.id)
  end

end