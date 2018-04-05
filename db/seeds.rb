Category.destroy_all
c1 = Category.create :title => 'Beverages', :image => 'https://i.imgur.com/Pi5cPPG.jpg'

Ingredient.destroy_all
i1 = Ingredient.create :name => 'Kahlua'
i2 = Ingredient.create :name => 'Absolut Vodka'

Recipe.destroy_all
r1 = Recipe.create :title => 'Black Russian', :description => 'Pour over ice', :image => 'https://www.kahlua.com/globalassets/classic-cocktails/black-russian/kahlua-black-russian-highlighted.png/CocktailHighlight'

User.destroy_all
u1 = User.create :name => 'Neek', :email => 'neek.webdev@gmail.com', :image => 'https://i.imgur.com/nUyk4Db.jpg?1', :password => 'chicken', :admin => true
u2 = User.create :name => 'Monique', :email => 'moniquelee.webdev@gmail.com', :image => 'https://i.imgur.com/WYaJ5dS.jpg?1', :password => 'chicken'


#Categories and recipes
c1.recipes << r1

#Recipes and users
u1.recipes << r1

#Recipes and ingredients
r1.ingredients << i1 << i2
