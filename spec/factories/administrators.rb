# frozen_string_literal: true

FactoryBot.define do
  factory :administrator do
    user
    cnpj { Faker::Number.number(digits: 14) }
  end
end
