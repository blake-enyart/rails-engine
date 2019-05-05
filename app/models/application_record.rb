class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #Merchant
  def self.merchant_find(merchant_id)
    where(merchant_id: merchant_id)
  end

  def self.merchant_to_invoice_find(invoice_id)
    joins(:invoices).where(invoices: {id: invoice_id}).first
  end

  #Transaction
  def self.transaction_find(transaction_id)
    joins(:transactions).where(transactions: {id: transaction_id}).first
  end

  def self.transaction_to_customer_find(customer_id)
    joins(:invoice).where(invoices: {customer_id: customer_id})
  end

  #Item
  def self.item_find(item_id)
    where(item_id: item_id)
  end

  def self.item_to_customer_find(item_id)
    joins(:invoices).where(invoices: {id: item_id}).first
  end

  def self.item_to_merchant_find(item_id)
    joins(:items).where(items: {id: item_id}).first
  end

  def self.item_to_invoice_find(invoice_id)
    joins(:invoices).where(invoice_items: {invoice_id: invoice_id})
  end

  def self.item_to_invoice_item_find(invoice_item_id)
    joins(:invoice_items).where(invoice_items: {id: invoice_item_id}).first
  end

  #Invoice
  def self.invoice_find(invoice_id)
    where(invoice_id: invoice_id)
  end

  def self.invoice_to_invoice_item_find(invoice_item_id)
    joins(:invoice_items).where(invoice_items: {id: invoice_item_id}).first
  end

  #Customer
  def self.customer_find(customer_id)
    where(customer_id: customer_id)
  end

  def self.attr_find(params, limit = nil)
    if limit == 1
      where(params).first
    else
      where(params).limit(limit)
    end
  end

  def self.unit_price_find(unit_params, limit = nil)
    if limit == 1
      where(unit_price: unit_params).first
    else
      where(unit_price: unit_params).limit(limit)
    end
  end

  def self.sample
    sample
  end
end
