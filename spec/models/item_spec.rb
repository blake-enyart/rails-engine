require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationship(s)' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
  end
end
