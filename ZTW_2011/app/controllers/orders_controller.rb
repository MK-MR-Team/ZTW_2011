class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
	@menu_link_text = 'Add'
	@menu_link_controller = 'orders'
	@menu_link_action = 'new'
	if params[:command] != nil then
		if params[:command] == 'clear' then
			session[:pizzas] = nil
		end
	end
	session[:pizzas] = session[:pizzas] != nil ? session[:pizzas] : []
	if params[:recipe_id] != nil then
		recipe = Recipe.find_by_id(params[:recipe_id])
		pizza = recipe.pizzas.build
		session[:pizzas] << pizza
	end
    @pizzas = session[:pizzas]
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])
    @order.pizzas = session[:pizzas]
    @order.user = logged_user if user_logged?
    if @order.save
       session[:pizzas] = nil
       redirect_to(:user_orders)
    else
      render :action => "confirm"
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  def confirm
    @pizzas = session[:pizzas]
    if @pizzas.nil? || @pizzas.empty? then
      redirect_to(new_order_url, :command => "clear") and return
    end
    @order = Order.new
    if user_logged? then
      rewrite_user_data_to_order
    end
    @order.pizzas = @pizzas
  end

  def user_orders
    @user_logged = user_logged?
    if @user_logged then
      @orders = Order.where(:user_id => session[:user_id])
    end
  end

  private

  def rewrite_user_data_to_order
    user = logged_user
    @order.firstName = user.firstName
    @order.surname = user.surname
    @order.address = user.address
    @order.phone = user.phone
    @order.email = user.email
  end
end
