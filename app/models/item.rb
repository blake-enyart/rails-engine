class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    joins(invoice_items: {invoice: :transactions})
    .where(transactions: {result: 1 })
    .select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoice_items: {invoice: :transactions})
    .where(transactions: {result: 1 })
    .select("items.*, SUM(invoice_items.quantity) as most_items")
    .group(:id)
    .order("most_items DESC")
    .limit(quantity)
  end
end
