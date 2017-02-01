class Recipe < ApplicationRecord
  has_many :ingredients
  require 'spoonacular/api/search'
end
