require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationship(s)' do
    it { should have_many :invoices }
    it { should have_many :items }
  end

  describe 'Class methods' do
    describe '.most_revenue' do
      it 'returns the top x merchants ranked by total revenue' do
        merchants = create_list(:merchant, 4)

        item_1 = create(:item, merchant: merchants[0])
        item_2 = create(:item, merchant: merchants[1])
        item_3 = create(:item, merchant: merchants[2])
        item_4 = create(:item, merchant: merchants[3])

        invoice_1 = create(:invoice, merchant: merchants[0])
        invoice_2 = create(:invoice, merchant: merchants[1])
        invoice_3 = create(:invoice, merchant: merchants[2])
        invoice_4 = create(:invoice, merchant: merchants[3])

        transaction_1 = create(:transaction, invoice: invoice_1)
        transaction_2 = create(:transaction, invoice: invoice_2)
        transaction_3 = create(:failed_transaction, invoice: invoice_3)
        transaction_4 = create(:transaction, invoice: invoice_4)

        invoice_item_1 = create(:invoice_item,
          item: item_1,
          invoice: invoice_1,
          quantity: 2,
          unit_price: 5)

        invoice_item_2 = create(:invoice_item,
          item: item_2,
          invoice: invoice_2,
          quantity: 2,
          unit_price: 4)

        invoice_item_3 = create(:invoice_item,
          item: item_3,
          invoice: invoice_3,
          quantity: 2,
          unit_price: 5)

        invoice_item_4 = create(:invoice_item,
          item: item_4,
          invoice: invoice_4,
          quantity: 20,
          unit_price: 5)

        expect(Merchant.most_revenue(2)).to eq([merchants[3], merchants[0]])
      end
    end
  end
end
