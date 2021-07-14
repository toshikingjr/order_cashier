class OrdersController < ApplicationController
  before_action :setup_order_menu!, only: [:add_item, :update_item, :delete_item]

  def my_order
    @order_menus = current_order.menu_orders.includes([:menu])
    @total = @order_menus.inject(0){ |sum, item| sum + item.sum_of_price }
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_menu
    @menu_order ||= MenuOrder.new(order_id: current_order.id, menu_id: params[:menu_id])
    @menu_order.quantity += params[:quantity].to_i
    if @menu_order.save
      flash[:notice] = '注文を追加しました'
      redirect_to my_order_path
    else
      flash[:alert] = '注文の追加に失敗しました'
      redirect_to menu_url(params[:menu_id])
    end
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_menu
    @order_menu.update(quantity: params[:quantity].to_i)
    redirect_to my_order_path
  end

  # カート詳細画面から、「削除」を押した時のアクション
  def delete_menu
    @order_menu.destroy
    redirect_to my_order_path
  end

  private

  def setup_order_menu!
    @order_menu = current_order.order_menus.find_by(menu_id: params[:menu_id])
  end
end
