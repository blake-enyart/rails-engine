class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  scope :sorted, -> { order(id: :asc) }
end
