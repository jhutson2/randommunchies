class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all
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
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def initialize(key)
    @key ||= key
  end

  def find_by_ingredients(ingredients, options={})
    method = "/recipes/findByIngredients"
    query = "ingredients=#{ingredients.querify}&#{options.querify}"
    uri = Spoonacular.build_endpoint(method, query)
    response = Spoonacular.get({key: @key, uri: uri, accept_json: true})
    return response
  end

  def search_recipes(options={})
    method = "/recipes/search"
    query = "#{options.querify}"
    uri = Spoonacular.build_endpoint(method, query)
    response = Spoonacular.get({key: @key, uri: uri})
    return response
  end

  # PATCH/PUT /recipes/1
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:name, :protein, :vegetables, :seaoning, :instrucions)
    end
end
