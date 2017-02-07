class IngredientsController < ApplicationController
  # GET /ingredients
   before_action :authenticate!, except: [:index, :show]

  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  def show
    @ingredient = Ingredient.find(params[:id])
    @ingredient.recipes
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
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient, notice: 'Ingredient was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:meat, :vegetable, :seasoning, :grain, :fruit, :recipe_reference)
    end
end
