FactoryBot.define do
  factory :trip_event do
    association :trip, factory: :trip
    association :place, factory: :place
  end
end
