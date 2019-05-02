class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  enum status: [:unshipped, :shipped]

  def self.total_revenue_date(date)
    joins(:transactions, :invoice_items)
    .select('SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue, invoices.updated_at::timestamp::date AS date')
    .group('date')
    .where('invoices.updated_at::timestamp::date = ? AND transactions.result = 1', date)[0]
  end
end
