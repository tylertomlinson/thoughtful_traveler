FactoryBot.define do
  factory :user do
    full_name  { Faker::Name.full_name }
    email { Faker::Internet.email }
  end
end
