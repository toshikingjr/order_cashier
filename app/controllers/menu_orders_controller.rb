class MenuOrdersController < ApplicationController
  def index
    order_confirms = OrderConfirm.all
    @menu_orders = MenuOrder.where(order_id:order_confirms.map(&:order_id)).where(created_at: Time.zone.today.beginning_of_day...Time.zone.today.end_of_day)
    respond_to do |format|
      format.html
      format.json{@new_menu_orders = MenuOrder.where('id > ?', params[:menu_order][:id]).where(order_id: order_confirms.map(&:order_id))}
    end
  end
end
