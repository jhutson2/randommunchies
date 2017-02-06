class ApiRecipe
  include ActiveModel
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include ActiveModel::Model

  attr_accessor :id, :title, :image, :imageType, :usedIngredientCount, :missedIngredientCount, :likes, :readyInMinutes

  def initialize(hash)
    @id = hash["id"]
    @title = hash["title"]
    @image = hash["image"]
    @imageType = hash["imageType"]
    @usedIngredientCount = hash["usedIngredientCount"]
    @missedIngredientCount = hash["missedIngredientCount"]
    @likes = hash["likes"]
    @readyInMinutes = hash["readyInMinutes"]
  end

  def self.search(ingredients)
    api = Spoonacular::API.new(ENV["SPOONACULAR_KEY"])
    results = api.find_by_ingredients(ingredients)

    results.body.map { |hash| ApiRecipe.new(hash) }
  end

  def self.to_partial_path
    "api_recipes/api_recipe"
  end

  def to_partial_path
    "api_recipes/api_recipe"
  end

  def persisted?
    true
  end

  def self.from_id(id)
    method = "/recipes/#{id}/information"
    uri = Spoonacular.build_endpoint(method, "")
    response = Spoonacular.get({key: ENV["SPOONACULAR_KEY"], uri: uri})

    ApiRecipe.new(response.body)
  end

  def recipe_information
    @recipe_information ||= Spoonacular::API.new(ENV["SPOONACULAR_KEY"]).get_recipe_information(@id).body
  end

  def instructions
    recipe_information["analyzedInstructions"].flat_map { |instruction| instruction["steps"].map { |step| step["step"] } }
  end

  def ingredients
    recipe_information["extendedIngredients"].map { |ingredient| ingredient["originalString"] }
  end
end
