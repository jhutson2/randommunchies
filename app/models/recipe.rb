class Recipe < ApplicationRecord
  has_many :ingredients
  require 'spoonacular/api/search'

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("content LIKE ?", "%#{search}%")
  end
end
