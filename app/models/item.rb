class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  scope :sorted, -> { order(id: :asc) }

  def self.most_revenue(quantity)
    joins(invoice_items: {invoice: :transactions})
    .where(transactions: {result: 1 })
    .select("items.*,
             SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoice_items: {invoice: :transactions})
    .where(transactions: {result: 1 })
    .select("items.*,
             SUM(invoice_items.quantity) AS most_items")
    .group(:id)
    .order("most_items DESC")
    .limit(quantity)
  end

  def self.best_day(item_id)
    Invoice.joins(:items, :transactions)
           .where(items: {id: item_id}, transactions: {result: 1})
           .select('invoices.updated_at::timestamp::date AS date,
                    SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
           .group('date')
           .order('revenue DESC, date DESC')[0]
  end
end
