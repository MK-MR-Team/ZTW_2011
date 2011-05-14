class OrdersController < ApplicationController
  # GET /orders
  def index
    @user_logged = user_logged?
    if @user_logged then
      @orders = Order.where(:user_id => session[:user_id])
    end
  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  # POST /orders/new
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

  # POST /orders
  def create
    @order = Order.new(params[:order])
    @order.pizzas = session[:pizzas]
    @order.user = logged_user if user_logged?
    if @order.save
       session[:pizzas] = nil
       redirect_to orders_url
    else
      render :action => "confirm"
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