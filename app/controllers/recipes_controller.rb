class RecipesController < ApplicationController
  # GET /recipes
  before_action :authenticate!, except: [:index, :show]

  def index
    if params[:search]
      ingredients = params[:search].split(",")

      @recipes = ApiRecipe.search(ingredients).to_a

      ingredients.each do |ingredient|
        match = "%#{ingredient}%"

        @recipes.concat(Recipe.where("name ilike ?", match))
        %w{meat vegetable seasoning grain fruit}.each do |kind|
          @recipes.concat(Recipe.joins(:ingredients).where("ingredients.#{kind} ilike ?", match))
        end
      end
      Rails.logger.info ["COUNT", @recipes.size]
    else
      @recipes = Recipe.all
    end
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients
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
      redirect_to new_recipe_ingredient_path(@recipe)
    else
      render :new
    end
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
      params.require(:recipe).permit(:name, :instructions, :recipe_image)
    end
end
