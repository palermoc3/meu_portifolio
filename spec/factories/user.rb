FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    cpf { CPF.generate }
    email { Faker::Internet.email }
    state { "RJ" }
    cep { "21750230" }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    password { "pedro@pedro" }
    password_confirmation { "pedro@pedro" }
    kind { true }
    phone { Faker::PhoneNumber.phone_number }
    role { "2" }
    created_at { Date.today } 
  end
end
