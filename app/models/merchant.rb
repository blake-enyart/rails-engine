class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  scope :sorted, -> { order(id: :asc) }

  def self.most_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 1 })
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end

  def self.most_revenue_for_merchant(merchant_id)
    joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 1 }, id: merchant_id)
    .select("SUM(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .group(:id)
    .first
  end

  def self.most_items(quantity)
    joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: 1 })
    .select("merchants.*, SUM(invoice_items.quantity) as most_items")
    .group(:id)
    .order("most_items DESC")
    .limit(quantity)
  end

  def self.total_revenue_one_merchant_date(merchant_id, date)
    Invoice.total_revenue_one_merchant_date(merchant_id, date)
  end

  def self.best_customer_for_merchant(merchant_id)
    Customer.joins(invoices: :transactions)
            .where(invoices: {merchant_id: merchant_id}, transactions: {result: 1})
            .select('customers.*, SUM(transactions.result) AS transaction_count')
            .group(:id)
            .order('transaction_count DESC')
            .first
  end

  def self.customers_with_pending_invoices(merchant_id)
    Customer.find_by_sql ["SELECT c.*, i.id invoice_id FROM invoices i
                          LEFT OUTER JOIN transactions t ON t.invoice_id = i.id
                          INNER JOIN customers c ON c.id = i.customer_id
                          WHERE ((t.result IS NULL OR t.result = 0) AND i.merchant_id = :merchant_id)
                          EXCEPT
                            SELECT c.*, i.id invoice_id FROM invoices i
                            INNER JOIN transactions t ON t.invoice_id = i.id
                            INNER JOIN customers c ON c.id = i.customer_id
                            WHERE t.result = 1 AND i.merchant_id = :merchant_id;", { :merchant_id => merchant_id }]
  end
end
