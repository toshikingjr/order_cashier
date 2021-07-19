class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  helper_method :current_order

  def current_order
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
    end
    @order
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
