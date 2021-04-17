FactoryBot.define do
  factory :arc do
    sequence(:name) { |n| "arc_#{n}" }
    number {1}
    series { '{1,2}' }
    anime { create :anime }
  end
end

