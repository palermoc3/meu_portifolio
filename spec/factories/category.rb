FactoryBot.define do
    factory :category do
      name { Faker::Commerce.department }
      association :department, factory: :department
    end
  end