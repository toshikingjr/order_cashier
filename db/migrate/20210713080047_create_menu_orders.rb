class CreateMenuOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_orders do |t|
      t.integer :quantity, defoult: 0
      t.references :menu, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
