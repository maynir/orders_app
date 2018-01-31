class OrderItemsController < ApplicationController
  def create
    @order_item = OrderItem.new({order_id: current_order.id}.merge(order_item_params))

    respond_to do |format|
      if @order_item.save
        flash[:notice] = "New item to your order."
        format.html { redirect_to controller: :menu_items, action: :index}
        format.json { render 'menu_items/index', status: :created }
      else
        flash[:alert] = @order_item.errors.full_messages.join(', ')
        format.html { redirect_to controller: :menu_items, action: :index}
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @order_item = OrderItem.new(order_id: current_order.id, menu_item_id: params[:menu_item_id])
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

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def order_item_params
    params.require(:order_item).permit(:quantity, :menu_item_id)
  end
end
