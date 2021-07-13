class OrdersController < ApplicationController
  before_action :setup_order_menu!, only: [:add_item, :update_item, :delete_item]

  def show
    @order_menus = current_order.order_menus
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_item
    @order_menu = current_order.order_menus.build(menu_id: params[:menu_id])

    @order_menu.quantity += params[:quantity].to_i
    @order_menu.save
    redirect_to current_order
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @order_menu.update(quantity: params[:quantity].to_i)
    redirect_to current_order
  end

　# カート詳細画面から、「削除」を押した時のアクション
  def delete_item
    @order_menu.destroy
    redirect_to current_order
  end

  private

  def setup_order_menu!
    @order_menu = current_order.order_menus.find_by(menu_id: params[:menu_id])
  end
end
