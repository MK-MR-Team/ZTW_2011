class Admin::RecipesController < AdminController
  # GET /admin/recipes
  def index
    @recipes = $recipies
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to admin_recipe_url(@recipe), :notice => 'Recipe was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /recipes/1
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to admin_recipe_url(@recipe), :notice => 'Recipe was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to(admin_recipes_url)
  end
end
