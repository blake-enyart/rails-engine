class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.merchant_find(merchant_id)
    where(merchant_id: merchant_id)
  end

  def self.transaction_find(transaction_id)
    joins(:transactions).where(transactions: {id: transaction_id}).first
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
