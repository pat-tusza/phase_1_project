class Recipe < ActiveRecord::Base

    belongs_to :mood
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def self.random_recipe(id_num)
        random = self.where(mood_id: id_num)
        random.sample
    end
    
end