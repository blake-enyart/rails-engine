FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    sequence(:quantity) { |n| (n + 1) * 2 }
    sequence(:unit_price) { |n| n }
  end
end
