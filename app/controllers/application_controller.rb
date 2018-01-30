class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
     Order.find(session[:order_id])
    else
      order = Order.create(user_id: current_user.id)
      session[:order_id] = order.id
      order
    end
  end
end