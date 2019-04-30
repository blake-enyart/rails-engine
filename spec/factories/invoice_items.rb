FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    sequence(:quantity) { |n| "#{n}".to_i }
    sequence(:unit_price) { |n| "#{n}".to_i }
  end
end
