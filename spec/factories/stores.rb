# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    kind { 1 } # Ajuste conforme necessário
    theme { 1 } # Ajuste conforme necessário
    payroll_day { Faker::Number.between(from: 1, to: 28) }
    administrator { association :admin }
    logo { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/logo.jpg'), 'image/jpeg') }
    name { Faker::Company.name }
    facebook { "https://www.facebook.com/#{Faker::Internet.username(specifier: 5..8)}" }
    instagram { "https://www.instagram.com/#{Faker::Internet.username(specifier: 5..8)}" }
    twitter { "https://twitter.com/#{Faker::Internet.username(specifier: 5..8)}" }
  end
end
