class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :sorted, -> { order(id: :asc) }

  enum status: [:unshipped, :shipped]

  def self.total_revenue_one_merchant_date(merchant_id,date)
    joins(:transactions, :invoice_items)
    .select('SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue,
             invoices.updated_at::timestamp::date AS date')
    .group('date')
    .where('invoices.updated_at::timestamp::date = ? AND transactions.result = 1', date)
    .where(merchant_id: merchant_id)[0]
  end
end
