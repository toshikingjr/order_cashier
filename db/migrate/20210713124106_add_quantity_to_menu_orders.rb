class AddQuantityToMenuOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_orders, :quantity, :integer, default: 0
  end
end
