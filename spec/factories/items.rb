FactoryBot.define do
  factory :item do
    merchant
    sequence(:name) { |n| "name_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
    sequence(:unit_price) { |n| (n + 1) * 2 }
  end
end
