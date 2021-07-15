class MenuTagRelation < ApplicationRecord
  belongs_to :menu
  belongs_to :tag
end
