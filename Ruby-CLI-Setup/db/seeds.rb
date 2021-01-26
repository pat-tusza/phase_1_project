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
vodka = Ingredient.create(name: "Vodka")
tequila = Ingredient.create(name: "Tequila")
whisky = Ingredient.create(name: "Whisky")
dk_rum = Ingredient.create(name: "Dark Rum")
lt_rum = Ingredient.create(name: "Light Rum")
gin = Ingredient.create(name: "Gin")
agave = Ingredient.create(name: "Agave Syrup")
simp_syrup = Ingredient.create(name: "Simple Syrup")
sour = Ingredient.create(name: "Sour mix")
t_sec= Ingredient.create(name: "Triple Sec")
l_juice= Ingredient.create(name: "Lemon Juice")
i_cube= Ingredient.create(name: "Ice Cube")
tonic= Ingredient.create(name: "Tonic")
cherry= Ingredient.create(name: "Cherry")
lime= Ingredient.create(name: "Lime")
cran_juice= Ingredient.create(name: "Cranberry Juice")
orange_juice= Ingredient.create(name: "Orange Juice")
lime_juice= Ingredient.create(name: "Lime Juice")


puts "🥃 🥃 🥃 🥃 "

######## Moods ########
happy = Mood.create(mood_name: "Happy")
sad  = Mood.create(mood_name: "Sad")
tense  = Mood.create(mood_name: "Tense")
frisky  = Mood.create(mood_name: "Frisky")
excited  = Mood.create(mood_name: "Excited")

puts " 🙃🙃🙃🙃🙃  "

########### Recipes #######
gin_and_tonic = Recipe.create(name: "Gin and Tonic", mood_id: 1)
create_recipe_joins(gin_and_tonic, [gin, tonic])
long_island = Recipe.create(name: "Long Island Iced Tea", mood_id: 3)
create_recipe_joins(long_island, [gin, tonic])
screw_driver = Recipe.create(name: "Screw Driver", mood_id: 1)
create_recipe_joins(screw_driver, [vodka, orange_juice])
whisky_sour = Recipe.create(name: "Whisky sour", mood_id: 5)
create_recipe_joins(whisky_sour, [whisky, sour])
margarita = Recipe.create(name: "Margarita", mood_id: 4)
create_recipe_joins(margarita, [tequila, simp_syrup, lime_juice])


puts "🌶🌶🌶🌶🌶🌶 "

####### User ######
patrick = User.create(name: "Patrick", pass: "1234")
mike = User.create(name: "Mike", pass: "we did it joe")
chase = User.create(name: "Chase", pass: "flatiron321")
eric = User.create(name: "Eric", pass: "follow deliverables")
sylwia = User.create(name: "Sylwia", pass: "dum dum")

puts "🎮🎮🎮 "

####### Dummy UserMood data (delete when done testing please =) ) #########

UserMood.create(user_id: 1, mood_id: 4)
UserMood.create(user_id: 2, mood_id: 3)
UserMood.create(user_id: 3, mood_id: 5)
UserMood.create(user_id: 4, mood_id: 1)
UserMood.create(user_id: 5, mood_id: 1)

puts "🥳 🥳 🥳 🥳 🥳 🥳"


puts "🔥 🔥 🔥 🔥 "