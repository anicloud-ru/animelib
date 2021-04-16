FactoryBot.define do
  factory :genre do
    sequence(:canonical) { |n| "genre_#{n}" }
    sequence(:russian) { |n| "жанр_#{n}" }
  end
end
