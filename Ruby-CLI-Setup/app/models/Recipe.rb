class Recipe < ActiveRecord::Base

    belongs_to :mood
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
end
