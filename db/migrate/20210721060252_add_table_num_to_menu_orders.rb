class AddTableNumToMenuOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_orders, :table_num, :string
  end
end
