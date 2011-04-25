class PizzasController < ApplicationController
  # GET /pizzas
  # GET /pizzas.xml
  def index
    @pizzas = Pizza.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pizzas }
    end
  end

  # GET /pizzas/1
  # GET /pizzas/1.xml
  def show
    @pizza = Pizza.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pizza }
    end
  end

  # GET /pizzas/new
  # GET /pizzas/new.xml
  def new
    @pizza = Pizza.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pizza }
    end
  end

  # GET /pizzas/1/edit
  def edit
    index = params[:id]
    @index = index
    @pizza = session[:pizzas][index.to_i]
    redirect_to(fake_new_order_url) if @pizza.nil?
  end

  # POST /pizzas
  # POST /pizzas.xml
  def create
    @pizza = Pizza.new(params[:pizza])

    respond_to do |format|
      if @pizza.save
        format.html { redirect_to(@pizza, :notice => 'Pizza was successfully created.') }
        format.xml  { render :xml => @pizza, :status => :created, :location => @pizza }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pizza.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pizzas/1
  # PUT /pizzas/1.xml
  def update
    index = params[:id]
    @pizza = session[:pizzas][index.to_i]

    respond_to do |format|
      if @pizza.update_attributes(params[:pizza])
        format.html { redirect_to(@pizza, :notice => 'Pizza was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pizza.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pizzas/1
  # DELETE /pizzas/1.xml
  def destroy
    @pizza = Pizza.find(params[:id])
    @pizza.destroy

    respond_to do |format|
      format.html { redirect_to(pizzas_url) }
      format.xml  { head :ok }
    end
  end

  def change
    index = params[:id].to_i
    pizza = session[:pizzas][index]
    ingredient = Ingredient.find(params[:ingredient_id].to_i)
    if pizza.ingredients.include?(ingredient) then
      pizza.ingredients.delete(ingredient)
      puts "deleting"
    else
      puts "adding"
      pizza.ingredients << ingredient
    end
    session[:pizzas][index] = pizza
    redirect_to edit_pizza_url(index)
  end

end