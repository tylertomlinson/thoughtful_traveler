FactoryBot.define do
  factory :trip do
    trait :past_trip do
      start_date  { Faker::Date.backward(days: 5) }
      end_date    { Faker::Date.backward(days: 10) }
      location    { Faker::Address.city }
      user_id { nil }
    end

    trait :upcoming_trip do
      start_date  { Faker::Date.forward(days: 5) }
      end_date    { Faker::Date.forward(days: 10) }
      location    { Faker::Address.city }
      user_id { nil }
    end
  end
end
