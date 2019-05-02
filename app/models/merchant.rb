class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 1 })
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 1 })
    .select("merchants.*, SUM(invoice_items.quantity) as most_items")
    .group(:id)
    .order("most_items DESC")
    .limit(quantity)
  end
end
