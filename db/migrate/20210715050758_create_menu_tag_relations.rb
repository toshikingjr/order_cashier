class CreateMenuTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_tag_relations do |t|
      t.references :menu, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
