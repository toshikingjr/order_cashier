class OrdersController < ApplicationController
  before_action :setup_order_menu!, only: [:add_menu, :update_menu, :delete_menu]

  def my_order
    @menu_orders = current_order.menu_orders.includes([:menu])
    @total = @menu_orders.inject(0){ |sum, item| sum + item.sum_of_price }
    @order_confirm = OrderConfirm.new
    @table = Table.find(params[:table_id])
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_menu
    @menu_order ||= MenuOrder.new(order_id: current_order.id, menu_id: params[:menu_id], table_num: params[:table_num])
    @menu_order.quantity += params[:quantity].to_i
    if @menu_order.save
      flash[:notice] = '注文を追加しました'
      redirect_to table_my_order_path(params[:table_id])
    else
      flash[:alert] = '注文の追加に失敗しました'
      redirect_to table_menu_url(table_id: params[:table_id], id: params[:menu_id])
    end
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_menu
    @menu_order.update(quantity: params[:quantity].to_i)
    redirect_to table_my_order_path(params[:table_id])
  end

  # カート詳細画面から、「削除」を押した時のアクション
  def delete_menu
    @menu_order.destroy
    redirect_to table_my_order_path(params[:table_id])
  end


  private

  def setup_order_menu!
    @menu_order = current_order.menu_orders.find_by(menu_id: params[:menu_id])
  end
end
