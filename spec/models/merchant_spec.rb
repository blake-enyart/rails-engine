require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationship(s)' do
    it { should have_many :invoices }
    it { should have_many :items }
  end
end
