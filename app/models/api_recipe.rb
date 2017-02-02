class ApiRecipe
  attr_accessor :id, :title, :image, :imageType, :usedIngredientCount, :missedIngredientCount, :likes

  def initialize(hash)
    @id = hash["id"]
    @title = hash["title"]
    @image = hash["image"]
    @imageType = hash["imageType"]
    @usedIngredientCount = hash["usedIngredientCount"]
    @missedIngredientCount = hash["missedIngredientCount"]
    @likes = hash["likes"]
  end

  def to_partial_path
    "api_recipe"
  end
end
