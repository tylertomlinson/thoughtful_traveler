FactoryBot.define do
  factory :user do
    user_name { Faker::Name.name }
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password_digest { "12345"}
  end
end
