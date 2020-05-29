FactoryBot.define do
  factory :user do
    full_name  { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
