class Recipe < ApplicationRecord
  has_many :ingredients
  require 'spoonacular/api/search'
  require 'spoonacular/api/data'

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
