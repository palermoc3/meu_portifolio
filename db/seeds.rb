# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
toys = Department.create!(name: 'Toys')

fem = Category.create!(name: 'brinquedo fem', department_id: toys.id)

(1..21).each do |_i|
    value_buy = Faker::Commerce.price(range: 10.0..49.0, as_string: false).to_f
    value_sell = Faker::Commerce.price(range: (value_buy + 1.0)..(value_buy + 20.0), as_string: false).to_f
  
    Product.create!(
      name: Faker::Commerce.product_name,
      weight: 0.5,
      width: 1.2,
      length: 0.6,
      depth: 0.2,
      quantity: 20,
      valueSell: value_sell,
      valueBuy: value_buy,
      description: Faker::Lorem.sentence(word_count: 3),
      category_id: fem.id,
      photo1: File.open("app/assets/images/#{rand(1..9)}.jpeg"),
      photo2: File.open("app/assets/images/#{rand(1..9)}.jpeg"),
      photo3: File.open("app/assets/images/#{rand(1..9)}.jpeg")
    )
  end
  