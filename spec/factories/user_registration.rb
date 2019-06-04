FactoryBot.define do
  factory :user_registration, class: User do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end
