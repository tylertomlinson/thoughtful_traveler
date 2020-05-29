FactoryBot.define do
  factory :place do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
  end
end
