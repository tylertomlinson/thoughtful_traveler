FactoryBot.define do
  factory :place do
    google_place_id { Faker::Number.number(digits: 10) }
    name { Faker::Comany.name }
    address { Faker::Address.full_address }
  end
end
