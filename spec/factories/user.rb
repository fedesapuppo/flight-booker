FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "fedesapu#{n}@test.com" }
    sequence(:password) { |n| "123456#{n}" }
  end
end
