FactoryGirl.define do
  factory :token do
    expires_at DateTime.now + 5.minute
    association :user, factory: :user
    token { Faker::Lorem.characters(10) }
  end
end
