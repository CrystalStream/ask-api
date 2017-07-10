FactoryGirl.define do
  factory :user do
    email { Faker::Internet.safe_email }
    name { Faker::Name.name }
    provider { Faker::Company.name }
    uid { Faker::Number.number(10) }
  end
end
