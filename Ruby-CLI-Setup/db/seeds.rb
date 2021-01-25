# THIS SEED FILE NEEDS TO BE ENTIRELY REPLACED -- I'M LEAVING CODE FOR YOUR REFERENCE ONLY!

User.destroy_all
Mood.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
UserMood.destroy_all
RecipeIngredients.destroy_all

Ingredient.reset_pk_sequence
UserMood.reset_pk_sequence
RecipeIngredients.reset_pk_sequence
User.reset_pk_sequence
Mood.reset_pk_sequence
Recipe.reset_pk_sequence


def create_recipe_joins(recipe, ingredient_array)
    ingredient_array.each{|ingredient| RecipeIngredients.create(recipe_id: recipe.id, ingredient_id: ingredient.id)}
end

########### Ingredients ############
vodka = Ingredient.create("Vodka")
tequila = Ingredient.create("Tequila")
whisky = Ingredient.create("Whisky")
dk_rum = Ingredient.create("Dark Rum")
lt_rum = Ingredient.create("Light Rum")
gin = Ingredient.create("Gin")
agave = Ingredient.create("Agave Syrup")
simp_syrup = Ingredient.create("Simple Syrup")
sour = Ingredient.create("Sour mix")
t_sec= Ingredient.create("Triple Sec")
l_juice= Ingredient.create("Lemon Juice")
i_cube= Ingredient.create("Ice Cube")
tonic= Ingredient.create("Tonic")
cherry= Ingredient.create("Cherry")
lime= Ingredient.create("Lime")
cran_juice= Ingredient.create("Cranberry Juice")
orange_juice= Ingredient.create("Orange Juice")
lime_juice= Ingredient.create("Lime Juice")


puts "🥃 🥃 🥃 🥃 "

######## Moods ########
happy = Mood.create("Happy")
sad  = Mood.create("Sad")
tense  = Mood.create("Tense")
frisky  = Mood.create("Frisky")
excited  = Mood.create("Excited")

puts " 🙃🙃🙃🙃🙃  "

########### Recipes #######
gin_and_tonic = Recipe.create("Gin and Tonic", 1)
create_recipe_joins(gin_and_tonic, [gin, tonic])
long_island = Recipe.create("Long Island Iced Tea", 3)
screw_driver = Recipe.create("Screw Driver", 1)
whisky_sour = Recipe.create("Whisky sour", 5)
margarita = Recipe.create("Margarita", 4)


puts "🌶🌶🌶🌶🌶🌶 "

####### User ######
patrick = User.create("Patrick", "1234")
mike = User.create("Mike", "we did it joe")
chase = User.create("Chase", "flatiron321")
eric = User.create("Eric", "follow deliverables")
sylwia = User.create("Sylwia", "dum dum")

puts "🎮🎮🎮 "

####### Recipe Ingredients #########









puts "🔥 🔥 🔥 🔥 "