if @new_menu_orders.present?
  json.array! @new_menu_orders do |menu_order|
    json.id menu_order.id
    json.menu_id menu_order.menu_id
    json.order_id menu_order.order_id
    json.created_at menu_order.created_at
    json.quantity menu_order.quantity
    json.table_num menu_order.table_num
    json.menu_name menu_order.menu.name
  end
end
