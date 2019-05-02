class Customer < ApplicationRecord
  has_many :invoices

  def self.best_customer_for_merchant(merchant_id)
     joins(invoices: :transactions)
     .where(invoices: {merchant_id: merchant_id}, transactions: {result: 1})
     .select('customers.*, SUM(result) AS transaction_count')
     .group(:id)
     .order('transaction_count DESC')
     .first
  end
end
