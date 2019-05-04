class Transaction < ApplicationRecord
  belongs_to :invoice

  scope :sorted, -> { order(id: :asc) }

  enum result: [:failed, :success]
end
