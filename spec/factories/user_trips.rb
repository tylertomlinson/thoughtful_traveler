FactoryBot.define do
  factory :user_trip do
    association :user, factory: :user
    association :trip, factory: :trip
  end
end
