class OrderItemsController < ApplicationController
  def create
    @order_item = OrderItem.new(order_id: current_order.id, menu_item_id: params[:menu_item_id])

    respond_to do |format|
      if @order_item.save
        flash[:notice] = "New item to your order."
        format.html { redirect_to controller: :menu_items, action: :index}
        format.json { render 'menu_items/index', status: :created }
      else
        format.html { redirect_to controller: :menu_items, action: :index}
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    OrderItem.delete params[:id]
    respond_to do |format|
      format.html { redirect_to "/orders/#{current_order.id}", notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
