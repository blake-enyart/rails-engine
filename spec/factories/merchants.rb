FactoryBot.define do
  factory :merchant do
    sequence(:name) { |n| "name_#{n}" }
  end
end
