require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'relationship(s)' do
    it { should belong_to :customer }
    it { should belong_to :merchant }
    it { should have_many :transactions }
    it { should have_many :invoice_items }
  end
end
