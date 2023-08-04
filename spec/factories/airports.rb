FactoryBot.define do
  factory :airport do
    sequence(:code) { |n| "CODE#{n}" }
    sequence(:name) { |n| "Airport #{n}" }
  end
end
