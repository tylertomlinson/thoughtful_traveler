FactoryBot.define do
  factory :trip_preference do
    association :trip, factory: :trip
    association :preference, factory: :preference
  end
end
