class Customer < ApplicationRecord
  has_many :invoices

  def self.best_customer_for_merchant(merchant_id)
     joins(invoices: :transactions)
     .where(invoices: {merchant_id: merchant_id}, transactions: {result: 1})
     .select('customers.*, SUM(transactions.result) AS transaction_count')
     .group(:id)
     .order('transaction_count DESC')
     .first
  end

  def self.favorite_merchant(customer_id)
    Merchant.joins(invoices: [:customer, :transactions])
            .select('merchants.*, SUM(transactions.result) AS results_count')
            .group(:id)
            .order('results_count DESC')
            .where(transactions: {result: 1}, customers: {id: customer_id})
            .first
  end
end
