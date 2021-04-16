FactoryBot.define do
  factory :hashtag do
    sequence(:name) { |n| "Hashtag_#{n}" }
  end
end