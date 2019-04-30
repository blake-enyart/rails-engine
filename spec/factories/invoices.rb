FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status { 1 }
  end
end
