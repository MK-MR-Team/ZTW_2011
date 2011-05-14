class PizzasController < ApplicationController
  # GET /pizzas
  def index
    @menu_link_text = 'Order'
    @menu_link_controller = 'orders'
    @menu_link_action = 'new'
  end

  # GET /pizzas/1/edit
  def edit
    @index = params[:id]
    @pizza = get_pizza_from_session
    redirect_to(new_order_url) if @pizza.nil?
  end

  # PUT /pizzas/1
  def update
    index = params[:id].to_i
    pizza = session[:pizzas][index]
    ingredient = Ingredient.find(params[:ingredient].to_i)
    if pizza.ingredients.include?(ingredient) then
      pizza.ingredients.delete(ingredient)
    else
      pizza.ingredients << ingredient
    end
    session[:pizzas][index] = pizza
    redirect_to edit_pizza_url(index)
  end

  # DELETE /pizzas/1
  # DELETE /pizzas/1.xml
  def destroy
    session[:pizzas].delete(get_pizza_from_session)
    redirect_to(new_order_url)
  end

  private

  def get_pizza_from_session
    session[:pizzas][params[:id].to_i]
  end

end
