class ApiRecipesController < ApplicationController
  before_action :authenticate!, except: [:index, :show]

  def show
    @api_recipe = ApiRecipe.from_id(params[:id])
  end
end
