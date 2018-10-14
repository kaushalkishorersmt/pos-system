# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create(name: "Coffee", price: 100)
Item.create(name: "Tea", price: 75)
Item.create(name: "Chicken Sandwich", price: 150)
Item.create(name: "Veg Sandwich", price: 125)

# 1) Coffee (Rs. 100, #Coffee #Beverage)
# 2) Tea (Rs. 75, #Tea #Beverage)
# 3) Chicken Sandwich (Rs. 150, #Sandwich #Food #Bread #Non-Veg #Chicken) 4) Chocolate Cake (Rs. 125, #Chocolate #Cake #Dessert)
# 5) Veg Sandwich (Rs. 125, #Sandwich #Food #Bread #Veg)
