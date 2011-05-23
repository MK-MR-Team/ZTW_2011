# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
mushroom = Ingredient.create(:name => 'mushroom', :price => 200)
onion = Ingredient.create(:name => 'onion', :price => 250)
corn = Ingredient.create(:name => 'corn', :price => 300)
olives = Ingredient.create(:name => 'olives', :price => 300)
pepper = Ingredient.create(:name => 'pepper', :price => 300)
chicken = Ingredient.create(:name => 'chicken', :price => 400)
bacon = Ingredient.create(:name => 'bacon', :price => 400)
ham = Ingredient.create(:name => 'ham', :price => 450)
margerita = Recipe.create(:name => "Margherita", :price=> 950, :description => "Classic Mozarella & fresh tomatoes sauce taste makes this pizza one of the most famous pizzas of the world")
funghi = Recipe.create(:name => "Funghi", :price => 1200, :description => "Margherita and mushrooms creates together great composition for people who appreciate simplicity and taste")
funghi.ingredients << mushroom
capriciosa = Recipe.create(:name => "Capriciosa", :price => 1450, :description => "One of the most popular pizzas in our menu, ham and pizza composition makes this piza not only look delicious, but also be tasty")
capriciosa.ingredients << mushroom
capriciosa.ingredients << ham
User.create(
  :login => "admin",
  :password => "admin",
  :password_confirmation => "admin",
  :firstName => "Administrator",
  :surname => "Pizzerii",
  :address => "ul. Dluga St. 71, 53-045 Wroclaw",
  :phone => "07112345678",
  :admin => true)
order1 = Order.create(
	:firstName  => 'Jacek',
	:surname => 'Domek',
	:address => 'Wrocław 23-324, ul. Kapajaka 12/12',
	:email => 'asdas@wa.pl',
	:phone => '432522634'
)
order1.pizzas << Recipe.pizzas.new
