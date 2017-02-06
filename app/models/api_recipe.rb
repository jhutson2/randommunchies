class ApiRecipe
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

  def to_partial_path
    "api_recipe"
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
