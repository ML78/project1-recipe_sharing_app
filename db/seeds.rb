Category.destroy_all
c1 = Category.create :title => 'Beverages'

Ingredient.destroy_all
i1 = Ingredient.create :name => 'Kahlua'
i2 = Ingredient.create :name => 'Absolut Vodka'

Recipe.destroy_all
r1 = Recipe.create :title => 'Black Russian'

User.destroy_all
u1 = User.create :name => 'Monique'
u2 = User.create :name => 'Neek', :email => 'neek.webdev@gmail.com', :image => 'https://i.imgur.com/nUyk4Db.jpg?1', :password => 'chicken', :admin => true

#Categories and recipes
c1.recipes << r1

#Recipes and users
u1.recipes << r1

#Recipes and ingredients
r1.ingredients << i1 << i2
