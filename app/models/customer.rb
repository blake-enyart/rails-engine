class Customer < ApplicationRecord
  has_many :invoices

  scope :sorted, -> { order(id: :asc) }

  def self.favorite_merchant(customer_id)
    Merchant.joins(invoices: [:customer, :transactions])
            .select('merchants.*, SUM(transactions.result) AS results_count')
            .group(:id)
            .order('results_count DESC')
            .where(transactions: {result: 1}, customers: {id: customer_id})
            .first
  end
end
