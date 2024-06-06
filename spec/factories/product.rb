# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product#{n}" }
    weight { 0.5 }
    width { 1.2 }
    length { 0.6 }
    depth { 0.2 }
    quantity { 20 }
    valueBuy { Faker::Commerce.price(range: 10.0..49.0, as_string: false).to_f }
    valueSell { Faker::Commerce.price(range: (valueBuy + 1.0)..(valueBuy + 20.0), as_string: false).to_f }
    description { Faker::Lorem.sentence(word_count: 3) }
    association :category, factory: :category
  end
end
