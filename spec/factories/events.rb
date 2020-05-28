FactoryBot.define do
  factory :event do
    name  { Faker::Name.name }
    association :place, factory: :place
    date { Faker::Date.forward(days: 10) }
  end
end
