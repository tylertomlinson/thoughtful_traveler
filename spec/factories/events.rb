FactoryBot.define do
  factory :event do
    name  { Faker::Restaurant.name }
    date { Faker::Date.forward(days: rand(5..10)) }
    location { nil }
    genre { Faker::Restaurant.type }
  end
end
