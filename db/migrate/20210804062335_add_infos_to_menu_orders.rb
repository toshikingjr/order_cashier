class AddInfosToMenuOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_orders, :age_id, :integer
    add_column :menu_orders, :sex_id, :integer
  end
end
