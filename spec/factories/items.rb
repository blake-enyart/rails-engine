FactoryBot.define do
  factory :item do
    merchant
    sequence(:name) { |n| "name_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
    sequence(:unit_price) { |n| "#{n}".to_i }
  end
end
