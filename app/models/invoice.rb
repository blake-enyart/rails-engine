class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  
  enum status: [:unshipped, :shipped]
end
