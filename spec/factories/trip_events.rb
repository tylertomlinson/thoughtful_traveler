FactoryBot.define do
  factory :trip_event do
    association :trip, factory: :trip
    association :event, factory: :event
  end
end
