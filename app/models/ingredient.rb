class Ingredient < ApplicationRecord
  belongs_to :recipe, required: false
end
