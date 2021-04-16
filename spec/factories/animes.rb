FactoryBot.define do
  factory :anime do
    sequence(:canonical) { |n| "anime_#{n}" }
    sequence(:russian) { |n| "аниме_#{n}" }
    description_ru { '' }
    description_en { '' }
    episodes_number{ 0 }
    duration { 0 }
    score { 1 }
    kind { :tv }
    status { :released }
    franchise { nil }
    age_rating { :pg_13 }
    genres_ids { '{}' }
  end
end
