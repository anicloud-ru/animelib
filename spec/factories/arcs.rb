FactoryBot.define do
  factory :arc do
    sequence(:russian) { |n| "арка_#{n}" }
    sequence(:canonical) { |n| "arc_#{n}" }
    number {1}
    episodes { '{1,2}' }
    anime { create :anime }
  end
end

