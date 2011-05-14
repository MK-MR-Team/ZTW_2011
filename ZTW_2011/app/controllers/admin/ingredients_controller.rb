class Admin::IngredientsController < AdminController
  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  def show
    @ingredient = Ingredient.find(params[:id])
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  # POST /ingredients
  # POST /ingredients.xml
  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      redirect_to admin_ingredient_url(@ingredient), :notice => 'Ingredient was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /ingredients/1
  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(params[:ingredient])
      redirect_to admin_ingredient_url(@ingredient), :notice => 'Ingredient was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to admin_ingredients_url
  end
end