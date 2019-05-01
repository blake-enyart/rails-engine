FactoryBot.define do
  factory :transaction do
    invoice
    sequence(:credit_card_number) { |n| (n + 1000000000000000).to_s }
    credit_card_expiration_date { "2019-04-29" }
    result { 1 }
  end

  factory :failed_transaction, parent: :transaction do
    invoice
    sequence(:credit_card_number) { |n| (n + 1000000000000000).to_s }
    credit_card_expiration_date { "2019-04-29" }
    result { 0 }
  end
end
