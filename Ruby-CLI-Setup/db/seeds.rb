# THIS SEED FILE NEEDS TO BE ENTIRELY REPLACED -- I'M LEAVING CODE FOR YOUR REFERENCE ONLY!

User.destroy_all
Mood.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
UserMood.destroy_all
RecipeIngredient.destroy_all

Ingredient.reset_pk_sequence
UserMood.reset_pk_sequence
RecipeIngredient.reset_pk_sequence
User.reset_pk_sequence
Mood.reset_pk_sequence
Recipe.reset_pk_sequence


def create_recipe_joins(recipe, ingredient_array)
    ingredient_array.each{|ingredient| RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)}
end

########### Ingredients ############
vodka = Ingredient.create(name: "Vodka")
tequila = Ingredient.create(name: "Tequila")
whiskey = Ingredient.create(name: "Whiskey")
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
orange_garnish= Ingredient.create(name: "Orange Twist Garnish")
borboun= Ingredient.create(name: "Borboun")
bitters= Ingredient.create(name: "Bitters")
cointreau= Ingredient.create(name: "Cointreau")
ginger_beer= Ingredient.create(name: "Ginger Beer")
vermouth= Ingredient.create(name: "Vermouth")
sugar= Ingredient.create(name: "Sugar")
cognac= Ingredient.create(name: "Cognac")
mint_leaves= Ingredient.create(name: "Mint Leaves")
olive= Ingredient.create(name: "Olive")
champagne= Ingredient.create(name: "Champagne")




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
create_recipe_joins(long_island, [t_sec, tequila, vodka,gin])
screw_driver = Recipe.create(name: "Screw Driver", mood_id: 1)
create_recipe_joins(screw_driver, [vodka, orange_juice])
whiskey_sour = Recipe.create(name: "Whiskey sour", mood_id: 5)
create_recipe_joins(whiskey_sour, [whiskey, sour])
margarita = Recipe.create(name: "Margarita", mood_id: 4)
create_recipe_joins(margarita, [tequila, simp_syrup, lime_juice])
old_fashioned = Recipe.create(name: "Old Fashioned", mood_id: 3)
create_recipe_joins(old_fashioned, [whiskey, bitters, orange_garnish, i_cube])
cosmopolitan = Recipe.create(name: "Cosmopolitan", mood_id: 4)
create_recipe_joins(cosmopolitan, [vodka, cointreau, lime_juice, cran_juice])
moscow_mule = Recipe.create(name: "Moscow Mule", mood_id: 5)
create_recipe_joins(moscow_mule, [ginger_beer, vodka, lime_juice])
martini = Recipe.create(name: "Martini", mood_id: 1)
create_recipe_joins(martini, [vodka, vermouth, olive])
mojito= Recipe.create(name: "Mojito", mood_id: 3)
create_recipe_joins(mojito, [mint_leaves, lt_rum, lime_juice, simp_syrup])
french_seven_five= Recipe.create(name: "French 75", mood_id: 4)
create_recipe_joins(french_seven_five, [l_juice, champagne, gin, simp_syrup])
manhattan= Recipe.create(name: "Manhattan", mood_id: 5)
create_recipe_joins(manhattan, [whiskey, vermouth, bitters])
gimlet= Recipe.create(name: "Gimlet", mood_id: 1)
create_recipe_joins(gimlet, [vodka, simp_syrup, lime_juice])
mimosa= Recipe.create(name: "Mimosa", mood_id: 3)
create_recipe_joins(mimosa, [champagne, orange_juice])
sidecar= Recipe.create(name: "Sidecar", mood_id: 4)
create_recipe_joins(sidecar, [cognac, cointreau, l_juice])
mint_julep= Recipe.create(name: "Mint Julep", mood_id: 5)
create_recipe_joins(mint_julep, [mint_leaves, borboun, simp_syrup])
daiquiri= Recipe.create(name: "Daiquiri", mood_id: 1)
create_recipe_joins(daiquiri, [lt_rum, lime_juice, simp_syrup])
dark_and_stormy= Recipe.create(name: "Dark and Stormy", mood_id: 3)
create_recipe_joins(dark_and_stormy, [dk_rum, ginger_beer])








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