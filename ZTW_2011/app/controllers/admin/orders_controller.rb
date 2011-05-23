class Admin::OrdersController < AdminController

  # GET /orders/1
  def show
    @order = Order.find(params[:id])
  end

  # PUT /orders/1
  def update
    @order = Order.find(params[:id])
    @order.finishTime = DateTime.now
    render :action => 'show'
  end

end
