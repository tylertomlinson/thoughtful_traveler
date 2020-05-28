FactoryBot.define do
  factory :user do
    name  { Faker::Name.full_name }
    email { Faker::Internet.email }
  end
end
