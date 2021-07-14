class RemoveQuantityFromMenuOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_orders, :quantity, :integer
  end
end
