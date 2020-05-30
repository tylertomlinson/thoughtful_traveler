FactoryBot.define do
  factory :trip do
    start_date  { Faker::Date.forward(days: 5) }
    end_date    { Faker::Date.forward(days: 10) }
    place_id { nil }
    user_id { nil }
  end
end
