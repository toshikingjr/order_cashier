class OrderConfirmsController < ApplicationController
  def create
    @order_confirm = OrderConfirm.new(order_confirm_params)
    @order = Order.find(@order_confirm.order_id)
    if @order_confirm.save
      session.delete(:order_id)
    else
      render "orders/my_order"
    end
  end
  def destroy
    
  end

  private

  def order_confirm_params
    params.require(:order_confirm).permit(:order_id).merge(table_id: params[:table_id])
  end
end
