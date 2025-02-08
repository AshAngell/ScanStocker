# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

flour = Item.create(brand: "Woolworths Select", name: "Plain Flour", units: "kg")

Size.create(item: flour, amount: 1)
Size.create(item: flour, amount: 2)

soda = Item.create(name: "Diet Soda", units: "mL")

Size.create(item: soda, amount: 355)


